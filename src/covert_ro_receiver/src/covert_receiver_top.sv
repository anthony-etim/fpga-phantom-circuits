`include "parameters.vh"

module covert_receiver_top #(
    parameter NUM_CTRLS             = 4,
    parameter CTRL_ROS              = 5,
    parameter CTRL_RO_TYPE          = RO_LUT,
    parameter CTRL_STAGES           = 2,
    parameter NUM_HEATERS           = 5,
    parameter HEATER_ROS            = 500,
    parameter HEATER_RO_TYPE        = RO_LUT,
    parameter HEATER_STAGES         = 2,
    parameter BAUD_RATE             = 115_200,
    parameter CLK_SPEED             = 200_000_000
) (
    input                           sys_clk_p,
    input                           sys_clk_n,
    input                           sys_rst,
    input                           uart_rx,
    output                          uart_tx
);

// Differential pair to single-ended clock conversion
logic sys_clk;
IBUFDS #(
    .DQS_BIAS("FALSE")
) IBUFDS_inst (
    .I(sys_clk_p),
    .IB(sys_clk_n),
    .O(sys_clk)
);


if (NUM_HEATERS > 8) begin
initial begin
    $error("Too many heaters (%d). Up to 8 allowed", NUM_HEATERS);
end
end

typedef enum {
    BUSY,
    IDLE,
    RECEIVING_WAIT_BITS,
    RECEIVING_CNT_0,
    RECEIVING_CNT_1,
    RECEIVING_MASK,
    TRANSMITTING_CONFIG_0,
    TRANSMITTING_CONFIG_1,
    MEASURING_0,
    MEASURING_1,
    WAITING_FIFO_0,
    WAITING_FIFO_1
} State;

typedef enum {
    TX_IDLE,
    TX_CFG_0,
    TX_CFG_1,
    TX_CFG_2,
    TX_CFG_3,
    TX_READ_0,
    TX_READ_1,
    TX_SEND_0,
    TX_SEND_1
} TX_State;

typedef enum {
    FIFO_IDLE,
    FIFO_WRITING_0,
    FIFO_WRITING_1
} FIFO_State;

// 8 bit words, one stop bit | parity exists, not fixed, odd | clocks per baud
localparam INITIAL_SETUP        = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED/BAUD_RATE);

localparam CNT_WIDTH            = 32; // must be multiple of 8, and is hardcoded for FIFO
localparam CNT_BYTES            = CNT_WIDTH/8;
localparam CTRL_BITS            = (CTRL_ROS+1)*CNT_WIDTH;
localparam CNT_BITS             = CTRL_BITS*NUM_CTRLS + CNT_WIDTH;
localparam NUM_WORDS            = CNT_BITS/CNT_WIDTH;
localparam N_STAGES             = 5;

// Global state
State                           state;

// UART connections
logic [7:0]                     tx_byte;
logic [7:0]                     rx_byte;
logic                           tx_ready;
logic                           tx_valid;
logic                           rx_valid;
logic                           tx_busy;

// Measurement and config logic
logic                           send_config;
logic                           send_config_done;
logic [15:0]                    repetitions;
logic [CNT_BITS-1:0]            ro_counts;
logic [CNT_BITS-1:0]            ro_counts_piped;
logic [$clog2(CNT_WIDTH)-1:0]   trig_bit;
logic [6:0]                     wait_cnt;
logic                           send_stages;
logic                           enable_measurement;
logic [NUM_CTRLS-1:0]           measurement_ready;
logic [NUM_CTRLS-1:0]           measurement_ready_piped;
logic                           measurement_error;
logic [3:0]                     num_ctrls;
logic [7:0]                     num_ctrl_ros;
logic [3:0]                     ctrl_stages;
logic [3:0]                     num_heats;
logic [7:0]                     num_heat_ros;
logic [3:0]                     heat_stages;
logic [NUM_HEATERS-1:0]         heater_enable;
logic [NUM_HEATERS-1:0]         actual_heater_enable;
logic [NUM_HEATERS-1:0]         heater_mask;

// FIFO connections
logic [CNT_WIDTH-1:0]           fifo_in;
logic [CNT_WIDTH-1:0]           fifo_out;
logic                           fifo_rd;
logic                           fifo_wr;
logic                           fifo_full;
logic                           fifo_almost_full;
logic                           fifo_empty;
logic                           fifo_error;
logic                           fifo_wr_rst_busy;
logic                           fifo_rd_rst_busy;

// Write to FIFO
FIFO_State                      fifo_state;
logic                           fifo_idle;
logic [CNT_BITS-1:0]            fifo_counts_in;
logic [$clog2(NUM_WORDS+1)-1:0] fifo_write_remaining;

// TX to uart
TX_State                        tx_state;
logic [CNT_WIDTH-1:0]           tx_bytes_out;
logic [$clog2(CNT_BYTES+1)-1:0] fifo_read_remaining;
logic                           tx_done;

assign tx_ready     = ~tx_busy;
assign fifo_idle    = (fifo_state == FIFO_IDLE);
assign tx_done      = (tx_state == TX_IDLE);
assign num_ctrl_ros = CTRL_ROS;
assign num_ctrls    = NUM_CTRLS;
assign ctrl_stages  = CTRL_STAGES;
assign num_heat_ros = HEATER_ROS;
assign num_heats    = NUM_HEATERS;
assign heat_stages  = HEATER_STAGES;

assign actual_heater_enable = heater_enable & heater_mask;

txuart #(
    .INITIAL_SETUP              (INITIAL_SETUP)
) tx_uart (
    .i_setup                    (INITIAL_SETUP),
    .i_clk                      (sys_clk),
    .i_reset                    (sys_rst),
    .i_wr                       (tx_valid),
    .i_data                     (tx_byte),
    .i_break                    (),
    .i_cts_n                    (),
    .o_uart_tx                  (uart_tx),
    .o_busy                     (tx_busy)
);

rxuart #(
    .INITIAL_SETUP              (INITIAL_SETUP)
) rx_uart (
    .i_setup                    (INITIAL_SETUP),
    .i_clk                      (sys_clk),
    .i_reset                    (sys_rst),
    .i_uart_rx                  (uart_rx),
    .o_wr                       (rx_valid),
    .o_data                     (rx_byte),
    .o_break                    (),
    .o_parity_err               (),
    .o_frame_err                (),
    .o_ck_uart                  ()
);

pipeline #(
    .BIT_WIDTH                  (NUM_CTRLS),
    .N_STAGES                   (N_STAGES)
) pipeline_meas_error(
    .clk                        (sys_clk),
    .rst                        (sys_rst),
    .pipe_in                    (measurement_ready),
    .pipe_out                   (measurement_ready_piped)
);

pipeline #(
    .BIT_WIDTH                  (CNT_BITS),
    .N_STAGES                   (N_STAGES)
) pipeline_counts(
    .clk                        (sys_clk),
    .rst                        (sys_rst),
    .pipe_in                    (ro_counts),
    .pipe_out                   (ro_counts_piped)
);

assign fifo_wr_rst_busy = 0;
assign fifo_rd_rst_busy = 0;

fifo cnt_fifo(
    .clk                        (sys_clk),
    .srst                       (sys_rst),
    .din                        (fifo_in),
    .wr_en                      (fifo_wr),
    .rd_en                      (fifo_rd),
    .dout                       (fifo_out),
    .full                       (fifo_full),
    .prog_full                  (fifo_almost_full),
    .empty                      (fifo_empty)
);

genvar i;
generate
for (i = 0; i < NUM_CTRLS; i = i+1) begin : ctrl_gen
    controller #(
        .ROS                    (CTRL_ROS),
        .RO_TYPE                (CTRL_RO_TYPE),
        .STAGES                 (CTRL_STAGES),
        .CNT_WIDTH              (CNT_WIDTH),
        .CTRL_ID                (i)
    ) ctrl_inst (
        .clk                    (sys_clk),
        .rst                    (sys_rst),
        .enable_pulse           (enable_measurement),
        .trig_bit               (trig_bit),
        .wait_cnt               (wait_cnt),
        .ready_pulse            (measurement_ready[i]),
        .ro_counts              (ro_counts[CTRL_BITS*(i+1)-1:CTRL_BITS*i])
    );
end
assign ro_counts[CNT_BITS-1:CNT_BITS-CNT_WIDTH] = {{(CNT_BITS-NUM_HEATERS){1'b1}}, actual_heater_enable};
endgenerate

genvar j;
generate
for (j = 0; j < NUM_HEATERS; j = j+1) begin : heat_gen
    heater #(
        .ROS                    (HEATER_ROS),
        .RO_TYPE                (HEATER_RO_TYPE),
        .STAGES                 (HEATER_STAGES)
    ) heat_inst (
        .enable                 (actual_heater_enable[j])
    );
end
endgenerate

always_ff @(posedge sys_clk) begin
    fifo_wr  <= 0;
    if (sys_rst) begin
        fifo_counts_in <= 0;
        fifo_error <= 0;
        fifo_write_remaining <= 0;
    end else begin
        case (fifo_state)
            FIFO_IDLE: begin
                if (measurement_ready_piped) begin
                    fifo_counts_in <= ro_counts_piped;
                    fifo_write_remaining <= NUM_WORDS;
                    fifo_state <= FIFO_WRITING_0;
                end
            end
            FIFO_WRITING_0: begin
                {fifo_in, fifo_counts_in} <= {fifo_counts_in, {CNT_WIDTH{1'b0}}};
                fifo_write_remaining <= fifo_write_remaining - 1;
                fifo_state <= FIFO_WRITING_1;
            end
            FIFO_WRITING_1: begin
                if (!fifo_full) begin
                    if (fifo_wr) begin
                        if (fifo_write_remaining) begin
                            fifo_state <= FIFO_WRITING_0;
                        end else begin
                            fifo_state <= FIFO_IDLE;
                        end
                    end else begin
                        fifo_wr <= 1;
                    end
                end
            end
        endcase

        if (measurement_ready_piped && !fifo_idle) begin
            fifo_error <= 1;
        end
    end
end

// TX State machine
always_ff @(posedge sys_clk) begin
    send_config_done <= 0;
    fifo_rd <= 0;
    tx_valid <= 0;
    if (sys_rst) begin
        tx_state <= TX_IDLE;
        tx_bytes_out <= 0;
        fifo_read_remaining <= 0;
        tx_byte <= 0;
    end else begin
        case (tx_state)
            TX_IDLE: begin
                if (send_config) begin
                    tx_state <= TX_CFG_0;
                end else if (!fifo_empty) begin
                    fifo_rd <= 1;
                    tx_state <= TX_READ_0;
                end
            end
            TX_CFG_0: begin
                if (tx_ready) begin
                    if (tx_valid) begin
                        tx_state <= TX_CFG_1;
                    end else begin
                        tx_valid <= 1;
                        tx_byte <= num_ctrl_ros;
                    end
                end
            end
            TX_CFG_1: begin
                if (tx_ready) begin
                    if (tx_valid) begin
                        tx_state <= TX_CFG_2;
                    end else begin
                        tx_valid <= 1;
                        tx_byte <= num_heat_ros;
                    end
                end
            end
            TX_CFG_2: begin
                if (tx_ready) begin
                    if (tx_valid) begin
                        if (send_stages) begin
                            tx_state <= TX_CFG_3;
                        end else begin
                            tx_state <= TX_IDLE;
                            send_config_done <= 1;
                        end
                    end else begin
                        tx_valid <= 1;
                        tx_byte <= {num_heats, num_ctrls};
                    end
                end
            end
            TX_CFG_3: begin
                if (tx_ready) begin
                    if (tx_valid) begin
                        tx_state <= TX_IDLE;
                        send_config_done <= 1;
                    end else begin
                        tx_valid <= 1;
                        tx_byte <= {heat_stages, ctrl_stages};
                    end
                end
            end
            TX_READ_0: begin
                tx_state <= TX_READ_1;
            end
            TX_READ_1: begin
                fifo_read_remaining <= CNT_BYTES;
                tx_bytes_out <= fifo_out;
                tx_state <= TX_SEND_0;
            end
            TX_SEND_0: begin
                {tx_byte, tx_bytes_out}  <= {tx_bytes_out, 8'b0};
                fifo_read_remaining <= fifo_read_remaining - 1;
                tx_state <= TX_SEND_1;
            end
            TX_SEND_1: begin
                if (tx_ready) begin
                    if (tx_valid) begin
                        if (fifo_read_remaining) begin
                            tx_state <= TX_SEND_0;
                        end else begin
                            tx_state <= TX_IDLE;
                        end
                    end else begin
                        tx_valid <= 1;
                    end
                end
            end
        endcase
    end
end

// RX and Measurement state machine
always_ff @(posedge sys_clk) begin
    enable_measurement <= 0;
    send_config <= 0;
    if (sys_rst) begin
        trig_bit <= 0;
        wait_cnt <= 0;
        send_stages <= 0;
        repetitions <= 0;
        measurement_error <= 0;
        heater_enable <= 0;
        state <= BUSY;
    end else begin
        case (state)
            BUSY: begin
                if (!fifo_wr_rst_busy & !fifo_rd_rst_busy & fifo_empty & fifo_idle & tx_done) begin
                    state <= IDLE;
                end
            end
            IDLE: begin
                if (rx_valid) begin
                    trig_bit <= rx_byte;
                    state <= RECEIVING_WAIT_BITS;
                end
            end
            RECEIVING_WAIT_BITS: begin
                if (rx_valid) begin
                    {send_stages, wait_cnt} <= rx_byte;
                    state <= RECEIVING_CNT_0;
                end
            end
            RECEIVING_CNT_0: begin
                if (rx_valid) begin
                    repetitions <= {repetitions, rx_byte};
                    state <= RECEIVING_CNT_1;
                end
            end
            RECEIVING_CNT_1: begin
                if (rx_valid) begin
                    repetitions <= {repetitions, rx_byte};
                    state <= RECEIVING_MASK;
                end
            end
            RECEIVING_MASK: begin
                if (rx_valid) begin
                    heater_mask <= rx_byte;
                    state <= TRANSMITTING_CONFIG_0;
                end
            end
            TRANSMITTING_CONFIG_0: begin
                send_config <= 1;
                state <= TRANSMITTING_CONFIG_1;
            end
            TRANSMITTING_CONFIG_1: begin
                if (send_config_done) begin
                    state <= MEASURING_0;
                end
            end
            MEASURING_0: begin
                if (repetitions == 0) begin
                    state <= BUSY;
                end else begin
                    repetitions <= repetitions - 1;
                    enable_measurement <= 1;
                    heater_enable <= ~heater_enable;
                    state <= MEASURING_1;
                end
            end
            MEASURING_1: begin
                if (measurement_ready_piped) begin
                    if (measurement_ready_piped != {NUM_CTRLS{1'b1}}) begin
                        measurement_error <= 1;
                    end
                    state <= WAITING_FIFO_0;
                end
            end
            WAITING_FIFO_0: begin
                state <= WAITING_FIFO_1;
            end
            WAITING_FIFO_1: begin // backpressure. don't measure if you can't handle it
                if (~fifo_almost_full) begin
                    state <= MEASURING_0;
                end
            end
        endcase
    end
end

endmodule
