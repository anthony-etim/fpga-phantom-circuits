//`include "transmitter.v"
//`include "receiver.v"
// include only defines
`include "../../receiver/ro_defines.sv"

module top #(parameter CLOCKS_PER_BIT = 10,
             parameter BIT_SIZE = 8,
		     parameter RO_TYPE = `RO_LATCH,
		     parameter STAGES = 5)
    (
        input wire clock,
        input wire reset,
        input wire send, 
        input wire enable,
        input wire[BIT_SIZE-1:0] input_Data,
        output wire gotData,
        output wire[BIT_SIZE-1:0] output_Data
    );

reg [0:0] receive;
wire tx_Output;
wire tx_done;
assign send = receive;

always @(posedge clock) begin
    // if (reset== 1'b1) 
    //     begin
    //         //tx_done <= 0;
    //     end 
    // else 
    //     begin
    //         receive <= 1'b1;
    //     end
    receive <= 1'b1;
end

transmitter #(
    .CLOCKS_PER_BIT(CLOCKS_PER_BIT),
    .BIT_SIZE(BIT_SIZE)
) transmitter_INST (
    .send(send),
    .clock(clock),
    .reset(reset), 
    //.en(input_Data),
	.data(input_Data),
    .tx_wire(tx_Output),
    .done(tx_done)
);

receiver #(
    .CLOCKS_PER_BIT(CLOCKS_PER_BIT),
    .BIT_SIZE(BIT_SIZE),
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) receiver_INST(
    .receive(receive),
    .clock(clock),
    .reset(reset),
    .enable(enable), 
    .dataFromTx(tx_Output),
    .data(output_Data),
    .gotData(gotData)
);

endmodule
