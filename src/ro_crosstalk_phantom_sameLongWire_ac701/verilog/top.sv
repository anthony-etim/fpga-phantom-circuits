
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
// assign board_clk = clk_100;



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
//     .clk_out_100(clk),         
//     // Status and control signals
//     .reset(rst), // input reset
//     .locked(),       // output locked
//     // Clock in ports
//     .clk_in(board_clk)// input clk_in
// );

// localparam CLK_SPEED_LOC     = 100_000_000;
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
localparam SET_DELAY_TX               = 5'd12;
// debug states
localparam GET_DEBUG            = 5'd20;


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
        axi_read_flag <= 0;

        case (state)
            IDLE: begin
                out32counter <= 0;
                in32counter <= 0;

                if (rx_valid && !tx_busy) begin
                    // choices correspond to software
                    case (rx_byte)
                        `SET_SW_RST_ADDR:           state <= SET_SW_RST;
                        `SET_DELAY_PH_ADDR:         state <= SET_DELAY_PHAN;
                        `SET_DELAY_TX_ADDR:         state <= SET_DELAY_TX;
                        `SET_TX_WIRE_TT_ADDR:       state <= SET_TX_WIRE_PHAN;
                        `SET_PHANTOM_START_ADDR:    state <= SET_PHANTOM_START;
                        `GET_DEBUG0_PHAN_ADDR: begin out_32bits_data <= {debug_counter[0], debug_phantum_state[23:0]}; state <=  GET_32BITS_DATA; end
                        `GET_DEBUG1_PHAN_ADDR: begin state <=  GET_DEBUG; end
                        `GET_PHAN_FIFO_0_ADDR: begin out_32bits_data <= fifo_data[0]; axi_read_flag[0] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_FIFO_1_ADDR: begin out_32bits_data <= fifo_data[1]; axi_read_flag[1] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_FIFO_2_ADDR: begin out_32bits_data <= fifo_data[2]; axi_read_flag[2] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_FIFO_3_ADDR: begin out_32bits_data <= fifo_data[3]; axi_read_flag[3] <= 1'b1; state <=  GET_32BITS_DATA; end
                        // `GET_PHAN_FIFO_4_ADDR: begin out_32bits_data <= fifo_data[4]; axi_read_flag[4] <= 1'b1; state <=  GET_32BITS_DATA; end

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

            SET_DELAY_TX: begin
                if (in32counter == 3'b000) begin
                    // values: 000
                    if(rx_valid) begin
                        delayCycles_tx[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        delayCycles_tx <= (delayCycles_tx << 8);
                        delayCycles_tx[7:0] <= rx_byte;
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

            GET_DEBUG: begin
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= {7'b0000000, tx_wire_debug};
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
// parameters for tx and rx
////////////////////////////

localparam NUM_RO_COUNTER = `NUM_RO_COUNTER;

////////////////////////////
// Instantiate transmitter 
////////////////////////////

(* mark_debug = "true" *) reg         sendbit         = 0;
(* mark_debug = "true" *) reg [31:0]  delayCycles     = 1_048_576;


reg [31:0] delayCycles_tx = 1_048_576;

simple_transmitter simple_transmitter_INST (
    .clk(clk),
    .reset(reset_sw | rst),
    .send(start_phantum),
    .sendbit(sendbit),
    .delayCycles(delayCycles_tx),
    .highCycles (delayCycles),
    .tx_wire_debug(tx_wire_debug)
);
////////////////////////////
// Instantiate phantum 
////////////////////////////
wire [31:0]  debug_phantum_state;
wire [31:0]  debug_data_1;
(* mark_debug = "true" *)  wire    [NUM_RO_COUNTER-1:0]    fifo_empty;
(* mark_debug = "true" *)  reg     [NUM_RO_COUNTER-1:0]    fifo_rd_en = 0;
(* mark_debug = "true" *)  wire    [31:0]     fifo_data_rd [0:NUM_RO_COUNTER-1];
wire    [31:0]     fifo_data_rd_0;
wire    [31:0]     fifo_data_rd_1;
wire    [31:0]     fifo_data_rd_2;
wire    [31:0]     fifo_data_rd_3;
// wire    [31:0]     fifo_data_rd_4;

phantum #(
    .NUM_RO_COUNTER (NUM_RO_COUNTER)
) phantum_DUT(
    .clk(clk),
    .rst(rst),
    .reset_axi(reset_sw),
    // .delayCycles(delayCycles),
    .debug_syncup(start_phantum),

    .debug_phantum_state (debug_phantum_state),

    .fifo_empty(fifo_empty),
    .fifo_rd_en(fifo_rd_en),
    .fifo_data_rd_0(fifo_data_rd_0),
    .fifo_data_rd_1(fifo_data_rd_1),
    .fifo_data_rd_2(fifo_data_rd_2),
    .fifo_data_rd_3(fifo_data_rd_3)
    // .fifo_data_rd_4(fifo_data_rd_4)
);
// hard code
assign fifo_data_rd[0] = fifo_data_rd_0;
assign fifo_data_rd[1] = fifo_data_rd_1;
assign fifo_data_rd[2] = fifo_data_rd_2;
assign fifo_data_rd[3] = fifo_data_rd_3;
// assign fifo_data_rd[4] = fifo_data_rd_4;

/////////////////////////////////////////////////////////////////////////////
// Read phantum FIFOs
/////////////////////////////////////////////////////////////////////////////
reg [NUM_RO_COUNTER-1:0]       axi_read_flag           = 0;
reg [31:0]      fifo_data       [0:NUM_RO_COUNTER-1];
localparam FIFO_READ_IDLE   = 3'd0;
localparam FIFO_READ_1      = 3'd1;
localparam FIFO_READ_2      = 3'd2;
localparam FIFO_READ_WAIT   = 3'd3;
localparam FIFOREADDELAY = 3'd0;// NOT state, counter for the reading delay
// debug counter
reg [7:0] debug_counter [0:3] ;
generate
genvar i;
  for (i = 0; i < NUM_RO_COUNTER; i = i + 1) begin: GEN_PHANTUM_FIFO

    reg [2:0]       state_fifo_read = FIFO_READ_IDLE;
    reg [2:0]       counter_read_delay = 0;

    always @(posedge clk) begin
        if ( rst == 1'b1 ) begin
            // reset
            fifo_data[i] <= 0;
            fifo_rd_en[i] <= 0;
            state_fifo_read <= FIFO_READ_IDLE;
            counter_read_delay <= 3'd0;
            debug_counter[i] <= 0;
        end
        else begin
            fifo_rd_en[i] <= 0;

            case(state_fifo_read)
                FIFO_READ_IDLE: begin
                    if (fifo_empty[i] == 1'b0) begin
                        fifo_rd_en[i] <= 1'b1;
                        counter_read_delay <= 3'd0;
                        state_fifo_read <= FIFO_READ_1;
                    end else begin
                        fifo_data[i] <= 32'hfeedbee0 + i;
                        state_fifo_read <= FIFO_READ_IDLE;
                    end
                end
                FIFO_READ_1: begin
                    // if (counter_read_delay < FIFOREADDELAY) begin
                    //     counter_read_delay <= counter_read_delay + 1'b1;
                    // end else begin
                    //     state_fifo_read <= FIFO_READ_2;
                    // end

                    state_fifo_read <= FIFO_READ_2;
                end
                FIFO_READ_2: begin
                    debug_counter[i] <= debug_counter[i] + 1'b1;
                    fifo_data[i] <= fifo_data_rd[i];
                    state_fifo_read <= FIFO_READ_WAIT;
                end
                FIFO_READ_WAIT: begin
                    if (axi_read_flag[i] == 1'b1) begin// read by outside
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
               



endmodule
