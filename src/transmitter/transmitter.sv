
`include "defines.sv"

module transmitter #(//parameter CLOCKS_PER_BIT= 10,
    parameter BIT_SIZE = 8,
    parameter COOLDOWN_CYCLES = 10000000
) (
    input wire send, 
    input wire clock,
    input wire reset,
    input wire [31:0] clock_per_bit,
    input wire [BIT_SIZE-1:0] data,
    output wire tx_wire_debug_valid,
    output wire tx_wire_debug,
    output wire done
);

localparam LOCAL_SIM_SYN_SWITCH = `SIM_SYN_SWITCH;

(* DONT_TOUCH = "TRUE" *) reg         txData  = 0;

generate
if (LOCAL_SIM_SYN_SWITCH == 0) begin
    assign tx_wire_debug = txData;
end else if (LOCAL_SIM_SYN_SWITCH == 1) begin
    ////////////////////////////////
    // instantiate LUTs
    ////////////////////////////////
    (* DONT_TOUCH = "TRUE" *) wire tx_wire;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart (
        .I0             (txData),
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
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_second;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_second;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart_second (
        .I0             (txData),
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
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_third;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_third;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart_third (
        .I0             (txData),
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
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_fourth;
    (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_fourth;
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) txWireStart_fourth (
        .I0             (txData),
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
////////////////////////////////
// variables and state machines
////////////////////////////////
reg [2:0]   state           = IDLE;
reg [2:0]   return_state    = IDLE;


reg [31:0]  clk_count       = 0;
reg [$clog2(BIT_SIZE):0] index = 0;
reg [0:0]   tx_Done         = 0;

reg [BIT_SIZE-1:0]       data_internal = 0;

assign done = tx_Done;

localparam IDLE         = 3'd0;
localparam SEND_BIT     = 3'd1;
localparam DELAY        = 3'd2;
localparam FINISH       = 3'd3;
localparam WAIT_RETURN  = 3'd4;
localparam COOLDOWN     = 3'd5;
reg [31:0] coolDownCounter = 0;
reg tx_wire_debug_valid_internal = 0;
assign tx_wire_debug_valid = tx_wire_debug_valid_internal;
always_ff @(posedge clock) begin
    if (reset == 1'b1) begin
        state     <= IDLE;
        clk_count <= 0;
        index     <= 0;
        tx_Done   <= 0;
        data_internal <= 0;
    end else begin
        tx_wire_debug_valid_internal <= 0;

        case (state)
            IDLE: begin
                // Tx_wire <= 1'b0;// it is illegal
                clk_count <= 0;
                index <= 0;
                if (send == 1'b1) begin
                    data_internal <= data;
                    state <= SEND_BIT;
                end else begin
                    state <= IDLE;
                end
            end
            // WAIT_RETURN: begin
            //     state <= return_state;
            // end

            DELAY: begin
                if (clk_count < clock_per_bit) begin
                    clk_count <= clk_count + 1'b1;
                    state <= DELAY;
                end else begin
                    clk_count <= 0;
                    data_internal <= (data_internal >> 1);
                    index <= index + 1'b1;
                    coolDownCounter <= 0;
                    state <= COOLDOWN;
                end
            end


            SEND_BIT: begin
                txData <= data_internal[0];
                tx_wire_debug_valid_internal <= 1'b1;
                state <= DELAY;
            end

            COOLDOWN: begin
                // the FPGA chip needs some time to cool down
                if (coolDownCounter > COOLDOWN_CYCLES) begin
                    if (index == BIT_SIZE) begin
                        state <= FINISH;
                    end else begin
                        state <= SEND_BIT;
                    end
                end else begin
                    coolDownCounter <= coolDownCounter + 1'b1;
                    state <= COOLDOWN;
                end
            end

            FINISH: begin
                tx_Done <= 1'b1;
                state <= IDLE;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end
end

endmodule
