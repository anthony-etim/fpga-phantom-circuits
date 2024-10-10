
`include "defines.sv"

module simple_transmitter (
    input wire          clk,
    input wire          reset,
    input wire          send,
    input wire [31:0]   delayCycles,
    input wire          sendbit,
    output wire         tx_wire_debug
);

////////////////////////////////
// Deal with input protocols
////////////////////////////////

reg send_valid = 0;
reg send_internal = 0;
always_ff@(posedge clk) begin
    if (send == 1'b1) begin
        send_valid = ~send_internal; // ensure that only valid for one cycle, every time the send changes from 0 to 1
        send_internal = 1'b1;
    end else begin
        send_valid = 0;
        send_internal = 0;
    end
end


////////////////////////////////
// variables and state machines
////////////////////////////////
localparam IDLE         = 3'd0;
localparam WAIT_RETURN  = 3'd1;
localparam SEND_BIT_0     = 3'd2;
localparam SEND_BIT_1     = 3'd3;

reg [2:0]   state           = IDLE;
reg [2:0]   return_state    = IDLE;
reg [31:0]  counter = 0;

(* DONT_TOUCH = "TRUE", mark_debug = "true" *) reg         txBit  = 0;

always_ff @(posedge clk) begin
    if (reset == 1'b1) begin
        state <= IDLE;
    end else begin
        txBit <= 0;

        case (state)
            IDLE: begin
                if (send_valid == 1'b1) begin
                    counter <= 0;
                    state <= SEND_BIT_0;
                end else begin
                    state <= IDLE;
                end
            end

            SEND_BIT_0: begin
                txBit <= sendbit;// FIXME
                if (counter < delayCycles) begin
                    counter <= counter + 1'b1;
                end else begin
                    counter <= 0;
                    state <= SEND_BIT_1;
                end
            end

            SEND_BIT_1: begin
                if (counter < delayCycles) begin
                    txBit <= sendbit;
                    counter <= counter + 1'b1;
                end else begin
                    txBit <= 1'b0;
                    counter <= 0;
                    state <= IDLE;
                end
            end

        endcase
    end
end


////////////////////////////////
// TX wires
////////////////////////////////
localparam LOCAL_SIM_SYN_SWITCH = `SIM_SYN_SWITCH;

generate
if (LOCAL_SIM_SYN_SWITCH == 0) begin
    assign tx_wire_debug = txBit;
end else if (LOCAL_SIM_SYN_SWITCH == 1) begin
    ////////////////////////////////
    // instantiate LUTs
    ////////////////////////////////
    (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart (
        .I0             (txBit),
        .O              (tx_wire)
    );
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireEnd (
        .I0             (tx_wire),
        .O              (tx_wire_end)
    );
    // the second long wire
    (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire_second;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_second;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart_second (
        .I0             (txBit),
        .O              (tx_wire_second)
    );
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireEnd_second (
        .I0             (tx_wire_second),
        .O              (tx_wire_end_second)
    );
    // the third long wire
    (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire_third;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_third;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart_third (
        .I0             (txBit),
        .O              (tx_wire_third)
    );
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireEnd_third (
        .I0             (tx_wire_third),
        .O              (tx_wire_end_third)
    );
    // the fourth long wire
    (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire_fourth;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_fourth;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart_fourth (
        .I0             (txBit),
        .O              (tx_wire_fourth)
    );
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireEnd_fourth (
        .I0             (tx_wire_fourth),
        .O              (tx_wire_end_fourth)
    );
    // force output
    assign tx_wire_debug = tx_wire_end & tx_wire_end_second & tx_wire_end_third & tx_wire_end_fourth; // debug
    
end else begin
    initial begin
        $error("Invalid SIM SYN SWITCH choice. 0 is for simulation, 1 is for synthesis");
    end
end
endgenerate


endmodule
