
`include "ro_defines.sv"
`include "address.sv"

module phantom_circuits_top #(
    parameter CLK_SPEED         = 200_000_000,// this line is very special, it was substitued by make_build_one.py
    parameter BAUD_RATE         = 921_600,
    parameter COUNTER_BIT       = 32,
    parameter CLOCKS_PER_BIT    = 100000,
    parameter RO_TYPE           = `RO_LATCH,
    parameter MAX_BIT_SIZE      = 512,
    parameter NUM_RO_COUNTER    = 4,
    parameter MAX_RO_HEATERS    = 5,
    parameter FIFO_SAMPLE_DEPTH = 1024,
    parameter NUM_RO_SENSOR     = 4,
    parameter STAGES            = 2
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
localparam GET_DATA_PREDICTED       = 5'd5;

// _PHAN denotes phantom
localparam SET_TX_WIRE_PHAN         = 5'd6;
localparam SET_DELAY_PHAN           = 5'd7;
localparam SET_DELAY_TX             = 5'd8;
// debug states
localparam GET_DEBUG                = 5'd9;

// RO and MMCM STATES
localparam MMCM_COUNTS              = 5'd10;
localparam RO_COUNTS                = 5'd11;

// Phantum Info STATES
localparam NUM_TX_BITS              = 5'd12;
localparam COOLDOWN_CYCLES          = 5'd13;

// RO HEATER STATES
localparam RO_HEATER_START          = 5'd14;
localparam RO_SENSOR_CYCLES         = 5'd15;
localparam RO_SENSOR_CYCLES_OFFSET  = 5'd16;
localparam RO_HEATER_ON_NUM         = 5'd17;
// localparam RO_HEATER_CYCLES         = 5'd18;
// localparam RO_HEATER_DATA           = 5'd19;
// localparam RO_HEATER_DATA_LEN       = 5'd20;


// state registers
(* mark_debug = "true" *) reg [4:0] state = IDLE;
reg [4:0] return_state  = IDLE;

///////////////////////
// registers and wires
///////////////////////

// reset signal from Python script, only high for one cycle, active high
(* mark_debug = "true" *) reg         reset_sw = 0;
// start the phantom transactions, only high for one cycle
(* mark_debug = "true" *) reg         start_phantum = 0;
// start the counts for the ro and mmcm, only high for one cycle
(* mark_debug = "true" *) reg         start_count = 0;
// start the ro heater
(* mark_debug = "true" *) wire        start_ro_heater; //  output wire to start collecting ro heater data measurements
(* mark_debug = "true" *) reg         ro_heater_start = 0; // start ro heater using data from console
// (* mark_debug = "true" *) reg         ro_heater_cycles_set = 0;
// (* mark_debug = "true" *) reg         ro_heater_data_set = 0;
// (* mark_debug = "true" *) reg         ro_heater_data_len_set = 0;
(* mark_debug = "true" *) reg         ro_heater_on_num_set = 0;

// debug signal from transmitter
wire        tx_wire_debug;

// counter to transmit 8 bytes
reg [31:0]   out32counter = 0;
reg [31:0]   in32counter = 0;

// 32bits data to be sent
reg [31:0]  out_32bits_data = 0;

reg [MAX_BIT_SIZE-1:0] data_predicted = 0;

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
        start_count <= 0;
        ro_heater_start <= 0;
        // ro_heater_cycles_set <= 0;
        // ro_heater_data_set <= 0;
        // ro_heater_data_len_set <= 0;
        ro_heater_on_num_set <= 0;
        axi_read_flag <= 0;
        axi_read_flag_ro_heater <= 0;

        case (state)
            IDLE: begin
                out32counter <= 0;
                in32counter <= 0;

                if (rx_valid && !tx_busy) begin
                    // choices correspond to software
                    case (rx_byte)
                        `SET_SW_RST_ADDR:             state <= SET_SW_RST;
                        `SET_DELAY_PH_ADDR:           state <= SET_DELAY_PHAN;
                        `SET_DELAY_TX_ADDR:           state <= SET_DELAY_TX;
                        `SET_TX_WIRE_TT_ADDR:         state <= SET_TX_WIRE_PHAN;
                        `SET_PHANTOM_START_ADDR:      state <= SET_PHANTOM_START;
                        `SET_NUM_TX_BITS:             state <= NUM_TX_BITS;
                        `SET_COOLDOWN_CYCLES:         state <= COOLDOWN_CYCLES;
                        `SET_RO_HEATER_START:         state <= RO_HEATER_START;
                        // `SET_RO_HEATER_CYCLES:        state <= RO_HEATER_CYCLES;
                        `SET_RO_SENSOR_CYCLES:        state <= RO_SENSOR_CYCLES;
                        `SET_RO_SENSOR_CYCLES_OFFSET: state <= RO_SENSOR_CYCLES_OFFSET;
                        // `SET_RO_HEATER_DATA:          state <= RO_HEATER_DATA;
                        // `SET_RO_HEATER_DATA_LEN:      state <= RO_HEATER_DATA_LEN;
                        `SET_RO_HEATER_ON_NUM:        state <= RO_HEATER_ON_NUM;
                        `GET_DEBUG0_PHAN_ADDR:      begin out_32bits_data <= {debug_counter[0], debug_phantum_state[23:0]}; state <=  GET_32BITS_DATA; end
                        `GET_DEBUG1_PHAN_ADDR:      begin state <=  GET_DEBUG; end
                        `GET_PHAN_FIFO_0_ADDR:      begin out_32bits_data <= fifo_data[0]; axi_read_flag[0] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_FIFO_1_ADDR:      begin out_32bits_data <= fifo_data[1]; axi_read_flag[1] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_FIFO_2_ADDR:      begin out_32bits_data <= fifo_data[2]; axi_read_flag[2] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_FIFO_3_ADDR:      begin out_32bits_data <= fifo_data[3]; axi_read_flag[3] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_RO_HEATER_FIFO_ADDR_0: begin out_32bits_data <= fifo_ro_heater_data[0]; axi_read_flag_ro_heater[0] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_RO_HEATER_FIFO_ADDR_1: begin out_32bits_data <= fifo_ro_heater_data[1]; axi_read_flag_ro_heater[1] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_RO_HEATER_FIFO_ADDR_2: begin out_32bits_data <= fifo_ro_heater_data[2]; axi_read_flag_ro_heater[2] <= 1'b1; state <=  GET_32BITS_DATA; end
                        `GET_RO_HEATER_FIFO_ADDR_3: begin out_32bits_data <= fifo_ro_heater_data[3]; axi_read_flag_ro_heater[3] <= 1'b1; state <=  GET_32BITS_DATA; end
                        // RO AND MMCM CHANNELS
                        `GET_RO_COUNTS:             begin start_count <= 1'b1; state <= RO_COUNTS;   end
                        `GET_MMCM_COUNTS:           begin start_count <= 1'b1; state <= MMCM_COUNTS; end
                        `GET_MMCM_LOCKED_STATUS:    begin out_32bits_data <= locked_status; state <=  GET_32BITS_DATA; end
                        `GET_PHAN_START:            begin out_32bits_data <= debug_fifo; state <=  GET_32BITS_DATA; end
                        `GET_DEBUG_DATA_0:          begin out_32bits_data <= debug_wire_0;  state <= GET_32BITS_DATA; end
                        `GET_DEBUG_DATA_1:          begin data_predicted <= debug_wire_1;  state <= GET_DATA_PREDICTED; end
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

            // Tx Wire SET
            SET_TX_WIRE_PHAN: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        data[7:0] <= rx_byte;
                        in32counter <= in32counter + 32'd8;
                    end
                end else if (in32counter < num_tx_bits) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        data <= (data << 8);
                        data[7:0] <= rx_byte;
                        in32counter <= in32counter + 32'd8;
                    end
                end else begin
                    state <= IDLE;
                end
            end

            // Tx Initial Delay SET
            SET_DELAY_PHAN: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        delayCycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
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
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        delayCycles_tx[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
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

            NUM_TX_BITS: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        num_tx_bits <= (1 << rx_byte);
                        // rxbyte is power of 2, limit is 255
                        // number of tx bits is then 2^255
                        // change MAX_BIT_SIZE accordingly to fit num_tx_bits
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    state <= IDLE;
                end
            end

            COOLDOWN_CYCLES: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        cooldown_cycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        cooldown_cycles <= (cooldown_cycles << 8);
                        cooldown_cycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    state <= IDLE;
                end
            end

            RO_HEATER_START: begin
                ro_heater_start <= 1'b1;
                state <= IDLE;
            end

            // RO_HEATER_CYCLES: begin
            //     ro_heater_cycles <=  (ro_sensor_cycles * ro_sensor_cycles_offset);
            //     ro_heater_cycles_set <= 1'b1;
            //     state <= IDLE;
            // end

            RO_SENSOR_CYCLES: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        ro_sensor_cycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        ro_sensor_cycles <= (ro_sensor_cycles << 8);
                        ro_sensor_cycles[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    state <= IDLE;
                end
            end

            RO_SENSOR_CYCLES_OFFSET: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        ro_sensor_cycles_offset[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        ro_sensor_cycles_offset <= (ro_sensor_cycles_offset << 8);
                        ro_sensor_cycles_offset[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    state <= IDLE;
                end
            end

            // RO_HEATER_DATA: begin
            //     if (in32counter == 32'd0) begin
            //         // values: 000
            //         if(rx_valid) begin
            //             ro_heater_data[7:0] <= rx_byte;
            //             in32counter <= in32counter + 32'd8;
            //         end
            //     end else if (in32counter < ro_heater_data_len) begin
            //         // values: 001, 010, 011
            //         if(rx_valid) begin
            //             ro_heater_data <= (ro_heater_data << 8);
            //             ro_heater_data[7:0] <= rx_byte;
            //             in32counter <= in32counter + 32'd8;
            //         end
            //     end else begin
            //         ro_heater_data_set <= 1'b1;
            //         state <= IDLE;
            //     end
            // end

            // RO_HEATER_DATA_LEN: begin
            //     if (in32counter == 32'd0) begin
            //         // values: 000
            //         if(rx_valid) begin
            //             ro_heater_data_len <= (1 << rx_byte);
            //             // rxbyte is power of 2, limit is 255
            //             // number of tx bits is then 2^255
            //             // change MAX_BIT_SIZE accordingly to fit ro_heater_data_len
            //             in32counter <= in32counter + 1'b1;
            //         end
            //     end else begin
            //         ro_heater_data_len_set <= 1'b1;
            //         state <= IDLE;
            //     end
            // end

            RO_HEATER_ON_NUM: begin
                if (in32counter == 32'd0) begin
                    // values: 000
                    if(rx_valid) begin
                        ro_heater_on_num[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else if (in32counter <= 32'd3) begin
                    // values: 001, 010, 011
                    if(rx_valid) begin
                        ro_heater_on_num <= (ro_heater_on_num << 8);
                        ro_heater_on_num[7:0] <= rx_byte;
                        in32counter <= in32counter + 1'b1;
                    end
                end else begin
                    ro_heater_on_num_set <= 1'b1;
                    state <= IDLE;
                end
            end
            
            GET_32BITS_DATA: begin
                if (out32counter == 32'd0) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= out_32bits_data[7:0] ;
                        out_32bits_data <= (out_32bits_data >> 8);
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= GET_32BITS_DATA;
                    state <= WAIT_RETURN;
                end else if (out32counter <= 32'd3) begin
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

            GET_DATA_PREDICTED: begin
                if (out32counter == 32'd0) begin
                    // values: 000
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= data_predicted[7:0] ;
                        data_predicted <= (data_predicted >> 8);
                        out32counter <= out32counter + 1'b1;
                    end 
                    return_state <= GET_DATA_PREDICTED;
                    state <= WAIT_RETURN;
                end else if (out32counter <= 32'd31) begin // change if you want to transmit more bits 8 * 32 = 256
                    // values: 001, 010, 011
                    if(!tx_busy) begin
                        tx_valid <= 1'b1;
                        tx_byte <= data_predicted[7:0] ;
                        data_predicted <= (data_predicted >> 8);
                        out32counter <= out32counter + 1'b1;
                    end
                    return_state <= GET_DATA_PREDICTED;
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

            RO_COUNTS: begin
                out_32bits_data <= ro_comp_count;  
                state <= GET_32BITS_DATA;
            end

            MMCM_COUNTS: begin
                out_32bits_data <= mmcm_comp_count;  
                state <= GET_32BITS_DATA;    
            end

            default: 
                begin
                    state <= IDLE;  
                end
        endcase
    end
end

////////////////////////////
// RO Clock Source
////////////////////////////
wire ro_clk;
wire locked_status;
(* mark_debug = "true" *)  wire [31:0] ro_comp_count;
(* mark_debug = "true" *)  wire [31:0] mmcm_comp_count;

ro_clock #(
    .COUNTER_BIT (COUNTER_BIT),
    .RO_TYPE(RO_TYPE),
    .CLOCKS_PER_BIT(CLOCKS_PER_BIT),
    .STAGES(STAGES)
) 
ro_clock_INST(
    .clk(clk),
    .debug_syncup(start_count),
    .reset(rst),
    .ro_clk(ro_clk),
    .ro_comp_count(ro_comp_count),
    .mmcm_comp_count(mmcm_comp_count),
    .locked_status(locked_status)
);
////////////////////////////
// END
////////////////////////////

// Using Ro clock for the phantom circuits clock
wire phantom_clk;
assign phantom_clk = clk;
// assign phantom_clk = ro_clk;

////////////////////////////
// parameters for tx and rx
////////////////////////////

// localparam NUM_RO_COUNTER = `NUM_RO_COUNTER;

