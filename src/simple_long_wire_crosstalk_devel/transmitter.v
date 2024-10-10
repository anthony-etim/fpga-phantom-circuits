module transmitter #(parameter CLOCKS_PER_BIT= 10000,
                     parameter  BIT_SIZE = 8)
    (
        input wire send, 
        input wire clock,
        input wire reset,
        input wire en,
        input wire [BIT_SIZE-1:0] data,
        output  wire Tx_wire
    );
/*
Verilog seminar on 09/30
1. reg, wire, for regs, always block
    wire are updated in continuous assginmen,
        e.g. assign a = b;

*/


reg [2:0] state  = IDLE;
reg [BIT_SIZE-1:0] txData  = 0;
reg [$log2(CLOCKS_PER_BIT):0] clk_count = 0;
reg [$log2(BIT_SIZE):0] index = 0;
reg [0:0] tx_Done   = 0;
reg [0:0] tx_Active = 0;

assign Tx_wire = txData[0];

always @(posedge clock) begin
    if (reset== 1) 
        begin
        state     <= IDLE;
        txData    <= 0;
        clk_count <= 0;
        index     <= 0;
        tx_Done   <= 0;
        tx_Active <= 0;
        end 
    else 
    begin
        case (state)
        IDLE: 
            begin
                // Tx_wire <= 1'b0;// it is illegal
                clk_count <=0;
                if (send == 1)
                    begin
                        state <= SEND_BIT;
                    end
                else 
                    state <= IDLE;
            end

        SEND_BIT:
            begin
                tx_Active <= 1'b1;
                if (index == BIT_SIZE) 
                    begin
                    state = FINISH;
                    end 
                else 
                    begin
                    txData <= data >> index;
                    state <= DELAY;
                    end
            end

        DUMMY:
            begin
                state <= DELAY;
            end

        DELAY:
            begin
                if(clk_count < CLOCKS_PER_BIT-1)
                    begin
                        clk_count <= clk_count + 1;
                        state <= DELAY;
                    end
                    else
                        begin
                            clk_count <= 0;
                            state <= SEND_BIT;
                            index <= index + 1;
                        end
            end

        FINISH:
            begin
                tx_Done <= 1'b1;
                tx_Active <= 1'b0;
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
