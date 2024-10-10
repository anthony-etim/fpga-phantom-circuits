/*
 * This is fifo_mem module for binary-search-based CDT Gaussian Sampler.
 * 
 * Copyright (C): 2019
 * Author:           Shanquan Tian <shanquan.tian@yale.edu>
 * Updated:          2019-09-29
 *                
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
*/

// FIFO based on block ram.
// Usage: 1) Please reset fifo at the biginning. 
//           For example, #10; reset_fifo <= 0; #10; reset_fifo <= 1; #10; reset_fifo <= 0;
//        2) Set rd as high for one clock cycle, you will get data after one cycle;
//        3) Set wr as high for one clock cycle.
//        4) Do not wr and rd at the same time at the biggning. 
//           You can wr and rd at the same time if FIFO is not empty.
// a[0],       a[1],     ... ,   a[n-1]
// addr_1_reg                    addr_0_reg
// read                          write



module fifo_mem #(
    parameter WIDTH = 64, 
    parameter DEPTH = 512// Must be power of two
)(
    input  wire              clk,
    input  wire              rst,
    input  wire              wr,
    input  wire              rd,
    input  wire [WIDTH-1:0]  din,
    output wire              empty,
    output wire              full,
    output wire [WIDTH-1:0]  dout
);

reg  [$clog2(DEPTH):0]  size = 0; // debug
wire [WIDTH-1:0] wr_data_0;//write
wire [WIDTH-1:0] wr_data_1;
wire [$clog2(DEPTH)-1:0] addr_0;
wire [$clog2(DEPTH)-1:0] addr_1;
wire wr_en_0;
wire wr_en_1;
wire [WIDTH-1:0] rd_data_0;
wire [WIDTH-1:0] rd_data_1;//read

assign wr_data_0 = din;// write data to chanel 0
assign dout = rd_data_1;// read data from chanel 1

localparam IDLE = 3'd0,
           WAIT = 3'd1,
           START_CSHAKE = 3'd2,
           GENERATE_SAMPLES = 3'd3,
           OUTPUT = 3'd4;// state machine

reg [$clog2(DEPTH)-1:0] addr_0_reg = 0;// write, default is current element
reg [$clog2(DEPTH)-1:0] addr_1_reg = 0;// read, default is current element
reg wr_en_0_reg = 1'b0;

always @(posedge clk) begin
    if (rst == 1'b1) begin
        // reset
        addr_0_reg <= 0;
        addr_1_reg <= 0;
        wr_en_0_reg <= 1'b0;
        size <= 0;
    end
    else begin
        wr_en_0_reg <= 1'b0;

        case ({wr, rd})
        // 2'b00: begin
            // Do nothing
        // end

        2'b01: begin// read only
            if (empty==1'b0) begin// if it is not empty
                addr_1_reg <= (addr_1_reg + 1'b1) & (DEPTH - 1'b1);
                size <= size - 1'b1;
            end
            // empty is illegal
        end
        2'b10: begin// write only
            if ((empty==1'b1) && (addr_0_reg == addr_1_reg)) begin// at the beggining, it is empty
                addr_0_reg <= addr_0_reg;// at the beginning
                wr_en_0_reg <= 1'b1;
                size <= size + 1'b1;
            end
            else if (~full) begin// if it is not full
                addr_0_reg <= (addr_0_reg + 1'b1) & (DEPTH - 1'b1);
                wr_en_0_reg <= 1'b1;
                size <= size + 1'b1;
            end
            // full is illegal
        end

        2'b11: begin// read and write when not empty: two ocations: not full , full
            if (empty==1'b0) begin
                addr_1_reg <= (addr_1_reg + 1'b1) & (DEPTH - 1'b1);
                addr_0_reg <= (addr_0_reg + 1'b1) & (DEPTH - 1'b1);
                wr_en_0_reg <= 1'b1;
                size <= size;
                // if (~full) begin 
                //     addr_1_reg <= (addr_1_reg + 1'b1) & (DEPTH - 1'b1);
                //     addr_0_reg <= (addr_0_reg + 1'b1) & (DEPTH - 1'b1);
                //     wr_en_0_reg <= 1'b1;
                //     size <= size;
                // end
                // else begin// if it is full
                //     addr_1_reg <= (addr_1_reg + 1'b1) & (DEPTH - 1'b1);
                //     addr_0_reg <= (addr_0_reg + 1'b1) & (DEPTH - 1'b1);
                //     wr_en_0_reg <= 1'b1;
                //     size <= size;
                // end
            end
            // empty is illegal
        end
        endcase
    end
end

assign empty = (size == 0) ? 1'b1 : 1'b0;
assign full = (size == DEPTH) ? 1'b1 : 1'b0;

assign wr_en_1 = 1'b0;// chanel 1, read forever
assign addr_1 = addr_1_reg ; 

assign wr_en_0 = wr_en_0_reg;// chanel 0 , write
assign addr_0 = addr_0_reg;


mem_dual #(
    // .INIT (1'b1),
    .WIDTH(WIDTH), 
    .DEPTH(DEPTH)
) mem_dual_in_fifo (
    .clock(clk),
    .data_0(wr_data_0),
    .data_1(wr_data_1),
    .address_0(addr_0),
    .address_1(addr_1),
    .wren_0(wr_en_0),
    .wren_1(wr_en_1),
    .q_0(rd_data_0),
    .q_1(rd_data_1)
);



endmodule
