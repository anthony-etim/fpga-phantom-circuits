`include "ro_defines.sv"
`include "defines.sv"

module receiver #(
    parameter COUNTER_BIT = 32,
    parameter BIT_SIZE = 8,
	parameter RO_TYPE = `RO_LATCH,
	parameter STAGES = 2,
    parameter COOLDOWN_CYCLES = 10000000
) (
    input wire          clock,
    input wire          reset,

    input wire          receive, 
    input wire [31:0]   clock_per_bit, 
    input wire [31:0]   threshold,
    //input wire [3:0]    idx,
    output wire [BIT_SIZE-1:0]  data,
    output wire                 gotData,
    output wire [31:0]  debug_ro_counts_zero,
    output wire [31:0]  debug_ro_counts_one,
    output wire [31:0]  debug_ro_counts_two,
    output wire [31:0]  debug_ro_counts_three,
    output wire [31:0]  debug_ro_counts_four,
    output wire [31:0]  debug_ro_counts_five,
    output wire [31:0]  debug_ro_counts_six,
    output wire [31:0]  debug_ro_counts_seven,
    // debug
    output reg startROMeasure

);
///////////////////////////////////
// Debug 
///////////////////////////////////



reg [31:0]  debug_ro_counts_zero_reg = 0;
assign debug_ro_counts_zero = debug_ro_counts_zero_reg;

reg [31:0]  debug_ro_counts_one_reg = 0;
assign debug_ro_counts_one = debug_ro_counts_one_reg;

reg [31:0]  debug_ro_counts_two_reg = 0;
assign debug_ro_counts_two = debug_ro_counts_two_reg;

reg [31:0]  debug_ro_counts_three_reg = 0;
assign debug_ro_counts_three = debug_ro_counts_three_reg;

reg [31:0]  debug_ro_counts_four_reg = 0;
assign debug_ro_counts_four = debug_ro_counts_four_reg;

reg [31:0]  debug_ro_counts_five_reg = 0;
assign debug_ro_counts_five = debug_ro_counts_five_reg;

reg [31:0]  debug_ro_counts_six_reg = 0;
assign debug_ro_counts_six = debug_ro_counts_six_reg;

reg [31:0]  debug_ro_counts_seven_reg = 0;
assign debug_ro_counts_seven = debug_ro_counts_seven_reg;

///////////////////////////////////

reg [2:0] state = IDLE;
reg [2:0] return_state = IDLE;
reg [$clog2(BIT_SIZE):0] index = 0;
reg       gotData_reg= 0;

wire myROOutput;
reg [BIT_SIZE-1:0] data_reg = 0;


assign data = data_reg;
assign gotData = gotData_reg;

localparam IDLE         = 3'd0;
localparam ROMEASURE        = 3'd1;
localparam RECEIVE_BIT  = 3'd2;
localparam FINISH       = 3'd3;
localparam WAIT_RETURN  = 3'd4;
localparam COOLDOWN     = 3'd5;


(* DONT_TOUCH = "TRUE" *) reg      ro_counter_reset = 0;
(* DONT_TOUCH = "TRUE" *) wire [31:0] ro_counter_count;

counter #(
    .COUNTER_BIT(COUNTER_BIT)
) counter_RO(
    .tick(myROOutput),
    .reset(ro_counter_reset),
    .count(ro_counter_count)
);

reg       enableMyRO = 1'b1;

localparam LOCAL_SIM_SYN_SWITCH = `SIM_SYN_SWITCH;
generate
if (LOCAL_SIM_SYN_SWITCH == 0) begin
    dummyRO #(
        .RO_TYPE(RO_TYPE),
        .STAGES(STAGES)
    ) dummyRO_INST(
        .enable(enableMyRO),
        .ro_out(myROOutput)
    );

end else if (LOCAL_SIM_SYN_SWITCH == 1) begin
    (* DONT_TOUCH = "TRUE" *)
    ring_oscillator #(
        .RO_TYPE(RO_TYPE),
        .STAGES(STAGES)
    ) ring_oscillator_INST(
        .enable(enableMyRO),
        .ro_out(myROOutput)
    );
end else begin
    initial begin
        $error("Invalid SIM SYN SWITCH choice. 0 is for simulation, 1 is for synthesis");
    end
end
endgenerate


reg [31:0]  clk_count       = 0;
reg [31:0] coolDownCounter  = 0;

always_ff @(posedge clock) begin
    if (reset == 1'b1) begin
        state     <= IDLE;
        index     <= 0;
        gotData_reg <= 0;
        clk_count <= 0;
        ro_counter_reset <= 1'b1;
    end else begin
        ro_counter_reset <= 1'b0;
        startROMeasure <= 0;// debug

        case (state)
            IDLE: begin
                index <= 0;
                data_reg <=0;
                gotData_reg <=0;
                // enableMyRO <= 1'b0;
                clk_count <= 0;
                ro_counter_reset <= 1'b1;

                if (receive == 1'b1) begin// 1 binary bit of 1
                    // enableMyRO <= 1'b1;
                    state <= RECEIVE_BIT;
                end else begin
                    state <= IDLE;
                end
            end

            // WAIT_RETURN: begin
            //     state <= return_state;
            // end
            
            ROMEASURE: begin
                if (clk_count < clock_per_bit) begin// this is the fixed time slot
                    clk_count <= clk_count + 1'b1;
                    state <= ROMEASURE;
                end else begin
                    clk_count <= 0;
                    // finishes the transaction of one bit
                    if (ro_counter_count < threshold) begin
                        data_reg <= {1'b0, data_reg[BIT_SIZE-1:1]};
                    end else begin
                        data_reg <= {1'b1, data_reg[BIT_SIZE-1:1]};
                    end
                    index <= index + 1'b1;
                    coolDownCounter <= 0;
                    state <= COOLDOWN;
                    // debug signal
                    // Multiplexer for ro counts debug
                    case (index)
                        4'b0000: debug_ro_counts_zero_reg <= ro_counter_count; 
                        4'b0001: debug_ro_counts_one_reg <= ro_counter_count; 
                        4'b0010: debug_ro_counts_two_reg <= ro_counter_count; 
                        4'b0011: debug_ro_counts_three_reg <= ro_counter_count; 
                        4'b0100: debug_ro_counts_four_reg <= ro_counter_count; 
                        4'b0101: debug_ro_counts_five_reg <= ro_counter_count; 
                        4'b0110: debug_ro_counts_six_reg <= ro_counter_count; 
                        4'b0111: debug_ro_counts_seven_reg <= ro_counter_count; 
                    endcase
                end
            end

            RECEIVE_BIT: begin
                ro_counter_reset <= 1'b1;
                startROMeasure <= 1'b1;
                state <= ROMEASURE;
            end

            COOLDOWN: begin
                // the FPGA chip needs some time to cool down
                ro_counter_reset <= 1'b1;

                if (coolDownCounter > COOLDOWN_CYCLES) begin
                    if (index == BIT_SIZE) begin
                        state <= FINISH;
                    end else begin
                        state <= RECEIVE_BIT;
                    end                    
                end else begin
                    coolDownCounter <= coolDownCounter + 1'b1;
                    state <= COOLDOWN;
                end
            end


            FINISH: begin
                // enableMyRO <= 1'b0;
                gotData_reg <= 1'b1;
                state <= IDLE;
            end
            
            default: begin
                state <= IDLE;
            end
        endcase
    end
end


endmodule
