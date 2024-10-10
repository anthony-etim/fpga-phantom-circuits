`include "parameters.vh"

module controller #(
    parameter ROS        = 5,
    parameter RO_TYPE    = RO_LUT,
    parameter STAGES     = 2,
    parameter CNT_WIDTH  = 32,
    parameter WAIT_BITS  = 7,
    parameter CTRL_ID    = 5'b00000
)(
    input                                   clk,
    input                                   rst,
    input                                   enable_pulse,
    input [$clog2(CNT_WIDTH)-1:0]           trig_bit,
    input [WAIT_BITS-1:0]                   wait_cnt,

    output logic                            ready_pulse,
    output logic [(ROS+1)*CNT_WIDTH-1:0]    ro_counts
);

typedef enum {
    IDLE,
    MEASURING,
    WAITING
} State;


logic [4:0]                     ctrl_id;
logic [ROS*CNT_WIDTH-1:0]       internal_ro_counts;
logic [$clog2(CNT_WIDTH)-1:0]   trig_bit_copy;
logic [CNT_WIDTH-1:0]           clk_counter;
logic [WAIT_BITS-1:0]           wait_cnt_copy;
logic [WAIT_BITS-1:0]           cur_wait_cnt;
logic [15:0]                    cur_index;
logic                           counter_rst;
logic                           enabled;
logic                           measurement_complete;
State                           state;

assign measurement_complete = clk_counter[trig_bit_copy];
assign ctrl_id              = CTRL_ID;

genvar i;
generate
for (i = 0; i < ROS; i = i+1) begin : ro_gen
    counter_with_reset #(
        .WIDTH      (CNT_WIDTH),
        .RO_TYPE    (RO_TYPE),
        .STAGES     (STAGES)
    ) cnt_inst (
        .enable     (enabled),
        .rst        (rst | counter_rst),
        .ro_counter (internal_ro_counts[CNT_WIDTH*(i+1)-1:CNT_WIDTH*i])
    );
end
endgenerate

always_ff @(posedge clk) begin
    ready_pulse <= 0;
    ro_counts <= 0;
    if (rst) begin
        cur_wait_cnt <= 0;
        wait_cnt_copy <= 0;
        clk_counter <= 0;
        counter_rst <= 1;
        cur_index <= 0;
        enabled <= 0;
        trig_bit_copy <= 0;
        state <= IDLE;
    end else begin
        if (enabled) begin
            clk_counter <= clk_counter + 1;
        end

        case (state)
            IDLE: begin
                if (enable_pulse) begin
                    trig_bit_copy <= trig_bit;
                    wait_cnt_copy <= wait_cnt;
                    clk_counter <= 0;
                    enabled <= 1;
                    counter_rst <= 0;
                    state <= MEASURING;
                end
            end
            MEASURING: begin
                if (measurement_complete) begin
                    enabled <= 0;
                    cur_wait_cnt <= wait_cnt_copy;
                    state <= WAITING;
                end
            end

            WAITING: begin
                if (cur_wait_cnt) begin
                    cur_wait_cnt <= cur_wait_cnt - 1;
                end else begin
                    ro_counts <= {{11{1'b1}}, ctrl_id, cur_index, internal_ro_counts};
                    ready_pulse <= 1;
                    counter_rst <= 1;
                    cur_index <= cur_index + 1;
                    state <= IDLE;
                end
            end
            default: begin // should not happen
                cur_wait_cnt <= 0;
                wait_cnt_copy <= 0;
                clk_counter <= 0;
                counter_rst <= 1;
                cur_index <= 0;
                enabled <= 0;
                trig_bit_copy <= 0;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