////////////////////////////
// Instantiate transmitter 
////////////////////////////

(* mark_debug = "true" *) reg         sendbit         = 0;
(* mark_debug = "true" *) reg [31:0]  delayCycles     = 1_048_576;

wire tx_wire_debug_valid;
wire done;
wire phantom_start;
wire [31:0] debug_wire;

reg [31:0] delayCycles_tx = 1_048_576;
reg [31:0] cooldown_cycles = 0;
reg [$clog2(MAX_BIT_SIZE):0] num_tx_bits = 0;
reg [MAX_BIT_SIZE-1:0] data = 0;

reg [31:0] ro_sensor_cycles = 0;
reg [31:0] ro_sensor_cycles_offset = 0;
reg [31:0] ro_heater_on_num = 0;
// reg [31:0] ro_heater_cycles = 0;
// reg [MAX_BIT_SIZE-1:0] ro_heater_data = 0;
// reg [$clog2(MAX_BIT_SIZE)-1:0] ro_heater_data_len = 0;


simple_transmitter #(
    .MAX_BIT_SIZE(MAX_BIT_SIZE)
)
 simple_transmitter_INST (
    .clk(clk),
    .reset(reset_sw | rst),
    .send(start_phantum),
    .delayCycles(delayCycles_tx),
    .highCycles (delayCycles),
    .cooldown_cycles(cooldown_cycles),
    .data(data),
    .num_tx_bits(num_tx_bits),
    .tx_wire_debug(tx_wire_debug),
    .tx_wire_debug_valid(tx_wire_debug_valid),
    .start(phantom_start),
    .done(done),
    .debug_wire(debug_wire)
);

