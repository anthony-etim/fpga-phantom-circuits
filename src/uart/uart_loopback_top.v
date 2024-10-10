
module uart_loopback_top #(
    parameter BAUD_RATE     = 921_600,
    parameter CLK_SPEED     = 300_000_000,
) (
    input  wire clk_p,
    input  wire clk_n,
    //input  wire rst,
    input  wire uart_rx,
    output wire uart_tx
);

// Some boards don't have reset singal, tie reset to 0
reg            rst = 0;

// Global clock
wire           clk;

// UART connections
reg  [7:0]     tx_byte;
wire [7:0]     rx_byte;
wire           tx_ready;
reg            tx_valid;
wire           rx_valid;
wire           tx_busy;

// UART configuration, see rxuart.v and txuart.v
// 8 bit words, one stop bit | parity exists, not fixed, odd | clocks per baud
localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED/BAUD_RATE);


// Differential pair to single-ended clock conversion
IBUFDS #(
    .DQS_BIAS("FALSE")
) IBUFDS_inst (
    .I(clk_p),
    .IB(clk_n),
    .O(clk)
);


// State machine for looping back UART RX to TX
always @(posedge clk) begin
    if (rst) begin
        tx_valid <= 0;
        tx_byte <= 0;
    end
    else begin
      if (rx_valid & !tx_busy) begin
          tx_valid <= 1;
          tx_byte <= rx_byte + 1;
      end
      else if (rx_valid & tx_busy) begin
          tx_valid <= 0;
          tx_byte <= 0;
      end
      else begin
          tx_valid <= 0;
          tx_byte <= 0;
      end
    end
end


// UART modules for TX and RX
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

endmodule
