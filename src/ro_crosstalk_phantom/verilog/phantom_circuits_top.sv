
`include "ro_defines.sv"
`include "address.sv"

module phantom_circuits_top #(
    parameter CLK_SPEED     = 200_000_000,// this line is very special, it was substitued by make_build_one.py
    parameter BAUD_RATE     = 921_600,
    parameter BIT_SIZE = 8,
    parameter RO_TYPE = `RO_LATCH,
    parameter STAGES = 2
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

///////////////////////
// Clock wizard
///////////////////////
wire clk;
assign clk = board_clk;
// clk_wiz_0 clk_wiz_0_inst (
//     // Clock out ports
//     .clk_out_50(clk),         
//     // Status and control signals
//     .reset(rst), // input reset
//     .locked(),       // output locked
//     // Clock in ports
//     .clk_in(board_clk)// input clk_in
// );

// localparam CLK_SPEED_LOC     = 50_000_000;
// UART configuration, see rxuart.v and txuart.v
// 8 bit words, one stop bit | parity exists, not fixed, odd | clocks per baud
localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED/BAUD_RATE);
// localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED_LOC/BAUD_RATE);


///////////////////////
// UART connections
///////////////////////
reg  [7:0]     tx_byte = 0;
wire [7:0]     rx_byte;
wire           tx_ready;
reg            tx_valid = 0;
wire           rx_valid;
wire           tx_busy;

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


///////////////////////
// States
///////////////////////

// FSM states, 2**5 = 32 , 0 - 31
localparam IDLE                     = 5'd0;
localparam WAIT_RETURN              = 5'd1;
localparam SET_SW_RST               = 5'd2;
localparam SET_PHANTOM_START        = 5'd3;
localparam GET_32BITS_DATA          = 5'd4;

// _PHAN denotes phantum
localparam SET_TX_WIRE_PHAN           = 5'd10;
localparam SET_DELAY_PHAN             = 5'd11;


// state registers
(* mark_debug = "true" *) reg [4:0] state         = IDLE;
reg [4:0] return_state  = IDLE;

///////////////////////
// registers and wires
///////////////////////

// reset signal from Python script, only high for one cycle, active high
(* mark_debug = "true" *) reg         reset_sw = 0;
// start the phantum transactions, only high for one cycle
(* mark_debug = "true" *) reg         start_phantum = 0;
// debug signal from transmitter
wire        tx_wire_debug;
// got data flag
wire        gotData;
// counter to transmit 8 bytes
reg [2:0]   out32counter = 0;
reg [2:0]   in32counter = 0;
// 32bits data to be sent
reg [31:0]  out_32bits_data = 0;
// State machine for looping back UART RX to TX
always_ff @(posedge clk) begin
    if (rst == 1'b1) begin
        tx_valid <= 0;
        tx_byte <= 0;
    end
    else begin
        tx_valid <= 0;
        reset_sw <= 0;
        start_phantum <= 0;

        case (state)
            IDLE: begin
                out32counter <= 0;
                in32counter <= 0;

                if (rx_valid && !tx_busy) begin
                    // choices correspond to software
                    case (rx_byte)
                        `SET_SW_RST_ADDR:           state <= SET_SW_RST;
                        `SET_DELAY_TT_ADDR:         state <= SET_DELAY_PHAN;
                        `SET_TX_WIRE_TT_ADDR:       state <= SET_TX_WIRE_PHAN;
                        `SET_PHANTOM_START_ADDR:    state <= SET_PHANTOM_START;
                        `GET_DEBUG0_PHAN_ADDR: begin out_32bits_data <= debug_data_0; state <=  GET_32BITS_DATA; end
                        `GET_DEBUG1_PHAN_ADDR: begin out_32bits_data <= debug_data_1; state <=  GET_32BITS_DATA; end
                    endcase
                end else begin
                    state <= IDLE;
                end
            end

            WAIT_RETURN: begin
                state <= return_state;
            end

            SET_SW_RST: begin
                reset_sw <= 1'b1;
                state <= IDLE;
            end

            SET_PHANTOM_START: begin
                start_phantum <= 1'b1;
                state <= IDLE;
            end

            SET_TX_WIRE_PHAN: begin
                if (rx_valid) begin
                    sendbit = rx_byte[0];
                    state <= IDLE;
                end
            end

            SET_DELAY_PHAN: begin
                if (in32counter == 3'b000) begin
                    // values: 000
                    if(rx_valid) begin
                        delayCycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        delayCycles <= (delayCycles << 8);
                        delayCycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    state <= IDLE;
                end
            end

            GET_32BITS_DATA: begin
                if (out32counter == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_32bits_data[7:0] ;
                        out_32bits_data <= (out_32bits_data >> 8);
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= GET_32BITS_DATA;
                    state <= WAIT_RETURN;
                end else if (out32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_32bits_data[7:0] ;
                        out_32bits_data <= (out_32bits_data >> 8);
                        out32counter <= out32counter + 1'b1;
                    end
                    return_state <= GET_32BITS_DATA;
                    state <= WAIT_RETURN;
                end else begin
                    state <= IDLE;
                end
            end

            default: 
                begin
                    state <= IDLE;  
                end
        endcase
    end
end

// ////////////////////////////
// // Deal with gotData and data value
// ////////////////////////////

// reg rxHasData = 0;

// always_ff @(posedge clk) begin
//     if (rst == 1'b1) begin
//         rxHasData <= 0;
//         phantum_output_data <= 0;
//     end else begin
//         if ((gotData == 1'b1) && (rxHasData == 1'b0)) begin
//             rxHasData <= 1'b1;
//             phantum_output_data <= output_Data;
//         end else begin
//             if (beenReadFlag == 1'b1) begin
//                 rxHasData <= 0;
//                 phantum_output_data <= 0;
//             end
//         end
//     end
// end

////////////////////////////
// Instantiate transmitter 
////////////////////////////

(* mark_debug = "true" *) reg         sendbit         = 0;
(* mark_debug = "true" *) reg [31:0]  delayCycles     = 0;

simple_transmitter  simple_transmitter_INST (
    .clk(clk),
    .reset(reset_sw | rst),
    .send(start_phantum),
    .delayCycles(delayCycles),
    .sendbit(sendbit),
    .tx_wire_debug(tx_wire_debug)
);

////////////////////////////
// Instantiate phantum 
////////////////////////////
wire [31:0]  debug_data_0;
wire [31:0]  debug_data_1;

phantum phantum_DUT(
    .clk(clk),
    .reset(reset_sw | rst),

    .delayCycles(delayCycles),

    .debug_syncup(start_phantum),
    .debug_data_0(debug_data_0),
    .debug_data_1(debug_data_1)
);





endmodule