////////////////////////////
// Instantiate phantom 
////////////////////////////
wire [31:0]  debug_phantum_state;
(* mark_debug = "true" *)  wire    [NUM_RO_COUNTER-1:0]    fifo_empty_tx;
(* mark_debug = "true" *)  reg     [NUM_RO_COUNTER-1:0]    fifo_rd_en_tx = 0;
(* mark_debug = "true" *)  wire    [31:0]     fifo_data_rd_tx [0:NUM_RO_COUNTER-1];

wire    [31:0]     fifo_data_rd_tx_0;
wire    [31:0]     fifo_data_rd_tx_1;
wire    [31:0]     fifo_data_rd_tx_2;
wire    [31:0]     fifo_data_rd_tx_3;

wire [31:0] debug_fifo;
wire [$clog2(MAX_BIT_SIZE):0] index [0:NUM_RO_COUNTER-1];
wire [$clog2(MAX_BIT_SIZE):0] index_0;
wire [$clog2(MAX_BIT_SIZE):0] index_1;
wire [$clog2(MAX_BIT_SIZE):0] index_2;
wire [$clog2(MAX_BIT_SIZE):0] index_3;

assign index[0] = index_0;
assign index[1] = index_1;
assign index[2] = index_2;
assign index[3] = index_3;

// RX Write interface
(* mark_debug = "true" *) reg      [31:0]                  fifo_data_wr_rx = 0 ;
(* mark_debug = "true" *) reg      fifo_wr_en_rx = 0;
(* mark_debug = "true" *) wire     fifo_full_rx;

