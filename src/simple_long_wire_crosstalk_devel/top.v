//`include "transmitter.v"
//`include "receiver.v"
// include only defines
`include "ro_defines.sv"

module top #(parameter  BIT_SIZE = 8;)
    (
        input wire clock,
        input wire reset,
        input wire send, 
        input wire[BIT_SIZE-1:0] input_Data,
        output wire gotData,
        output wire[BIT_SIZE-1:0] output_Data
    );

localparam CLOCKS_PER_BIT = xxx
localparam BIT_SIZE = xxx
localparam RO_TYPE
localparam xxx

assign gotData = rx_done;

wire tx_done;

transmitter #(
    parameter CLOCKS_PER_BIT = 10000,
    parameter BIT_SIZE = 8
) transmitter_INST (
        .clock(clock),
        .reset(reset),
        .send(send), 
        .data(input_Data),
	.done(tx_done)
    )

wire rx_done;

receiver #(
    .CLOCKS_PER_BIT(CLOCKS_PER_BIT),
    .BIT_SIZE(BIT_SIZE),
    .RO_TYPE(RO_TYPE),
    .xxx
    
) receiver_INST (
        .clock(clock),
        .reset(reset),
        .receive(send), 
        .done(rx_done),
        .data(output_Data)
)

endmodule
