
`include "ro_defines.sv"
`include "address.sv"

module phantom_circuits_top #(
    parameter CLK_SPEED     = 300_000_000,// this line is very special, it was substitued by make_build_one.py
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

// clk_wiz_0 clk_wiz_0_inst (
//     // Clock out ports
//     .clk_out_90(clk),     // output clk_out_90
//     .clk_out_100(),     // output clk_out_100
//     .clk_out112(),     // output clk_out112
//     .clk_out_128(),     // output clk_out_128
//     .clk_out_150(),     // output clk_out_150
//     // Status and control signals
//     .reset(rst), // input reset
//     .locked(),       // output locked
//     // Clock in ports
//     .clk_in(board_clk)// input clk_in
// );


clk_wiz_0 clk_wiz_0_inst (
    // Clock out ports
    .clk_out_40(clk),         
    // Status and control signals
    .reset(rst), // input reset
    .locked(),       // output locked
    // Clock in ports
    .clk_in(board_clk)// input clk_in
);

localparam CLK_SPEED_LOC     = 40_000_000;


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
// localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED/BAUD_RATE);
localparam [30:0] INITIAL_SETUP = (4'b0000 << 27) | (3'b101 << 24) | (CLK_SPEED_LOC/BAUD_RATE);


// FSM states, 2**5 = 32 // state machine
localparam IDLE                     = 5'd0;
localparam WAIT_RETURN              = 5'd1;
localparam SET_PHANTOM_DATA         = 5'd2;
localparam SET_PHANTOM_TRANSMIT     = 5'd3;
localparam PHANTOM_RECEIVE          = 5'd4;
localparam GET_PHANTOM_CHECK        = 5'd5;
localparam SET_CLOCKS_PER_BIT       = 5'd6;
localparam SET_THRESHOLD            = 5'd7;
localparam GET_FINAL_DATA           = 5'd8;
localparam GET_DEBUG_ROCOUNTS       = 5'd9;
localparam GET_DEBUG_TX_WIRE        = 5'd10;

localparam SET_TDC_START                = 5'd19;
localparam SET_TDC_RESET                = 5'd20;
localparam SET_TDC_MEASUREMENT_NUM      = 5'd21;
localparam SET_TDC_CONFIG               = 5'd22;
localparam SET_TDC_COARSE               = 5'd23;
localparam SET_TDC_FINE                 = 5'd24;
localparam GET_TDC_STATUS               = 5'd25;
localparam GET_TDC_FIFO_ALL             = 5'd26;




reg [4:0] state  = IDLE;
reg [4:0] return_state  = IDLE;

reg [BIT_SIZE-1:0] phantom_output_data;

reg beenReadFlag = 0;

reg [2:0] out32counter = 0;
reg [2:0] in32counter = 0;


// TDC
reg  set_tdc_start = 0;
reg  set_tdc_reset = 0;

reg [31:0] out_data_internal = 0;
reg [31:0] tdc_fifo_data_internal = 0;
reg [31:0] out_debug_rocounts = 0;