wire [31:0] debug_wire_0;
wire [MAX_BIT_SIZE-1:0] debug_wire_1;

phantum #(
    .NUM_RO_COUNTER(NUM_RO_COUNTER),
    .MAX_BIT_SIZE(MAX_BIT_SIZE),
    .MAX_RO_HEATERS(MAX_RO_HEATERS),
    .FIFO_SAMPLE_DEPTH(FIFO_SAMPLE_DEPTH),
    .COUNTER_BIT(COUNTER_BIT),
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) phantum_DUT(
    .clk(clk),
    .ro_clk(phantom_clk),
    .rst(reset_sw | rst),
    .delayCycles(delayCycles),
    .cooldown_cycles(cooldown_cycles),
    .num_tx_bits(num_tx_bits),
    .debug_phantum_state (debug_phantum_state),

    .fifo_empty_tx(fifo_empty_tx),
    .fifo_rd_en_tx(fifo_rd_en_tx),

    .fifo_data_rd_tx_0(fifo_data_rd_tx_0),
    .fifo_data_rd_tx_1(fifo_data_rd_tx_1),
    .fifo_data_rd_tx_2(fifo_data_rd_tx_2),
    .fifo_data_rd_tx_3(fifo_data_rd_tx_3),

    .index_0(index_0),
    .index_1(index_1),
    .index_2(index_2),
    .index_3(index_3),

    .fifo_data_wr_rx(fifo_data_wr_rx),
    .fifo_wr_en_rx(fifo_wr_en_rx),
    .fifo_full_rx(fifo_full_rx),

    .start_ro_heater(start_ro_heater),

    .debug_fifo(debug_fifo),
    .debug_wire_0(debug_wire_0),
    .debug_wire_1(debug_wire_1)
);
// hard code
assign fifo_data_rd_tx[0] = fifo_data_rd_tx_0;
assign fifo_data_rd_tx[1] = fifo_data_rd_tx_1;
assign fifo_data_rd_tx[2] = fifo_data_rd_tx_2;
assign fifo_data_rd_tx[3] = fifo_data_rd_tx_3;

