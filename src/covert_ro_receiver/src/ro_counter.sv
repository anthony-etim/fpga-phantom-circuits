`include "parameters.vh"

module counter_with_reset #(
    parameter WIDTH     = 32,
    parameter RO_TYPE   = RO_LUT,
    parameter STAGES    = 2
)(
    input                       rst,
    input                       enable,
    output logic [WIDTH-1:0]    ro_counter
);

(* DONT_TOUCH = "TRUE" *)
logic ro_out;

ring_oscillator #(
    .RO_TYPE    (RO_TYPE),
    .STAGES     (STAGES)
) ro (
    .enable     (enable),
    .ro_out     (ro_out)
);

always_ff @(posedge ro_out or posedge rst) begin
    if (rst) begin
        ro_counter <= 0;
    end else begin
        ro_counter <= ro_counter + 1;
    end
end

endmodule