reg [31:0] measurement_num_receive = 0;

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

        set_tdc_start <= 0;
        set_tdc_reset <= 0;

        axi_read_flag <= 0;

        case (state)
            IDLE: begin
                measurement_num <= measurement_num_receive;

                
                if (rx_valid && !tx_busy) begin
                    out32counter <= 0;
                    in32counter <= 0;
                    
                    case (rx_byte)
                        `SET_CLOCKS_PER_BIT_ADDR:         state <= SET_CLOCKS_PER_BIT;
                        `SET_THRESHOLD_ADDR:              state <= SET_THRESHOLD;
                        `SET_PHANTOM_DATA_ADDR:           state <= SET_PHANTOM_DATA;
                        `SET_START_CROSSTALK_ADDR:        state <= SET_PHANTOM_TRANSMIT;
                        `GET_PHANTOM_RECEIVER_STATUS_ADDR: state <= GET_PHANTOM_CHECK;
                        `GET_FINAL_DATA_ADDR:             state <= GET_FINAL_DATA;
                        `GET_DEBUG_ROCOUNTS_ZERO_ADDR:    begin out_debug_rocounts <= debug_ro_counts[0]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_ONE_ADDR:     begin out_debug_rocounts <= debug_ro_counts[1]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_TWO_ADDR:     begin out_debug_rocounts <= debug_ro_counts[2]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_THREE_ADDR:   begin out_debug_rocounts <= debug_ro_counts[3]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_FOUR_ADDR:    begin out_debug_rocounts <= debug_ro_counts[4]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_FIVE_ADDR:    begin out_debug_rocounts <= debug_ro_counts[5]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_SIX_ADDR:     begin out_debug_rocounts <= debug_ro_counts[6]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_ROCOUNTS_SEVEN_ADDR:   begin out_debug_rocounts <= debug_ro_counts[7]; state <= GET_DEBUG_ROCOUNTS;  end
                        `GET_DEBUG_TX_WIRE_ADDR:          state <= GET_DEBUG_TX_WIRE;
                        `TDC_SET_START_ADDR:              state <= SET_TDC_START;
                        `TDC_SET_RESET_ADDR:              state <= SET_TDC_RESET;
                        `TDC_SET_MEASUREMENT_NUM_ADDR:    state <= SET_TDC_MEASUREMENT_NUM;
                        `TDC_SET_CONFIG_ADDR:             state <= SET_TDC_CONFIG;
                        `TDC_SET_COARSE_ADDR:             state <= SET_TDC_COARSE;
                        `TDC_SET_FINE_ADDR:               state <= SET_TDC_FINE;
                        `TDC_GET_STATUS_ADDR:             state <= GET_TDC_STATUS;
                        `TDC_GET_FIFO0_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[0]; axi_read_flag[0] <= 1'b1; end
                        `TDC_GET_FIFO1_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[1]; axi_read_flag[1] <= 1'b1; end
                        `TDC_GET_FIFO2_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[2]; axi_read_flag[2] <= 1'b1; end
                        `TDC_GET_FIFO3_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[3]; axi_read_flag[3] <= 1'b1; end
                        `TDC_GET_FIFO4_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[4]; axi_read_flag[4] <= 1'b1; end
                        `TDC_GET_FIFO5_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[5]; axi_read_flag[5] <= 1'b1; end
                        `TDC_GET_FIFO6_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[6]; axi_read_flag[6] <= 1'b1; end
                        `TDC_GET_FIFO7_ADDR:    begin   state <= GET_TDC_FIFO_ALL; tdc_fifo_data_internal <= fifo_data[7]; axi_read_flag[7] <= 1'b1; end
                    endcase
                end else begin
                    state <= IDLE;
                end
            end 
            WAIT_RETURN: begin
                state <= return_state;
            end

            SET_TDC_START: begin
                set_tdc_start <= 1'b1;
                state <= IDLE;
            end

            SET_TDC_RESET: begin
                set_tdc_reset <= 1'b1;
                state <= IDLE;
            end

            SET_TDC_MEASUREMENT_NUM : begin
                if (in32counter == 3'b000) begin
                    // values: 000
                    if(rx_valid && !tx_busy) begin
                        measurement_num_receive[7:0] <= rx_byte; 
                        in32counter <= in32counter + 1'b1;
                    end 
                    state <= SET_TDC_MEASUREMENT_NUM;
                end else if (in32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid && !tx_busy) begin
                        measurement_num_receive <= (measurement_num_receive << 8);
                        measurement_num_receive[7:0] <= rx_byte; 
                        in32counter <= in32counter + 1'b1;
                    end
                    state <= SET_TDC_MEASUREMENT_NUM;
                end else begin
                    in32counter <= 0;
                    state <= IDLE;
                end
            end

            SET_TDC_CONFIG: begin
                if (rx_valid && !tx_busy) begin
                    tdc_config_reg = rx_byte[2:0];
                    state <= IDLE;
                end
            end
            SET_TDC_COARSE: begin
                if (rx_valid && !tx_busy) begin
                    tdc_coarse_reg = rx_byte[4:0];
                    state <= IDLE;
                end
            end
            SET_TDC_FINE: begin
                if (rx_valid && !tx_busy) begin
                    tdc_fine_reg = rx_byte[4:0];
                    state <= IDLE;
                end
            end

            GET_TDC_STATUS: begin
                if (out32counter == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= tdc_status[7:0] ;// var
                        out_data_internal <= (tdc_status >> 8);// var
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= GET_TDC_STATUS;// var
                    state <= WAIT_RETURN;
                end else if (out32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_data_internal[7:0] ;
                        out_data_internal <= (out_data_internal >> 8);
                        out32counter <= out32counter + 1'b1;
                    end
                    return_state <= GET_TDC_STATUS;// var
                    state <= WAIT_RETURN;
                end else begin
                    out32counter <= 0;
                    state <= IDLE;
                end
            end

            GET_TDC_FIFO_ALL: begin
                if (out32counter == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= tdc_fifo_data_internal[7:0] ;// var
                        out_data_internal <= (tdc_fifo_data_internal >> 8);// var
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= GET_TDC_FIFO_ALL;// var
                    state <= WAIT_RETURN;
                end else if (out32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_data_internal[7:0] ;
                        out_data_internal <= (out_data_internal >> 8);
                        out32counter <= out32counter + 1'b1;
                    end
                    return_state <= GET_TDC_FIFO_ALL;// var
                    state <= WAIT_RETURN;
                end else begin
                    out32counter <= 0;
                    state <= IDLE;
                end
            end


            SET_PHANTOM_DATA: begin
                if (rx_valid && !tx_busy) begin
                    input_Data = rx_byte;
                    state <= IDLE;
                end
            end

            SET_PHANTOM_TRANSMIT: begin
                    reset_Data <= 1'b1; 
                    state <= PHANTOM_RECEIVE;
            end
            PHANTOM_RECEIVE: begin
                    send_Data <= 1'b1;
                    receive_Data <= 1'b1;
                    state <= IDLE;
            end
            GET_PHANTOM_CHECK: begin
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= rxHasData;
                    state <= IDLE;
                end else begin
                    state <= GET_PHANTOM_CHECK;
                end
            end
            SET_CLOCKS_PER_BIT: begin
                if (in32counter == 3'b000) begin
                    // values: 000
                    if(rx_valid && !tx_busy) begin
                        clock_per_bit[7:0] <= rx_byte; 
                        // Most significant byte is sent first
                        in32counter <= in32counter + 1'b1;
                    end 
                    // return_state <= SET_CLOCKS_PER_BIT;
                    // state <= WAIT_RETURN;
                    state <= SET_CLOCKS_PER_BIT;
                end else if (in32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid && !tx_busy) begin
                        //tx_valid <= 1'b1;
                        clock_per_bit <= (clock_per_bit<< 8);
                        clock_per_bit[7:0] <= rx_byte; 
                        in32counter <= in32counter + 1'b1;
                    end
                    // return_state <= SET_CLOCKS_PER_BIT;
                    // state <= WAIT_RETURN;
                    state <= SET_CLOCKS_PER_BIT;
                end else begin
                    in32counter <= 0;
                    state <= IDLE;
                end

            end

            SET_THRESHOLD: begin
                if (in32counter == 3'b000) begin
                    // values: 000
                    if(rx_valid && !tx_busy) begin
                        threshold[7:0] <= rx_byte; 
                        // Most significant byte is sent first
                        in32counter <= in32counter + 1'b1;
                    end 
                    // return_state <= SET_THRESHOLD;
                    // state <= WAIT_RETURN;
                    state <= SET_THRESHOLD;
                end else if (in32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(rx_valid && !tx_busy) begin
                        //tx_valid <= 1'b1;
                        threshold <= (threshold << 8);
                        threshold[7:0] <= rx_byte; 
                        in32counter <= in32counter + 1'b1;
                    end
                    // return_state <= SET_THRESHOLD;
                    // state <= WAIT_RETURN;
                    state <= SET_THRESHOLD;
                end else begin
                    in32counter <= 0;
                    state <= IDLE;
                end

            end
            GET_FINAL_DATA: begin
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= phantom_output_data;
                    beenReadFlag <= 1'b1;// signal of being read by software
                    state <= IDLE;
                end 
            end

            GET_DEBUG_TX_WIRE: begin
                if(!tx_busy) begin
                    tx_valid <= 1'b1;
                    tx_byte <= tx_wire_debug;
                    state <= IDLE;
                end else begin
                    state <= GET_DEBUG_TX_WIRE;
                end
            end

            GET_DEBUG_ROCOUNTS: begin
                if (out32counter == 3'b000) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_debug_rocounts[7:0] ;// var
                        debug_ro_counts_reg <= (out_debug_rocounts >> 8);// var
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= GET_DEBUG_ROCOUNTS;// var
                    state <= WAIT_RETURN;
                end else if (out32counter <= 3'b011) begin
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= debug_ro_counts_reg[7:0] ;
                        debug_ro_counts_reg <= (debug_ro_counts_reg >> 8);
                        out32counter <= out32counter + 1'b1;
                    end
                    return_state <= GET_DEBUG_ROCOUNTS;// var
                    state <= WAIT_RETURN;
                end else begin
                    out32counter <= 0;
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

wire [31:0]  debug_ro_counts [7:0];
// wire [31:0]  debug_ro_counts_zero;
// wire [31:0]  debug_ro_counts_one;
// wire [31:0]  debug_ro_counts_two;
// wire [31:0]  debug_ro_counts_three;
// wire [31:0]  debug_ro_counts_four;
// wire [31:0]  debug_ro_counts_five;
// wire [31:0]  debug_ro_counts_six;
// wire [31:0]  debug_ro_counts_seven;
reg [31:0]  debug_ro_counts_reg = 0;
// reg [31:0]  debug_ro_counts_reg_zero = 0;
// reg [31:0]  debug_ro_counts_reg_one = 0;
// reg [31:0]  debug_ro_counts_reg_two = 0;
// reg [31:0]  debug_ro_counts_reg_three = 0;
// reg [31:0]  debug_ro_counts_reg_four = 0;
// reg [31:0]  debug_ro_counts_reg_five = 0;
// reg [31:0]  debug_ro_counts_reg_six = 0;
// reg [31:0]  debug_ro_counts_reg_seven = 0;

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

    .debug_ro_counts_zero(debug_ro_counts[0]),
    .debug_ro_counts_one(debug_ro_counts[1]),
    .debug_ro_counts_two(debug_ro_counts[2]),
    .debug_ro_counts_three(debug_ro_counts[3]),
    .debug_ro_counts_four(debug_ro_counts[4]),
    .debug_ro_counts_five(debug_ro_counts[5]),
    .debug_ro_counts_six(debug_ro_counts[6]),
    .debug_ro_counts_seven(debug_ro_counts[7])
);


/*
TDC usage:
1.  set measurement num
    set tdcConfigReg
    set coarseConfigReg
    set fineConfigReg
2. Reset and start (the code should handle the warmup)    
3. Read data
*/


wire          start_trigger;
wire          reset_axi;
reg   [31:0]  measurement_num = 0;
wire  [31:0]  tdc_config;
wire  [31:0]  tdc_status;
reg   [7:0]   fifo_rd_en = 0;
wire  [7:0]   fifo_empty;
wire  [31:0]  tdc_fifo_data [7:0];

reg           enable_tdcRealTimeRead_reg = 0;
wire  [255:0] tdcRealTimeRead;



tdc tdc_INST_0 (
  .clk(clk),
  .rst(rst),//active high
  .start_trigger(start_trigger),
  .reset_axi(reset_axi),
  .measurement_num(measurement_num),
  .tdc_config(tdc_config),
  .status(tdc_status),
  .fifo_rd_en(fifo_rd_en),
  .fifo_empty(fifo_empty),
  .fifo_data_0(tdc_fifo_data[0]),
  .fifo_data_1(tdc_fifo_data[1]),
  .fifo_data_2(tdc_fifo_data[2]),
  .fifo_data_3(tdc_fifo_data[3]),
  .fifo_data_4(tdc_fifo_data[4]),
  .fifo_data_5(tdc_fifo_data[5]),
  .fifo_data_6(tdc_fifo_data[6]),
  .fifo_data_7(tdc_fifo_data[7]),
  .enable_tdcRealTimeRead(enable_tdcRealTimeRead_reg),
  .tdcRealTimeRead(tdcRealTimeRead)
);

// assign TDC configs
reg [2:0] tdc_config_reg = 0;
reg [4:0] tdc_coarse_reg = 0;
reg [4:0] tdc_fine_reg = 0;
assign tdc_config = {3'd0, tdc_fine_reg, 3'd0, tdc_coarse_reg, 7'd0, tdc_config_reg[2], 3'd0, tdc_config_reg[1], 3'd0, tdc_config_reg[0]};
// axi reset signals
// reg axi_reset_reg1 = 0;
// reg axi_reset_reg2 = 0;
// always @(posedge clk) begin
//   if (set_tdc_reset == 1'b1) begin
//     axi_reset_reg1 <= ~axi_reset_reg2 ;
//     axi_reset_reg2 <= 1'b1;               
//   end else begin
//     axi_reset_reg1 <= 1'b0;
//     axi_reset_reg2 <= 1'b0;
//   end
// end
assign reset_axi = set_tdc_reset;
// axi start signals
// reg axi_start_reg1 = 0;
// reg axi_start_reg2 = 0;
// always @(posedge clk) begin
//   if (set_tdc_start == 1'b1) begin //to enable trigger in runtime
//     axi_start_reg1 <= ~axi_start_reg2 ;// high for only one cycle
//     axi_start_reg2 <= 1'b1;               
//   end else begin
//     axi_start_reg1 <= 1'b0;
//     axi_start_reg2 <= 1'b0;
//   end
// end
assign start_trigger = set_tdc_start;


// /////////////////////////////////////////////////////////////////////////////
// // count tdc number of 1s
// /////////////////////////////////////////////////////////////////////////////
// logic [15:0] tdcRealTimeRead_count1s;
// integer tdc_i;

// always_comb begin : TDCREALTIMEREADCOUNT1S
//   tdcRealTimeRead_count1s = 0;
//   if (enable_tdcRealTimeRead_reg == 1'b1) begin
//     for (tdc_i = 0; tdc_i < 256; tdc_i = tdc_i + 1) begin
//       tdcRealTimeRead_count1s = tdcRealTimeRead_count1s + tdcRealTimeRead[tdc_i];
//     end
//   end else begin
//     tdcRealTimeRead_count1s = tdcRealTimeRead_count1s;
//   end
// end

/////////////////////////////////////////////////////////////////////////////
// Read TDC FIFOs
/////////////////////////////////////////////////////////////////////////////
reg [7:0]       axi_read_flag           = 0;
reg [31:0]      fifo_data       [7:0];
reg [2:0]       state_fifo_read [7:0];
localparam FIFO_READ_IDLE   = 3'd0;
localparam FIFO_READ_1      = 3'd1;
localparam FIFO_READ_2      = 3'd2;
localparam FIFO_READ_WAIT   = 3'd3;
reg [2:0] counter_read_delay[7:0];
localparam FIFOREADDELAY = 3'd2;// NOT state, counter for the reading delay



generate
genvar i;
  for (i = 0; i < 8; i = i + 1) begin: AXI_FIFO_GEN
    always @(posedge clk) begin
      if ( rst == 1'b1 ) begin
        // reset
        fifo_data[i] <= 0;
        fifo_rd_en[i] <= 0;
        state_fifo_read[i] <= FIFO_READ_IDLE;
        counter_read_delay[i] <= 3'd0; 
      end
      else begin
      fifo_rd_en[i] <= 0;
      case(state_fifo_read[i])
        FIFO_READ_IDLE: begin
          if (fifo_empty[i] == 1'b0) begin
            fifo_rd_en[i] <= 1'b1;
            counter_read_delay[i] <= 3'd0;            
            state_fifo_read[i] <= FIFO_READ_1;
          end else begin
            fifo_data[i] <= 32'hfeedbee0 + i;
            state_fifo_read[i] <= FIFO_READ_IDLE;
          end
        end
        FIFO_READ_1: begin
          if (counter_read_delay[i] < FIFOREADDELAY) begin
            counter_read_delay[i] <= counter_read_delay[i] + 1'b1;
          end else begin
            state_fifo_read[i] <= FIFO_READ_2;
          end
        end
        FIFO_READ_2: begin
          fifo_data[i] <= tdc_fifo_data[i];
          state_fifo_read[i] <= FIFO_READ_WAIT;
        end
        FIFO_READ_WAIT: begin
          if (axi_read_flag[i] == 1'b1) begin// read by outside
            state_fifo_read[i] <= FIFO_READ_IDLE;
          end else begin
            state_fifo_read[i] <= FIFO_READ_WAIT;
          end
        end
      endcase 
      end
    end
  end
endgenerate




endmodule