/////////////////////////////////////////////////////////////////////////////
// Write phantum RX FIFO
/////////////////////////////////////////////////////////////////////////////
reg [NUM_RO_COUNTER-1:0]       axi_write_flag_rx = 0;

localparam FIFO_WRITE_IDLE_RX                = 3'd0;
localparam FIFO_WRITE_WAIT_RX                = 3'd1;
localparam FIFO_WRITE_RO_HEATER_CYCLES       = 3'd2;
localparam FIFO_WRITE_RO_HEATER_DATA         = 3'd3;
localparam FIFO_WRITE_RO_HEATER_DATA_LEN     = 3'd4;
localparam FIFO_WRITE_RO_HEATER_ON_NUM       = 3'd5;

reg [2:0] state_fifo_write_rx = FIFO_WRITE_IDLE_RX;

// FIFO RX WRITE
always @(posedge clk) begin
    if (rst == 1'b1) begin
        // reset
        fifo_data_wr_rx <= 0;
        fifo_wr_en_rx <= 1'b0;
        state_fifo_write_rx <= FIFO_WRITE_IDLE_RX;
    end
    else begin
        fifo_wr_en_rx <= 1'b0;
        axi_write_flag_rx <= 1'b0;
        fifo_data_wr_rx <= 0;

        case(state_fifo_write_rx)
            FIFO_WRITE_IDLE_RX: begin
                if (fifo_full_rx == 1'b0) begin
                    if (phantom_start == 1'b1) begin
                        fifo_wr_en_rx <= 1'b1;
                        fifo_data_wr_rx <= 32'd50;
                        axi_write_flag_rx <= 1'b1;
                        state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
                    end else if(ro_heater_start == 1'b1) begin
                        fifo_wr_en_rx <= 1'b1;
                        fifo_data_wr_rx <= 32'd51;
                        axi_write_flag_rx <= 1'b1;
                        state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
                    // end else if(ro_heater_cycles_set == 1'b1) begin
                    //     fifo_wr_en_rx <= 1'b1;
                    //     fifo_data_wr_rx <= 32'd52;
                    //     state_fifo_write_rx <= FIFO_WRITE_RO_HEATER_CYCLES;
                    // end else if(ro_heater_data_set == 1'b1) begin
                    //     fifo_wr_en_rx <= 1'b1;
                    //     fifo_data_wr_rx <= 32'd53;
                    //     state_fifo_write_rx <= FIFO_WRITE_RO_HEATER_DATA;
                    // end else if(ro_heater_data_len_set == 1'b1) begin
                    //     fifo_wr_en_rx <= 1'b1;
                    //     fifo_data_wr_rx <= 32'd54;
                    //     state_fifo_write_rx <= FIFO_WRITE_RO_HEATER_DATA_LEN;
                    end else if(ro_heater_on_num_set == 1'b1) begin
                        fifo_wr_en_rx <= 1'b1;
                        fifo_data_wr_rx <= 32'd55;
                        state_fifo_write_rx <= FIFO_WRITE_RO_HEATER_ON_NUM;
                    end 
                end else begin
                    state_fifo_write_rx <= FIFO_WRITE_IDLE_RX;
                end
            end

            FIFO_WRITE_RO_HEATER_ON_NUM: begin
                fifo_wr_en_rx <= 1'b1;
                fifo_data_wr_rx <= ro_heater_on_num;
                axi_write_flag_rx <= 1'b1;
                state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
            end

            FIFO_WRITE_WAIT_RX: begin
                if (axi_write_flag_rx == 1'b1) begin// write by outside
                    state_fifo_write_rx <= FIFO_WRITE_IDLE_RX;
                end else begin
                    state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
                end
            end

            // FIFO_WRITE_RO_HEATER_CYCLES: begin
            //     fifo_wr_en_rx <= 1'b1;
            //     fifo_data_wr_rx <= ro_heater_cycles;
            //     axi_write_flag_rx <= 1'b1;
            //     state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
            // end

            // FIFO_WRITE_RO_HEATER_DATA: begin
            //     fifo_wr_en_rx <= 1'b1;
            //     fifo_data_wr_rx <= ro_heater_data;
            //     axi_write_flag_rx <= 1'b1;
            //     state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
            // end

            // FIFO_WRITE_RO_HEATER_DATA_LEN: begin
            //     fifo_wr_en_rx <= 1'b1;
            //     fifo_data_wr_rx <= ro_heater_data_len;
            //     axi_write_flag_rx <= 1'b1;
            //     state_fifo_write_rx <= FIFO_WRITE_WAIT_RX;
            // end

        endcase
    end
end
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Read phantum  TX FIFOs
/////////////////////////////////////////////////////////////////////////////
reg [NUM_RO_COUNTER-1:0] axi_read_flag = 0;
reg [31:0] fifo_data [0:NUM_RO_COUNTER-1];
localparam FIFO_READ_IDLE   = 3'd0;
localparam FIFO_READ_1      = 3'd1;
localparam FIFO_READ_2      = 3'd2;
localparam FIFO_READ_WAIT   = 3'd3;
// debug counter
reg [7:0] debug_counter [0:3];
generate
genvar i;
  for (i = 0; i < NUM_RO_COUNTER; i = i + 1) begin: GEN_PHANTUM_FIFO
    reg [2:0] state_fifo_read = FIFO_READ_IDLE;

    always @(posedge clk) begin
        if (rst == 1'b1 | reset_sw == 1'b1) begin
            // reset
            fifo_data[i] <= 0;
            fifo_rd_en_tx[i] <= 0;
            state_fifo_read <= FIFO_READ_IDLE;
            debug_counter[i] <= 0;
        end
        else begin
            fifo_rd_en_tx[i] <= 0;

            case(state_fifo_read)
                FIFO_READ_IDLE: begin
                    if (fifo_empty_tx[i] == 1'b0) begin
                        fifo_rd_en_tx[i] <= 1'b1;
                        state_fifo_read <= FIFO_READ_1;
                    end else begin
                        //fifo_data[i] <= 32'hfeedbee0 + i;
                        state_fifo_read <= FIFO_READ_IDLE;
                    end
                end

                FIFO_READ_1: begin
                    state_fifo_read <= FIFO_READ_2;
                end

                FIFO_READ_2: begin
                    debug_counter[i] <= debug_counter[i] + 1'b1;                    
                    fifo_data[i] <= fifo_data_rd_tx[i];
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


/////////////////////////////////////////////////////////////////////////////
// RO HEATER 4 SENSORS BLOCK
/////////////////////////////////////////////////////////////////////////////

////////////////////////////
// READ ALWAYS BLOCK SIGNALS
////////////////////////////
reg [NUM_RO_SENSOR-1:0] axi_read_flag_ro_heater = 0;
reg [31:0] fifo_ro_heater_data [0:NUM_RO_SENSOR-1];

// RO HEATER FIFO WRITE STATES
localparam RO_HEATER_WRITE_IDLE     = 3'd0;
localparam RO_HEATER_MEASURE        = 3'd1;

// RO HEATER FIFO READ STATES
localparam RO_HEATER_READ_IDLE      = 3'd2;
localparam RO_HEATER_READ_1         = 3'd3;
localparam RO_HEATER_READ_2         = 3'd4;
localparam RO_HEATER_READ_WAIT      = 3'd5;

generate
genvar j;
    for (j = 0; j < NUM_RO_SENSOR; j = j + 1) begin: GEN_RO_HEATER_SENSOR
    
    ////////////////////////////
    // RO heater sensor
    ////////////////////////////
    // ro ticks
    wire ro_out;
    // enable signal for ro
    reg ro_enable_internal = 1'b1;
    (* DONT_TOUCH = "TRUE" *)
    ring_oscillator #(
        .RO_TYPE(RO_TYPE),
        .STAGES(STAGES)
    ) ro_sensor_INST(
        .enable(ro_enable_internal),
        .ro_out(ro_out)
    );

    // RO counter reg and wire
    (* DONT_TOUCH = "TRUE", mark_debug = "true" *)  reg   ro_counter_reset = 0;
    (* DONT_TOUCH = "TRUE", mark_debug = "true" *)  wire [31:0] ro_counter_count;

    // RO counters
    (* DONT_TOUCH = "TRUE" *)
    counter #(
        .COUNTER_BIT(COUNTER_BIT)
    ) ro_sensor_counter_RO(
        .tick(ro_out),
        .reset(ro_counter_reset),
        .count(ro_counter_count)
    );

    // FIFO reg and wire
    (* mark_debug = "true" *) reg               fifo_wr_en = 0;
    (* mark_debug = "true" *) reg [31:0]        fifo_data_wr = 0 ;
    (* mark_debug = "true" *) wire              fifo_full;

    (* mark_debug = "true" *) reg               fifo_rd_en = 0;
    (* mark_debug = "true" *) wire [31:0]       fifo_data_rd;
    (* mark_debug = "true" *) wire              fifo_empty;

    // Ro heater data FIFO
    fifo_mem #(
        .WIDTH(COUNTER_BIT),
        .DEPTH(FIFO_SAMPLE_DEPTH)
    ) ro_heater_fifo_inst (
        .clk(clk),
        .rst(rst),
        .wr(fifo_wr_en),
        .rd(fifo_rd_en),
        .din(fifo_data_wr),
        .empty(fifo_empty),
        .full(fifo_full),
        .dout(fifo_data_rd)
    );

    ////////////////////////////////////////////////////////
    // RO_HEATER FIFO WRITE ALWAYS BLOCK
    ////////////////////////////////////////////////////////
    (* mark_debug = "true" *) reg [2:0] state_ro_heater_write = RO_HEATER_WRITE_IDLE;
    reg [31:0] ro_heater_counter_clk = 0;
    // reg [31:0] ro_heater_sensor_cycles = 0;

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            state_ro_heater_write <= RO_HEATER_WRITE_IDLE;
            fifo_data_wr <= 0;
            fifo_wr_en <= 1'b0;
            //////////////////////////
            ro_heater_counter_clk <= 0;
            // ro_heater_sensor_cycles <= 0;
            ro_counter_reset <= 1'b1;
            //////////////////////////
        end else begin
            ro_counter_reset <= 1'b0;
            fifo_wr_en <= 1'b0;

            case (state_ro_heater_write)
                RO_HEATER_WRITE_IDLE: begin
                    ro_heater_counter_clk <= 0;
                    ro_counter_reset <= 1'b1;
                    if (start_ro_heater == 1'b1) begin
                        // ro_heater_sensor_cycles <= (ro_heater_cycles/ro_heater_cycles_offset);
                        state_ro_heater_write <= RO_HEATER_MEASURE;
                    end else begin
                        state_ro_heater_write <= RO_HEATER_WRITE_IDLE;
                    end
                end

                RO_HEATER_MEASURE: begin
                    if (ro_heater_counter_clk < ro_sensor_cycles) begin
                        ro_heater_counter_clk <= ro_heater_counter_clk + 1'b1;
                        state_ro_heater_write <= RO_HEATER_MEASURE;
                    end else begin
                        if (fifo_full == 1'b0) begin
                            fifo_wr_en <= 1'b1;
                            fifo_data_wr <= ro_counter_count;
                            // keep reseting the counter, sleep
                            ro_counter_reset <= 1'b1;
                            ro_heater_counter_clk <= 0;
                            state_ro_heater_write <= RO_HEATER_MEASURE; 
                        end else begin
                            // fifo is full
                            state_ro_heater_write <= RO_HEATER_WRITE_IDLE;
                        end 
                    end
                end    
            endcase
        end
    end

    ////////////////////////////////////////////////////////
    // RO_HEATER FIFO READ ALWAYS BLOCK
    ////////////////////////////////////////////////////////
    (* mark_debug = "true" *) reg [2:0] state_ro_heater_read = RO_HEATER_READ_IDLE;

    always_ff @(posedge clk) begin
        if ( rst == 1'b1 ) begin
            // reset
            fifo_ro_heater_data[j] <= 0;
            fifo_rd_en <= 0;
            state_ro_heater_read <= RO_HEATER_READ_IDLE;
        end
        else begin
            fifo_rd_en <= 0;

            case(state_ro_heater_read)
                RO_HEATER_READ_IDLE: begin
                    if (fifo_empty == 1'b0) begin
                        fifo_rd_en <= 1'b1;
                        state_ro_heater_read <= RO_HEATER_READ_1;
                    end else begin
                        state_ro_heater_read <= RO_HEATER_READ_IDLE;
                    end
                end

                RO_HEATER_READ_1: begin
                    state_ro_heater_read <= RO_HEATER_READ_2;
                end

                RO_HEATER_READ_2: begin                  
                    fifo_ro_heater_data[j] <= fifo_data_rd;
                    state_ro_heater_read <= RO_HEATER_READ_WAIT;
                end

                RO_HEATER_READ_WAIT: begin
                    if (axi_read_flag_ro_heater[j] == 1'b1) begin// read by outside
                        state_ro_heater_read <= RO_HEATER_READ_IDLE;
                    end else begin
                        state_ro_heater_read <= RO_HEATER_READ_WAIT;
                    end
                end
            endcase
        end
    end
end 
endgenerate
endmodule