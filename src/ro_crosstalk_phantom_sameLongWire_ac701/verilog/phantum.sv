
`include "ro_defines.sv"
`include "defines.sv"

module phantum #(
    parameter NUM_RO_COUNTER    = 4, // to be changed in top module
    parameter MAX_BIT_SIZE      = 256,
    parameter MAX_RO_HEATERS    = 5,
    parameter FIFO_SAMPLE_DEPTH = 1024,
    parameter COUNTER_BIT       = 32,
    parameter RO_TYPE           = `RO_LATCH,
    parameter STAGES            = 2
) (
    input wire                                 clk,
    input wire                                 ro_clk,
    input wire                                 rst,
    input wire [31:0]                          delayCycles,
    input wire [31:0]                          cooldown_cycles,
    input wire [$clog2(MAX_BIT_SIZE):0]      num_tx_bits,
    output wire [31:0]                         debug_phantum_state,

    // TX async fifo wires
    output wire    [NUM_RO_COUNTER-1:0]        fifo_empty_tx,
    input  wire    [NUM_RO_COUNTER-1:0]        fifo_rd_en_tx,

    output wire    [31:0]                      fifo_data_rd_tx_0,
    output wire    [31:0]                      fifo_data_rd_tx_1,
    output wire    [31:0]                      fifo_data_rd_tx_2,
    output wire    [31:0]                      fifo_data_rd_tx_3,

    output wire    [$clog2(MAX_BIT_SIZE):0]  index_0,
    output wire    [$clog2(MAX_BIT_SIZE):0]  index_1,
    output wire    [$clog2(MAX_BIT_SIZE):0]  index_2,
    output wire    [$clog2(MAX_BIT_SIZE):0]  index_3,

    // RX async fifo wires
    input wire     [31:0]                      fifo_data_wr_rx,
    input  wire                                fifo_wr_en_rx,
    output wire                                fifo_full_rx,

    output wire                                start_ro_heater,

    // Debug wires
    output wire [31:0]                         debug_fifo,
    output wire [31:0]                         debug_wire_0,
    output wire [MAX_BIT_SIZE-1:0]             debug_wire_1
);

////////////////////////////
// local paramters or reg generated from parameters
////////////////////////////
wire [31:0] delayCycles_unit ;
assign delayCycles_unit = (delayCycles >> 2);

////////////////////////////
// Debug output
////////////////////////////

assign debug_phantum_state = {8'd0, 
                                8'd0, 
                                4'd0, fifo_empty_tx, 
                                3'd0, GEN_RO_COUNTER_FSM[0].state};

////////////////////////////
// RO sensor
////////////////////////////
// ro ticks
wire ro_out;
// enable signal for ro
reg ro_enable_internal = 1'b1;
(* DONT_TOUCH = "TRUE" *)
ring_oscillator #(
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) ro_INST(
    .enable(ro_enable_internal),
    .ro_out(ro_out)
);

////////////////////////////
// RO Heater
////////////////////////////
reg ro_heater_start = 0;
assign start_ro_heater = ro_heater_start;
reg [MAX_BIT_SIZE-1:0] ro_heater_data_crosstalk = 0;
reg [$clog2(MAX_BIT_SIZE):0] ro_heater_data_len_crosstalk = 0;
reg [31:0] ro_heater_on_num = 0;
wire [31:0] ro_heater_debug;
// reg [31:0] ro_heater_cycles = 0;
// reg [MAX_BIT_SIZE-1:0] ro_heater_data_console = 0;
// reg [$clog2(MAX_BIT_SIZE)-1:0] ro_heater_data_len_console = 0;

ro_heater #(
    .MAX_BIT_SIZE(MAX_BIT_SIZE),
    .MAX_RO_HEATERS(MAX_RO_HEATERS)
) ro_heater_DUT(
    .ro_clk(ro_clk),
    .rst(rst),
    .ro_heater_start(ro_heater_start),
    .ro_heater_data( ro_heater_data_crosstalk),
    .ro_heater_data_len(ro_heater_data_len_crosstalk),
    .ro_heater_on_num(ro_heater_on_num),
    .ro_heater_debug(ro_heater_debug)
);

////////////////////////////////////////////////////////
// BEST OFFSET REG AND WIRES
////////////////////////////////////////////////////////
reg [4:0] state_best_offset = BEST_OFFSET_IDLE;
reg [$clog2(MAX_BIT_SIZE):0] read_counter = 0;
reg [31:0] fifo_ro_data [0:NUM_RO_COUNTER-1];
reg [NUM_RO_COUNTER-1:0] best_offset_start = 0;
reg [MAX_BIT_SIZE-1:0] data_predicted = 0;
reg [NUM_RO_COUNTER-1:0] signed_diff_bit = 0;
reg signed_diff_bit_max = 0; 
reg [31:0] best_offset_max = 0;
reg [$clog2(MAX_BIT_SIZE):0] index_best_offset = 0;
reg [$clog2(MAX_BIT_SIZE):0] counter_best_offset = 0;

// FIFO READ SIGNALS
reg [NUM_RO_COUNTER-1:0] fifo_rd_en;
wire [31:0] fifo_data_rd [0:NUM_RO_COUNTER-1];
wire [NUM_RO_COUNTER-1:0] fifo_empty;

assign debug_fifo = read_counter;
assign debug_wire_0 = ro_heater_debug;
assign debug_wire_1 = ro_heater_data_crosstalk;

////////////////////////////
// RO COUNTS Index REG
////////////////////////////
(* mark_debug = "true" *) reg [$clog2(MAX_BIT_SIZE):0] index [0:NUM_RO_COUNTER-1];   

////////////////////////////
// FIFO to store the sample data
////////////////////////////

// FIFO TX IO wires
(* mark_debug = "true" *) wire [31:0] fifo_data_rd_tx [0:NUM_RO_COUNTER-1];

//////////////////////////////////
// hardcode for the outputs
//////////////////////////////////
assign fifo_data_rd_tx_0 = fifo_data_rd_tx[0];
assign fifo_data_rd_tx_1 = fifo_data_rd_tx[1];
assign fifo_data_rd_tx_2 = fifo_data_rd_tx[2];
assign fifo_data_rd_tx_3 = fifo_data_rd_tx[3];

assign index_0 = index[0];
assign index_1 = index[1];
assign index_2 = index[2];
assign index_3 = index[3];

////////////////////////////
// States
////////////////////////////
// FIFO TX WRITE STATES
localparam IDLE                                 = 5'd0;
localparam OFFSET                               = 5'd1;
localparam ROMEASURE                            = 5'd2;
localparam CONTINUE_MEASURE                     = 5'd3;
localparam ROCOUNTS_DIFF                        = 5'd4;
localparam ROCOUNTS_PRED                        = 5'd5;
localparam FINISH                               = 5'd6;

// FIFO RX READ STATES
localparam FIFO_READ_IDLE_RX                    = 5'd7;
localparam FIFO_READ_WAIT_RX                    = 5'd8;
localparam FIFO_READ_RO_HEATER_ON_NUM_RX        = 5'd9;
localparam FIFO_READ_RO_HEATER_ON_NUM_WAIT_RX   = 5'd10;
// localparam FIFO_READ_RO_HEATER_CYCLES_RX        = 5'd9;
// localparam FIFO_READ_RO_HEATER_DATA_RX          = 5'd10;
// localparam FIFO_READ_RO_HEATER_DATA_LEN_RX      = 5'd11;
// localparam FIFO_READ_RO_HEATER_CYCLES_WAIT_RX   = 5'd13;
// localparam FIFO_READ_RO_HEATER_DATA_WAIT_RX     = 5'd14;
// localparam FIFO_READ_RO_HEATER_DATA_LEN_WAIT_RX = 5'd15;


// BEST OFFSET FIFO READ STATES
localparam BEST_OFFSET_READ_IDLE                = 5'd11;
localparam BEST_OFFSET_READ_1                   = 5'd12;
localparam BEST_OFFSET_READ_2                   = 5'd13;
localparam BEST_OFFSET_READ_WAIT_1              = 5'd14;
localparam BEST_OFFSET_READ_WAIT_2              = 5'd15;
localparam BEST_OFFSET_READ_WAIT_3              = 5'd16;
localparam BEST_OFFSET_READ_3                   = 5'd17;
localparam BEST_OFFSET_READ_4                   = 5'd18;

localparam BEST_OFFSET_IDLE                     = 5'd19;
localparam BEST_OFFSET_DIFF                     = 5'd20;
localparam BEST_OFFSET_MAX                      = 5'd21;
localparam BEST_OFFSET_PRED                     = 5'd22;
localparam BEST_OFFSET_FINISH                   = 5'd23;

////////////////////////////////////////////////////////
// RX ASYNC FIFO (ONLY 1 FIFO)
////////////////////////////////////////////////////////
  
// READ interface
(* mark_debug = "true" *) reg  fifo_rd_en_rx = 0; // read rx fifo internally
(* mark_debug = "true" *) wire [31:0] fifo_data_rd_rx;
(* mark_debug = "true" *) wire fifo_empty_rx;

fifo_generator_0 rx_async_fifo (
.rst(rst),                 // input wire rst
.wr_clk(clk),              // input wire wr_clk 200MHz
.rd_clk(ro_clk),           // input wire rd_clk 470MHz
.din(fifo_data_wr_rx),     // input wire [31 : 0] din
.wr_en(fifo_wr_en_rx),     // input wire wr_en
.rd_en(fifo_rd_en_rx),     // input wire rd_en
.dout(fifo_data_rd_rx),    // output wire [31 : 0] dout
.full(fifo_full_rx),       // output wire full
.empty(fifo_empty_rx)      // output wire empty
);

/////////////////////////////////////////////////////////////////////////////
// READ phantum RX FIFO
/////////////////////////////////////////////////////////////////////////////
reg [4:0] state_fifo_read_rx = FIFO_READ_IDLE_RX;
reg start_ro_receive = 0;
reg [31:0]  debug_reg = 0;

// FIFO RX READ
always_ff @(posedge ro_clk) begin
    if ( rst == 1'b1 ) begin
        // reset
        fifo_rd_en_rx <= 1'b0;
        state_fifo_read_rx <= FIFO_READ_IDLE_RX;
    end
    else begin
        fifo_rd_en_rx <= 1'b0;
        start_ro_receive <= 1'b0;
        ro_heater_start <= 1'b0;

        case(state_fifo_read_rx)
            FIFO_READ_IDLE_RX: begin
                if (fifo_empty_rx == 1'b0) begin
                    fifo_rd_en_rx <= 1'b1;
                    state_fifo_read_rx <= FIFO_READ_WAIT_RX;
                end else begin
                    state_fifo_read_rx <= FIFO_READ_IDLE_RX;
                end
            end
            
            FIFO_READ_WAIT_RX: begin
                if(fifo_data_rd_rx == 32'd50) begin
                    start_ro_receive <= 1'b1;
                    state_fifo_read_rx <= FIFO_READ_IDLE_RX;  
                end else if (fifo_data_rd_rx == 32'd51) begin
                    ro_heater_start <= 1'b1;
                    state_fifo_read_rx <= FIFO_READ_IDLE_RX;
                // end else if (fifo_data_rd_rx == 32'd52) begin
                //     if (fifo_empty_rx == 1'b0) begin
                //         fifo_rd_en_rx <= 1'b1;
                //         state_fifo_read_rx <= FIFO_READ_RO_HEATER_CYCLES_WAIT_RX;
                //     end
                // end else if (fifo_data_rd_rx == 32'd53) begin
                //     if (fifo_empty_rx == 1'b0) begin
                //         fifo_rd_en_rx <= 1'b1;
                //         state_fifo_read_rx <= FIFO_READ_RO_HEATER_DATA_WAIT_RX;
                //     end
                // end else if (fifo_data_rd_rx == 32'd54) begin
                //     if (fifo_empty_rx == 1'b0) begin
                //         fifo_rd_en_rx <= 1'b1;
                //         state_fifo_read_rx <= FIFO_READ_RO_HEATER_DATA_LEN_WAIT_RX;
                //     end
                end else if (fifo_data_rd_rx == 32'd55) begin
                    if (fifo_empty_rx == 1'b0) begin
                        fifo_rd_en_rx <= 1'b1;
                        state_fifo_read_rx <= FIFO_READ_RO_HEATER_ON_NUM_WAIT_RX;
                    end
                end else begin
                    state_fifo_read_rx <= FIFO_READ_WAIT_RX;
                end
            end

            FIFO_READ_RO_HEATER_ON_NUM_WAIT_RX: begin
                state_fifo_read_rx <= FIFO_READ_RO_HEATER_ON_NUM_RX;
            end

            FIFO_READ_RO_HEATER_ON_NUM_RX: begin
                ro_heater_on_num <= fifo_data_rd_rx;
                state_fifo_read_rx <= FIFO_READ_IDLE_RX;
            end

            // FIFO_READ_RO_HEATER_CYCLES_WAIT_RX: begin
            //     state_fifo_read_rx <= FIFO_READ_RO_HEATER_CYCLES_RX;
            // end

            // FIFO_READ_RO_HEATER_CYCLES_RX: begin
            //     ro_heater_cycles <= fifo_data_rd_rx;
            //     state_fifo_read_rx <= FIFO_READ_IDLE_RX;
            // end

            // FIFO_READ_RO_HEATER_DATA_WAIT_RX: begin
            //     state_fifo_read_rx <= FIFO_READ_RO_HEATER_DATA_RX;
            // end

            // FIFO_READ_RO_HEATER_DATA_RX: begin
            //     ro_heater_data_console <= fifo_data_rd_rx;
            //     state_fifo_read_rx <= FIFO_READ_IDLE_RX;
            // end
            
            // FIFO_READ_RO_HEATER_DATA_LEN_WAIT_RX: begin
            //     state_fifo_read_rx <= FIFO_READ_RO_HEATER_DATA_LEN_RX;
            // end

            // FIFO_READ_RO_HEATER_DATA_LEN_RX: begin
            //     ro_heater_data_len_console <= fifo_data_rd_rx;
            //     state_fifo_read_rx <= FIFO_READ_IDLE_RX;
            // end

        endcase
    end
end

/////////////////////////////////////////////////////////////////////////////


////////////////////////////
// Main FSM
////////////////////////////

// different offset cycles
wire [31:0] offset_clock_cycles [0:NUM_RO_COUNTER-1];
assign offset_clock_cycles[0] = 1'b1;
assign offset_clock_cycles[1] = delayCycles_unit;
assign offset_clock_cycles[2] = offset_clock_cycles[1] + delayCycles_unit;
assign offset_clock_cycles[3] = offset_clock_cycles[2] + delayCycles_unit;

// Generate the logic
genvar j;
generate;
    for (j = 0 ; j < NUM_RO_COUNTER; j = j + 1) begin: GEN_RO_COUNTER_FSM
        // RO counter reg and wire
        (* DONT_TOUCH = "TRUE", mark_debug = "true" *)  reg   ro_counter_reset = 0;
        (* DONT_TOUCH = "TRUE", mark_debug = "true" *)  wire [31:0] ro_counter_count;
        (* DONT_TOUCH = "TRUE", mark_debug = "true" *)  wire [31:0] ro_counter_count_pos;

        // RO counters
        (* DONT_TOUCH = "TRUE" *)
        counter #(
            .COUNTER_BIT(COUNTER_BIT)
        ) counter_RO(
            .tick(ro_out),
            .reset(ro_counter_reset),
            .count(ro_counter_count_pos)
        );
        
        assign ro_counter_count = ro_counter_count_pos;

        
        ////////////////////////////////////////////////////////
        // FOUR TX ASYNC FIFO AND FIFO TX WRITE
        ////////////////////////////////////////////////////////

        // TX ASYNC FIFO reg and wire
        // Write interface
        (* mark_debug = "true" *) reg              fifo_wr_en_tx = 0;
        (* mark_debug = "true" *) reg [31:0]       fifo_data_wr_tx = 0;
        (* mark_debug = "true" *) wire             fifo_full_tx;

        fifo_generator_0 tx_async_fifo (
        .rst(rst),                 // input wire rst
        .wr_clk(ro_clk),           // input wire wr_clk 470MHz
        .rd_clk(clk),              // input wire rd_clk 200MHz
        .din(fifo_data_wr_tx),     // input wire [31 : 0] din
        .wr_en(fifo_wr_en_tx),     // input wire wr_en
        .rd_en(fifo_rd_en_tx[j]),  // input wire rd_en
        .dout(fifo_data_rd_tx[j]), // output wire [31 : 0] dout
        .full(fifo_full_tx),       // output wire full
        .empty(fifo_empty_tx[j])   // output wire empty
        );

        ////////////////////////////////////////////////////////
        
        // BEST OFSSET SYNC FIFO reg and wire
        // FIFO reg and wire
        (* mark_debug = "true" *) reg               fifo_wr_en = 0;
        (* mark_debug = "true" *) reg [31:0]        fifo_data_wr = 0 ;
        (* mark_debug = "true" *) wire              fifo_full;

        // BEST OFFSET data FIFO
        fifo_mem #(
            .WIDTH(COUNTER_BIT),
            .DEPTH(FIFO_SAMPLE_DEPTH)
        ) best_offset_fifo_inst (
            .clk(ro_clk),
            .rst(rst),
            .wr(fifo_wr_en),
            .rd(fifo_rd_en[j]),
            .din(fifo_data_wr),
            .empty(fifo_empty[j]),
            .full(fifo_full),
            .dout(fifo_data_rd[j])
        );

        // Control logic
        (* mark_debug = "true" *) reg [4:0] state = IDLE;
        // counter for the clock, referencing to the RO counter
        reg [31:0] counter_offset = 0;
        reg [31:0] counter_clk = 0;
        reg [31:0] coolDownCounter  = 0;

        ////////////////////////////////////////////////////////
        // TX FIFO WRITE ALWAYS BLOCK
        ////////////////////////////////////////////////////////
        always_ff @(posedge ro_clk) begin
            if (rst == 1'b1) begin
                //////////////////////////
                state <= IDLE;
                fifo_data_wr_tx <= 0;
                fifo_wr_en_tx <= 1'b0;
                fifo_data_wr <= 0;
                fifo_wr_en <= 1'b0;
                index[j] <= 0;
                counter_clk <= 0;
                ro_counter_reset <= 1'b1;
                counter_offset <= 0;
                best_offset_start[j] <= 1'b0;
                //////////////////////////
            end else begin
                ro_counter_reset <= 1'b0;
                fifo_wr_en_tx <= 1'b0;
                fifo_wr_en <= 1'b0;
                best_offset_start[j] <= 1'b0;

                case (state)
                    IDLE: begin
                        counter_clk <= 0;
                        ro_counter_reset <= 1'b1;
                        if (start_ro_receive == 1'b1) begin
                            index[j] <= 0;
                            state <= OFFSET;
                            counter_offset <= 0;
                        end else begin
                            state <= IDLE;
                        end
                    end

                    OFFSET: begin
                        // for each offset counter, wait for several cycles
                        if (counter_offset < offset_clock_cycles[j]) begin// offset
                            counter_offset <= counter_offset + 1'b1;
                            state <= OFFSET;
                        end else begin
                            counter_clk <= 0;
                            ro_counter_reset <= 1'b1;
                            state <= ROMEASURE;
                        end
                    end

                    ROMEASURE: begin
                        if (counter_clk < delayCycles) begin
                            counter_clk <= counter_clk + 1'b1;
                            state <= ROMEASURE;
                        end else begin
                            if (fifo_full_tx == 1'b0 && fifo_full == 1'b0) begin
                                fifo_wr_en_tx <= 1'b1;
                                fifo_data_wr_tx <= ro_counter_count;
                                fifo_wr_en <= 1'b1;
                                fifo_data_wr <= ro_counter_count;
                                index[j] <= index[j] + 1'b1;
                                coolDownCounter <= 0;
                                state <= CONTINUE_MEASURE; 
                            end     
                        end
                    end

                    CONTINUE_MEASURE: begin
                        // keep reseting the counter, sleep
                        ro_counter_reset <= 1'b1;
                        counter_clk <= 0;
                        // if cooldowncycles is 0, no cooldown go to next state
                        if (cooldown_cycles == 32'd0) begin
                            if (index[j] == num_tx_bits) begin 
                                state <= FINISH;
                            end else begin
                                state <= ROMEASURE;
                            end
                        end else begin
                            if (coolDownCounter > cooldown_cycles) begin
                                if (index[j] == num_tx_bits) begin
                                    state <= FINISH;
                                end else begin
                                    state <= ROMEASURE;
                                end
                            end else begin
                                coolDownCounter <= coolDownCounter + 1'b1;
                                state <= CONTINUE_MEASURE;
                            end
                        end
                    end 
                        
                    FINISH: begin
                        best_offset_start[j] <= 1'b1;
                        state <= IDLE;
                    end
                endcase
            end
        end                    
    end
endgenerate

////////////////////////////////////////////////////////
// BEST_OFFSET FIFO READ ALWAYS BLOCK
////////////////////////////////////////////////////////

always_ff @(posedge ro_clk) begin
    if (rst == 1'b1) begin
        // reset
        state_best_offset <= BEST_OFFSET_IDLE;
        fifo_ro_data[0] <= 0; 
        fifo_ro_data[1] <= 0; 
        fifo_ro_data[2] <= 0; 
        fifo_ro_data[3] <= 0; 
        fifo_rd_en[0] <= 1'b0;
        fifo_rd_en[1] <= 1'b0;
        fifo_rd_en[2] <= 1'b0;
        fifo_rd_en[3] <= 1'b0;
        read_counter <= 0;
        data_predicted <= 0;
        ro_heater_data_crosstalk <= 0;
        ro_heater_data_len_crosstalk <= 0;
        best_offset_max <= 0;
        signed_diff_bit <= 0;
        signed_diff_bit_max <= 1'b0;
        index_best_offset <= 0;
        counter_best_offset <= 0;
    end
    else begin
        fifo_rd_en[0] <= 1'b0;
        fifo_rd_en[1] <= 1'b0;
        fifo_rd_en[2] <= 1'b0;
        fifo_rd_en[3] <= 1'b0;

        case (state_best_offset)

            BEST_OFFSET_IDLE: begin
                fifo_ro_data[0] <= 0; 
                fifo_ro_data[1] <= 0; 
                fifo_ro_data[2] <= 0; 
                fifo_ro_data[3] <= 0; 
                best_offset_max <= 0;
                signed_diff_bit <= 0;
                signed_diff_bit_max <= 1'b0;
                counter_best_offset <= 0;
                if(best_offset_start[3] == 1'b1) begin
                    read_counter <= 0;
                    data_predicted <= 0;
                    ro_heater_data_len_crosstalk <= (num_tx_bits >> 1);
                    index_best_offset <= (num_tx_bits >> 1);
                    state_best_offset <= BEST_OFFSET_READ_IDLE;
                end else begin
                    state_best_offset <= BEST_OFFSET_IDLE;
                end
            end

            BEST_OFFSET_READ_IDLE: begin    
                if(index_best_offset == 0) begin
                    ro_heater_data_crosstalk <= data_predicted;
                    state_best_offset <= BEST_OFFSET_FINISH;
                end else begin
                    if (fifo_empty == 4'b0000) begin
                        fifo_rd_en[0] <= 1'b1;
                        fifo_rd_en[1] <= 1'b1;
                        fifo_rd_en[2] <= 1'b1;
                        fifo_rd_en[3] <= 1'b1;
                        state_best_offset <= BEST_OFFSET_READ_1;
                    end else begin
                        state_best_offset <= BEST_OFFSET_READ_IDLE;
                    end  
                end
            end

            BEST_OFFSET_READ_1: begin
                state_best_offset <= BEST_OFFSET_READ_2;
            end

            BEST_OFFSET_READ_2: begin     
                fifo_ro_data[0] <= fifo_data_rd[0];    
                fifo_ro_data[1] <= fifo_data_rd[1];  
                fifo_ro_data[2] <= fifo_data_rd[2];  
                fifo_ro_data[3] <= fifo_data_rd[3];  
                read_counter <= read_counter + 1'b1;
                state_best_offset <= BEST_OFFSET_READ_WAIT_1;
            end

            BEST_OFFSET_READ_WAIT_1: begin
                state_best_offset <= BEST_OFFSET_READ_3;
            end

            BEST_OFFSET_READ_3: begin
                if (fifo_empty == 4'b0000) begin
                    fifo_rd_en[0] <= 1'b1;
                    fifo_rd_en[1] <= 1'b1;
                    fifo_rd_en[2] <= 1'b1;
                    fifo_rd_en[3] <= 1'b1;
                    state_best_offset <= BEST_OFFSET_READ_WAIT_2; 
                end else begin
                    state_best_offset <= BEST_OFFSET_READ_3;
                end
            end

            BEST_OFFSET_READ_WAIT_2: begin
                state_best_offset <= BEST_OFFSET_READ_4;
            end

            BEST_OFFSET_READ_4: begin
                if(fifo_ro_data[0] > fifo_data_rd[0]) begin
                    fifo_ro_data[0] <= fifo_ro_data[0] - fifo_data_rd[0];
                    signed_diff_bit[0] <= 1'b1;
                end else begin
                    fifo_ro_data[0] <= fifo_data_rd[0]- fifo_ro_data[0];
                    signed_diff_bit[0] <= 1'b0;
                end
                if(fifo_ro_data[1] > fifo_data_rd[1]) begin
                    fifo_ro_data[1] <= fifo_ro_data[1] - fifo_data_rd[1];
                    signed_diff_bit[1] <= 1'b1;
                end else begin
                    fifo_ro_data[1] <= fifo_data_rd[1]- fifo_ro_data[1];
                    signed_diff_bit[1] <= 1'b0;
                end
                if(fifo_ro_data[2] > fifo_data_rd[2]) begin
                    fifo_ro_data[2] <= fifo_ro_data[2] - fifo_data_rd[2];
                    signed_diff_bit[2] <= 1'b1;
                end else begin
                    fifo_ro_data[2] <= fifo_data_rd[2]- fifo_ro_data[2];
                    signed_diff_bit[2] <= 1'b0;
                end
                if(fifo_ro_data[3] > fifo_data_rd[3]) begin
                    fifo_ro_data[3] <= fifo_ro_data[3] - fifo_data_rd[3];
                    signed_diff_bit[3] <= 1'b1;
                end else begin
                    fifo_ro_data[3] <= fifo_data_rd[3]- fifo_ro_data[3];
                    signed_diff_bit[3] <= 1'b0;
                end
                state_best_offset <= BEST_OFFSET_MAX;
                read_counter <= read_counter + 1'b1;
                counter_best_offset <= 0;
                signed_diff_bit_max <= 0;
                best_offset_max <= 0;
            end  
            
            BEST_OFFSET_MAX: begin
                if(fifo_ro_data[counter_best_offset] > best_offset_max) begin
                    best_offset_max <= fifo_ro_data[counter_best_offset];
                    signed_diff_bit_max <= signed_diff_bit[counter_best_offset];
                end
                if(counter_best_offset < 32'd3) begin
                    counter_best_offset <= counter_best_offset + 1'b1;
                    state_best_offset <= BEST_OFFSET_MAX;  
                end else begin
                    state_best_offset <= BEST_OFFSET_PRED;
                end
            end

            BEST_OFFSET_PRED: begin
                data_predicted[index_best_offset - 1'b1] <= signed_diff_bit_max;
                index_best_offset <= index_best_offset - 1'b1;
                state_best_offset <= BEST_OFFSET_READ_IDLE;
            end

            BEST_OFFSET_FINISH: begin
                state_best_offset <= BEST_OFFSET_IDLE;
            end
        endcase   
    end
end
endmodule