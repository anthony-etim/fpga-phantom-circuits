`include "ro_defines.sv"
`include "power2.v"

module phantom_circuits_top #(
    parameter CLK_SPEED     = 200000000,
    parameter BAUD_RATE     = 921_600,
    //parameter CLOCKS_PER_BIT = 10,
    parameter BIT_SIZE = 8,
    parameter RO_TYPE = `RO_LATCH,
    parameter STAGES = 2)
(
    input  wire clk_p,
    input  wire clk_n,
    //input  wire rst,

    input  wire uart_rx,
    output wire uart_tx
);

///////////////////////
// Global clock
///////////////////////
wire           clk;
// Differential pair to single-ended clock conversion
IBUFDS #(
    .DQS_BIAS("FALSE")
) IBUFDS_inst (
    .I(clk_p),
    .IB(clk_n),
    .O(clk)
);

///////////////////////
// rst
///////////////////////
reg            rst = 0;
reg [3:0]      rst_init_counter = 0;
always_ff @(posedge clk) begin
    if (rst_init_counter < 4'd8) begin
        rst <= 0;
        rst_init_counter <= rst_init_counter + 1'b1;
    end else if (rst_init_counter < 4'd12) begin
        rst <= 1'b1;
        rst_init_counter <= rst_init_counter + 1'b1;
    end else begin
        rst <= 0;
    end
end


///////////////////////
// UART connections
///////////////////////
reg  [7:0]     tx_byte;
wire [7:0]     rx_byte;
wire           tx_ready;
reg            tx_valid;
wire           rx_valid;
wire           tx_busy;
///////////////////////
// Other registers and wires
///////////////////////
reg  [BIT_SIZE-1:0] input_Data;
wire [BIT_SIZE-1:0] output_Data;
wire                tx_wire_debug;
wire       gotData;
wire       tx_done;
reg  [31:0] random_bits;
reg        send_Data;
reg        reset_Data;
reg        receive_Data;
reg [31:0] clock_per_bit = 0;
reg [31:0] threshold = 0;


// UART configuration, see rxuart.v and txuart.v
// 8 bit words, one stop bit | parity exists, not fixed, odd | clocks per baud
localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED/BAUD_RATE);

// UART protocol
localparam GET_INTIAL_DATA           = 8'b0000_0001;
localparam START_CROSSTALK           = 8'b0000_0010;
localparam IS_PHANTOM_RECEIVER_READY = 8'b0000_0011;
localparam GET_FINAL_DATA            = 8'b0000_0100;
localparam GET_CLOCKS_PER_BIT        = 8'b0000_0101;
localparam GET_THRESHOLD             = 8'b0000_0110;
//localparam GET_DEBUG_ROCOUNTS        = 8'b0000_0111;
localparam GET_DEBUG_ROCOUNTS_ZERO   = 8'b0000_0111;
localparam GET_DEBUG_ROCOUNTS_ONE    = 8'b0000_1000;
localparam GET_DEBUG_ROCOUNTS_TWO    = 8'b0000_1001;
localparam GET_DEBUG_ROCOUNTS_THREE  = 8'b0000_1010;
localparam GET_DEBUG_ROCOUNTS_FOUR   = 8'b0000_1011;
localparam GET_DEBUG_ROCOUNTS_FIVE   = 8'b0000_1100;
localparam GET_DEBUG_ROCOUNTS_SIX    = 8'b0000_1101;
localparam GET_DEBUG_ROCOUNTS_SEVEN  = 8'b0000_1110;
localparam GET_DEBUG_TX_WIRE  = 8'b0000_1111;

// FSM states
localparam IDLE = 5'd0,
           PHANTOM_DATA         = 5'd1,
           PHANTOM_TRANSMIT     = 5'd2,
           PHANTOM_RECEIVE      = 5'd3,
           PHANTOM_CHECK        = 5'd4,
           SET_CLOCKS_PER_BIT   = 5'd5,
           SET_THRESHOLD        = 5'd6,
           FINISH               = 5'd7;// state machine
localparam DEBUG_ROCOUNTS       = 5'd8;
localparam DEBUG_ROCOUNTS_ZERO  = 5'd9;
localparam DEBUG_ROCOUNTS_ONE   = 5'd10;
localparam DEBUG_ROCOUNTS_TWO   = 5'd11;
localparam DEBUG_ROCOUNTS_THREE = 5'd12;
localparam DEBUG_ROCOUNTS_FOUR  = 5'd13;
localparam DEBUG_ROCOUNTS_FIVE  = 5'd14;
localparam DEBUG_ROCOUNTS_SIX   = 5'd15;
localparam DEBUG_ROCOUNTS_SEVEN = 5'd16;
localparam WAIT_RETURN          = 5'd17;
localparam DEBUG_TX_WIRE        = 5'd18;

reg [4:0] state  = IDLE;
reg [4:0] return_state  = IDLE;

reg [BIT_SIZE-1:0] phantom_output_data;

reg beenReadFlag = 0;

// reg [2:0] out32counter = 0;
reg [2:0] out32counter_zero = 0;
reg [2:0] out32counter_one = 0;
reg [2:0] out32counter_two = 0;
reg [2:0] out32counter_three = 0;
reg [2:0] out32counter_four = 0;
reg [2:0] out32counter_five = 0;
reg [2:0] out32counter_six = 0;
reg [2:0] out32counter_seven = 0;
reg [2:0] in32counter_one = 0;
reg [2:0] in32counter_two = 0;
// reg [3:0] idx = 0;

// State machine for looping back UART RX to TX
always_ff @(posedge clk) begin
    if (rst == 1'b1) begin
        tx_valid <= 0;
        tx_byte <= 0;
    end
    else begin
        reset_Data <= 0;
        send_Data <= 0;
        receive_Data <= 0;
        tx_valid <=0;
        tx_byte <= 0;

        beenReadFlag <= 0;

        case (state)
            IDLE:
                begin
                    if (rx_valid && !tx_busy) begin
                        if (rx_byte == GET_CLOCKS_PER_BIT) begin
                            state <= SET_CLOCKS_PER_BIT;
                        end
                        else if (rx_byte == GET_THRESHOLD) begin
                            state <= SET_THRESHOLD;
                        end
                        else if (rx_byte == GET_INTIAL_DATA) begin
                            state <= PHANTOM_DATA;
                        end
                        else if(rx_byte == START_CROSSTALK) begin
                            //generate random 8 bits for phantom transmitter
                            state <= PHANTOM_TRANSMIT;
                        end
                        else if (rx_byte == IS_PHANTOM_RECEIVER_READY) begin
                            state <= PHANTOM_CHECK;
                        end
                        else if (rx_byte == GET_FINAL_DATA) begin
                            state <= FINISH;
                        end
                        // else if (rx_byte == GET_DEBUG_ROCOUNTS) begin
                        //     out32counter <= 0;
                        //     state <= DEBUG_ROCOUNTS;
                        // end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_ZERO) begin
                            out32counter_zero <= 0;
                            state <= DEBUG_ROCOUNTS_ZERO;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_ONE) begin
                            out32counter_one <= 0;
                            state <= DEBUG_ROCOUNTS_ONE;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_TWO) begin
                            out32counter_two <= 0;
                            state <= DEBUG_ROCOUNTS_TWO;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_THREE) begin
                            out32counter_three <= 0;
                            state <= DEBUG_ROCOUNTS_THREE;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_FOUR) begin
                            out32counter_four <= 0;
                            state <= DEBUG_ROCOUNTS_FOUR;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_FIVE) begin
                            out32counter_five <= 0;
                            state <= DEBUG_ROCOUNTS_FIVE;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_SIX) begin
                            out32counter_six <= 0;
                            state <= DEBUG_ROCOUNTS_SIX;
                        end
                        else if (rx_byte == GET_DEBUG_ROCOUNTS_SEVEN) begin
                            out32counter_seven <= 0;
                            state <= DEBUG_ROCOUNTS_SEVEN;
                        end if (rx_byte == GET_DEBUG_TX_WIRE) begin
                            state <= DEBUG_TX_WIRE;
                        end
                    end
                    else 
                        state <= IDLE;
                end 
            PHANTOM_DATA:
                begin
                    if (rx_valid && !tx_busy) begin
                        input_Data = rx_byte;
                        state <= IDLE;
                    end
                end
            PHANTOM_TRANSMIT:
                begin
                    reset_Data <= 1'b1; 
                    state <= PHANTOM_RECEIVE;
                end
            PHANTOM_RECEIVE:
                begin
                    send_Data <= 1'b1;
                    receive_Data <= 1'b1;
                    state <= IDLE;
                end
            PHANTOM_CHECK:
                begin
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= rxHasData;
                        state <= IDLE;
                    end else 
                        state <= PHANTOM_CHECK;
                end
            SET_CLOCKS_PER_BIT:
                begin
                    // if (rx_valid && !tx_busy) begin
                    //     clock_per_bit <= `POWER2(rx_byte);
                    //     state <= IDLE;
                    // end

                    if (in32counter_one == 3'b000) begin
                    // values: 000
                    if(rx_valid && !tx_busy) begin
                        //tx_valid <= 1'b1;
                        clock_per_bit[7:0] <= rx_byte; 
                        // Most significant byte is sent first
                        //tx_byte <= debug_ro_counts[7:0] ;
                        //debug_ro_counts_reg <= (debug_ro_counts >> 8);
                        in32counter_one <= in32counter_one + 1'b1;
                    end 
                    // return_state <= SET_CLOCKS_PER_BIT;
                    // state <= WAIT_RETURN;
                    state <= SET_CLOCKS_PER_BIT;
                end else if (in32counter_one <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid && !tx_busy) begin
                        //tx_valid <= 1'b1;
                        clock_per_bit <= (clock_per_bit<< 8);
                        clock_per_bit[7:0] <= rx_byte; 
                        in32counter_one <= in32counter_one + 1'b1;
                    end
                    // return_state <= SET_CLOCKS_PER_BIT;
                    // state <= WAIT_RETURN;
                    state <= SET_CLOCKS_PER_BIT;
                end else begin
                    in32counter_one <= 0;
                    state <= IDLE;
                end

                end
            SET_THRESHOLD:
                begin
                    // if (rx_valid && !tx_busy) begin
                    //     threshold <= `POWER2(rx_byte);
                    //     state <= IDLE;
                    // end

                    if (in32counter_two == 3'b000) begin
                    // values: 000
                    if(rx_valid && !tx_busy) begin
                        //tx_valid <= 1'b1;
                        threshold[7:0] <= rx_byte; 
                        // Most significant byte is sent first
                        //tx_byte <= debug_ro_counts[7:0] ;
                        //debug_ro_counts_reg <= (debug_ro_counts >> 8);
                        in32counter_two <= in32counter_two + 1'b1;
                    end 
                    // return_state <= SET_THRESHOLD;
                    // state <= WAIT_RETURN;
                    state <= SET_THRESHOLD;
                end else if (in32counter_two <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid && !tx_busy) begin
                        //tx_valid <= 1'b1;
                        threshold <= (threshold << 8);
                        threshold[7:0] <= rx_byte; 
                        in32counter_two <= in32counter_two + 1'b1;
                    end
                    // return_state <= SET_THRESHOLD;
                    // state <= WAIT_RETURN;
                    state <= SET_THRESHOLD;
                end else begin
                    in32counter_two <= 0;
                    state <= IDLE;
                end

                end
            FINISH:
                begin
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= phantom_output_data;
                        beenReadFlag <= 1'b1;// signal of being read by software
                        state <= IDLE;
                    end 
                end
            // DEBUG_ROCOUNTS: begin
            //     if (out32counter == 3'b000) begin
            //         // values: 000
            //         if(!tx_busy) begin
            //             tx_valid <= 1'b1;
            //             tx_byte <= debug_ro_counts[7:0] ;
            //             debug_ro_counts_reg <= (debug_ro_counts >> 8);
            //             out32counter <= out32counter + 1'b1;
            //         end 
            //         return_state <= DEBUG_ROCOUNTS;
            //         state <= WAIT_RETURN;
            //     end else if (out32counter <= 3'b011) begin
            //         // values: 001, 010, 011
            //         if(!tx_busy) begin
            //             tx_valid <= 1'b1;
            //             tx_byte <= debug_ro_counts_reg[7:0] ;
            //             debug_ro_counts_reg <= (debug_ro_counts_reg >> 8);
            //             out32counter <= out32counter + 1'b1;
            //         end
            //         return_state <= DEBUG_ROCOUNTS;
            //         state <= WAIT_RETURN;
            //     end else begin
            //         out32counter <= 0;
            //         state <= IDLE;
            //     end
            // end

            DEBUG_TX_WIRE: begin
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= tx_wire_debug;
                    state <= IDLE;
                end else begin
                    state <= DEBUG_TX_WIRE;
                end
            end


            DEBUG_ROCOUNTS_ZERO: begin
                if (out32counter_zero == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_zero[7:0] ;
                        debug_ro_counts_reg_zero <= (debug_ro_counts_zero >> 8);
                        out32counter_zero <= out32counter_zero + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_ZERO;
                    state <= WAIT_RETURN;
                end else if (out32counter_zero <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_zero[7:0] ;
                        debug_ro_counts_reg_zero <= (debug_ro_counts_reg_zero >> 8);
                        out32counter_zero <= out32counter_zero + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_ZERO;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_zero <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_ONE: begin
                if (out32counter_one == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_one[7:0] ;
                        debug_ro_counts_reg_one <= (debug_ro_counts_one >> 8);
                        out32counter_one <= out32counter_one + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_ONE;
                    state <= WAIT_RETURN;
                end else if (out32counter_one <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_one[7:0] ;
                        debug_ro_counts_reg_one <= (debug_ro_counts_reg_one >> 8);
                        out32counter_one <= out32counter_one + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_ONE;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_one <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_TWO: begin
                if (out32counter_two == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_two[7:0] ;
                        debug_ro_counts_reg_two <= (debug_ro_counts_two >> 8);
                        out32counter_two <= out32counter_two + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_TWO;
                    state <= WAIT_RETURN;
                end else if (out32counter_two <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_two[7:0] ;
                        debug_ro_counts_reg_two <= (debug_ro_counts_reg_two >> 8);
                        out32counter_two <= out32counter_two + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_TWO;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_two <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_THREE: begin
                if (out32counter_three == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_three[7:0] ;
                        debug_ro_counts_reg_three <= (debug_ro_counts_three >> 8);
                        out32counter_three <= out32counter_three + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_THREE;
                    state <= WAIT_RETURN;
                end else if (out32counter_three <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_three[7:0] ;
                        debug_ro_counts_reg_three <= (debug_ro_counts_reg_three >> 8);
                        out32counter_three <= out32counter_three + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_THREE;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_three <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_FOUR: begin
                if (out32counter_four == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_four[7:0] ;
                        debug_ro_counts_reg_four <= (debug_ro_counts_four >> 8);
                        out32counter_four <= out32counter_four + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_FOUR;
                    state <= WAIT_RETURN;
                end else if (out32counter_four <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_four[7:0] ;
                        debug_ro_counts_reg_four <= (debug_ro_counts_reg_four >> 8);
                        out32counter_four <= out32counter_four + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_FOUR;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_four <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_FIVE: begin
                if (out32counter_five == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_five[7:0] ;
                        debug_ro_counts_reg_five <= (debug_ro_counts_five >> 8);
                        out32counter_five <= out32counter_five + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_FIVE;
                    state <= WAIT_RETURN;
                end else if (out32counter_five <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_five[7:0] ;
                        debug_ro_counts_reg_five <= (debug_ro_counts_reg_five >> 8);
                        out32counter_five <= out32counter_five + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_FIVE;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_five <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_SIX: begin
                if (out32counter_six == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_six[7:0] ;
                        debug_ro_counts_reg_six <= (debug_ro_counts_six >> 8);
                        out32counter_six <= out32counter_six + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_SIX;
                    state <= WAIT_RETURN;
                end else if (out32counter_six <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_six[7:0] ;
                        debug_ro_counts_reg_six <= (debug_ro_counts_reg_six >> 8);
                        out32counter_six <= out32counter_six + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_SIX;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_six <= 0;
                    state <= IDLE;
                end
            end

            DEBUG_ROCOUNTS_SEVEN: begin
                if (out32counter_seven == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_seven[7:0] ;
                        debug_ro_counts_reg_seven <= (debug_ro_counts_seven >> 8);
                        out32counter_seven <= out32counter_seven + 1'b1;
                    end 
                    return_state <= DEBUG_ROCOUNTS_SEVEN;
                    state <= WAIT_RETURN;
                end else if (out32counter_seven <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg_seven[7:0] ;
                        debug_ro_counts_reg_seven <= (debug_ro_counts_reg_seven >> 8);
                        out32counter_seven <= out32counter_seven + 1'b1;
                    end
                    return_state <= DEBUG_ROCOUNTS_SEVEN;
                    state <= WAIT_RETURN;
                end else begin
                    out32counter_seven <= 0;
                    state <= IDLE;
                end
            end

            WAIT_RETURN: begin
                state <= return_state;
            end

            default: 
                begin
                    state <= IDLE;  
                end
        endcase
        
    end
end

////////////////////////////
// Deal with gotData and data value
////////////////////////////

reg rxHasData = 0;

always_ff @(posedge clk) begin
    if (rst == 1'b1) begin
        rxHasData <= 0;
        phantom_output_data <= 0;
    end else begin
        if ((gotData == 1'b1) && (rxHasData == 1'b0)) begin
            rxHasData <= 1'b1;
            phantom_output_data <= output_Data;
        end else begin
            if (beenReadFlag == 1'b1) begin
                rxHasData <= 0;
                phantom_output_data <= 0;
            end
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

//integer CLOCKS_PER_BIT = CLOCKS_PER_BIT_TEMP[31:0];

(* DONT_TOUCH = "TRUE" *)
transmitter #(
    //.CLOCKS_PER_BIT(CLOCKS_PER_BIT_TEMP),
    .BIT_SIZE(BIT_SIZE)
) transmitter_INST (
    .send(send_Data),
    .clock(clk),
    .reset(reset_Data), 
    .clock_per_bit(clock_per_bit),
    .data(input_Data),
    .tx_wire_debug(tx_wire_debug),
    .done(tx_done)
);

// wire [31:0]  debug_ro_counts;
wire [31:0]  debug_ro_counts_zero;
wire [31:0]  debug_ro_counts_one;
wire [31:0]  debug_ro_counts_two;
wire [31:0]  debug_ro_counts_three;
wire [31:0]  debug_ro_counts_four;
wire [31:0]  debug_ro_counts_five;
wire [31:0]  debug_ro_counts_six;
wire [31:0]  debug_ro_counts_seven;
//reg [31:0]  debug_ro_counts_reg = 0;
reg [31:0]  debug_ro_counts_reg_zero = 0;
reg [31:0]  debug_ro_counts_reg_one = 0;
reg [31:0]  debug_ro_counts_reg_two = 0;
reg [31:0]  debug_ro_counts_reg_three = 0;
reg [31:0]  debug_ro_counts_reg_four = 0;
reg [31:0]  debug_ro_counts_reg_five = 0;
reg [31:0]  debug_ro_counts_reg_six = 0;
reg [31:0]  debug_ro_counts_reg_seven = 0;

receiver #(
    //.CLOCKS_PER_BIT(CLOCKS_PER_BIT_TEMP),
    .BIT_SIZE(BIT_SIZE),
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) receiver_INST(
    .receive(receive_Data),
    .clock(clk),
    .reset(reset_Data),
    .clock_per_bit(clock_per_bit),
    .threshold(threshold),
    //.idx(idx),
    .data(output_Data),
    .gotData(gotData),
    //.debug_ro_counts(debug_ro_counts)
    .debug_ro_counts_zero(debug_ro_counts_zero),
    .debug_ro_counts_one(debug_ro_counts_one),
    .debug_ro_counts_two(debug_ro_counts_two),
    .debug_ro_counts_three(debug_ro_counts_three),
    .debug_ro_counts_four(debug_ro_counts_four),
    .debug_ro_counts_five(debug_ro_counts_five),
    .debug_ro_counts_six(debug_ro_counts_six),
    .debug_ro_counts_seven(debug_ro_counts_seven)
);

endmodule