`include "ro_defines.sv"
`include "defines.sv"

// ideally, module ro_clock
//          parameters
//          output wire ro_clock


module async_fifo_loopback #(
    parameter BAUD_RATE     = 921_600,
    parameter CLK_SPEED     = 300_000_000,
    parameter RO_TYPE       = `RO_LATCH,
	parameter STAGES        = 2,
    parameter COUNTER_BIT   = 32,
    parameter RO_POSIITON   = 15,
    parameter CLOCKS_PER_BIT = 10000
)  (
    input  wire clk_p,
    input  wire clk_n,
    //input  wire rst,
    input  wire uart_rx,
    output wire uart_tx
);

// RO wires
reg [31:0]  debug_ro_counts = 0;

(* DONT_TOUCH = "TRUE" *) reg      ro_counter_reset = 0;
(* DONT_TOUCH = "TRUE" *) wire [31:0] ro_counter_count;
reg [31:0] ro_counter_count_reg;

(* DONT_TOUCH = "TRUE" *) reg      mmcm_counter_reset = 0;
(* DONT_TOUCH = "TRUE" *) wire [31:0] mmcm_counter_count;
reg [31:0] mmcm_counter_count_reg;

(* DONT_TOUCH = "TRUE" *) reg      clock_counter_reset = 0;
(* DONT_TOUCH = "TRUE" *) wire [31:0] clock_counter_count;

counter #(
    .COUNTER_BIT(COUNTER_BIT)
) counter_RO(
    .tick(myROOutput),
    .reset(ro_counter_reset),
    .count(ro_counter_count)
);

counter #(
    .COUNTER_BIT(COUNTER_BIT)
) counter_MMCM(
    .tick(clk_wiz_out),
    .reset(mmcm_counter_reset),
    .count(mmcm_counter_count)
);

counter #(
    .COUNTER_BIT(COUNTER_BIT)
) counter_clock(
    .tick(clk),
    .reset(clock_counter_reset),
    .count(clock_counter_count)
);

reg       enableMyRO = 1'b1;
wire      myROOutput;

wire clk_wiz_out;

// Some boards don't have reset singal, tie reset to 0
reg            reset = 0;

// Global clocks
wire           clk;
wire           wr_clk_rx;
wire           rd_clk_rx;
wire           wr_clk_tx;
wire           rd_clk_tx;


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


// #####################################################
// RX ASYNC FIFO

// FIFO Parameters
// Write interface
reg wr_en_rx;
reg [7:0] din_rx;
wire full_rx;

// Read interface
reg rd_en_rx;
wire [7:0] dout_rx;
wire empty_rx;	// True if FIFO is empty
// #####################################################


// #####################################################
// TX ASYNC FIFO

// FIFO Parameters
// Write interface
reg wr_en_tx;
reg [7:0] din_tx;
wire full_tx;

// Read interface
reg rd_en_tx;
wire [7:0] dout_tx;
wire empty_tx;	// True if FIFO is empty
// #####################################################


// State machine parameters

localparam [3:0] IDLE_rx = 4'b0000,
                 DELAY_rx_one = 4'b0001,
                 DELAY_rx_two = 4'b0010;

localparam [3:0] IDLE = 4'b0000,
                 DELAY_ONE = 4'b0001,
                 DELAY_TWO = 4'b0010,
                 DELAY_THREE = 4'b0011;

localparam [3:0] IDLE_tx = 4'b0000,
                 DELAY_tx_one = 4'b0001,
                 DELAY_tx_two = 4'b0010,
                 DELAY_tx_three = 4'b0011;

// UART protocol
localparam GET_MMCM_COUNTS = 8'b0000_0001;
localparam GET_RO_COUNTS   = 8'b0000_0010;
localparam GET_FIFO_WRITE  = 8'b0000_0011;
localparam GET_FIFO_READ   = 8'b0000_0100;

// FSM states
localparam MMCM_COUNTS = 4'd5;
localparam RO_COUNTS   = 4'd6;
localparam FIFO_WRITE  = 4'd7;
localparam FIFO_READ   = 4'd8;
localparam WAIT_RETURN = 4'd9;

// Define register holding the state
reg [3:0] state = IDLE;
reg [3:0] state_rx = IDLE_rx;
reg [3:0] state_tx = IDLE_tx;
reg [3:0] return_state  = IDLE_tx;

// Registers for holding counter states
reg [2:0] out32counter_one = 0;
reg [2:0] out32counter_two = 0;

// Differential pair to single-ended clock conversion
IBUFDS #(
    .DQS_BIAS("FALSE")
) IBUFDS_inst (
    .I(clk_p),
    .IB(clk_n),
    .O(clk)
);

// RX FSM
always @(posedge clk) begin  
    if(reset) begin
        wr_en_rx <= 0;
    end 
    else begin

        case (state_rx)

        IDLE_rx: begin
            if (rx_valid && !tx_busy) begin
                if (rx_byte == GET_FIFO_WRITE) begin
                    state_rx <= FIFO_WRITE;
                end
                else begin
                    state_rx <= IDLE_rx;
                end
            end
        end

        FIFO_WRITE: begin
            if (rx_valid && !full_rx) begin
                wr_en_rx <= 1;
                din_rx <= rx_byte;
                state_rx <= DELAY_rx_one;
            end
            else begin
                wr_en_rx <= 0;
                state_rx <= FIFO_WRITE; 
            end
        end

        DELAY_rx_one: begin
            state_rx <= DELAY_rx_two; 
        end 

        DELAY_rx_two: begin
            wr_en_rx <= 0;
            state_rx <= IDLE_rx; 
        end  
        
        endcase
    end
end

//LOOPBACK FSM
always @(posedge clk_wiz_out) begin
    if(reset) begin
        rd_en_rx <= 0;
        wr_en_tx <= 0;
    end 
    else begin

        case (state)
        IDLE : begin
            if (!empty_rx && !full_rx ) begin
                rd_en_rx <= 1;
                wr_en_tx <= 0;
                state <= DELAY_ONE;
            end
            else begin
                rd_en_rx <= 0;
                wr_en_tx <= 0;
                state <= IDLE;
            end
        end
        
        DELAY_ONE: begin
            state <= DELAY_TWO;
        end

        DELAY_TWO: begin
            rd_en_rx <= 0;
            wr_en_tx <= 1;
            din_tx <= dout_rx;
            state <= DELAY_THREE; 
        end

        DELAY_THREE: begin
            rd_en_rx <= 0;
            wr_en_tx <= 0;
            state <= IDLE; 
        end
        endcase
    end
end

// TX FSM
always @(posedge clk) begin
    if(reset) begin
        rd_en_tx <= 0;
        tx_valid <= 0;
    end 
    else begin
        
        case (state_tx)

        IDLE_tx: begin
            tx_valid <= 0;
            if (rx_valid && !tx_busy) begin
                if (rx_byte == GET_FIFO_READ) begin
                    state_tx <= FIFO_READ;
                end else if (rx_byte == GET_RO_COUNTS) begin
                    state_tx <= RO_COUNTS;
                end else if (rx_byte == GET_MMCM_COUNTS) begin
                    state_tx <= MMCM_COUNTS;
                end
                else begin
                    state_tx <= IDLE_tx;
                end         
            end
        end

        RO_COUNTS: begin
            //ro_counter_reset <= 0;
            if (out32counter_one == 3'b000) begin
                // values: 000
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= ro_comp_count[7:0];
                    ro_comp_count_reg <= (ro_comp_count_reg >> 8);
                    out32counter_one <= out32counter_one + 1'b1;
                end
                return_state <= RO_COUNTS;
                state_tx <= WAIT_RETURN;
            end else if (out32counter_one <= 3'b011) begin
                // values: 001, 010, 011
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= ro_comp_count[7:0];
                    ro_comp_count_reg <= (ro_comp_count_reg >> 8);
                    out32counter_one <= out32counter_one + 1'b1;
                end
                return_state <= RO_COUNTS;
                state_tx <= WAIT_RETURN;
            end else begin
                out32counter_one <= 0;
                state_tx <= IDLE_tx;
            end
        end

        MMCM_COUNTS: begin
            mmcm_counter_reset <= 0;
            if (out32counter_two == 3'b000) begin
                // values: 000
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= mmcm_counter_count[7:0];
                    mmcm_counter_count_reg <= (mmcm_counter_count >> 8);
                    out32counter_two <= out32counter_two + 1'b1;
                end
                return_state <= MMCM_COUNTS;
                state_tx <= WAIT_RETURN;
            end else if (out32counter_two <= 3'b011) begin
                // values: 001, 010, 011
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= mmcm_counter_count_reg[7:0] ;
                    mmcm_counter_count_reg <= (mmcm_counter_count_reg >> 8);
                    out32counter_two <= out32counter_two + 1'b1;
                end
                return_state <= MMCM_COUNTS;
                state_tx <= WAIT_RETURN;
            end else begin
                out32counter_two <= 0;
                state_tx <= IDLE_tx;
            end
        end

        WAIT_RETURN: begin
            state_tx <= return_state;
        end

        FIFO_READ: begin
            if(!empty_tx) begin
                rd_en_tx <= 1;
                state_tx <= DELAY_tx_one;
            end
            else begin
                state_tx <= IDLE_tx;
            end
        end

        DELAY_tx_one: begin
            state_tx <= DELAY_tx_two;
        end

        DELAY_tx_two: begin
            if(!tx_busy) begin
                tx_valid <= 1;
                tx_byte <= dout_tx + 1;
                state_tx <= DELAY_tx_three;
                
            end 
            else begin
                rd_en_tx <= 0;
                tx_valid <= 0;
                state_tx <= IDLE_tx;
            end
        end

        DELAY_tx_three: begin
            rd_en_tx <= 0;
            tx_valid <= 0;
            state_tx <= IDLE_tx;
        end

        default: begin
            state_tx <= IDLE_tx;
        end

        endcase
    end
end

// UART modules for TX and RX
txuart #(
    .INITIAL_SETUP(INITIAL_SETUP)
) tx_uart (
    .i_setup(INITIAL_SETUP),
    .i_clk(clk),
    .i_reset(reset),
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
    .i_reset(reset),
    .i_uart_rx(uart_rx),
    .o_wr(rx_valid),
    .o_data(rx_byte),
    .o_break(),
    .o_parity_err(),
    .o_frame_err(),
    .o_ck_uart()
);


fifo_generator_0 rx_async_fifo (
  .rst(reset),         // input wire rst
  .wr_clk(clk),        // input wire wr_clk 100MHz
  .rd_clk(clk_wiz_out),// input wire rd_clk 400MHz
  
  .din(din_rx),        // input wire [7 : 0] din
  .wr_en(wr_en_rx),    // input wire wr_en
  
  .rd_en(rd_en_rx),    // input wire rd_en
  .dout(dout_rx),      // output wire [7 : 0] dout
  
  .full(full_rx),      // output wire full
  .empty(empty_rx)     // output wire empty
);

fifo_generator_0 tx_async_fifo (
  .rst(reset),         // input wire rst
  .wr_clk(clk_wiz_out),// input wire wr_clk 100MHz
  .rd_clk(clk),        // input wire rd_clk 400MHz
  
  .din(din_tx),        // input wire [7 : 0] din
  .wr_en(wr_en_tx),    // input wire wr_en
  
  .rd_en(rd_en_tx),    // input wire rd_en
  .dout(dout_tx),      // output wire [7 : 0] dout
  
  .full(full_tx),      // output wire full
  .empty(empty_tx)     // output wire empty
);

wire raw_ro_tick;
(* DONT_TOUCH = "TRUE" *)
ring_oscillator #(
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) ring_oscillator_INST(
    .enable(enableMyRO),
    .ro_out(myROOutput)
);

// // RO_helper_counter - bit 7
// reg [7:0] RO_helper_counter = 0;
// always @(posedge myROOutput) begin
//     RO_helper_counter <= RO_helper_counter + 1'b1;
// end
// assign myROOutput = RO_helper_counter[7];

// 0000000
// 0000001
// ...
// 1111111
// 0000000

clk_wiz_0 clk_wizard(

    // Clock out ports
    .clk_out1(clk_wiz_out),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
   // Clock in ports
    .clk_in1(myROOutput) // input clk_in1
);      

////////////////////////////
// RO COMPARATOR
////////////////////////////
wire [31:0] ro_comp_count;
reg [31:0] ro_comp_count_reg;

comparator #(
    .COUNTER_BIT(COUNTER_BIT),
    .CLOCKS_PER_BIT(CLOCKS_PER_BIT)
) COMPARTATOR_RO(
    .clk(clk),
    .reset(reset),
    .clk_count_in(clock_counter_count),
    .comp_count_in(ro_counter_count),
    .count_out(ro_comp_count)
);

////////////////////////////
// MMCM COMPARATOR
////////////////////////////
wire [31:0] mmcm_comp_count;
reg [31:0] mmcm_comp_count_reg;

comparator #(
    .COUNTER_BIT(COUNTER_BIT),
    .CLOCKS_PER_BIT(CLOCKS_PER_BIT)
) COMPARTATOR_MMCM(
    .clk(clk),
    .reset(reset),
    .clk_count_in(clock_counter_count),
    .comp_count_in(mmcm_counter_count),
    .count_out(mmcm_comp_count)
);

endmodule

