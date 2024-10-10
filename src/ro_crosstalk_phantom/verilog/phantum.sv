

module phantum (
    input wire          clk,
    input wire          reset,

    input wire [31:0]   delayCycles,

    input wire          debug_syncup,

    output wire [31:0]  debug_data_0,
    output wire [31:0]  debug_data_1
);

////////////////////////////
// Debug output
////////////////////////////
assign debug_data_0 = roCounts[0];
assign debug_data_1 = roCounts[1];

////////////////////////////
// RO sensor
////////////////////////////
// RO sensors
localparam NUM_RO_SENSOR = 2;
localparam RO_MEASURE_CYCLES = 10_000_000;

// reset and enable variables
reg [NUM_RO_SENSOR-1:0]     rst_ro = 0;
(* mark_debug = "true" *) reg [NUM_RO_SENSOR-1:0]     enableSensor = 0;
// ro counts wires
(* mark_debug = "true" *) wire [31:0]    roCounts [NUM_RO_SENSOR-1:0];
wire [NUM_RO_SENSOR-1:0]    roCounts_valid;
// offset counter
(* mark_debug = "true" *) reg [31:0] offset_counter [NUM_RO_SENSOR-1:0];
// some states for ro offset
localparam OFFSET_IDLE         = 3'd0;
localparam OFFSET_COUNT        = 3'd1;
reg [2:0] offset_state = OFFSET_IDLE;
// generate block
generate;
    genvar i;
    for (i = 0; i < NUM_RO_SENSOR; i = i + 1) begin: GEN_ROSENSORS
        roSensor roSensor_DUT(
            .clk(clk),
            .rst(rst_ro[i]),
            .enableSensor(enableSensor[i]),
            .meas_cycle(RO_MEASURE_CYCLES),
            .roCount(roCounts[i]),
            .roCount_valid(roCounts_valid[i])
        );

        // For RO sensor with index 1 - n-1
        if (i > 0) begin

            always_ff @(posedge clk) begin
                if (reset == 1'b1) begin
                    offset_counter[i] <= 0;
                    offset_state <= OFFSET_IDLE;
                end else begin
                    enableSensor[i] <= 0;

                    case (offset_state)
                        OFFSET_IDLE: begin
                            if (enableSensor[0] == 1'b1) begin
                                offset_counter[i] <= 0;
                                offset_state <= OFFSET_COUNT;
                            end else begin
                                offset_state <= OFFSET_IDLE;
                            end
                        end
                        OFFSET_COUNT: begin
                            if (offset_counter[i] < (delayCycles * i)) begin
                                offset_counter[i] <= offset_counter[i] + 1'b1;
                            end else begin
                                enableSensor[i] <= 1'b1;
                                offset_state <= OFFSET_IDLE;
                            end
                        end
                    endcase
                end
            end

        end
    end
endgenerate


////////////////////////////
// State
////////////////////////////
// no more than 8 states (0-7)
localparam IDLE         = 3'd0;
localparam ROMEASURE    = 3'd1;
localparam DEBUG_END    = 3'd2;

(* mark_debug = "true" *) reg [2:0] state = IDLE;
reg [2:0] return_state = IDLE;

////////////////////////////
// FSM
////////////////////////////



always_ff @(posedge clk) begin
    if (reset == 1'b1) begin
        state <= IDLE;
        rst_ro <= {NUM_RO_SENSOR{1'b1}};
    end else begin
        rst_ro <= 0;
        enableSensor[0] <= 0;

        case (state)
            IDLE: begin
                if (debug_syncup == 1'b1) begin
                    rst_ro <= {NUM_RO_SENSOR{1'b1}};
                    state <= ROMEASURE;
                end else begin
                    state <= IDLE;
                end
            end

            ROMEASURE: begin
                enableSensor[0] <= 1'b1;// only high for one cycle
                state <= IDLE;
            end
        endcase
    end
end

endmodule
