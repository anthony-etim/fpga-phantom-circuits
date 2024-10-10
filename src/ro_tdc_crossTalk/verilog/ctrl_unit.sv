`default_nettype wire

module ctrl_unit #(
    parameter TRNGCFG_WIDTH = 5,
    parameter TRNG_WIDTH    = 256
    )(
    input  logic       clk,
    input  logic       rst,
    input  logic       stop,
    input  logic       man_mode,
    input  logic       man_cfg,
    output logic       entropy_vld,
    //---------------- TRNG signals ----------------//
    output logic                     trng_enable,
    output logic [TRNGCFG_WIDTH-1:0] trng_fine_cfg,
    output logic [TRNGCFG_WIDTH-1:0] trng_coarse_cfg,
    input  logic [TRNG_WIDTH-1:0]    trng_output,
    input  logic                     trng_valid_out,

    //---------------- Optional AWS interface ------//
    input  logic [TRNGCFG_WIDTH-1:0] aws_fine_cfg,
    input  logic [TRNGCFG_WIDTH-1:0] aws_coarse_cfg
    );

//====================================================================
// Signal declarations
//====================================================================
localparam FINE_MAX    = 8'd26;
localparam COARSE_MAX  = 8'd24;
localparam FINE_INIT   = FINE_MAX/2;
localparam COARSE_INIT = COARSE_MAX/2;

localparam BOUND_LO_OUTSIDE = 8'd48;
localparam BOUND_LO_INSIDE  = 8'd98;
localparam BOUND_HI_INSIDE  = 8'd158;
localparam BOUND_HI_OUTSIDE = 8'd208;

localparam REQ_SAMPLES = 8'd80;

enum logic [2:0] {
    IDLE,
    RUN_TRNG,
    STOP_TRNG,
    COUNT_ONES,
    TUNE_TRNG,
    CHECK_ENTROPY,
    FINISH
} state, state_next;

logic                     trng_enable_next;
logic [TRNGCFG_WIDTH-1:0] trng_fine_cfg_next;
logic [TRNGCFG_WIDTH-1:0] trng_coarse_cfg_next;

logic [$clog2(TRNG_WIDTH)-1:0] cnt, cnt_next;
logic [$clog2(TRNG_WIDTH):0] sum_of_ones, sumofones_next;
logic [7:0] samples_cnt, samples_cnt_next;
//====================================================================
// Combinational/sequential logic
//====================================================================

//--------------------------------------------------------------------
// FSMD sequential logic
//--------------------------------------------------------------------
always_ff @(posedge clk) begin
    if(rst==1'b1) begin
        state           <= IDLE;
        trng_enable     <= '0;
        trng_fine_cfg   <= FINE_INIT;
        trng_coarse_cfg <= COARSE_INIT;
        cnt             <= '0;
        sum_of_ones     <= '0;
        samples_cnt     <= '0;
        entropy_vld     <= '0;
    end else begin
        state           <= state_next;
        trng_enable     <= trng_enable_next;
        trng_fine_cfg   <= trng_fine_cfg_next;
        trng_coarse_cfg <= trng_coarse_cfg_next;
        cnt             <= cnt_next;
        sum_of_ones     <= sumofones_next;
        samples_cnt     <= samples_cnt_next;

        // Set the entropy_vld signal to high to indicate that we have accumulated enough entropy
        entropy_vld     <= samples_cnt > REQ_SAMPLES;
    end
end

//--------------------------------------------------------------------
// FSMD combinational logic
//--------------------------------------------------------------------
always_comb begin
    // Default states
    state_next           = state;
    trng_enable_next     = trng_enable;
    trng_fine_cfg_next   = trng_fine_cfg;
    trng_coarse_cfg_next = trng_coarse_cfg;
    cnt_next             = cnt;
    sumofones_next       = sum_of_ones;
    samples_cnt_next     = samples_cnt;

    case(state)
        //------------------------------------------------------------------------------------------
        IDLE: begin
            if(man_cfg==1'b1) begin
                trng_fine_cfg_next   = aws_fine_cfg;
                trng_coarse_cfg_next = aws_coarse_cfg;
            end else begin
                trng_fine_cfg_next   = FINE_INIT;
                trng_coarse_cfg_next = COARSE_INIT;
            end

            state_next = RUN_TRNG;
        end

        //------------------------------------------------------------------------------------------
        RUN_TRNG: begin
            sumofones_next = '0;

            if(trng_valid_out==1'b1) begin
                trng_enable_next = '0;
                state_next       = man_mode ? FINISH : COUNT_ONES;
            end else begin
                trng_enable_next = '1;
                state_next       = RUN_TRNG;
            end
        end

        //------------------------------------------------------------------------------------------
        // GP-19/10/19: perhaps we can use the built-in countones(), not sure if it is synthesizable though
        COUNT_ONES: begin
            cnt_next       = cnt + 1;
            sumofones_next = trng_output[cnt] ? sum_of_ones + 1 : sum_of_ones;
            state_next     = cnt == '1 ? TUNE_TRNG : COUNT_ONES;
        end

        //------------------------------------------------------------------------------------------
        // Readjust the coarse and fine settings based on the predefined boundaries
        TUNE_TRNG: begin
            if((sum_of_ones <= BOUND_LO_OUTSIDE) && (trng_coarse_cfg > '0)) begin
                trng_fine_cfg_next   = FINE_INIT;
                trng_coarse_cfg_next = trng_coarse_cfg - 1;
            end else if((sum_of_ones > BOUND_LO_OUTSIDE) && (sum_of_ones <= BOUND_LO_INSIDE) &&  (trng_fine_cfg > '0)) begin
                trng_fine_cfg_next   = trng_fine_cfg - 1;
                trng_coarse_cfg_next = trng_coarse_cfg;
            end else if((sum_of_ones >= BOUND_HI_INSIDE) && (sum_of_ones < BOUND_HI_OUTSIDE) && (trng_fine_cfg < FINE_MAX)) begin
                trng_fine_cfg_next   = trng_fine_cfg + 1;
                trng_coarse_cfg_next = trng_coarse_cfg;
            end else if((sum_of_ones >= BOUND_HI_OUTSIDE) && (trng_coarse_cfg < COARSE_MAX)) begin
                trng_fine_cfg_next   = FINE_INIT;
                trng_coarse_cfg_next = trng_coarse_cfg + 1;
            end else begin
                trng_fine_cfg_next   = trng_fine_cfg;
                trng_coarse_cfg_next = trng_coarse_cfg;
            end

            cnt_next   = '0;
            state_next = CHECK_ENTROPY;
        end

        //------------------------------------------------------------------------------------------
        // If the last sample was near the middle, increase the samples counter by one. When we have
        // accumulated enough entropy (i.e. samples) go to the Finish state
        CHECK_ENTROPY: begin
            if(sum_of_ones > 'd16 && sum_of_ones < 'd240)
                samples_cnt_next = samples_cnt + 1;
            state_next = samples_cnt >= REQ_SAMPLES ? FINISH : STOP_TRNG;
        end

        //-------------------------------------------------sumofones_next-----------------------------------------
        STOP_TRNG: state_next = stop ? STOP_TRNG : RUN_TRNG;

        //------------------------------------------------------------------------------------------
        FINISH: state_next = FINISH;

        //------------------------------------------------------------------------------------------
        default: state_next = IDLE;
    endcase
end

endmodule
