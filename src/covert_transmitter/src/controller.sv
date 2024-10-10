module controller #(
    parameter NUM_HEATERS                   = 1,
    parameter CNT_WIDTH                     = 32
) (
    input                                   clk,
    input                                   rst,
    input                                   toggle_heater,
    input  [NUM_HEATERS-1:0]                heater_mask,
    input  [$clog2(CNT_WIDTH)-1:0]          trig_bit,

    output logic [NUM_HEATERS-1:0]          heater_value
);

logic [NUM_HEATERS-1:0]         local_mask;
logic [CNT_WIDTH-1:0]           clk_counter;

always_comb begin
    if (rst) begin
        heater_value = '0;
    end else begin
        heater_value = heater_mask & local_mask;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        local_mask  <= {NUM_HEATERS{1'b1}};
        clk_counter <= 0;
    end else begin
        clk_counter <= clk_counter + 1;

        if (clk_counter[trig_bit]) begin
            clk_counter <= 0;
            if (toggle_heater) begin
                local_mask <= ~local_mask;
            end
        end
    end
end

endmodule
