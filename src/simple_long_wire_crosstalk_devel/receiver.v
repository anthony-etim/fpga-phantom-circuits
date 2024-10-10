`include "ro_defines.sv"

module receiver #(parameter CLOCKS_PER_BIT = 10000,
                  parameter BIT_SIZE = 8,
		          parameter RO_TYPE = RO_LATCH,
		          parameter STAGES = 5)
    (
        input wire receive, 
        input wire clock,
        input wire reset,
        input wire en,
        output wire [BIT_SIZE-1:0] data,
        output wire gotData
    );

reg [2:0] state  = IDLE;
reg [BIT_SIZE-1:0] rxData  = 0;
reg [$log2(CLOCKS_PER_BIT):0] clk_count = 0;
reg [$log2(BIT_SIZE):0] index = 0;
reg [0:0] rx_Done   = 0;
reg [0:0] rx_Active = 0;
reg [0:0] enableMyR0 = 0;
reg [$log2(CLOCKS_PER_BIT):0] ro_count = 0;
reg [$log2(CLOCKS_PER_BIT):0] counter_count = 0;
wire myROOutput;
wire counter_reset;
wire counter_enable; // define a variable , wire

assign data = rxData[0];


ring_oscillator #(
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) ring_oscillator_INST(
    .enable(enableMyR0),
    .ro_out(myR00utput)
)


assign counter_enable = (in) ? ro_out : 1'b1; // mux to select either ro_out or 1 as input 
// define the switch signal
// 1 is to select clock 

// Instance of module used to count RO oscillations
counter counter_INST #(
    .BIT_SIZE(BIT_SIZE)
)(
    //.in(ro_out),
    .clock(clock),
    //.is_dummy(xxx),
    .reset(counter_reset),
    .enable(counter_enable),
    .count(counter_count)
)


always @(posedge clock) begin
    if (reset== 1) 
        begin
        state     <= IDLE;
        rxData    <= 0;
        clk_count <= 0;
        index     <= 0;
        rx_Done   <= 0;
        rx_Active <= 0;
        gotData   <= 0;
        end 
    else 
        begin
            case (state)
            IDLE: 
                begin
                    index <= 0;
                    // rx_wire <= 1'b0;// see previous assign
                    clk_count <=0;
                    // if (receive == 1)// the default 1 is 32-bit
                    if (receive == 1'b1)// 1 binary bit of 1
                        begin
                            state <= RECEIVE_BIT;
                        end
                    else 
                        state <= IDLE;
                end
            
            DUMMY:// add dummy after finishing the whole FSM
                begin
                    state <= DELAY;
                end

            DELAY: // measuring RO is in the delay stage
                begin
                    counter_enable <= 1;
                    if(clk_count < CLOCKS_PER_BIT-1)
                        begin
                            clk_count <= clk_count + 1;
                            state <= DELAY;
                        end
                        else
                            begin
                                clk_count <= 0;
                                if(enableMyR0 == 1)
                                    begin
                                        ro_count <= counter_count;
                                    end
                        if(ro_count < THRESHOLD)
                            data_bit <= 0;
                    else
                    data_bit <= 1;

                                state <= RECEIVE_BIT;
                                index <= index + 1;
                            end
                end

            RECEIVE_BIT:
                begin
                    rx_Active <= 1'b1;
                    enableMyR0 <= 1'b1;
                    if (index == BIT_SIZE) 
                        begin
                        state = FINISH;
                        end 
                    else 
                        begin
                        state <= DELAY;
                        end
                    counter_reset <= 1;
                end       
                
            FINISH:
                begin
                    rx_Done <= 1'b1;
                    rx_Active <= 1'b0;
                    enableMyR0 <= 1'b0;
                    gotData <= 1'b1;
                    state <= IDLE;
                end
            
            default: 
                begin
                state <= IDLE;
                end
        endcase
    end
end

endmodule
