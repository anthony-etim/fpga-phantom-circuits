`include "parameters.vh"

module covert_transmitter_top #(
    parameter NUM_HEATERS           = 1,
    parameter NUM_ROS               = 1000,
    parameter RO_TYPE               = RO_LUT,
    parameter BAUD_RATE             = 115_200,
    parameter CLK_SPEED             = 200_000_000
) (
    input                           sys_clk_p,
    input                           sys_clk_n,
    input                           sys_rst,
    input                           uart_rx
);

initial begin
if (NUM_HEATERS > 16) begin
    $error("Too many heaters (%d). Up to 16 allowed", NUM_HEATERS);
end
end

typedef enum {
    IDLE,
    RECEIVING_HEAT,
    RECEIVING_SETUP
} State;

// 8 bit words, one stop bit | parity exists, not fixed, odd | clocks per baud
localparam INITIAL_SETUP        = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED/BAUD_RATE);
localparam CNT_WIDTH            = 32;

logic                           sys_clk;
logic                           ctrl_rst;
logic                           toggle_enable;
logic [7:0]                     rx_byte;
logic                           rx_valid;
logic [15:0]                    recv_data;
logic [NUM_HEATERS-1:0]         heater_enable;
logic [NUM_HEATERS-1:0]         recv_enable;
logic [$clog2(CNT_WIDTH)-1:0]   trig_bit;
State                           state;


IBUFDS #(
    .DQS_BIAS                   ("FALSE")
) IBUFDS_inst (
    .I                          (sys_clk_p),
    .IB                         (sys_clk_n),
    .O                          (sys_clk)
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

 controller #(
    .NUM_HEATERS                (NUM_HEATERS),
    .CNT_WIDTH                  (CNT_WIDTH)
) ctrl (
    .clk                        (sys_clk),
    .rst                        (sys_rst | ctrl_rst),
    .toggle_heater              (toggle_enable),
    .heater_mask                (recv_enable),
    .trig_bit                   (trig_bit),
    .heater_value               (heater_enable)
);

genvar i;
generate
for (i = 0; i < NUM_HEATERS; i = i+1) begin : heat_gen
    heater #(
        .NUM_ROS                (NUM_ROS),
        .RO_TYPE                (RO_TYPE)
    ) heat_inst (
        .enable                 (heater_enable[i])
    );
end
endgenerate

always_ff @(posedge sys_clk) begin
    if (sys_rst) begin
        recv_data               <= '0;
        recv_enable             <= '0;
        trig_bit                <= '0;
        ctrl_rst                <= 0;
        toggle_enable           <= 0;
        state                   <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                if (rx_valid) begin
                    recv_data   <= {recv_data, rx_byte};
                    state       <= RECEIVING_HEAT;
                    ctrl_rst    <= 1;
                end
            end
            RECEIVING_HEAT: begin
                if (rx_valid) begin
                    recv_data   <= {recv_data, rx_byte};
                    state       <= RECEIVING_SETUP;
                end
            end
            RECEIVING_SETUP: begin
                if (rx_valid) begin
                    recv_enable <= recv_data;
                    {toggle_enable, trig_bit} <= rx_byte;
                    state       <= IDLE;
                    ctrl_rst    <= 0;
                end
            end
        endcase
    end
end

endmodule
