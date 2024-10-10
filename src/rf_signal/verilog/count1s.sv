

module count1s#(
    parameter INP_WIDTH = 256,
    parameter OUT_WIDTH = 8
)(
    input wire                      enable,
    input wire [INP_WIDTH-1:0]      inData,
    output wire [OUT_WIDTH-1:0]     outValue
);


/////////////////////////////////////////////////////////////////////////////
// count tdc number of 1s
/////////////////////////////////////////////////////////////////////////////
logic [OUT_WIDTH-1:0] out_value_internal;
assign outValue = out_value_internal;
integer tdc_i;
always_comb begin : TDCCOUNT1S
    out_value_internal = 0;
    if (enable == 1'b1) begin
        for (tdc_i = 0; tdc_i < INP_WIDTH; tdc_i = tdc_i + 1) begin
            out_value_internal = out_value_internal + inData[tdc_i];
        end
    end else begin
        out_value_internal = out_value_internal;
    end
end


endmodule


