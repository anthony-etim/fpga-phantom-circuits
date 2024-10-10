
`include "address.sv"

module top #(
    parameter CLK_SPEED     = 300_000_000,// this line is very special, it was substitued by make_build_one.py
    parameter BAUD_RATE     = 921_600
) (
    input  wire clk_p,
    input  wire clk_n,

    input  wire uart_rx,
    output wire uart_tx
);


///////////////////////
// Global clock
///////////////////////
wire           board_clk;
// Differential pair to single-ended clock conversion
IBUFDS #(
    .DQS_BIAS("FALSE")
) IBUFDS_inst (
    .I(clk_p),
    .IB(clk_n),
    .O(board_clk)
);

///////////////////////
// rst
///////////////////////
reg            rst_reg = 0;// active high
reg [3:0]      rst_init_counter = 0;
always_ff @(posedge board_clk) begin
    if (rst_init_counter < 4'd8) begin
        rst_reg <= 0;
        rst_init_counter <= rst_init_counter + 1'b1;
    end else if (rst_init_counter < 4'd12) begin
        rst_reg <= 1'b1;
        rst_init_counter <= rst_init_counter + 1'b1;
    end else begin
        rst_reg <= 0;
    end
end
wire rst;
assign rst = rst_reg;

// -------------------------------------
// Clock wizard
// -------------------------------------

wire clk;
// Only works with 45 and 50 clock
clk_wiz_0 clk_wiz_0_inst (
    // .clk_out_20 (),
    // .clk_out_30 (),
    // .clk_out_40 (),
    .clk_out_50 (clk),  // ac701
    // .clk_out_60 (clk),  // kc705
    // .clk_out_100 (clk),
    .reset (rst),
    .locked (),
    .clk_in (board_clk)
);

// -------------------------------------
// Parameters
// -------------------------------------

// localparam CLK_WIZ_SPEED = 100_000_000;
// localparam CLK_WIZ_SPEED = 60_000_000; // kc075
localparam CLK_WIZ_SPEED = 50_000_000; // ac701
// localparam CLK_WIZ_SPEED = CLK_SPEED;

// UART configuration, see rxuart.v and txuart.v
// 8 bit words, one stop bit | parity exists, not fixed, odd | clocks per baud
localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_WIZ_SPEED/BAUD_RATE);

// The number of TDCs
localparam TDC_COUNT = 4;
// The mask 2'b11, ensuring the count reg to be 00, 01, 10, 11, ...
localparam [31:0] IDX_MASK  = 3;
// FIFO depth
localparam FIFO_DEPTH = 4096;



// -------------------------------------
// UART modules for TX and RX
// -------------------------------------

///////////////////////
// Heater connections
///////////////////////

///////////////////////
// UART connections
///////////////////////
reg  [7:0]     tx_byte;
wire [7:0]     rx_byte;
// wire           tx_ready;
reg            tx_valid;
wire           rx_valid;
wire           tx_busy;


txuart #(
    .INITIAL_SETUP(INITIAL_SETUP)
) tx_uart (
    .i_setup(INITIAL_SETUP),
    .i_clk(clk),
    .i_reset(rst),
    .i_wr(tx_valid),
    .i_data(tx_byte),
    .i_break(),
    .i_cts_n(),
    .o_uart_tx(uart_tx),
    .o_busy(tx_busy)
);

rxuart #(
    .INITIAL_SETUP(INITIAL_SETUP)
) rx_uart (
    .i_setup(INITIAL_SETUP),
    .i_clk(clk),
    .i_reset(rst),
    .i_uart_rx(uart_rx),
    .o_wr(rx_valid),
    .o_data(rx_byte),
    .o_break(),
    .o_parity_err(),
    .o_frame_err(),
    .o_ck_uart()
);


// -------------------------------------
// Control Logic
// -------------------------------------

// FSM States
localparam IDLE                                  = 5'd0;
localparam WAIT_RETURN                           = 5'd1;
localparam IN_FOUR_BYTES                         = 5'd2;
localparam SET_TDC_MEASUREMENT_NUM               = 5'd3;
localparam SET_TDC_CONFIG                        = 5'd4;
localparam SET_TDC_COARSE                        = 5'd5;
localparam SET_TDC_FINE                          = 5'd6;
localparam SET_TDC_START                         = 5'd7;
localparam SET_TDC_RESET                         = 5'd8;
localparam OUT_FOUR_BYTES                        = 5'd9;
localparam GET_TDC0_BYTE                         = 5'd10;
localparam GET_TDC1_BYTE                         = 5'd11;
localparam GET_TDC2_BYTE                         = 5'd12;
localparam GET_TDC3_BYTE                         = 5'd13;
localparam SET_RO_HEATER_ON                      = 5'd14;
localparam SET_RO_HEATER_OFF                     = 5'd15;
localparam SET_LOCAL_STRESSOR_COUNT_CYCLES       = 5'd16;
localparam MEASURING_0                           = 5'd17;
localparam MEASURING_1                           = 5'd18;
localparam MEASURING_2                           = 5'd19;

logic [4:0] state             = IDLE;
logic [4:0] return_state      = IDLE;
logic [4:0] tdc_prev_state    = IDLE;

// counter to transmit 8 bytes
reg [31:0]   out32counter   = 0;
reg [31:0]   in32counter    = 0;
reg [31:0]   in32_data      = 0;
reg [31:0]   out_32bits_data = 0;

// State machine for looping back UART RX to TX
always_ff @(posedge clk) begin
    if (rst == 1'b1) begin
        tx_valid <= 0;
        tx_byte <= 0;
        ro_heater_mask <= 0;
        local_stressor_count_cycles <= 0;
    end else begin
        tx_valid <= 0;
        set_tdc_start <= 0;
        set_tdc_reset <= 0;
        tdc_finish_out <= 0;

        case (state)
            IDLE: begin
                out32counter <= 0;
                in32counter <= 0;
                in32_data <= 0;

                if (rx_valid && !tx_busy) begin
                    // choices correspond to software
                    case (rx_byte)
                        `SET_TDC_MEASUREMENT_NUM_ADDR:  begin
                            state           <= IN_FOUR_BYTES;
                            return_state    <= SET_TDC_MEASUREMENT_NUM;
                        end
                        `SET_RO_HEATER_ON_ADDR:                   state <= SET_RO_HEATER_ON;
                        `SET_RO_HEATER_OFF_ADDR:                  state <= SET_RO_HEATER_OFF;
                        `SET_TDC_CONFIG_ADDR:                     state <= SET_TDC_CONFIG;
                        `SET_TDC_COARSE_ADDR:                     state <= SET_TDC_COARSE;
                        `SET_TDC_FINE_ADDR:                       state <= SET_TDC_FINE;
                        `SET_TDC_START_ADDR:                      state <= SET_TDC_START;
                        `SET_TDC_RESET_ADDR:                      state <= SET_TDC_RESET;
                        `SET_LOCAL_STRESSOR_COUNT_CYCLES_ADDR:  begin 
                            state           <= IN_FOUR_BYTES;      
                            return_state    <= SET_LOCAL_STRESSOR_COUNT_CYCLES;
                        end
                        `GET_TDC0_BYTE_ADDR:                      state <= GET_TDC0_BYTE;
                        `GET_TDC1_BYTE_ADDR:                      state <= GET_TDC1_BYTE;
                        `GET_TDC2_BYTE_ADDR:                      state <= GET_TDC2_BYTE;
                        `GET_TDC3_BYTE_ADDR:                      state <= GET_TDC3_BYTE;
                    endcase 
                end else begin
                    state <= IDLE;
                end
            end

            WAIT_RETURN: begin
                state <= return_state;
            end

            IN_FOUR_BYTES: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if (rx_valid == 1'b1) begin
                        in32_data[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
                    // values: 001, 010, 011
                    if (rx_valid == 1'b1) begin
                        in32_data <= (in32_data << 8);
                        in32_data[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    state <= return_state;
                end
            end

            SET_RO_HEATER_ON: begin
                if (rx_valid == 1'b1) begin
                    ro_heater_mask <= rx_byte;
                    state <= IDLE;
                end
            end

            SET_RO_HEATER_OFF: begin
                ro_heater_mask <= 0;
                state <= IDLE;
            end

            SET_TDC_MEASUREMENT_NUM: begin
                measurement_num <= in32_data;
                state <= IDLE;
            end

            SET_TDC_CONFIG: begin
                if (rx_valid == 1'b1) begin
                    tdc_config_reg <= rx_byte[2:0];
                    state <= IDLE;
                end
            end

            SET_TDC_COARSE: begin
                if (rx_valid == 1'b1) begin
                    tdc_coarse_reg <= rx_byte[4:0];
                    state <= IDLE;
                end
            end

            SET_TDC_FINE: begin
                if (rx_valid == 1'b1) begin
                    tdc_fine_reg <= rx_byte[4:0];
                    state <= IDLE;
                end
            end

            SET_LOCAL_STRESSOR_COUNT_CYCLES: begin
                local_stressor_count_cycles <= (1 << in32_data);
                // local_stressor_count_cycles <=  in32_data;
                state <= IDLE;
            end

            SET_TDC_START: begin
                set_tdc_start <= 1'b1;
                state <= IDLE;
            end

            SET_TDC_RESET: begin
                set_tdc_reset <= 1'b1;
                state <= IDLE;
            end

            OUT_FOUR_BYTES: begin
                if (out32counter == 32'd0) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_32bits_data[7:0] ;
                        out_32bits_data <= (out_32bits_data >> 8);
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= OUT_FOUR_BYTES;
                    state <= WAIT_RETURN;
                end else if (out32counter <= 32'd3) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_32bits_data[7:0] ;
                        out_32bits_data <= (out_32bits_data >> 8);
                        out32counter <= out32counter + 1'b1;
                    end
                    return_state <= OUT_FOUR_BYTES;
                    state <= WAIT_RETURN;
                end else begin
                    if(tdc_prev_state == GET_TDC0_BYTE) begin
                        tdc_prev_state <= IDLE;
                        tdc_finish_out[0] <= 1'b1;                        
                    end else if(tdc_prev_state == GET_TDC1_BYTE) begin
                        tdc_prev_state <= IDLE;
                        tdc_finish_out[1] <= 1'b1;
                    end else if(tdc_prev_state == GET_TDC2_BYTE) begin
                        tdc_prev_state <= IDLE;
                        tdc_finish_out[2] <= 1'b1;
                    end else if(tdc_prev_state == GET_TDC3_BYTE) begin
                        tdc_prev_state <= IDLE;
                        tdc_finish_out[3] <= 1'b1;
                    end
                    state <= IDLE;
                end
            end

            GET_TDC0_BYTE: begin
                // if(!tx_busy) begin
                //     tx_valid <= 1'b1;
                //     tx_byte <= tdc_data[0];
                //     state <= IDLE;
                //     tdc_finish_out[0] <= 1'b1;
                // end
                out_32bits_data <= tdc_data[0];
                tdc_prev_state <= GET_TDC0_BYTE;
                state <= OUT_FOUR_BYTES;
            end

            GET_TDC1_BYTE: begin
                // if(!tx_busy) begin
                //     tx_valid <= 1'b1;
                //     tx_byte <= tdc_data[1];
                //     state <= IDLE;
                //     tdc_finish_out[1] <= 1'b1;
                // end
                out_32bits_data <= tdc_data[1];
                tdc_prev_state <= GET_TDC1_BYTE;
                state <= OUT_FOUR_BYTES;
            end

            GET_TDC2_BYTE: begin
                // if(!tx_busy) begin
                //     tx_valid <= 1'b1;
                //     tx_byte <= tdc_data[2];
                //     state <= IDLE;
                //     tdc_finish_out[2] <= 1'b1;
                // end
                out_32bits_data <= tdc_data[2];
                tdc_prev_state <= GET_TDC2_BYTE;
                state <= OUT_FOUR_BYTES;
            end

            GET_TDC3_BYTE: begin
                // if(!tx_busy) begin
                //     tx_valid <= 1'b1;
                //     tx_byte <= tdc_data[3];
                //     state <= IDLE;
                //     tdc_finish_out[3] <= 1'b1;
                // end
                out_32bits_data <= tdc_data[3];
                tdc_prev_state <= GET_TDC3_BYTE;
                state <= OUT_FOUR_BYTES;
            end

        endcase
    end
end


// -------------------------------------
// TDC
// -------------------------------------

logic  [31:0]     measurement_num             = 0;
logic  [2:0]      tdc_config_reg              = 0;
logic  [4:0]      tdc_coarse_reg              = 0;
logic  [4:0]      tdc_fine_reg                = 0;
logic             set_tdc_start_init          = 0;
logic             set_tdc_start               = 0;
logic             set_tdc_reset               = 0;// Active high
// logic  [7:0]      tdc_data   [3:0];
logic  [31:0]     tdc_data   [3:0];
wire   [31:0]     tdc_status [3:0];
logic  [3:0]      tdc_finish_out              = 0;
logic  [31:0]     local_stressor_count_cycles = 0;
logic  [TDC_COUNT-1:0] measurement_complete;
// logic  [TDC_COUNT-1:0] measurement_complete_out;

localparam FIFO_READ_IDLE = 3'd0;
localparam FIFO_READ_1 = 3'd1;
localparam FIFO_READ_2 = 3'd2;
localparam FIFO_READ_WAIT = 3'd3;

localparam [31:0] MEASUREMENTS_PER_CYCLES = (1 << 10);

genvar i;
genvar j;
generate
    for (i = 0; i < TDC_COUNT; i = i + 1) begin: GEN_TDC
        // Inputs
        wire            start_trigger;
        wire            reset_axi;
        wire [31:0]     measurements;
        wire [31:0]     tdc_config;
        wire [7:0]      fifo_rd_bundle;

        // Outputs
        reg             tdc_fifo_rd_en = 0;
        wire            tdc_fifo_empty;
        // wire  [7:0]     tdc_fifo_data;
        wire  [31:0]    tdc_fifo_data;

        // Modules
        tdc #(
            .MEASUREMENTS_PER_CYCLES(MEASUREMENTS_PER_CYCLES)
        ) tdc_inst (
            .clk (clk),
            .rst (rst),
            .start_trigger (start_trigger),
            .reset_axi (reset_axi),
            // .measurement_num ((measurements << $clog2(MEASUREMENTS_PER_CYCLES))),
            .measurement_num (measurements),
            .tdc_config (tdc_config),
            .status (tdc_status[i]),

            .local_stressor_count_cycles (local_stressor_count_cycles),

            .compressedTDC_fifo_rd_en(tdc_fifo_rd_en),
            .compressedTDC_fifo_empty(tdc_fifo_empty),
            .compressedTDC_fifo_rd_data(tdc_fifo_data),
            .measurement_ready_wire(measurement_complete[i])
        );

        assign start_trigger = set_tdc_start;
        assign reset_axi = set_tdc_reset;
        assign measurements = measurement_num;
        assign tdc_config = {3'd0, tdc_fine_reg,
                             3'd0, tdc_coarse_reg,
                             7'd0, tdc_config_reg[2],
                             3'd0, tdc_config_reg[1],
                             3'd0, tdc_config_reg[0]};

        logic [2:0] state_fifo_read = FIFO_READ_IDLE;


        always @(posedge clk) begin
            if ( rst == 1'b1 ) begin
                // reset
                tdc_data[i] <= 8'hfd;
                tdc_fifo_rd_en <= 0;
                state_fifo_read <= FIFO_READ_IDLE;
            end
            else begin
                tdc_fifo_rd_en <= 0;

                case(state_fifo_read)
                    FIFO_READ_IDLE: begin
                        if (tdc_fifo_empty == 1'b0) begin
                            tdc_fifo_rd_en <= 1'b1;
                            state_fifo_read <= FIFO_READ_1;
                        end else begin
                            tdc_data[i] <= 8'hfd;
                            // tdc_data[i] <= tdc_status[i][7:0]; // debug
                            // tdc_data[i] <= tdc_status[0][8*(i+1)-1 -: 8] ; // debug
                            state_fifo_read <= FIFO_READ_IDLE;
                        end
                    end
                    FIFO_READ_1: begin
                        state_fifo_read <= FIFO_READ_2;
                    end
                    FIFO_READ_2: begin
                        tdc_data[i] <= tdc_fifo_data;
                        state_fifo_read <= FIFO_READ_WAIT;
                    end
                    FIFO_READ_WAIT: begin
                        if (tdc_finish_out[i] == 1'b1) begin// read by outside
                            state_fifo_read <= FIFO_READ_IDLE;
                        end else begin
                            state_fifo_read <= FIFO_READ_WAIT;
                        end
                    end
                endcase 
            end
        end
    end
endgenerate

// -------------------------------------
// RO Heater
// -------------------------------------

// localparam HEATER_NUM       = 8;// one byte, do not change
localparam HEATER_NUM       = 5;// one byte, do not change
localparam HEATER_ROS     	= 500;  // for ac701 and kc705 now. trying to be consistent for both
localparam HEATER_STAGES	= 2;

logic [7:0]  ro_heater_mask = 0;
logic [7:0]  enable_signal = 0;
logic [HEATER_NUM-1:0] actual_heater_enable;
assign actual_heater_enable = enable_signal & ro_heater_mask;

genvar k;
generate
    for (k = 0; k < HEATER_NUM; k = k+1) begin: RO_GEATER_GEN
        heater #(
            .ROS                (HEATER_ROS),
            .STAGES             (HEATER_STAGES)
        ) heater_inst (
            // .enable             (enable_signal[k])
            .enable             (actual_heater_enable[k])
        );

        // logic [31:0] stressor_cycles_counter = 0;

        // always_ff @(posedge clk) begin
        //     if(ro_heater_mask[k] == 1'b1 && enable_ro_heaters == 1'b1) begin
        //         if(stressor_cycles_counter < local_stressor_count_cycles) begin
        //             stressor_cycles_counter <= stressor_cycles_counter + 1'b1;
        //             enable_signal[k] <= enable_signal[k];
        //         end else begin
        //             stressor_cycles_counter <= 0;
        //             enable_signal[k] <= ~enable_signal[k];
        //         end
        //     end else begin
        //         stressor_cycles_counter <= 0;
        //         enable_signal[k] <= 0;
        //     end
        // end
    end
endgenerate

// logic [31:0] tdc_start_counter = 0;
// logic enable_ro_heaters = 0;

// always_ff @(posedge clk) begin
//     if(set_tdc_start == 1'b1) begin
//         tdc_start_counter <= 1'b1;
//         enable_ro_heaters <= 1'b1;
//     end else if((tdc_start_counter > 1'b0) && (tdc_start_counter < measurement_num*local_stressor_count_cycles)) begin
//         tdc_start_counter <= tdc_start_counter + 1'b1;
//         enable_ro_heaters <= 1'b1;
//     end else  begin
//         tdc_start_counter <= 1'b0;
//         enable_ro_heaters <= 1'b0;
//     end
// end

// pipeline #(
//     .BIT_WIDTH              (TDC_COUNT),//1
//     .N_STAGES               (5)//5
// ) pipeline_measure_ready (// every signal is 5 cycles later
//     .clk                    (clk),
//     .rst                    (rst),
//     .pipe_in                (measurement_complete), // we only use the measurement ready of the first controller, because they all have the same timing
//     .pipe_out               (measurement_complete_out)
// );

logic  [31:0]     measurement_num_copy = 0;
logic [4:0] state_measure   = MEASURING_0;

always_ff @(posedge clk) begin
    if(rst | set_tdc_reset) begin
        measurement_num_copy <=0;
        enable_signal <= 0;
        state_measure <= MEASURING_0;
    end else begin

        case (state_measure)

            MEASURING_0: begin
                if(set_tdc_start == 1'b1) begin
                    measurement_num_copy <= measurement_num;
                    state_measure <= MEASURING_1;
                end else begin
                    state_measure <= MEASURING_0;
                end
            end

            MEASURING_1: begin
                if(measurement_num_copy == 0) begin
                    state_measure <= MEASURING_0;
                end else begin
                    measurement_num_copy <= measurement_num_copy - 1'b1;
                    enable_signal <= ~enable_signal;
                    state_measure <= MEASURING_2;
                end 
            end

            MEASURING_2: begin
                if (measurement_complete) begin
                    state_measure <= MEASURING_1;
                end
            end 
            default: state_measure <= MEASURING_0;
        endcase
    end
end

endmodule
