// Adapted from https://github.com/seldridge/verilog/blob/master/src/pipeline_registers.v
module pipeline #(
    parameter BIT_WIDTH         = 10,
    parameter N_STAGES          = 5
) (
   input                        clk,
   input                        rst,
   input [BIT_WIDTH-1:0]        pipe_in,
   output logic [BIT_WIDTH-1:0] pipe_out
);

genvar i;
generate
if (N_STAGES == 0) begin
    assign pipe_out = pipe_in;
end else if (N_STAGES == 1) begin
    always_ff @(posedge clk) begin
        if (rst) begin
            pipe_out <= 0;
        end else begin
            pipe_out <= pipe_in;
        end
    end
end else begin
    logic [BIT_WIDTH*(N_STAGES-1)-1:0] pipe_gen;
    always_ff @(posedge clk) begin
        if (rst) begin
            pipe_gen[BIT_WIDTH-1:0] <= 0;
            pipe_out                <= 0;
        end else begin
            pipe_gen[BIT_WIDTH-1:0] <= pipe_in;
            pipe_out                <= pipe_gen[BIT_WIDTH*(N_STAGES-1)-1:BIT_WIDTH*(N_STAGES-2)];
        end
    end
    for (i = 1; i < N_STAGES-1; i = i + 1) begin : pipeline
        always_ff @(posedge clk) begin
            if (rst) begin
                pipe_gen[BIT_WIDTH*(i+1)-1:BIT_WIDTH*i] <= 0;
            end else begin
                pipe_gen[BIT_WIDTH*(i+1)-1:BIT_WIDTH*i] <= pipe_gen[BIT_WIDTH*i-1:BIT_WIDTH*(i-1)];
            end
        end
    end
end
endgenerate

endmodule

