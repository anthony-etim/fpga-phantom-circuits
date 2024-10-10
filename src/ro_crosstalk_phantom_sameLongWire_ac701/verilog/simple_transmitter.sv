
`include "defines.sv"

module simple_transmitter 
#(  
    parameter MAX_BIT_SIZE = 2048
)
 (
    input wire          clk,
    input wire          reset,
    input wire          send,
    input wire [31:0]   delayCycles,
    input wire [31:0]   highCycles,
    input wire [31:0]   cooldown_cycles,
    input wire [MAX_BIT_SIZE-1:0]   data,
    input wire [$clog2(MAX_BIT_SIZE):0]   num_tx_bits,
    output wire         tx_wire_debug,
    output wire         tx_wire_debug_valid,
    output wire         start,
    output wire         done,
    output wire [31:0]  debug_wire
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
localparam IDLE              = 3'd0;
localparam DELAY_INIT        = 3'd1;
localparam COOLDOWN_INIT     = 3'd2;
localparam SEND_BIT          = 3'd3;
localparam COOLDOWN_BIT      = 3'd4;
localparam FINISH            = 3'd5;
localparam SEND_BIT_CONTINUE = 3'd6;

reg [2:0]   state           = IDLE;
reg [2:0]   return_state    = IDLE;
reg [31:0]  counter = 0;

(* DONT_TOUCH = "TRUE", mark_debug = "true" *) reg txBit  = 0;
reg [$clog2(MAX_BIT_SIZE):0] index = 0;
reg tx_Start = 0;
reg tx_Done = 0;
(* DONT_TOUCH = "TRUE", mark_debug = "true" *) reg  tx_wire_debug_valid_internal;
reg [MAX_BIT_SIZE-1:0] data_internal = 0;
reg [31:0] coolDownCounter = 0;
reg [31:0] debug_reg = 0;

assign start = tx_Start;
assign done = tx_Done;
assign tx_wire_debug_valid = tx_wire_debug_valid_internal;
assign debug_wire = debug_reg;

always_ff @(posedge clk) begin
    if (reset == 1'b1) begin
        state <= IDLE;
        counter <= 0;
        index <= 0;
        tx_Start <= 0;
        tx_Done <= 0;
        data_internal <= 0;
    end else begin
        // txBit <= 0;// DEBUG
        tx_wire_debug_valid_internal <= 0;
        tx_Start <= 0;
        tx_Done <= 0;

        case (state)
            IDLE: begin
                if (send_valid == 1'b1) begin
                    index <= 0;
                    counter <= 0;
                    data_internal <= data;
                    state <= DELAY_INIT;
                end else begin
                    state <= IDLE;
                end
            end

            DELAY_INIT: begin
                txBit <= 0;
                if (counter < delayCycles) begin
                    counter <= counter + 1'b1;
                end else begin
                    counter <= 0;
                    coolDownCounter <= 0;
                    state <= COOLDOWN_INIT;
                end
            end

            COOLDOWN_INIT: begin
                // if cooldowncycles is 0, no cooldown go to next state
                if (cooldown_cycles == 32'd0) begin
                    coolDownCounter <= 0;
                    counter <= 0;
                    tx_Start <= 1'b1;
                    state <= SEND_BIT;
                end else begin
                    if (coolDownCounter > cooldown_cycles) begin
                        coolDownCounter <= 0;
                        counter <= 0;
                        tx_Start <= 1'b1;
                        state <= SEND_BIT;
                        // debug_reg <= data_internal;
                    end else begin
                        tx_Start <= 1'b0;
                        coolDownCounter <= coolDownCounter + 1'b1;
                        state <= COOLDOWN_INIT;
                    end 
                end  
            end

            SEND_BIT: begin
                txBit <= data_internal[num_tx_bits-1];
                counter <= 0;
                tx_wire_debug_valid_internal <= 1'b1;
                state <= SEND_BIT_CONTINUE;
            end

            SEND_BIT_CONTINUE: begin
                //txBit <= data_internal[0];
                if (counter < highCycles) begin
                    counter <= counter + 1'b1;
                    state <= SEND_BIT_CONTINUE;                   
                end else begin
                    counter <= 0;
                    coolDownCounter <= 0;
                    state <= COOLDOWN_BIT;
                    data_internal <= (data_internal << 1);
                    index <= index + 1'b1;
                end
            end

            COOLDOWN_BIT: begin
                // if cooldowncycles is 0, no cooldown go to next state
                if (cooldown_cycles == 32'd0) begin
                    if (index == num_tx_bits) begin
                        state <= FINISH;
                    end else begin
                        counter <= 0;
                        state <= SEND_BIT;
                    end
                end else begin
                    // the FPGA chip needs some time to cool down
                    if (coolDownCounter > cooldown_cycles) begin
                        if (index == num_tx_bits) begin
                            state <= FINISH;
                        end else begin
                            counter <= 0;
                            coolDownCounter <= 0;
                            state <= SEND_BIT;
                        end
                    end else begin
                        coolDownCounter <= coolDownCounter + 1'b1;
                        state <= COOLDOWN_BIT;
                    end
                end  
            end

            FINISH: begin
                tx_Done <= 1'b1;
                // tx_wire_debug_valid_internal <= 1'b1;
                state <= IDLE;
            end

            default: begin
                state <= IDLE;
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
    // the first long wire
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
    // // the third long wire
    // (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire_third;
    // (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_third;
    // (* DONT_TOUCH = "TRUE" *)
    // LUT1  #(
    //     .INIT           (2'b10)
    // ) txWireStart_third (
    //     .I0             (txBit),
    //     .O              (tx_wire_third)
    // );
    // (* DONT_TOUCH = "TRUE" *)
    // LUT1  #(
    //     .INIT           (2'b10)
    // ) txWireEnd_third (
    //     .I0             (tx_wire_third),
    //     .O              (tx_wire_end_third)
    // );
    // // the fourth long wire
    // (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire_fourth;
    // (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_fourth;
    // (* DONT_TOUCH = "TRUE" *)
    // LUT1  #(
    //     .INIT           (2'b10)
    // ) txWireStart_fourth (
    //     .I0             (txBit),
    //     .O              (tx_wire_fourth)
    // );
    // (* DONT_TOUCH = "TRUE" *)
    // LUT1  #(
    //     .INIT           (2'b10)
    // ) txWireEnd_fourth (
    //     .I0             (tx_wire_fourth),
    //     .O              (tx_wire_end_fourth)
    // );
    // // the fifth long wire
    // (* DONT_TOUCH = "TRUE", mark_debug = "true" *) wire tx_wire_fifth;
    // (* DONT_TOUCH = "TRUE" *) wire tx_wire_end_fifth;
    // (* DONT_TOUCH = "TRUE" *)
    // LUT1  #(
    //     .INIT           (2'b10)
    // ) txWireStart_fifth (
    //     .I0             (txBit),
    //     .O              (tx_wire_fifth)
    // );
    // (* DONT_TOUCH = "TRUE" *)
    // LUT1  #(
    //     .INIT           (2'b10)
    // ) txWireEnd_fifth (
    //     .I0             (tx_wire_fifth),
    //     .O              (tx_wire_end_fifth)
    // );
    // force output
    // assign tx_wire_debug = tx_wire_end & tx_wire_end_second & tx_wire_end_third & tx_wire_end_fourth & tx_wire_end_fifth; // debug
    assign tx_wire_debug = 1'b0; // debug
    // assign tx_wire_debug = tx_wire_end & tx_wire_end_second ; // debug
    
end else begin
    initial begin
        $error("Invalid SIM SYN SWITCH choice. 0 is for simulation, 1 is for synthesis");
    end
end 
endgenerate


endmodule
