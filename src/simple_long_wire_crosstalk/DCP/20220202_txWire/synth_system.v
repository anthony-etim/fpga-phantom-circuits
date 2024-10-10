// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Wed Feb  2 22:44:29 2022
// Host        : caslab-srv3 running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force ../build/ac701/synth_system.v
// Design      : phantom_circuits_top
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a200tfbg676-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module counter
   (out,
    ro_out,
    clear);
  output [31:0]out;
  input ro_out;
  input clear;

  wire \<const0> ;
  wire \<const1> ;
  wire clear;
  wire \count_reg[0]_i_2_n_0 ;
  wire \count_reg_reg[0]_i_1_n_0 ;
  wire \count_reg_reg[0]_i_1_n_4 ;
  wire \count_reg_reg[0]_i_1_n_5 ;
  wire \count_reg_reg[0]_i_1_n_6 ;
  wire \count_reg_reg[0]_i_1_n_7 ;
  wire \count_reg_reg[12]_i_1_n_0 ;
  wire \count_reg_reg[12]_i_1_n_4 ;
  wire \count_reg_reg[12]_i_1_n_5 ;
  wire \count_reg_reg[12]_i_1_n_6 ;
  wire \count_reg_reg[12]_i_1_n_7 ;
  wire \count_reg_reg[16]_i_1_n_0 ;
  wire \count_reg_reg[16]_i_1_n_4 ;
  wire \count_reg_reg[16]_i_1_n_5 ;
  wire \count_reg_reg[16]_i_1_n_6 ;
  wire \count_reg_reg[16]_i_1_n_7 ;
  wire \count_reg_reg[20]_i_1_n_0 ;
  wire \count_reg_reg[20]_i_1_n_4 ;
  wire \count_reg_reg[20]_i_1_n_5 ;
  wire \count_reg_reg[20]_i_1_n_6 ;
  wire \count_reg_reg[20]_i_1_n_7 ;
  wire \count_reg_reg[24]_i_1_n_0 ;
  wire \count_reg_reg[24]_i_1_n_4 ;
  wire \count_reg_reg[24]_i_1_n_5 ;
  wire \count_reg_reg[24]_i_1_n_6 ;
  wire \count_reg_reg[24]_i_1_n_7 ;
  wire \count_reg_reg[28]_i_1_n_4 ;
  wire \count_reg_reg[28]_i_1_n_5 ;
  wire \count_reg_reg[28]_i_1_n_6 ;
  wire \count_reg_reg[28]_i_1_n_7 ;
  wire \count_reg_reg[4]_i_1_n_0 ;
  wire \count_reg_reg[4]_i_1_n_4 ;
  wire \count_reg_reg[4]_i_1_n_5 ;
  wire \count_reg_reg[4]_i_1_n_6 ;
  wire \count_reg_reg[4]_i_1_n_7 ;
  wire \count_reg_reg[8]_i_1_n_0 ;
  wire \count_reg_reg[8]_i_1_n_4 ;
  wire \count_reg_reg[8]_i_1_n_5 ;
  wire \count_reg_reg[8]_i_1_n_6 ;
  wire \count_reg_reg[8]_i_1_n_7 ;
  wire [31:0]out;
  wire ro_out;
  wire [3:0]\NLW_count_reg_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg_reg[8]_i_1_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h1)) 
    \count_reg[0]_i_2 
       (.I0(out[0]),
        .O(\count_reg[0]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[0] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[0]_i_1_n_7 ),
        .Q(out[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\count_reg_reg[0]_i_1_n_0 ,\NLW_count_reg_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\count_reg_reg[0]_i_1_n_4 ,\count_reg_reg[0]_i_1_n_5 ,\count_reg_reg[0]_i_1_n_6 ,\count_reg_reg[0]_i_1_n_7 }),
        .S({out[3:1],\count_reg[0]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[10] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[8]_i_1_n_5 ),
        .Q(out[10]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[11] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[8]_i_1_n_4 ),
        .Q(out[11]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[12] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[12]_i_1_n_7 ),
        .Q(out[12]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[12]_i_1 
       (.CI(\count_reg_reg[8]_i_1_n_0 ),
        .CO({\count_reg_reg[12]_i_1_n_0 ,\NLW_count_reg_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[12]_i_1_n_4 ,\count_reg_reg[12]_i_1_n_5 ,\count_reg_reg[12]_i_1_n_6 ,\count_reg_reg[12]_i_1_n_7 }),
        .S(out[15:12]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[13] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[12]_i_1_n_6 ),
        .Q(out[13]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[14] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[12]_i_1_n_5 ),
        .Q(out[14]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[15] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[12]_i_1_n_4 ),
        .Q(out[15]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[16] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[16]_i_1_n_7 ),
        .Q(out[16]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[16]_i_1 
       (.CI(\count_reg_reg[12]_i_1_n_0 ),
        .CO({\count_reg_reg[16]_i_1_n_0 ,\NLW_count_reg_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[16]_i_1_n_4 ,\count_reg_reg[16]_i_1_n_5 ,\count_reg_reg[16]_i_1_n_6 ,\count_reg_reg[16]_i_1_n_7 }),
        .S(out[19:16]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[17] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[16]_i_1_n_6 ),
        .Q(out[17]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[18] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[16]_i_1_n_5 ),
        .Q(out[18]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[19] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[16]_i_1_n_4 ),
        .Q(out[19]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[1] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[0]_i_1_n_6 ),
        .Q(out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[20] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[20]_i_1_n_7 ),
        .Q(out[20]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[20]_i_1 
       (.CI(\count_reg_reg[16]_i_1_n_0 ),
        .CO({\count_reg_reg[20]_i_1_n_0 ,\NLW_count_reg_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[20]_i_1_n_4 ,\count_reg_reg[20]_i_1_n_5 ,\count_reg_reg[20]_i_1_n_6 ,\count_reg_reg[20]_i_1_n_7 }),
        .S(out[23:20]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[21] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[20]_i_1_n_6 ),
        .Q(out[21]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[22] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[20]_i_1_n_5 ),
        .Q(out[22]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[23] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[20]_i_1_n_4 ),
        .Q(out[23]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[24] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[24]_i_1_n_7 ),
        .Q(out[24]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[24]_i_1 
       (.CI(\count_reg_reg[20]_i_1_n_0 ),
        .CO({\count_reg_reg[24]_i_1_n_0 ,\NLW_count_reg_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[24]_i_1_n_4 ,\count_reg_reg[24]_i_1_n_5 ,\count_reg_reg[24]_i_1_n_6 ,\count_reg_reg[24]_i_1_n_7 }),
        .S(out[27:24]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[25] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[24]_i_1_n_6 ),
        .Q(out[25]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[26] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[24]_i_1_n_5 ),
        .Q(out[26]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[27] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[24]_i_1_n_4 ),
        .Q(out[27]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[28] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[28]_i_1_n_7 ),
        .Q(out[28]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[28]_i_1 
       (.CI(\count_reg_reg[24]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[28]_i_1_n_4 ,\count_reg_reg[28]_i_1_n_5 ,\count_reg_reg[28]_i_1_n_6 ,\count_reg_reg[28]_i_1_n_7 }),
        .S(out[31:28]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[29] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[28]_i_1_n_6 ),
        .Q(out[29]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[2] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[0]_i_1_n_5 ),
        .Q(out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[30] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[28]_i_1_n_5 ),
        .Q(out[30]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[31] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[28]_i_1_n_4 ),
        .Q(out[31]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[3] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[0]_i_1_n_4 ),
        .Q(out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[4] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[4]_i_1_n_7 ),
        .Q(out[4]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[4]_i_1 
       (.CI(\count_reg_reg[0]_i_1_n_0 ),
        .CO({\count_reg_reg[4]_i_1_n_0 ,\NLW_count_reg_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[4]_i_1_n_4 ,\count_reg_reg[4]_i_1_n_5 ,\count_reg_reg[4]_i_1_n_6 ,\count_reg_reg[4]_i_1_n_7 }),
        .S(out[7:4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[5] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[4]_i_1_n_6 ),
        .Q(out[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[6] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[4]_i_1_n_5 ),
        .Q(out[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[7] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[4]_i_1_n_4 ),
        .Q(out[7]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[8] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[8]_i_1_n_7 ),
        .Q(out[8]));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \count_reg_reg[8]_i_1 
       (.CI(\count_reg_reg[4]_i_1_n_0 ),
        .CO({\count_reg_reg[8]_i_1_n_0 ,\NLW_count_reg_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg_reg[8]_i_1_n_4 ,\count_reg_reg[8]_i_1_n_5 ,\count_reg_reg[8]_i_1_n_6 ,\count_reg_reg[8]_i_1_n_7 }),
        .S(out[11:8]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg_reg[9] 
       (.C(ro_out),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\count_reg_reg[8]_i_1_n_6 ),
        .Q(out[9]));
endmodule

(* BAUD_RATE = "921600" *) (* BIT_SIZE = "8" *) (* CLK_SPEED = "200000000" *) 
(* DEBUG_ROCOUNTS = "5'b01000" *) (* DEBUG_ROCOUNTS_FIVE = "5'b01110" *) (* DEBUG_ROCOUNTS_FOUR = "5'b01101" *) 
(* DEBUG_ROCOUNTS_ONE = "5'b01010" *) (* DEBUG_ROCOUNTS_SEVEN = "5'b10000" *) (* DEBUG_ROCOUNTS_SIX = "5'b01111" *) 
(* DEBUG_ROCOUNTS_THREE = "5'b01100" *) (* DEBUG_ROCOUNTS_TWO = "5'b01011" *) (* DEBUG_ROCOUNTS_ZERO = "5'b01001" *) 
(* DEBUG_TX_WIRE = "5'b10010" *) (* ECO_CHECKSUM = "8456fb95" *) (* FINISH = "5'b00111" *) 
(* GET_CLOCKS_PER_BIT = "8'b00000101" *) (* GET_DEBUG_ROCOUNTS_FIVE = "8'b00001100" *) (* GET_DEBUG_ROCOUNTS_FOUR = "8'b00001011" *) 
(* GET_DEBUG_ROCOUNTS_ONE = "8'b00001000" *) (* GET_DEBUG_ROCOUNTS_SEVEN = "8'b00001110" *) (* GET_DEBUG_ROCOUNTS_SIX = "8'b00001101" *) 
(* GET_DEBUG_ROCOUNTS_THREE = "8'b00001010" *) (* GET_DEBUG_ROCOUNTS_TWO = "8'b00001001" *) (* GET_DEBUG_ROCOUNTS_ZERO = "8'b00000111" *) 
(* GET_DEBUG_TX_WIRE = "8'b00001111" *) (* GET_FINAL_DATA = "8'b00000100" *) (* GET_INTIAL_DATA = "8'b00000001" *) 
(* GET_THRESHOLD = "8'b00000110" *) (* IDLE = "5'b00000" *) (* INITIAL_SETUP = "31'b0000101000000000000000011011001" *) 
(* IS_PHANTOM_RECEIVER_READY = "8'b00000011" *) (* PHANTOM_CHECK = "5'b00100" *) (* PHANTOM_DATA = "5'b00001" *) 
(* PHANTOM_RECEIVE = "5'b00011" *) (* PHANTOM_TRANSMIT = "5'b00010" *) (* RO_TYPE = "2" *) 
(* SET_CLOCKS_PER_BIT = "5'b00101" *) (* SET_THRESHOLD = "5'b00110" *) (* STAGES = "2" *) 
(* START_CROSSTALK = "8'b00000010" *) (* WAIT_RETURN = "5'b10001" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module phantom_circuits_top
   (clk_p,
    clk_n,
    uart_rx,
    uart_tx);
  input clk_p;
  input clk_n;
  input uart_rx;
  output uart_tx;

  wire \<const0> ;
  wire \<const1> ;
  wire beenReadFlag;
  wire clk;
  wire clk_BUFG;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire clk_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire clk_p;
  wire \clock_per_bit_reg_n_0_[24] ;
  wire \clock_per_bit_reg_n_0_[25] ;
  wire \clock_per_bit_reg_n_0_[26] ;
  wire \clock_per_bit_reg_n_0_[27] ;
  wire \clock_per_bit_reg_n_0_[28] ;
  wire \clock_per_bit_reg_n_0_[29] ;
  wire \clock_per_bit_reg_n_0_[30] ;
  wire \clock_per_bit_reg_n_0_[31] ;
  wire [31:1]debug_ro_counts_five;
  wire [31:24]debug_ro_counts_four;
  wire [31:24]debug_ro_counts_one;
  wire debug_ro_counts_reg_five;
  wire \debug_ro_counts_reg_five[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_five_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_five_reg_n_0_[9] ;
  wire debug_ro_counts_reg_four;
  wire \debug_ro_counts_reg_four_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_four_reg_n_0_[9] ;
  wire debug_ro_counts_reg_one;
  wire \debug_ro_counts_reg_one[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_one_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_one_reg_n_0_[9] ;
  wire \debug_ro_counts_reg_seven[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_seven_reg_n_0_[9] ;
  wire debug_ro_counts_reg_six;
  wire \debug_ro_counts_reg_six[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_six_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_six_reg_n_0_[9] ;
  wire debug_ro_counts_reg_three;
  wire \debug_ro_counts_reg_three[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_three_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_three_reg_n_0_[9] ;
  wire debug_ro_counts_reg_two;
  wire \debug_ro_counts_reg_two[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_two_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_two_reg_n_0_[9] ;
  wire debug_ro_counts_reg_zero;
  wire \debug_ro_counts_reg_zero[15]_i_3_n_0 ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[0] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[10] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[11] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[12] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[13] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[14] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[15] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[16] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[17] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[18] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[19] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[1] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[20] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[21] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[22] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[23] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[2] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[3] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[4] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[5] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[6] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[7] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[8] ;
  wire \debug_ro_counts_reg_zero_reg_n_0_[9] ;
  wire [31:0]debug_ro_counts_seven;
  wire [31:0]debug_ro_counts_six;
  wire [31:0]debug_ro_counts_three;
  wire [31:1]debug_ro_counts_two;
  wire [31:0]debug_ro_counts_zero;
  wire \in32counter_one[2]_i_2_n_0 ;
  wire \in32counter_one_reg_n_0_[0] ;
  wire \in32counter_one_reg_n_0_[1] ;
  wire \in32counter_one_reg_n_0_[2] ;
  wire \in32counter_two[2]_i_2_n_0 ;
  wire \in32counter_two_reg_n_0_[0] ;
  wire \in32counter_two_reg_n_0_[1] ;
  wire \in32counter_two_reg_n_0_[2] ;
  wire input_Data;
  wire \input_Data_reg_n_0_[0] ;
  wire \input_Data_reg_n_0_[1] ;
  wire \input_Data_reg_n_0_[2] ;
  wire \input_Data_reg_n_0_[3] ;
  wire \input_Data_reg_n_0_[4] ;
  wire \input_Data_reg_n_0_[5] ;
  wire \input_Data_reg_n_0_[6] ;
  wire \input_Data_reg_n_0_[7] ;
  wire \out32counter_five[2]_i_4_n_0 ;
  wire \out32counter_five_reg_n_0_[0] ;
  wire \out32counter_five_reg_n_0_[1] ;
  wire \out32counter_five_reg_n_0_[2] ;
  wire \out32counter_four[2]_i_4_n_0 ;
  wire \out32counter_four_reg_n_0_[0] ;
  wire \out32counter_four_reg_n_0_[1] ;
  wire \out32counter_four_reg_n_0_[2] ;
  wire \out32counter_one_reg_n_0_[0] ;
  wire \out32counter_one_reg_n_0_[1] ;
  wire \out32counter_one_reg_n_0_[2] ;
  wire \out32counter_seven[2]_i_4_n_0 ;
  wire \out32counter_seven_reg_n_0_[0] ;
  wire \out32counter_seven_reg_n_0_[1] ;
  wire \out32counter_seven_reg_n_0_[2] ;
  wire \out32counter_six_reg_n_0_[0] ;
  wire \out32counter_six_reg_n_0_[1] ;
  wire \out32counter_six_reg_n_0_[2] ;
  wire \out32counter_three[2]_i_5_n_0 ;
  wire \out32counter_three_reg_n_0_[0] ;
  wire \out32counter_three_reg_n_0_[1] ;
  wire \out32counter_three_reg_n_0_[2] ;
  wire \out32counter_two[2]_i_3_n_0 ;
  wire \out32counter_two_reg_n_0_[0] ;
  wire \out32counter_two_reg_n_0_[1] ;
  wire \out32counter_two_reg_n_0_[2] ;
  wire \out32counter_zero_reg_n_0_[0] ;
  wire \out32counter_zero_reg_n_0_[1] ;
  wire \out32counter_zero_reg_n_0_[2] ;
  wire [3:0]p_0_in;
  wire [31:8]p_0_out;
  wire [7:0]p_1_in;
  wire [7:0]phantom_output_data;
  wire receiver_INST_n_10;
  wire receiver_INST_n_100;
  wire receiver_INST_n_101;
  wire receiver_INST_n_102;
  wire receiver_INST_n_103;
  wire receiver_INST_n_104;
  wire receiver_INST_n_105;
  wire receiver_INST_n_106;
  wire receiver_INST_n_107;
  wire receiver_INST_n_108;
  wire receiver_INST_n_109;
  wire receiver_INST_n_11;
  wire receiver_INST_n_110;
  wire receiver_INST_n_111;
  wire receiver_INST_n_112;
  wire receiver_INST_n_113;
  wire receiver_INST_n_114;
  wire receiver_INST_n_115;
  wire receiver_INST_n_116;
  wire receiver_INST_n_117;
  wire receiver_INST_n_118;
  wire receiver_INST_n_119;
  wire receiver_INST_n_12;
  wire receiver_INST_n_120;
  wire receiver_INST_n_121;
  wire receiver_INST_n_122;
  wire receiver_INST_n_13;
  wire receiver_INST_n_139;
  wire receiver_INST_n_14;
  wire receiver_INST_n_140;
  wire receiver_INST_n_141;
  wire receiver_INST_n_142;
  wire receiver_INST_n_143;
  wire receiver_INST_n_144;
  wire receiver_INST_n_145;
  wire receiver_INST_n_146;
  wire receiver_INST_n_147;
  wire receiver_INST_n_148;
  wire receiver_INST_n_149;
  wire receiver_INST_n_15;
  wire receiver_INST_n_150;
  wire receiver_INST_n_151;
  wire receiver_INST_n_152;
  wire receiver_INST_n_153;
  wire receiver_INST_n_154;
  wire receiver_INST_n_155;
  wire receiver_INST_n_156;
  wire receiver_INST_n_157;
  wire receiver_INST_n_158;
  wire receiver_INST_n_159;
  wire receiver_INST_n_160;
  wire receiver_INST_n_161;
  wire receiver_INST_n_162;
  wire receiver_INST_n_163;
  wire receiver_INST_n_164;
  wire receiver_INST_n_165;
  wire receiver_INST_n_166;
  wire receiver_INST_n_167;
  wire receiver_INST_n_168;
  wire receiver_INST_n_169;
  wire receiver_INST_n_170;
  wire receiver_INST_n_171;
  wire receiver_INST_n_172;
  wire receiver_INST_n_173;
  wire receiver_INST_n_174;
  wire receiver_INST_n_175;
  wire receiver_INST_n_176;
  wire receiver_INST_n_177;
  wire receiver_INST_n_178;
  wire receiver_INST_n_179;
  wire receiver_INST_n_180;
  wire receiver_INST_n_181;
  wire receiver_INST_n_182;
  wire receiver_INST_n_183;
  wire receiver_INST_n_184;
  wire receiver_INST_n_185;
  wire receiver_INST_n_186;
  wire receiver_INST_n_187;
  wire receiver_INST_n_188;
  wire receiver_INST_n_189;
  wire receiver_INST_n_190;
  wire receiver_INST_n_191;
  wire receiver_INST_n_192;
  wire receiver_INST_n_193;
  wire receiver_INST_n_194;
  wire receiver_INST_n_195;
  wire receiver_INST_n_196;
  wire receiver_INST_n_197;
  wire receiver_INST_n_198;
  wire receiver_INST_n_199;
  wire receiver_INST_n_200;
  wire receiver_INST_n_201;
  wire receiver_INST_n_202;
  wire receiver_INST_n_203;
  wire receiver_INST_n_204;
  wire receiver_INST_n_205;
  wire receiver_INST_n_206;
  wire receiver_INST_n_207;
  wire receiver_INST_n_208;
  wire receiver_INST_n_209;
  wire receiver_INST_n_210;
  wire receiver_INST_n_211;
  wire receiver_INST_n_212;
  wire receiver_INST_n_213;
  wire receiver_INST_n_214;
  wire receiver_INST_n_215;
  wire receiver_INST_n_216;
  wire receiver_INST_n_217;
  wire receiver_INST_n_218;
  wire receiver_INST_n_219;
  wire receiver_INST_n_220;
  wire receiver_INST_n_221;
  wire receiver_INST_n_222;
  wire receiver_INST_n_223;
  wire receiver_INST_n_224;
  wire receiver_INST_n_225;
  wire receiver_INST_n_226;
  wire receiver_INST_n_227;
  wire receiver_INST_n_228;
  wire receiver_INST_n_229;
  wire receiver_INST_n_230;
  wire receiver_INST_n_231;
  wire receiver_INST_n_232;
  wire receiver_INST_n_233;
  wire receiver_INST_n_234;
  wire receiver_INST_n_24;
  wire receiver_INST_n_25;
  wire receiver_INST_n_39;
  wire receiver_INST_n_40;
  wire receiver_INST_n_41;
  wire receiver_INST_n_51;
  wire receiver_INST_n_64;
  wire receiver_INST_n_78;
  wire receiver_INST_n_79;
  wire receiver_INST_n_80;
  wire receiver_INST_n_90;
  wire receiver_INST_n_91;
  wire receiver_INST_n_92;
  wire receiver_INST_n_93;
  wire receiver_INST_n_94;
  wire receiver_INST_n_95;
  wire receiver_INST_n_96;
  wire receiver_INST_n_97;
  wire receiver_INST_n_98;
  wire receiver_INST_n_99;
  wire reset_Data;
  wire reset_Data_i_1_n_0;
  wire reset_Data_i_2_n_0;
  wire \return_state[4]_i_1_n_0 ;
  wire \return_state[4]_i_2_n_0 ;
  wire \return_state[4]_i_3_n_0 ;
  wire \return_state[4]_i_4_n_0 ;
  wire \return_state_reg_n_0_[0] ;
  wire \return_state_reg_n_0_[1] ;
  wire \return_state_reg_n_0_[2] ;
  wire \return_state_reg_n_0_[3] ;
  wire \return_state_reg_n_0_[4] ;
  wire rst;
  wire rst_i_1_n_0;
  wire [3:2]rst_init_counter_reg;
  wire \rst_init_counter_reg_n_0_[0] ;
  wire \rst_init_counter_reg_n_0_[1] ;
  wire rxHasData;
  wire rxHasData0;
  wire [7:0]rx_byte;
  wire rx_uart_n_0;
  wire rx_uart_n_1;
  wire rx_uart_n_10;
  wire rx_uart_n_11;
  wire rx_uart_n_12;
  wire rx_uart_n_13;
  wire rx_uart_n_14;
  wire rx_uart_n_15;
  wire rx_uart_n_16;
  wire rx_uart_n_17;
  wire rx_uart_n_18;
  wire rx_uart_n_19;
  wire rx_uart_n_2;
  wire rx_uart_n_20;
  wire rx_uart_n_21;
  wire rx_uart_n_22;
  wire rx_uart_n_23;
  wire rx_uart_n_24;
  wire rx_uart_n_25;
  wire rx_uart_n_26;
  wire rx_uart_n_27;
  wire rx_uart_n_3;
  wire rx_uart_n_36;
  wire rx_uart_n_37;
  wire rx_uart_n_38;
  wire rx_uart_n_39;
  wire rx_uart_n_4;
  wire rx_uart_n_40;
  wire rx_uart_n_42;
  wire rx_uart_n_43;
  wire rx_uart_n_44;
  wire rx_uart_n_45;
  wire rx_uart_n_46;
  wire rx_uart_n_5;
  wire rx_uart_n_6;
  wire rx_uart_n_7;
  wire rx_uart_n_8;
  wire rx_uart_n_9;
  wire sel;
  wire send_Data_i_1_n_0;
  wire send_Data_reg_n_0;
  wire \state[0]_i_2__0_n_0 ;
  wire \state[0]_i_3__0_n_0 ;
  wire \state[0]_i_5_n_0 ;
  wire \state[0]_i_6_n_0 ;
  wire \state[2]_i_6_n_0 ;
  wire \state[4]_i_5_n_0 ;
  wire \state[4]_i_6_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire \state_reg_n_0_[3] ;
  wire \state_reg_n_0_[4] ;
  wire \threshold_reg_n_0_[0] ;
  wire \threshold_reg_n_0_[10] ;
  wire \threshold_reg_n_0_[11] ;
  wire \threshold_reg_n_0_[12] ;
  wire \threshold_reg_n_0_[13] ;
  wire \threshold_reg_n_0_[14] ;
  wire \threshold_reg_n_0_[15] ;
  wire \threshold_reg_n_0_[16] ;
  wire \threshold_reg_n_0_[17] ;
  wire \threshold_reg_n_0_[18] ;
  wire \threshold_reg_n_0_[19] ;
  wire \threshold_reg_n_0_[1] ;
  wire \threshold_reg_n_0_[20] ;
  wire \threshold_reg_n_0_[21] ;
  wire \threshold_reg_n_0_[22] ;
  wire \threshold_reg_n_0_[23] ;
  wire \threshold_reg_n_0_[24] ;
  wire \threshold_reg_n_0_[25] ;
  wire \threshold_reg_n_0_[26] ;
  wire \threshold_reg_n_0_[27] ;
  wire \threshold_reg_n_0_[28] ;
  wire \threshold_reg_n_0_[29] ;
  wire \threshold_reg_n_0_[2] ;
  wire \threshold_reg_n_0_[30] ;
  wire \threshold_reg_n_0_[31] ;
  wire \threshold_reg_n_0_[3] ;
  wire \threshold_reg_n_0_[4] ;
  wire \threshold_reg_n_0_[5] ;
  wire \threshold_reg_n_0_[6] ;
  wire \threshold_reg_n_0_[7] ;
  wire \threshold_reg_n_0_[8] ;
  wire \threshold_reg_n_0_[9] ;
  wire tx_busy;
  wire [7:0]tx_byte;
  wire \tx_byte[0]_i_5_n_0 ;
  wire \tx_byte[5]_i_12_n_0 ;
  wire \tx_byte[6]_i_3_n_0 ;
  wire \tx_byte[6]_i_8_n_0 ;
  wire \tx_byte[7]_i_10_n_0 ;
  wire \tx_byte[7]_i_13_n_0 ;
  wire \tx_byte[7]_i_16_n_0 ;
  wire \tx_byte[7]_i_20_n_0 ;
  wire \tx_byte_reg_n_0_[0] ;
  wire \tx_byte_reg_n_0_[1] ;
  wire \tx_byte_reg_n_0_[2] ;
  wire \tx_byte_reg_n_0_[3] ;
  wire \tx_byte_reg_n_0_[4] ;
  wire \tx_byte_reg_n_0_[5] ;
  wire \tx_byte_reg_n_0_[6] ;
  wire \tx_byte_reg_n_0_[7] ;
  wire tx_uart_n_1;
  wire tx_uart_n_11;
  wire tx_uart_n_12;
  wire tx_uart_n_15;
  wire tx_uart_n_16;
  wire tx_uart_n_17;
  wire tx_uart_n_2;
  wire tx_uart_n_21;
  wire tx_uart_n_22;
  wire tx_uart_n_23;
  wire tx_uart_n_26;
  wire tx_uart_n_27;
  wire tx_uart_n_28;
  wire tx_uart_n_29;
  wire tx_uart_n_3;
  wire tx_uart_n_31;
  wire tx_uart_n_32;
  wire tx_uart_n_33;
  wire tx_uart_n_34;
  wire tx_uart_n_35;
  wire tx_uart_n_36;
  wire tx_uart_n_37;
  wire tx_uart_n_38;
  wire tx_uart_n_39;
  wire tx_uart_n_4;
  wire tx_uart_n_40;
  wire tx_uart_n_41;
  wire tx_uart_n_42;
  wire tx_uart_n_43;
  wire tx_uart_n_44;
  wire tx_uart_n_45;
  wire tx_valid;
  wire tx_valid_reg_n_0;
  wire tx_wire_debug;
  wire uart_rx;
  wire uart_rx_IBUF;
  wire uart_tx;
  wire uart_tx_OBUF;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    IBUFDS_inst
       (.I(clk_p),
        .IB(clk_n),
        .O(clk));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    beenReadFlag_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_uart_n_33),
        .Q(beenReadFlag),
        .R(\<const0> ));
  BUFG clk_BUFG_inst
       (.I(clk),
        .O(clk_BUFG));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[0] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[0]),
        .Q(p_0_out[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[10] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[10]),
        .Q(p_0_out[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[11] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[11]),
        .Q(p_0_out[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[12] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[12]),
        .Q(p_0_out[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[13] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[13]),
        .Q(p_0_out[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[14] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[14]),
        .Q(p_0_out[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[15] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[15]),
        .Q(p_0_out[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[16] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[16]),
        .Q(p_0_out[24]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[17] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[17]),
        .Q(p_0_out[25]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[18] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[18]),
        .Q(p_0_out[26]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[19] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[19]),
        .Q(p_0_out[27]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[1] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[1]),
        .Q(p_0_out[9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[20] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[20]),
        .Q(p_0_out[28]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[21] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[21]),
        .Q(p_0_out[29]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[22] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[22]),
        .Q(p_0_out[30]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[23] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[23]),
        .Q(p_0_out[31]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[24] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[24]),
        .Q(\clock_per_bit_reg_n_0_[24] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[25] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[25]),
        .Q(\clock_per_bit_reg_n_0_[25] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[26] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[26]),
        .Q(\clock_per_bit_reg_n_0_[26] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[27] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[27]),
        .Q(\clock_per_bit_reg_n_0_[27] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[28] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[28]),
        .Q(\clock_per_bit_reg_n_0_[28] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[29] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[29]),
        .Q(\clock_per_bit_reg_n_0_[29] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[2] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[2]),
        .Q(p_0_out[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[30] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[30]),
        .Q(\clock_per_bit_reg_n_0_[30] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[31] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[31]),
        .Q(\clock_per_bit_reg_n_0_[31] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[3] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[3]),
        .Q(p_0_out[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[4] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[4]),
        .Q(p_0_out[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[5] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[5]),
        .Q(p_0_out[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[6] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[6]),
        .Q(p_0_out[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[7] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_44),
        .D(rx_byte[7]),
        .Q(p_0_out[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[8] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[8]),
        .Q(p_0_out[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_per_bit_reg[9] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_43),
        .D(p_0_out[9]),
        .Q(p_0_out[17]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \debug_ro_counts_reg_five[15]_i_3 
       (.I0(rst),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[3] ),
        .O(\debug_ro_counts_reg_five[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_218),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_208),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_207),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_206),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_205),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_204),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_203),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[24]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[16] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[25]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[17] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[26]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[18] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[27]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[19] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_217),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[28]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[20] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[29]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[21] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[30]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[22] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(debug_ro_counts_five[31]),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[23] ),
        .R(tx_uart_n_41));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_216),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_215),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_214),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_213),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_212),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_211),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_210),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_five_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_five),
        .D(receiver_INST_n_209),
        .Q(\debug_ro_counts_reg_five_reg_n_0_[9] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_202),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_192),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_191),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_190),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_189),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_188),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_187),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[24]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[16] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[25]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[17] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[26]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[18] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[27]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[19] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_201),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[28]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[20] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[29]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[21] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[30]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[22] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(debug_ro_counts_four[31]),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[23] ),
        .R(tx_uart_n_37));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_200),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_199),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_198),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_197),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_196),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_195),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_194),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_four_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_four),
        .D(receiver_INST_n_193),
        .Q(\debug_ro_counts_reg_four_reg_n_0_[9] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \debug_ro_counts_reg_one[15]_i_3 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[4] ),
        .O(\debug_ro_counts_reg_one[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_154),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_144),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_143),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_142),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_141),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_140),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_139),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[24]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[16] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[25]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[17] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[26]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[18] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[27]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[19] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_153),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[28]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[20] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[29]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[21] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[30]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[22] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(debug_ro_counts_one[31]),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[23] ),
        .R(tx_uart_n_40));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_152),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_151),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_150),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_149),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_148),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_147),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_146),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_one_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_one),
        .D(receiver_INST_n_145),
        .Q(\debug_ro_counts_reg_one_reg_n_0_[9] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \debug_ro_counts_reg_seven[15]_i_3 
       (.I0(\out32counter_seven_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[4] ),
        .I2(\state_reg_n_0_[3] ),
        .O(\debug_ro_counts_reg_seven[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[0] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_106),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[10] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_96),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[11] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_95),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[12] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_94),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[13] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_93),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[14] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_92),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[15] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_91),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[16] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[24]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[16] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[17] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[25]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[17] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[18] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[26]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[18] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[19] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[27]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[19] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[1] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_105),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[20] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[28]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[20] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[21] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[29]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[21] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[22] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[30]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[22] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[23] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(debug_ro_counts_seven[31]),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[23] ),
        .R(tx_uart_n_42));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[2] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_104),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[3] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_103),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[4] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_102),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[5] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_101),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[6] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_100),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[7] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_99),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[8] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_98),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_seven_reg[9] 
       (.C(clk_BUFG),
        .CE(tx_uart_n_43),
        .D(receiver_INST_n_97),
        .Q(\debug_ro_counts_reg_seven_reg_n_0_[9] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \debug_ro_counts_reg_six[15]_i_3 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[0] ),
        .O(\debug_ro_counts_reg_six[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_234),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_224),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_223),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_222),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_221),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_220),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_219),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[24]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[16] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[25]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[17] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[26]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[18] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[27]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[19] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_233),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[28]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[20] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[29]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[21] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[30]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[22] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(debug_ro_counts_six[31]),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[23] ),
        .R(tx_uart_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_232),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_231),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_230),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_229),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_228),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_227),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_226),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_six_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_six),
        .D(receiver_INST_n_225),
        .Q(\debug_ro_counts_reg_six_reg_n_0_[9] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \debug_ro_counts_reg_three[15]_i_3 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(rst),
        .O(\debug_ro_counts_reg_three[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_186),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_176),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_175),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_174),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_173),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_172),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_171),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[24]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[16] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[25]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[17] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[26]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[18] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[27]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[19] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_185),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[28]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[20] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[29]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[21] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[30]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[22] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(debug_ro_counts_three[31]),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[23] ),
        .R(tx_uart_n_44));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_184),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_183),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_182),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_181),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_180),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_179),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_178),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_three_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_three),
        .D(receiver_INST_n_177),
        .Q(\debug_ro_counts_reg_three_reg_n_0_[9] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \debug_ro_counts_reg_two[15]_i_3 
       (.I0(\state_reg_n_0_[4] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(rst),
        .O(\debug_ro_counts_reg_two[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_170),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_160),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_159),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_158),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_157),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_156),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_155),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[24]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[16] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[25]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[17] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[26]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[18] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[27]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[19] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_169),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[28]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[20] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[29]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[21] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[30]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[22] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(debug_ro_counts_two[31]),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[23] ),
        .R(tx_uart_n_34));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_168),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_167),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_166),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_165),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_164),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_163),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_162),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_two_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_two),
        .D(receiver_INST_n_161),
        .Q(\debug_ro_counts_reg_two_reg_n_0_[9] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \debug_ro_counts_reg_zero[15]_i_3 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[4] ),
        .O(\debug_ro_counts_reg_zero[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[0] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_122),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[10] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_112),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[11] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_111),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[12] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_110),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[13] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_109),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[14] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_108),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[15] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_107),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[16] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[24]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[16] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[17] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[25]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[17] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[18] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[26]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[18] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[19] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[27]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[19] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[1] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_121),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[20] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[28]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[20] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[21] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[29]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[21] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[22] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[30]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[22] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[23] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(debug_ro_counts_zero[31]),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[23] ),
        .R(tx_uart_n_38));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[2] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_120),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[3] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_119),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[4] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_118),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[5] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_117),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[6] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_116),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[7] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_115),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[8] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_114),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_reg_zero_reg[9] 
       (.C(clk_BUFG),
        .CE(debug_ro_counts_reg_zero),
        .D(receiver_INST_n_113),
        .Q(\debug_ro_counts_reg_zero_reg_n_0_[9] ),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'hFFFFFFFDFFFFFFFF)) 
    \in32counter_one[2]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(rst),
        .I3(\state_reg_n_0_[4] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\state_reg_n_0_[0] ),
        .O(\in32counter_one[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \in32counter_one_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_2),
        .Q(\in32counter_one_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \in32counter_one_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_1),
        .Q(\in32counter_one_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \in32counter_one_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_0),
        .Q(\in32counter_one_reg_n_0_[2] ),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'hFFFFFFFDFFFFFFFF)) 
    \in32counter_two[2]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(rst),
        .I3(\state_reg_n_0_[4] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[1] ),
        .O(\in32counter_two[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \in32counter_two_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_5),
        .Q(\in32counter_two_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \in32counter_two_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_4),
        .Q(\in32counter_two_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \in32counter_two_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_3),
        .Q(\in32counter_two_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[0] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[0]),
        .Q(\input_Data_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[1] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[1]),
        .Q(\input_Data_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[2] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[2]),
        .Q(\input_Data_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[3] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[3]),
        .Q(\input_Data_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[4] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[4]),
        .Q(\input_Data_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[5] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[5]),
        .Q(\input_Data_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[6] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[6]),
        .Q(\input_Data_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE \input_Data_reg[7] 
       (.C(clk_BUFG),
        .CE(input_Data),
        .D(rx_byte[7]),
        .Q(\input_Data_reg_n_0_[7] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \out32counter_five[2]_i_4 
       (.I0(\state_reg_n_0_[4] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\out32counter_five[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_five_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_17),
        .Q(\out32counter_five_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_five_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_16),
        .Q(\out32counter_five_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_five_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_15),
        .Q(\out32counter_five_reg_n_0_[2] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \out32counter_four[2]_i_4 
       (.I0(rst),
        .I1(\state_reg_n_0_[4] ),
        .O(\out32counter_four[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_four_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_14),
        .Q(\out32counter_four_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_four_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_13),
        .Q(\out32counter_four_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_four_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_12),
        .Q(\out32counter_four_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_one_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_8),
        .Q(\out32counter_one_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_one_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_7),
        .Q(\out32counter_one_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_one_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_6),
        .Q(\out32counter_one_reg_n_0_[2] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out32counter_seven[2]_i_4 
       (.I0(rst),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[3] ),
        .O(\out32counter_seven[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_seven_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_23),
        .Q(\out32counter_seven_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_seven_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_22),
        .Q(\out32counter_seven_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_seven_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_21),
        .Q(\out32counter_seven_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_six_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_20),
        .Q(\out32counter_six_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_six_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_19),
        .Q(\out32counter_six_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_six_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_18),
        .Q(\out32counter_six_reg_n_0_[2] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \out32counter_three[2]_i_5 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[4] ),
        .O(\out32counter_three[2]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_three_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_11),
        .Q(\out32counter_three_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_three_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_10),
        .Q(\out32counter_three_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_three_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_9),
        .Q(\out32counter_three_reg_n_0_[2] ),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \out32counter_two[2]_i_3 
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[1] ),
        .O(\out32counter_two[2]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_two_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_uart_n_3),
        .Q(\out32counter_two_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_two_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_uart_n_2),
        .Q(\out32counter_two_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_two_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_uart_n_1),
        .Q(\out32counter_two_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_zero_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_26),
        .Q(\out32counter_zero_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_zero_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_25),
        .Q(\out32counter_zero_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out32counter_zero_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rx_uart_n_24),
        .Q(\out32counter_zero_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE \phantom_output_data_reg[0] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[0]),
        .Q(phantom_output_data[0]),
        .R(rst));
  FDRE \phantom_output_data_reg[1] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[1]),
        .Q(phantom_output_data[1]),
        .R(rst));
  FDRE \phantom_output_data_reg[2] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[2]),
        .Q(phantom_output_data[2]),
        .R(rst));
  FDRE \phantom_output_data_reg[3] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[3]),
        .Q(phantom_output_data[3]),
        .R(rst));
  FDRE \phantom_output_data_reg[4] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[4]),
        .Q(phantom_output_data[4]),
        .R(rst));
  FDRE \phantom_output_data_reg[5] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[5]),
        .Q(phantom_output_data[5]),
        .R(rst));
  FDRE \phantom_output_data_reg[6] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[6]),
        .Q(phantom_output_data[6]),
        .R(rst));
  FDRE \phantom_output_data_reg[7] 
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(p_1_in[7]),
        .Q(phantom_output_data[7]),
        .R(rst));
  receiver receiver_INST
       (.D({tx_byte[7],tx_byte[4]}),
        .E(receiver_INST_n_80),
        .Q({\clock_per_bit_reg_n_0_[31] ,\clock_per_bit_reg_n_0_[30] ,\clock_per_bit_reg_n_0_[29] ,\clock_per_bit_reg_n_0_[28] ,\clock_per_bit_reg_n_0_[27] ,\clock_per_bit_reg_n_0_[26] ,\clock_per_bit_reg_n_0_[25] ,\clock_per_bit_reg_n_0_[24] ,p_0_out}),
        .beenReadFlag(beenReadFlag),
        .clk_BUFG(clk_BUFG),
        .data_reg1_carry__2_0({\threshold_reg_n_0_[31] ,\threshold_reg_n_0_[30] ,\threshold_reg_n_0_[29] ,\threshold_reg_n_0_[28] ,\threshold_reg_n_0_[27] ,\threshold_reg_n_0_[26] ,\threshold_reg_n_0_[25] ,\threshold_reg_n_0_[24] ,\threshold_reg_n_0_[23] ,\threshold_reg_n_0_[22] ,\threshold_reg_n_0_[21] ,\threshold_reg_n_0_[20] ,\threshold_reg_n_0_[19] ,\threshold_reg_n_0_[18] ,\threshold_reg_n_0_[17] ,\threshold_reg_n_0_[16] ,\threshold_reg_n_0_[15] ,\threshold_reg_n_0_[14] ,\threshold_reg_n_0_[13] ,\threshold_reg_n_0_[12] ,\threshold_reg_n_0_[11] ,\threshold_reg_n_0_[10] ,\threshold_reg_n_0_[9] ,\threshold_reg_n_0_[8] ,\threshold_reg_n_0_[7] ,\threshold_reg_n_0_[6] ,\threshold_reg_n_0_[5] ,\threshold_reg_n_0_[4] ,\threshold_reg_n_0_[3] ,\threshold_reg_n_0_[2] ,\threshold_reg_n_0_[1] ,\threshold_reg_n_0_[0] }),
        .\data_reg_reg[7]_0 (p_1_in),
        .\debug_ro_counts_five_reg_reg[23]_0 ({receiver_INST_n_203,receiver_INST_n_204,receiver_INST_n_205,receiver_INST_n_206,receiver_INST_n_207,receiver_INST_n_208,receiver_INST_n_209,receiver_INST_n_210,receiver_INST_n_211,receiver_INST_n_212,receiver_INST_n_213,receiver_INST_n_214,receiver_INST_n_215,receiver_INST_n_216,receiver_INST_n_217,receiver_INST_n_218}),
        .\debug_ro_counts_five_reg_reg[31]_0 ({debug_ro_counts_five[31:24],debug_ro_counts_five[5],debug_ro_counts_five[3:1]}),
        .\debug_ro_counts_four_reg_reg[0]_0 (receiver_INST_n_90),
        .\debug_ro_counts_four_reg_reg[23]_0 ({receiver_INST_n_187,receiver_INST_n_188,receiver_INST_n_189,receiver_INST_n_190,receiver_INST_n_191,receiver_INST_n_192,receiver_INST_n_193,receiver_INST_n_194,receiver_INST_n_195,receiver_INST_n_196,receiver_INST_n_197,receiver_INST_n_198,receiver_INST_n_199,receiver_INST_n_200,receiver_INST_n_201,receiver_INST_n_202}),
        .\debug_ro_counts_four_reg_reg[31]_0 (debug_ro_counts_four),
        .\debug_ro_counts_one_reg_reg[1]_0 (receiver_INST_n_15),
        .\debug_ro_counts_one_reg_reg[23]_0 ({receiver_INST_n_139,receiver_INST_n_140,receiver_INST_n_141,receiver_INST_n_142,receiver_INST_n_143,receiver_INST_n_144,receiver_INST_n_145,receiver_INST_n_146,receiver_INST_n_147,receiver_INST_n_148,receiver_INST_n_149,receiver_INST_n_150,receiver_INST_n_151,receiver_INST_n_152,receiver_INST_n_153,receiver_INST_n_154}),
        .\debug_ro_counts_one_reg_reg[2]_0 (receiver_INST_n_24),
        .\debug_ro_counts_one_reg_reg[31]_0 (debug_ro_counts_one),
        .\debug_ro_counts_one_reg_reg[5]_0 (receiver_INST_n_39),
        .\debug_ro_counts_one_reg_reg[6]_0 (receiver_INST_n_40),
        .\debug_ro_counts_reg_five_reg[0] (receiver_INST_n_51),
        .\debug_ro_counts_reg_five_reg[10] (\debug_ro_counts_reg_five_reg_n_0_[18] ),
        .\debug_ro_counts_reg_five_reg[11] (\debug_ro_counts_reg_five_reg_n_0_[19] ),
        .\debug_ro_counts_reg_five_reg[12] (\debug_ro_counts_reg_five_reg_n_0_[20] ),
        .\debug_ro_counts_reg_five_reg[13] (\debug_ro_counts_reg_five_reg_n_0_[21] ),
        .\debug_ro_counts_reg_five_reg[14] (\debug_ro_counts_reg_five_reg_n_0_[22] ),
        .\debug_ro_counts_reg_five_reg[15] (\out32counter_five_reg_n_0_[0] ),
        .\debug_ro_counts_reg_five_reg[15]_0 (\out32counter_five_reg_n_0_[1] ),
        .\debug_ro_counts_reg_five_reg[15]_1 (\debug_ro_counts_reg_five_reg_n_0_[23] ),
        .\debug_ro_counts_reg_five_reg[7] ({\debug_ro_counts_reg_five_reg_n_0_[15] ,\debug_ro_counts_reg_five_reg_n_0_[14] ,\debug_ro_counts_reg_five_reg_n_0_[13] ,\debug_ro_counts_reg_five_reg_n_0_[12] ,\debug_ro_counts_reg_five_reg_n_0_[11] ,\debug_ro_counts_reg_five_reg_n_0_[10] ,\debug_ro_counts_reg_five_reg_n_0_[9] ,\debug_ro_counts_reg_five_reg_n_0_[8] ,\debug_ro_counts_reg_five_reg_n_0_[7] ,\debug_ro_counts_reg_five_reg_n_0_[6] ,\debug_ro_counts_reg_five_reg_n_0_[4] ,\debug_ro_counts_reg_five_reg_n_0_[0] }),
        .\debug_ro_counts_reg_five_reg[8] (\debug_ro_counts_reg_five_reg_n_0_[16] ),
        .\debug_ro_counts_reg_five_reg[9] (\debug_ro_counts_reg_five_reg_n_0_[17] ),
        .\debug_ro_counts_reg_four_reg[10] (\debug_ro_counts_reg_four_reg_n_0_[18] ),
        .\debug_ro_counts_reg_four_reg[11] (\debug_ro_counts_reg_four_reg_n_0_[19] ),
        .\debug_ro_counts_reg_four_reg[12] (\debug_ro_counts_reg_four_reg_n_0_[20] ),
        .\debug_ro_counts_reg_four_reg[13] (\debug_ro_counts_reg_four_reg_n_0_[21] ),
        .\debug_ro_counts_reg_four_reg[14] (\debug_ro_counts_reg_four_reg_n_0_[22] ),
        .\debug_ro_counts_reg_four_reg[15] (\out32counter_four_reg_n_0_[0] ),
        .\debug_ro_counts_reg_four_reg[15]_0 (\out32counter_four_reg_n_0_[1] ),
        .\debug_ro_counts_reg_four_reg[15]_1 (\debug_ro_counts_reg_four_reg_n_0_[23] ),
        .\debug_ro_counts_reg_four_reg[7] ({\debug_ro_counts_reg_four_reg_n_0_[15] ,\debug_ro_counts_reg_four_reg_n_0_[14] ,\debug_ro_counts_reg_four_reg_n_0_[13] ,\debug_ro_counts_reg_four_reg_n_0_[12] ,\debug_ro_counts_reg_four_reg_n_0_[11] ,\debug_ro_counts_reg_four_reg_n_0_[10] ,\debug_ro_counts_reg_four_reg_n_0_[9] ,\debug_ro_counts_reg_four_reg_n_0_[8] ,\debug_ro_counts_reg_four_reg_n_0_[7] ,\debug_ro_counts_reg_four_reg_n_0_[6] ,\debug_ro_counts_reg_four_reg_n_0_[5] ,\debug_ro_counts_reg_four_reg_n_0_[4] ,\debug_ro_counts_reg_four_reg_n_0_[3] ,\debug_ro_counts_reg_four_reg_n_0_[2] ,\debug_ro_counts_reg_four_reg_n_0_[1] ,\debug_ro_counts_reg_four_reg_n_0_[0] }),
        .\debug_ro_counts_reg_four_reg[8] (\debug_ro_counts_reg_four_reg_n_0_[16] ),
        .\debug_ro_counts_reg_four_reg[9] (\debug_ro_counts_reg_four_reg_n_0_[17] ),
        .\debug_ro_counts_reg_one_reg[10] (\debug_ro_counts_reg_one_reg_n_0_[18] ),
        .\debug_ro_counts_reg_one_reg[11] (\debug_ro_counts_reg_one_reg_n_0_[19] ),
        .\debug_ro_counts_reg_one_reg[12] (\debug_ro_counts_reg_one_reg_n_0_[20] ),
        .\debug_ro_counts_reg_one_reg[13] (\debug_ro_counts_reg_one_reg_n_0_[21] ),
        .\debug_ro_counts_reg_one_reg[14] (\debug_ro_counts_reg_one_reg_n_0_[22] ),
        .\debug_ro_counts_reg_one_reg[15] (\out32counter_one_reg_n_0_[0] ),
        .\debug_ro_counts_reg_one_reg[15]_0 (\out32counter_one_reg_n_0_[1] ),
        .\debug_ro_counts_reg_one_reg[15]_1 (\debug_ro_counts_reg_one_reg_n_0_[23] ),
        .\debug_ro_counts_reg_one_reg[3] (receiver_INST_n_25),
        .\debug_ro_counts_reg_one_reg[7] ({\debug_ro_counts_reg_one_reg_n_0_[15] ,\debug_ro_counts_reg_one_reg_n_0_[14] ,\debug_ro_counts_reg_one_reg_n_0_[13] ,\debug_ro_counts_reg_one_reg_n_0_[12] ,\debug_ro_counts_reg_one_reg_n_0_[11] ,\debug_ro_counts_reg_one_reg_n_0_[10] ,\debug_ro_counts_reg_one_reg_n_0_[9] ,\debug_ro_counts_reg_one_reg_n_0_[8] ,\debug_ro_counts_reg_one_reg_n_0_[7] ,\debug_ro_counts_reg_one_reg_n_0_[6] ,\debug_ro_counts_reg_one_reg_n_0_[5] ,\debug_ro_counts_reg_one_reg_n_0_[4] ,\debug_ro_counts_reg_one_reg_n_0_[3] ,\debug_ro_counts_reg_one_reg_n_0_[2] ,\debug_ro_counts_reg_one_reg_n_0_[1] ,\debug_ro_counts_reg_one_reg_n_0_[0] }),
        .\debug_ro_counts_reg_one_reg[8] (\debug_ro_counts_reg_one_reg_n_0_[16] ),
        .\debug_ro_counts_reg_one_reg[9] (\debug_ro_counts_reg_one_reg_n_0_[17] ),
        .\debug_ro_counts_reg_seven_reg[0] (\out32counter_seven_reg_n_0_[2] ),
        .\debug_ro_counts_reg_seven_reg[0]_0 (\out32counter_seven_reg_n_0_[0] ),
        .\debug_ro_counts_reg_seven_reg[0]_1 (\out32counter_seven_reg_n_0_[1] ),
        .\debug_ro_counts_reg_seven_reg[10] (\debug_ro_counts_reg_seven_reg_n_0_[18] ),
        .\debug_ro_counts_reg_seven_reg[11] (\debug_ro_counts_reg_seven_reg_n_0_[19] ),
        .\debug_ro_counts_reg_seven_reg[12] (\debug_ro_counts_reg_seven_reg_n_0_[20] ),
        .\debug_ro_counts_reg_seven_reg[13] (\debug_ro_counts_reg_seven_reg_n_0_[21] ),
        .\debug_ro_counts_reg_seven_reg[14] (\debug_ro_counts_reg_seven_reg_n_0_[22] ),
        .\debug_ro_counts_reg_seven_reg[15] (\debug_ro_counts_reg_seven_reg_n_0_[23] ),
        .\debug_ro_counts_reg_seven_reg[7] ({\debug_ro_counts_reg_seven_reg_n_0_[15] ,\debug_ro_counts_reg_seven_reg_n_0_[14] ,\debug_ro_counts_reg_seven_reg_n_0_[13] ,\debug_ro_counts_reg_seven_reg_n_0_[12] ,\debug_ro_counts_reg_seven_reg_n_0_[11] ,\debug_ro_counts_reg_seven_reg_n_0_[10] ,\debug_ro_counts_reg_seven_reg_n_0_[9] ,\debug_ro_counts_reg_seven_reg_n_0_[8] ,\debug_ro_counts_reg_seven_reg_n_0_[7] ,\debug_ro_counts_reg_seven_reg_n_0_[6] ,\debug_ro_counts_reg_seven_reg_n_0_[5] ,\debug_ro_counts_reg_seven_reg_n_0_[4] ,\debug_ro_counts_reg_seven_reg_n_0_[3] ,\debug_ro_counts_reg_seven_reg_n_0_[2] ,\debug_ro_counts_reg_seven_reg_n_0_[1] }),
        .\debug_ro_counts_reg_seven_reg[8] (\debug_ro_counts_reg_seven_reg_n_0_[16] ),
        .\debug_ro_counts_reg_seven_reg[9] (\debug_ro_counts_reg_seven_reg_n_0_[17] ),
        .\debug_ro_counts_reg_six_reg[10] (\debug_ro_counts_reg_six_reg_n_0_[18] ),
        .\debug_ro_counts_reg_six_reg[11] (\debug_ro_counts_reg_six_reg_n_0_[19] ),
        .\debug_ro_counts_reg_six_reg[12] (\debug_ro_counts_reg_six_reg_n_0_[20] ),
        .\debug_ro_counts_reg_six_reg[13] (\debug_ro_counts_reg_six_reg_n_0_[21] ),
        .\debug_ro_counts_reg_six_reg[14] (\debug_ro_counts_reg_six_reg_n_0_[22] ),
        .\debug_ro_counts_reg_six_reg[15] (\out32counter_six_reg_n_0_[0] ),
        .\debug_ro_counts_reg_six_reg[15]_0 (\out32counter_six_reg_n_0_[1] ),
        .\debug_ro_counts_reg_six_reg[15]_1 (\debug_ro_counts_reg_six_reg_n_0_[23] ),
        .\debug_ro_counts_reg_six_reg[7] ({\debug_ro_counts_reg_six_reg_n_0_[15] ,\debug_ro_counts_reg_six_reg_n_0_[14] ,\debug_ro_counts_reg_six_reg_n_0_[13] ,\debug_ro_counts_reg_six_reg_n_0_[12] ,\debug_ro_counts_reg_six_reg_n_0_[11] ,\debug_ro_counts_reg_six_reg_n_0_[10] ,\debug_ro_counts_reg_six_reg_n_0_[9] ,\debug_ro_counts_reg_six_reg_n_0_[8] }),
        .\debug_ro_counts_reg_six_reg[8] (\debug_ro_counts_reg_six_reg_n_0_[16] ),
        .\debug_ro_counts_reg_six_reg[9] (\debug_ro_counts_reg_six_reg_n_0_[17] ),
        .\debug_ro_counts_reg_three_reg[10] (\debug_ro_counts_reg_three_reg_n_0_[18] ),
        .\debug_ro_counts_reg_three_reg[11] (\debug_ro_counts_reg_three_reg_n_0_[19] ),
        .\debug_ro_counts_reg_three_reg[12] (\debug_ro_counts_reg_three_reg_n_0_[20] ),
        .\debug_ro_counts_reg_three_reg[13] (\debug_ro_counts_reg_three_reg_n_0_[21] ),
        .\debug_ro_counts_reg_three_reg[14] (\debug_ro_counts_reg_three_reg_n_0_[22] ),
        .\debug_ro_counts_reg_three_reg[15] (\out32counter_three_reg_n_0_[0] ),
        .\debug_ro_counts_reg_three_reg[15]_0 (\out32counter_three_reg_n_0_[1] ),
        .\debug_ro_counts_reg_three_reg[15]_1 (\debug_ro_counts_reg_three_reg_n_0_[23] ),
        .\debug_ro_counts_reg_three_reg[7] ({\debug_ro_counts_reg_three_reg_n_0_[15] ,\debug_ro_counts_reg_three_reg_n_0_[14] ,\debug_ro_counts_reg_three_reg_n_0_[13] ,\debug_ro_counts_reg_three_reg_n_0_[12] ,\debug_ro_counts_reg_three_reg_n_0_[11] ,\debug_ro_counts_reg_three_reg_n_0_[10] ,\debug_ro_counts_reg_three_reg_n_0_[9] ,\debug_ro_counts_reg_three_reg_n_0_[8] ,\debug_ro_counts_reg_three_reg_n_0_[7] ,\debug_ro_counts_reg_three_reg_n_0_[6] ,\debug_ro_counts_reg_three_reg_n_0_[4] }),
        .\debug_ro_counts_reg_three_reg[8] (\debug_ro_counts_reg_three_reg_n_0_[16] ),
        .\debug_ro_counts_reg_three_reg[9] (\debug_ro_counts_reg_three_reg_n_0_[17] ),
        .\debug_ro_counts_reg_two_reg[10] (\debug_ro_counts_reg_two_reg_n_0_[18] ),
        .\debug_ro_counts_reg_two_reg[11] (\debug_ro_counts_reg_two_reg_n_0_[19] ),
        .\debug_ro_counts_reg_two_reg[12] (\debug_ro_counts_reg_two_reg_n_0_[20] ),
        .\debug_ro_counts_reg_two_reg[13] (\debug_ro_counts_reg_two_reg_n_0_[21] ),
        .\debug_ro_counts_reg_two_reg[14] (\debug_ro_counts_reg_two_reg_n_0_[22] ),
        .\debug_ro_counts_reg_two_reg[15] (\out32counter_two_reg_n_0_[0] ),
        .\debug_ro_counts_reg_two_reg[15]_0 (\out32counter_two_reg_n_0_[1] ),
        .\debug_ro_counts_reg_two_reg[15]_1 (\debug_ro_counts_reg_two_reg_n_0_[23] ),
        .\debug_ro_counts_reg_two_reg[7] ({\debug_ro_counts_reg_two_reg_n_0_[15] ,\debug_ro_counts_reg_two_reg_n_0_[14] ,\debug_ro_counts_reg_two_reg_n_0_[13] ,\debug_ro_counts_reg_two_reg_n_0_[12] ,\debug_ro_counts_reg_two_reg_n_0_[11] ,\debug_ro_counts_reg_two_reg_n_0_[10] ,\debug_ro_counts_reg_two_reg_n_0_[9] ,\debug_ro_counts_reg_two_reg_n_0_[8] ,\debug_ro_counts_reg_two_reg_n_0_[7] ,\debug_ro_counts_reg_two_reg_n_0_[4] ,\debug_ro_counts_reg_two_reg_n_0_[0] }),
        .\debug_ro_counts_reg_two_reg[8] (\debug_ro_counts_reg_two_reg_n_0_[16] ),
        .\debug_ro_counts_reg_two_reg[9] (\debug_ro_counts_reg_two_reg_n_0_[17] ),
        .\debug_ro_counts_reg_zero_reg[10] (\debug_ro_counts_reg_zero_reg_n_0_[18] ),
        .\debug_ro_counts_reg_zero_reg[11] (\debug_ro_counts_reg_zero_reg_n_0_[19] ),
        .\debug_ro_counts_reg_zero_reg[12] (\debug_ro_counts_reg_zero_reg_n_0_[20] ),
        .\debug_ro_counts_reg_zero_reg[13] (\debug_ro_counts_reg_zero_reg_n_0_[21] ),
        .\debug_ro_counts_reg_zero_reg[14] (\debug_ro_counts_reg_zero_reg_n_0_[22] ),
        .\debug_ro_counts_reg_zero_reg[15] (\out32counter_zero_reg_n_0_[0] ),
        .\debug_ro_counts_reg_zero_reg[15]_0 (\out32counter_zero_reg_n_0_[1] ),
        .\debug_ro_counts_reg_zero_reg[15]_1 (\debug_ro_counts_reg_zero_reg_n_0_[23] ),
        .\debug_ro_counts_reg_zero_reg[7] ({\debug_ro_counts_reg_zero_reg_n_0_[15] ,\debug_ro_counts_reg_zero_reg_n_0_[14] ,\debug_ro_counts_reg_zero_reg_n_0_[13] ,\debug_ro_counts_reg_zero_reg_n_0_[12] ,\debug_ro_counts_reg_zero_reg_n_0_[11] ,\debug_ro_counts_reg_zero_reg_n_0_[10] ,\debug_ro_counts_reg_zero_reg_n_0_[9] ,\debug_ro_counts_reg_zero_reg_n_0_[8] }),
        .\debug_ro_counts_reg_zero_reg[8] (\debug_ro_counts_reg_zero_reg_n_0_[16] ),
        .\debug_ro_counts_reg_zero_reg[9] (\debug_ro_counts_reg_zero_reg_n_0_[17] ),
        .\debug_ro_counts_seven_reg_reg[23]_0 ({receiver_INST_n_91,receiver_INST_n_92,receiver_INST_n_93,receiver_INST_n_94,receiver_INST_n_95,receiver_INST_n_96,receiver_INST_n_97,receiver_INST_n_98,receiver_INST_n_99,receiver_INST_n_100,receiver_INST_n_101,receiver_INST_n_102,receiver_INST_n_103,receiver_INST_n_104,receiver_INST_n_105,receiver_INST_n_106}),
        .\debug_ro_counts_seven_reg_reg[31]_0 ({debug_ro_counts_seven[31:24],debug_ro_counts_seven[0]}),
        .\debug_ro_counts_six_reg_reg[23]_0 ({receiver_INST_n_219,receiver_INST_n_220,receiver_INST_n_221,receiver_INST_n_222,receiver_INST_n_223,receiver_INST_n_224,receiver_INST_n_225,receiver_INST_n_226,receiver_INST_n_227,receiver_INST_n_228,receiver_INST_n_229,receiver_INST_n_230,receiver_INST_n_231,receiver_INST_n_232,receiver_INST_n_233,receiver_INST_n_234}),
        .\debug_ro_counts_six_reg_reg[31]_0 ({debug_ro_counts_six[31:24],debug_ro_counts_six[7:0]}),
        .\debug_ro_counts_three_reg_reg[23]_0 ({receiver_INST_n_171,receiver_INST_n_172,receiver_INST_n_173,receiver_INST_n_174,receiver_INST_n_175,receiver_INST_n_176,receiver_INST_n_177,receiver_INST_n_178,receiver_INST_n_179,receiver_INST_n_180,receiver_INST_n_181,receiver_INST_n_182,receiver_INST_n_183,receiver_INST_n_184,receiver_INST_n_185,receiver_INST_n_186}),
        .\debug_ro_counts_three_reg_reg[31]_0 ({debug_ro_counts_three[31:24],debug_ro_counts_three[5],debug_ro_counts_three[3:0]}),
        .\debug_ro_counts_three_reg_reg[6]_0 (receiver_INST_n_41),
        .\debug_ro_counts_two_reg_reg[23]_0 ({receiver_INST_n_155,receiver_INST_n_156,receiver_INST_n_157,receiver_INST_n_158,receiver_INST_n_159,receiver_INST_n_160,receiver_INST_n_161,receiver_INST_n_162,receiver_INST_n_163,receiver_INST_n_164,receiver_INST_n_165,receiver_INST_n_166,receiver_INST_n_167,receiver_INST_n_168,receiver_INST_n_169,receiver_INST_n_170}),
        .\debug_ro_counts_two_reg_reg[31]_0 ({debug_ro_counts_two[31:24],debug_ro_counts_two[6:5],debug_ro_counts_two[3:1]}),
        .\debug_ro_counts_zero_reg_reg[23]_0 ({receiver_INST_n_107,receiver_INST_n_108,receiver_INST_n_109,receiver_INST_n_110,receiver_INST_n_111,receiver_INST_n_112,receiver_INST_n_113,receiver_INST_n_114,receiver_INST_n_115,receiver_INST_n_116,receiver_INST_n_117,receiver_INST_n_118,receiver_INST_n_119,receiver_INST_n_120,receiver_INST_n_121,receiver_INST_n_122}),
        .\debug_ro_counts_zero_reg_reg[31]_0 ({debug_ro_counts_zero[31:24],debug_ro_counts_zero[7:0]}),
        .\out32counter_four_reg[2] (receiver_INST_n_10),
        .\out32counter_four_reg[2]_0 (receiver_INST_n_11),
        .\out32counter_four_reg[2]_1 (receiver_INST_n_12),
        .\out32counter_four_reg[2]_2 (receiver_INST_n_13),
        .\out32counter_four_reg[2]_3 (receiver_INST_n_14),
        .\out32counter_two_reg[2] (receiver_INST_n_64),
        .\out32counter_two_reg[2]_0 (receiver_INST_n_78),
        .\out32counter_two_reg[2]_1 (receiver_INST_n_79),
        .reset_Data(reset_Data),
        .rxHasData(rxHasData),
        .rxHasData0(rxHasData0),
        .send(send_Data_reg_n_0),
        .tx_busy(tx_busy),
        .\tx_byte[0]_i_13_0 ({\state_reg_n_0_[4] ,\state_reg_n_0_[3] ,\state_reg_n_0_[2] }),
        .\tx_byte[7]_i_3_0 (\debug_ro_counts_reg_seven[15]_i_3_n_0 ),
        .\tx_byte[7]_i_3_1 (tx_uart_n_28),
        .\tx_byte[7]_i_3_2 (\tx_byte[7]_i_20_n_0 ),
        .\tx_byte[7]_i_5_0 (\out32counter_five_reg_n_0_[2] ),
        .\tx_byte[7]_i_6 (\out32counter_two_reg_n_0_[2] ),
        .\tx_byte[7]_i_6_0 (tx_uart_n_31),
        .\tx_byte_reg[0] (tx_uart_n_27),
        .\tx_byte_reg[0]_0 (tx_uart_n_26),
        .\tx_byte_reg[0]_1 (\out32counter_three[2]_i_5_n_0 ),
        .\tx_byte_reg[2] (\debug_ro_counts_reg_one[15]_i_3_n_0 ),
        .\tx_byte_reg[2]_0 (\tx_byte[7]_i_10_n_0 ),
        .\tx_byte_reg[2]_1 (tx_uart_n_32),
        .\tx_byte_reg[4] (tx_uart_n_36),
        .\tx_byte_reg[4]_0 (tx_uart_n_11),
        .\tx_byte_reg[4]_1 (\tx_byte[7]_i_16_n_0 ),
        .\tx_byte_reg[4]_2 (tx_uart_n_29),
        .\tx_byte_reg[7] (tx_uart_n_35),
        .\tx_byte_reg[7]_0 (tx_uart_n_12),
        .\tx_byte_reg[7]_1 (\out32counter_four_reg_n_0_[2] ),
        .\tx_byte_reg[7]_2 (\debug_ro_counts_reg_zero[15]_i_3_n_0 ),
        .\tx_byte_reg[7]_3 (tx_uart_n_45),
        .\tx_byte_reg[7]_4 (\tx_byte[7]_i_13_n_0 ),
        .tx_wire_debug(tx_wire_debug));
  LUT6 #(
    .INIT(64'hFFFF004000000040)) 
    reset_Data_i_1
       (.I0(\state_reg_n_0_[0] ),
        .I1(reset_Data_i_2_n_0),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[4] ),
        .I4(rst),
        .I5(reset_Data),
        .O(reset_Data_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    reset_Data_i_2
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[2] ),
        .O(reset_Data_i_2_n_0));
  FDRE reset_Data_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(reset_Data_i_1_n_0),
        .Q(reset_Data),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h4444444444445444)) 
    \return_state[4]_i_1 
       (.I0(rst),
        .I1(\return_state[4]_i_2_n_0 ),
        .I2(\return_state[4]_i_3_n_0 ),
        .I3(\return_state[4]_i_4_n_0 ),
        .I4(\state_reg_n_0_[3] ),
        .I5(\state_reg_n_0_[2] ),
        .O(\return_state[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \return_state[4]_i_2 
       (.I0(\state_reg_n_0_[4] ),
        .I1(\state[0]_i_3__0_n_0 ),
        .O(\return_state[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \return_state[4]_i_3 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .O(\return_state[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \return_state[4]_i_4 
       (.I0(\state_reg_n_0_[4] ),
        .I1(\out32counter_seven_reg_n_0_[2] ),
        .O(\return_state[4]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \return_state_reg[0] 
       (.C(clk_BUFG),
        .CE(\return_state[4]_i_1_n_0 ),
        .D(\state_reg_n_0_[0] ),
        .Q(\return_state_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \return_state_reg[1] 
       (.C(clk_BUFG),
        .CE(\return_state[4]_i_1_n_0 ),
        .D(\state_reg_n_0_[1] ),
        .Q(\return_state_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \return_state_reg[2] 
       (.C(clk_BUFG),
        .CE(\return_state[4]_i_1_n_0 ),
        .D(\state_reg_n_0_[2] ),
        .Q(\return_state_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \return_state_reg[3] 
       (.C(clk_BUFG),
        .CE(\return_state[4]_i_1_n_0 ),
        .D(\state_reg_n_0_[3] ),
        .Q(\return_state_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \return_state_reg[4] 
       (.C(clk_BUFG),
        .CE(\return_state[4]_i_1_n_0 ),
        .D(\state_reg_n_0_[4] ),
        .Q(\return_state_reg_n_0_[4] ),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    rst_i_1
       (.I0(rst_init_counter_reg[3]),
        .I1(rst_init_counter_reg[2]),
        .O(rst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rst_init_counter[0]_i_1 
       (.I0(\rst_init_counter_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rst_init_counter[1]_i_1 
       (.I0(\rst_init_counter_reg_n_0_[0] ),
        .I1(\rst_init_counter_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rst_init_counter[2]_i_1 
       (.I0(rst_init_counter_reg[2]),
        .I1(\rst_init_counter_reg_n_0_[1] ),
        .I2(\rst_init_counter_reg_n_0_[0] ),
        .O(p_0_in[2]));
  LUT2 #(
    .INIT(4'h7)) 
    \rst_init_counter[3]_i_1 
       (.I0(rst_init_counter_reg[3]),
        .I1(rst_init_counter_reg[2]),
        .O(sel));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rst_init_counter[3]_i_2 
       (.I0(rst_init_counter_reg[3]),
        .I1(\rst_init_counter_reg_n_0_[0] ),
        .I2(\rst_init_counter_reg_n_0_[1] ),
        .I3(rst_init_counter_reg[2]),
        .O(p_0_in[3]));
  FDRE #(
    .INIT(1'b0)) 
    \rst_init_counter_reg[0] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(p_0_in[0]),
        .Q(\rst_init_counter_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rst_init_counter_reg[1] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(p_0_in[1]),
        .Q(\rst_init_counter_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rst_init_counter_reg[2] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(p_0_in[2]),
        .Q(rst_init_counter_reg[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rst_init_counter_reg[3] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(p_0_in[3]),
        .Q(rst_init_counter_reg[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    rst_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(rst_i_1_n_0),
        .Q(rst),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    rxHasData_reg
       (.C(clk_BUFG),
        .CE(receiver_INST_n_80),
        .D(rxHasData0),
        .Q(rxHasData),
        .R(rst));
  rxuart rx_uart
       (.D({rx_uart_n_37,rx_uart_n_38,rx_uart_n_39,rx_uart_n_40}),
        .E(input_Data),
        .Q({\state_reg_n_0_[4] ,\state_reg_n_0_[3] ,\state_reg_n_0_[2] ,\state_reg_n_0_[1] ,\state_reg_n_0_[0] }),
        .clk_BUFG(clk_BUFG),
        .\in32counter_one_reg[0] (rx_uart_n_1),
        .\in32counter_one_reg[1] (rx_uart_n_0),
        .\in32counter_one_reg[2] (rx_uart_n_2),
        .\in32counter_one_reg[2]_0 ({rx_uart_n_43,rx_uart_n_44}),
        .\in32counter_one_reg[2]_1 (\in32counter_one_reg_n_0_[1] ),
        .\in32counter_one_reg[2]_2 (\in32counter_one_reg_n_0_[0] ),
        .\in32counter_one_reg[2]_3 (\in32counter_one_reg_n_0_[2] ),
        .\in32counter_one_reg[2]_4 (\in32counter_one[2]_i_2_n_0 ),
        .\in32counter_two_reg[0] (rx_uart_n_4),
        .\in32counter_two_reg[1] (rx_uart_n_3),
        .\in32counter_two_reg[2] (rx_uart_n_5),
        .\in32counter_two_reg[2]_0 ({rx_uart_n_45,rx_uart_n_46}),
        .\in32counter_two_reg[2]_1 (\in32counter_two_reg_n_0_[1] ),
        .\in32counter_two_reg[2]_2 (\in32counter_two_reg_n_0_[0] ),
        .\in32counter_two_reg[2]_3 (\in32counter_two_reg_n_0_[2] ),
        .\in32counter_two_reg[2]_4 (\in32counter_two[2]_i_2_n_0 ),
        .\input_Data_reg[0] (\debug_ro_counts_reg_two[15]_i_3_n_0 ),
        .\o_data_reg[0]_0 (rx_uart_n_36),
        .\o_data_reg[2]_0 (rx_uart_n_27),
        .\o_data_reg[7]_0 (rx_byte),
        .\out32counter_five_reg[0] (rx_uart_n_15),
        .\out32counter_five_reg[0]_0 (\out32counter_five[2]_i_4_n_0 ),
        .\out32counter_five_reg[2] (rx_uart_n_16),
        .\out32counter_five_reg[2]_0 (\out32counter_five_reg_n_0_[0] ),
        .\out32counter_five_reg[2]_1 (\out32counter_five_reg_n_0_[1] ),
        .\out32counter_five_reg[2]_2 (\out32counter_five_reg_n_0_[2] ),
        .\out32counter_four_reg[0] (rx_uart_n_12),
        .\out32counter_four_reg[0]_0 (\out32counter_four[2]_i_4_n_0 ),
        .\out32counter_four_reg[2] (rx_uart_n_13),
        .\out32counter_four_reg[2]_0 (\out32counter_four_reg_n_0_[0] ),
        .\out32counter_four_reg[2]_1 (\out32counter_four_reg_n_0_[1] ),
        .\out32counter_four_reg[2]_2 (\out32counter_four_reg_n_0_[2] ),
        .\out32counter_one_reg[0] (rx_uart_n_6),
        .\out32counter_one_reg[2] (rx_uart_n_7),
        .\out32counter_one_reg[2]_0 (\out32counter_one_reg_n_0_[0] ),
        .\out32counter_one_reg[2]_1 (\out32counter_one_reg_n_0_[1] ),
        .\out32counter_one_reg[2]_2 (\out32counter_one_reg_n_0_[2] ),
        .\out32counter_seven_reg[0] (\out32counter_seven[2]_i_4_n_0 ),
        .\out32counter_seven_reg[2] (rx_uart_n_23),
        .\out32counter_seven_reg[2]_0 (\out32counter_seven_reg_n_0_[0] ),
        .\out32counter_seven_reg[2]_1 (\out32counter_seven_reg_n_0_[1] ),
        .\out32counter_seven_reg[2]_2 (\out32counter_seven_reg_n_0_[2] ),
        .\out32counter_six_reg[0] (rx_uart_n_18),
        .\out32counter_six_reg[2] (rx_uart_n_19),
        .\out32counter_six_reg[2]_0 (\out32counter_six_reg_n_0_[0] ),
        .\out32counter_six_reg[2]_1 (\out32counter_six_reg_n_0_[1] ),
        .\out32counter_six_reg[2]_2 (\out32counter_six_reg_n_0_[2] ),
        .\out32counter_three_reg[0] (\out32counter_three[2]_i_5_n_0 ),
        .\out32counter_three_reg[0]_0 (\debug_ro_counts_reg_three[15]_i_3_n_0 ),
        .\out32counter_three_reg[2] (rx_uart_n_11),
        .\out32counter_three_reg[2]_0 (\out32counter_three_reg_n_0_[0] ),
        .\out32counter_three_reg[2]_1 (\out32counter_three_reg_n_0_[1] ),
        .\out32counter_three_reg[2]_2 (\out32counter_three_reg_n_0_[2] ),
        .\out32counter_zero_reg[0] (rx_uart_n_24),
        .\out32counter_zero_reg[0]_0 (tx_uart_n_23),
        .\out32counter_zero_reg[2] (rx_uart_n_25),
        .\out32counter_zero_reg[2]_0 (\out32counter_zero_reg_n_0_[0] ),
        .\out32counter_zero_reg[2]_1 (\out32counter_zero_reg_n_0_[1] ),
        .\out32counter_zero_reg[2]_2 (\out32counter_zero_reg_n_0_[2] ),
        .rst(rst),
        .rst_reg(rx_uart_n_42),
        .\state_reg[0]_0 (\state[4]_i_6_n_0 ),
        .\state_reg[0]_1 (\state[0]_i_2__0_n_0 ),
        .\state_reg[0]_2 (\state[0]_i_3__0_n_0 ),
        .\state_reg[0]_3 (tx_uart_n_16),
        .\state_reg[1]_0 (tx_uart_n_22),
        .\state_reg[1]_1 (tx_uart_n_15),
        .\state_reg[2]_0 (tx_uart_n_17),
        .\state_reg[3]_0 (rx_uart_n_8),
        .\state_reg[3]_1 (rx_uart_n_9),
        .\state_reg[3]_2 (rx_uart_n_10),
        .\state_reg[3]_3 (rx_uart_n_14),
        .\state_reg[3]_4 (rx_uart_n_17),
        .\state_reg[3]_5 (rx_uart_n_20),
        .\state_reg[3]_6 (rx_uart_n_26),
        .\state_reg[4] (rx_uart_n_21),
        .\state_reg[4]_0 (rx_uart_n_22),
        .\state_reg[4]_1 ({\return_state_reg_n_0_[4] ,\return_state_reg_n_0_[2] ,\return_state_reg_n_0_[1] ,\return_state_reg_n_0_[0] }),
        .\state_reg[4]_2 (\state[4]_i_5_n_0 ),
        .\state_reg[4]_3 (tx_uart_n_21),
        .\state_reg[4]_4 (\return_state[4]_i_2_n_0 ),
        .tx_busy(tx_busy),
        .uart_rx_IBUF(uart_rx_IBUF));
  LUT6 #(
    .INIT(64'hFFFF001000000010)) 
    send_Data_i_1
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\tx_byte[6]_i_3_n_0 ),
        .I3(\state_reg_n_0_[4] ),
        .I4(rst),
        .I5(send_Data_reg_n_0),
        .O(send_Data_i_1_n_0));
  FDRE send_Data_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(send_Data_i_1_n_0),
        .Q(send_Data_reg_n_0),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \state[0]_i_2__0 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[4] ),
        .I3(\out32counter_seven_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[3] ),
        .I5(\state_reg_n_0_[2] ),
        .O(\state[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT4 #(
    .INIT(16'hE2FF)) 
    \state[0]_i_3__0 
       (.I0(\state[0]_i_5_n_0 ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state[0]_i_6_n_0 ),
        .I3(\state_reg_n_0_[3] ),
        .O(\state[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT5 #(
    .INIT(32'hF0CCAAFF)) 
    \state[0]_i_5 
       (.I0(\out32counter_zero_reg_n_0_[2] ),
        .I1(\out32counter_one_reg_n_0_[2] ),
        .I2(\out32counter_two_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .O(\state[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \state[0]_i_6 
       (.I0(\out32counter_six_reg_n_0_[2] ),
        .I1(\out32counter_five_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\out32counter_four_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\out32counter_three_reg_n_0_[2] ),
        .O(\state[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state[2]_i_6 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .O(\state[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \state[4]_i_5 
       (.I0(\state_reg_n_0_[4] ),
        .I1(\state_reg_n_0_[3] ),
        .O(\state[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT5 #(
    .INIT(32'hFFFFFFBF)) 
    \state[4]_i_6 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[4] ),
        .I3(\state_reg_n_0_[3] ),
        .I4(\state_reg_n_0_[2] ),
        .O(\state[4]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_42),
        .D(rx_uart_n_40),
        .Q(\state_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_42),
        .D(rx_uart_n_39),
        .Q(\state_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_42),
        .D(rx_uart_n_38),
        .Q(\state_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_42),
        .D(tx_uart_n_4),
        .Q(\state_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[4] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_42),
        .D(rx_uart_n_37),
        .Q(\state_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[0] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[0]),
        .Q(\threshold_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[10] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[2] ),
        .Q(\threshold_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[11] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[3] ),
        .Q(\threshold_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[12] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[4] ),
        .Q(\threshold_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[13] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[5] ),
        .Q(\threshold_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[14] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[6] ),
        .Q(\threshold_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[15] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[7] ),
        .Q(\threshold_reg_n_0_[15] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[16] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[8] ),
        .Q(\threshold_reg_n_0_[16] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[17] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[9] ),
        .Q(\threshold_reg_n_0_[17] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[18] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[10] ),
        .Q(\threshold_reg_n_0_[18] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[19] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[11] ),
        .Q(\threshold_reg_n_0_[19] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[1] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[1]),
        .Q(\threshold_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[20] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[12] ),
        .Q(\threshold_reg_n_0_[20] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[21] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[13] ),
        .Q(\threshold_reg_n_0_[21] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[22] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[14] ),
        .Q(\threshold_reg_n_0_[22] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[23] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[15] ),
        .Q(\threshold_reg_n_0_[23] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[24] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[16] ),
        .Q(\threshold_reg_n_0_[24] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[25] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[17] ),
        .Q(\threshold_reg_n_0_[25] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[26] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[18] ),
        .Q(\threshold_reg_n_0_[26] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[27] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[19] ),
        .Q(\threshold_reg_n_0_[27] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[28] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[20] ),
        .Q(\threshold_reg_n_0_[28] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[29] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[21] ),
        .Q(\threshold_reg_n_0_[29] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[2] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[2]),
        .Q(\threshold_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[30] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[22] ),
        .Q(\threshold_reg_n_0_[30] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[31] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[23] ),
        .Q(\threshold_reg_n_0_[31] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[3] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[3]),
        .Q(\threshold_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[4] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[4]),
        .Q(\threshold_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[5] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[5]),
        .Q(\threshold_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[6] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[6]),
        .Q(\threshold_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[7] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_46),
        .D(rx_byte[7]),
        .Q(\threshold_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[8] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[0] ),
        .Q(\threshold_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \threshold_reg[9] 
       (.C(clk_BUFG),
        .CE(rx_uart_n_45),
        .D(\threshold_reg_n_0_[1] ),
        .Q(\threshold_reg_n_0_[9] ),
        .R(\<const0> ));
  (* BIT_SIZE = "8" *) 
  (* COOLDOWN = "3'b101" *) 
  (* COOLDOWN_CYCLES = "10000000" *) 
  (* DELAY = "3'b010" *) 
  (* DONT_TOUCH *) 
  (* FINISH = "3'b011" *) 
  (* IDLE = "3'b000" *) 
  (* LOCAL_SIM_SYN_SWITCH = "1" *) 
  (* SEND_BIT = "3'b001" *) 
  (* WAIT_RETURN = "3'b100" *) 
  transmitter transmitter_INST
       (.clock(clk_BUFG),
        .clock_per_bit({\clock_per_bit_reg_n_0_[31] ,\clock_per_bit_reg_n_0_[30] ,\clock_per_bit_reg_n_0_[29] ,\clock_per_bit_reg_n_0_[28] ,\clock_per_bit_reg_n_0_[27] ,\clock_per_bit_reg_n_0_[26] ,\clock_per_bit_reg_n_0_[25] ,\clock_per_bit_reg_n_0_[24] ,p_0_out}),
        .data({\input_Data_reg_n_0_[7] ,\input_Data_reg_n_0_[6] ,\input_Data_reg_n_0_[5] ,\input_Data_reg_n_0_[4] ,\input_Data_reg_n_0_[3] ,\input_Data_reg_n_0_[2] ,\input_Data_reg_n_0_[1] ,\input_Data_reg_n_0_[0] }),
        .reset(reset_Data),
        .send(send_Data_reg_n_0),
        .tx_wire_debug(tx_wire_debug));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \tx_byte[0]_i_5 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\tx_byte[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \tx_byte[5]_i_12 
       (.I0(\out32counter_three_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[4] ),
        .O(\tx_byte[5]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tx_byte[6]_i_3 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .O(\tx_byte[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tx_byte[6]_i_8 
       (.I0(\out32counter_two_reg_n_0_[1] ),
        .I1(\out32counter_two_reg_n_0_[0] ),
        .O(\tx_byte[6]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tx_byte[7]_i_10 
       (.I0(\out32counter_one_reg_n_0_[1] ),
        .I1(\out32counter_one_reg_n_0_[0] ),
        .O(\tx_byte[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tx_byte[7]_i_13 
       (.I0(\out32counter_four_reg_n_0_[1] ),
        .I1(\out32counter_four_reg_n_0_[0] ),
        .O(\tx_byte[7]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tx_byte[7]_i_16 
       (.I0(\out32counter_three_reg_n_0_[1] ),
        .I1(\out32counter_three_reg_n_0_[0] ),
        .O(\tx_byte[7]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tx_byte[7]_i_20 
       (.I0(\out32counter_seven_reg_n_0_[1] ),
        .I1(\out32counter_seven_reg_n_0_[0] ),
        .O(\tx_byte[7]_i_20_n_0 ));
  FDRE \tx_byte_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[0]),
        .Q(\tx_byte_reg_n_0_[0] ),
        .R(rst));
  FDRE \tx_byte_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[1]),
        .Q(\tx_byte_reg_n_0_[1] ),
        .R(rst));
  FDRE \tx_byte_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[2]),
        .Q(\tx_byte_reg_n_0_[2] ),
        .R(rst));
  FDRE \tx_byte_reg[3] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[3]),
        .Q(\tx_byte_reg_n_0_[3] ),
        .R(rst));
  FDRE \tx_byte_reg[4] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[4]),
        .Q(\tx_byte_reg_n_0_[4] ),
        .R(rst));
  FDRE \tx_byte_reg[5] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[5]),
        .Q(\tx_byte_reg_n_0_[5] ),
        .R(rst));
  FDRE \tx_byte_reg[6] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[6]),
        .Q(\tx_byte_reg_n_0_[6] ),
        .R(rst));
  FDRE \tx_byte_reg[7] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_byte[7]),
        .Q(\tx_byte_reg_n_0_[7] ),
        .R(rst));
  txuart tx_uart
       (.D(tx_uart_n_4),
        .E(tx_uart_n_43),
        .Q({\state_reg_n_0_[4] ,\state_reg_n_0_[3] ,\state_reg_n_0_[2] ,\state_reg_n_0_[1] ,\state_reg_n_0_[0] }),
        .beenReadFlag(beenReadFlag),
        .clk_BUFG(clk_BUFG),
        .debug_ro_counts_reg_five(debug_ro_counts_reg_five),
        .\debug_ro_counts_reg_five_reg[16] (\debug_ro_counts_reg_five[15]_i_3_n_0 ),
        .\debug_ro_counts_reg_five_reg[23] (\out32counter_five_reg_n_0_[2] ),
        .\debug_ro_counts_reg_five_reg[23]_0 (\out32counter_five_reg_n_0_[0] ),
        .\debug_ro_counts_reg_five_reg[23]_1 (\out32counter_five_reg_n_0_[1] ),
        .debug_ro_counts_reg_four(debug_ro_counts_reg_four),
        .\debug_ro_counts_reg_four_reg[23] (\out32counter_four_reg_n_0_[2] ),
        .\debug_ro_counts_reg_four_reg[23]_0 (\out32counter_four_reg_n_0_[1] ),
        .\debug_ro_counts_reg_four_reg[23]_1 (\out32counter_four_reg_n_0_[0] ),
        .debug_ro_counts_reg_one(debug_ro_counts_reg_one),
        .\debug_ro_counts_reg_one_reg[16] (\debug_ro_counts_reg_one[15]_i_3_n_0 ),
        .\debug_ro_counts_reg_one_reg[23] (\out32counter_one_reg_n_0_[2] ),
        .\debug_ro_counts_reg_one_reg[23]_0 (\out32counter_one_reg_n_0_[1] ),
        .\debug_ro_counts_reg_one_reg[23]_1 (\out32counter_one_reg_n_0_[0] ),
        .\debug_ro_counts_reg_seven_reg[15] (\debug_ro_counts_reg_seven[15]_i_3_n_0 ),
        .\debug_ro_counts_reg_seven_reg[23] (\out32counter_seven_reg_n_0_[2] ),
        .\debug_ro_counts_reg_seven_reg[23]_0 (\out32counter_seven_reg_n_0_[1] ),
        .\debug_ro_counts_reg_seven_reg[23]_1 (\out32counter_seven_reg_n_0_[0] ),
        .debug_ro_counts_reg_six(debug_ro_counts_reg_six),
        .\debug_ro_counts_reg_six_reg[16] (\debug_ro_counts_reg_six[15]_i_3_n_0 ),
        .\debug_ro_counts_reg_six_reg[23] (\out32counter_six_reg_n_0_[2] ),
        .\debug_ro_counts_reg_six_reg[23]_0 (\out32counter_six_reg_n_0_[0] ),
        .\debug_ro_counts_reg_six_reg[23]_1 (\out32counter_six_reg_n_0_[1] ),
        .debug_ro_counts_reg_three(debug_ro_counts_reg_three),
        .\debug_ro_counts_reg_three_reg[16] (\debug_ro_counts_reg_three[15]_i_3_n_0 ),
        .\debug_ro_counts_reg_three_reg[23] (\out32counter_three_reg_n_0_[0] ),
        .\debug_ro_counts_reg_three_reg[23]_0 (\out32counter_three_reg_n_0_[1] ),
        .\debug_ro_counts_reg_three_reg[23]_1 (\out32counter_three_reg_n_0_[2] ),
        .debug_ro_counts_reg_two(debug_ro_counts_reg_two),
        .\debug_ro_counts_reg_two_reg[16] (\debug_ro_counts_reg_two[15]_i_3_n_0 ),
        .debug_ro_counts_reg_zero(debug_ro_counts_reg_zero),
        .\debug_ro_counts_reg_zero_reg[23] (\out32counter_zero_reg_n_0_[2] ),
        .\debug_ro_counts_reg_zero_reg[23]_0 (\out32counter_zero_reg_n_0_[0] ),
        .\debug_ro_counts_reg_zero_reg[23]_1 (\out32counter_zero_reg_n_0_[1] ),
        .\debug_ro_counts_zero_reg_reg[4] (tx_uart_n_36),
        .\debug_ro_counts_zero_reg_reg[7] (tx_uart_n_35),
        .\in32counter_one_reg[2] (tx_uart_n_17),
        .\lcl_data_reg[7]_0 ({\tx_byte_reg_n_0_[7] ,\tx_byte_reg_n_0_[6] ,\tx_byte_reg_n_0_[5] ,\tx_byte_reg_n_0_[4] ,\tx_byte_reg_n_0_[3] ,\tx_byte_reg_n_0_[2] ,\tx_byte_reg_n_0_[1] ,\tx_byte_reg_n_0_[0] }),
        .o_uart_tx_reg_0(uart_tx_OBUF),
        .o_uart_tx_reg_1(tx_valid_reg_n_0),
        .\out32counter_five_reg[2] (tx_uart_n_26),
        .\out32counter_five_reg[2]_0 (tx_uart_n_27),
        .\out32counter_five_reg[2]_1 (tx_uart_n_41),
        .\out32counter_four_reg[2] (tx_uart_n_37),
        .\out32counter_one_reg[2] (tx_uart_n_40),
        .\out32counter_seven_reg[2] (tx_uart_n_21),
        .\out32counter_seven_reg[2]_0 (tx_uart_n_42),
        .\out32counter_six_reg[2] (tx_uart_n_39),
        .\out32counter_three_reg[2] (tx_uart_n_44),
        .\out32counter_two_reg[0] (tx_uart_n_1),
        .\out32counter_two_reg[0]_0 (\out32counter_two[2]_i_3_n_0 ),
        .\out32counter_two_reg[0]_1 (rx_uart_n_36),
        .\out32counter_two_reg[2] (tx_uart_n_2),
        .\out32counter_two_reg[2]_0 (tx_uart_n_34),
        .\out32counter_two_reg[2]_1 (\out32counter_two_reg_n_0_[0] ),
        .\out32counter_two_reg[2]_2 (\out32counter_two_reg_n_0_[1] ),
        .\out32counter_two_reg[2]_3 (\out32counter_two_reg_n_0_[2] ),
        .\out32counter_zero_reg[2] (tx_uart_n_38),
        .\phantom_output_data_reg[4] (tx_uart_n_11),
        .\phantom_output_data_reg[7] (tx_uart_n_12),
        .r_busy_reg_0(tx_uart_n_15),
        .r_busy_reg_1(tx_uart_n_16),
        .r_busy_reg_2(tx_uart_n_29),
        .r_busy_reg_3(tx_uart_n_32),
        .r_busy_reg_4(tx_uart_n_45),
        .rst(rst),
        .rxHasData(rxHasData),
        .\state_reg[1]_0 (tx_uart_n_23),
        .\state_reg[1]_1 (tx_uart_n_28),
        .\state_reg[1]_2 (tx_uart_n_33),
        .\state_reg[2]_0 ({tx_byte[6:5],tx_byte[3:0]}),
        .\state_reg[2]_1 (tx_uart_n_31),
        .\state_reg[2]_2 (\in32counter_two_reg_n_0_[2] ),
        .\state_reg[2]_3 (\in32counter_one_reg_n_0_[2] ),
        .\state_reg[2]_4 (\state[2]_i_6_n_0 ),
        .\state_reg[3]_0 (tx_uart_n_3),
        .\state_reg[3]_1 (\state[4]_i_6_n_0 ),
        .\state_reg[3]_2 (\return_state_reg_n_0_[3] ),
        .\state_reg[3]_3 (rx_uart_n_27),
        .\state_reg[4] (tx_uart_n_22),
        .\state_reg[4]_0 (reset_Data_i_2_n_0),
        .tx_busy(tx_busy),
        .\tx_byte[0]_i_4_0 (debug_ro_counts_seven[0]),
        .\tx_byte[0]_i_4_1 (\debug_ro_counts_reg_seven_reg_n_0_[0] ),
        .\tx_byte[5]_i_4_0 ({\debug_ro_counts_reg_three_reg_n_0_[5] ,\debug_ro_counts_reg_three_reg_n_0_[3] ,\debug_ro_counts_reg_three_reg_n_0_[2] ,\debug_ro_counts_reg_three_reg_n_0_[1] ,\debug_ro_counts_reg_three_reg_n_0_[0] }),
        .\tx_byte[5]_i_4_1 (\tx_byte[5]_i_12_n_0 ),
        .\tx_byte[5]_i_4_2 ({debug_ro_counts_three[5],debug_ro_counts_three[3:0]}),
        .\tx_byte[7]_i_6_0 ({\debug_ro_counts_reg_six_reg_n_0_[7] ,\debug_ro_counts_reg_six_reg_n_0_[6] ,\debug_ro_counts_reg_six_reg_n_0_[5] ,\debug_ro_counts_reg_six_reg_n_0_[4] ,\debug_ro_counts_reg_six_reg_n_0_[3] ,\debug_ro_counts_reg_six_reg_n_0_[2] ,\debug_ro_counts_reg_six_reg_n_0_[1] ,\debug_ro_counts_reg_six_reg_n_0_[0] }),
        .\tx_byte[7]_i_6_1 (debug_ro_counts_six[7:0]),
        .\tx_byte_reg[0] (\debug_ro_counts_reg_zero[15]_i_3_n_0 ),
        .\tx_byte_reg[0]_0 (\tx_byte[0]_i_5_n_0 ),
        .\tx_byte_reg[0]_1 (receiver_INST_n_51),
        .\tx_byte_reg[0]_2 (receiver_INST_n_64),
        .\tx_byte_reg[0]_3 (\out32counter_three[2]_i_5_n_0 ),
        .\tx_byte_reg[0]_4 (receiver_INST_n_90),
        .\tx_byte_reg[1] (\tx_byte[6]_i_3_n_0 ),
        .\tx_byte_reg[1]_0 (receiver_INST_n_14),
        .\tx_byte_reg[1]_1 (receiver_INST_n_15),
        .\tx_byte_reg[2] (receiver_INST_n_24),
        .\tx_byte_reg[2]_0 (receiver_INST_n_13),
        .\tx_byte_reg[3] (receiver_INST_n_25),
        .\tx_byte_reg[3]_0 (receiver_INST_n_12),
        .\tx_byte_reg[4] (receiver_INST_n_78),
        .\tx_byte_reg[5] (receiver_INST_n_11),
        .\tx_byte_reg[5]_0 (receiver_INST_n_39),
        .\tx_byte_reg[5]_1 ({debug_ro_counts_five[5],debug_ro_counts_five[3:1]}),
        .\tx_byte_reg[5]_2 ({\debug_ro_counts_reg_five_reg_n_0_[5] ,\debug_ro_counts_reg_five_reg_n_0_[3] ,\debug_ro_counts_reg_five_reg_n_0_[2] ,\debug_ro_counts_reg_five_reg_n_0_[1] }),
        .\tx_byte_reg[5]_3 (\tx_byte[6]_i_8_n_0 ),
        .\tx_byte_reg[6] (receiver_INST_n_41),
        .\tx_byte_reg[6]_0 (receiver_INST_n_10),
        .\tx_byte_reg[6]_1 (receiver_INST_n_40),
        .\tx_byte_reg[6]_2 ({\debug_ro_counts_reg_two_reg_n_0_[6] ,\debug_ro_counts_reg_two_reg_n_0_[5] ,\debug_ro_counts_reg_two_reg_n_0_[3] ,\debug_ro_counts_reg_two_reg_n_0_[2] ,\debug_ro_counts_reg_two_reg_n_0_[1] }),
        .\tx_byte_reg[6]_3 ({debug_ro_counts_two[6:5],debug_ro_counts_two[3:1]}),
        .\tx_byte_reg[7] (phantom_output_data),
        .\tx_byte_reg[7]_0 (receiver_INST_n_79),
        .\tx_byte_reg[7]_1 ({\debug_ro_counts_reg_zero_reg_n_0_[7] ,\debug_ro_counts_reg_zero_reg_n_0_[6] ,\debug_ro_counts_reg_zero_reg_n_0_[5] ,\debug_ro_counts_reg_zero_reg_n_0_[4] ,\debug_ro_counts_reg_zero_reg_n_0_[3] ,\debug_ro_counts_reg_zero_reg_n_0_[2] ,\debug_ro_counts_reg_zero_reg_n_0_[1] ,\debug_ro_counts_reg_zero_reg_n_0_[0] }),
        .\tx_byte_reg[7]_2 (debug_ro_counts_zero[7:0]),
        .tx_valid(tx_valid));
  FDRE tx_valid_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(tx_valid),
        .Q(tx_valid_reg_n_0),
        .R(rst));
  IBUF uart_rx_IBUF_inst
       (.I(uart_rx),
        .O(uart_rx_IBUF));
  OBUF uart_tx_OBUF_inst
       (.I(uart_tx_OBUF),
        .O(uart_tx));
endmodule

module receiver
   (D,
    \debug_ro_counts_four_reg_reg[31]_0 ,
    \out32counter_four_reg[2] ,
    \out32counter_four_reg[2]_0 ,
    \out32counter_four_reg[2]_1 ,
    \out32counter_four_reg[2]_2 ,
    \out32counter_four_reg[2]_3 ,
    \debug_ro_counts_one_reg_reg[1]_0 ,
    \debug_ro_counts_one_reg_reg[31]_0 ,
    \debug_ro_counts_one_reg_reg[2]_0 ,
    \debug_ro_counts_reg_one_reg[3] ,
    \debug_ro_counts_three_reg_reg[31]_0 ,
    \debug_ro_counts_one_reg_reg[5]_0 ,
    \debug_ro_counts_one_reg_reg[6]_0 ,
    \debug_ro_counts_three_reg_reg[6]_0 ,
    \debug_ro_counts_seven_reg_reg[31]_0 ,
    \debug_ro_counts_reg_five_reg[0] ,
    \debug_ro_counts_five_reg_reg[31]_0 ,
    \out32counter_two_reg[2] ,
    \debug_ro_counts_two_reg_reg[31]_0 ,
    \out32counter_two_reg[2]_0 ,
    \out32counter_two_reg[2]_1 ,
    E,
    \data_reg_reg[7]_0 ,
    rxHasData0,
    \debug_ro_counts_four_reg_reg[0]_0 ,
    \debug_ro_counts_seven_reg_reg[23]_0 ,
    \debug_ro_counts_zero_reg_reg[23]_0 ,
    \debug_ro_counts_zero_reg_reg[31]_0 ,
    \debug_ro_counts_one_reg_reg[23]_0 ,
    \debug_ro_counts_two_reg_reg[23]_0 ,
    \debug_ro_counts_three_reg_reg[23]_0 ,
    \debug_ro_counts_four_reg_reg[23]_0 ,
    \debug_ro_counts_five_reg_reg[23]_0 ,
    \debug_ro_counts_six_reg_reg[23]_0 ,
    \debug_ro_counts_six_reg_reg[31]_0 ,
    reset_Data,
    clk_BUFG,
    send,
    Q,
    data_reg1_carry__2_0,
    \tx_byte_reg[4] ,
    \tx_byte[0]_i_13_0 ,
    \tx_byte_reg[4]_0 ,
    \tx_byte_reg[7] ,
    \tx_byte_reg[7]_0 ,
    \tx_byte_reg[7]_1 ,
    \tx_byte_reg[7]_2 ,
    \tx_byte_reg[7]_3 ,
    \tx_byte_reg[7]_4 ,
    \debug_ro_counts_reg_four_reg[7] ,
    \tx_byte_reg[2] ,
    \tx_byte_reg[2]_0 ,
    \tx_byte_reg[2]_1 ,
    \debug_ro_counts_reg_one_reg[7] ,
    \tx_byte_reg[4]_1 ,
    \debug_ro_counts_reg_three_reg[7] ,
    \tx_byte_reg[4]_2 ,
    \debug_ro_counts_reg_seven_reg[0] ,
    \tx_byte[7]_i_3_0 ,
    \tx_byte[7]_i_3_1 ,
    \debug_ro_counts_reg_seven_reg[7] ,
    \tx_byte[7]_i_3_2 ,
    \debug_ro_counts_reg_five_reg[7] ,
    \tx_byte_reg[0] ,
    \tx_byte_reg[0]_0 ,
    \tx_byte_reg[0]_1 ,
    \tx_byte[7]_i_6 ,
    \debug_ro_counts_reg_two_reg[7] ,
    \debug_ro_counts_reg_two_reg[15] ,
    \debug_ro_counts_reg_two_reg[15]_0 ,
    \tx_byte[7]_i_6_0 ,
    beenReadFlag,
    rxHasData,
    tx_wire_debug,
    tx_busy,
    \tx_byte[7]_i_5_0 ,
    \debug_ro_counts_reg_five_reg[15] ,
    \debug_ro_counts_reg_five_reg[15]_0 ,
    \debug_ro_counts_reg_four_reg[15] ,
    \debug_ro_counts_reg_four_reg[15]_0 ,
    \debug_ro_counts_reg_seven_reg[0]_0 ,
    \debug_ro_counts_reg_seven_reg[0]_1 ,
    \debug_ro_counts_reg_seven_reg[8] ,
    \debug_ro_counts_reg_seven_reg[9] ,
    \debug_ro_counts_reg_seven_reg[10] ,
    \debug_ro_counts_reg_seven_reg[11] ,
    \debug_ro_counts_reg_seven_reg[12] ,
    \debug_ro_counts_reg_seven_reg[13] ,
    \debug_ro_counts_reg_seven_reg[14] ,
    \debug_ro_counts_reg_seven_reg[15] ,
    \debug_ro_counts_reg_zero_reg[15] ,
    \debug_ro_counts_reg_zero_reg[15]_0 ,
    \debug_ro_counts_reg_zero_reg[15]_1 ,
    \debug_ro_counts_reg_zero_reg[14] ,
    \debug_ro_counts_reg_zero_reg[13] ,
    \debug_ro_counts_reg_zero_reg[12] ,
    \debug_ro_counts_reg_zero_reg[11] ,
    \debug_ro_counts_reg_zero_reg[10] ,
    \debug_ro_counts_reg_zero_reg[9] ,
    \debug_ro_counts_reg_zero_reg[8] ,
    \debug_ro_counts_reg_zero_reg[7] ,
    \debug_ro_counts_reg_one_reg[15] ,
    \debug_ro_counts_reg_one_reg[15]_0 ,
    \debug_ro_counts_reg_one_reg[15]_1 ,
    \debug_ro_counts_reg_one_reg[14] ,
    \debug_ro_counts_reg_one_reg[13] ,
    \debug_ro_counts_reg_one_reg[12] ,
    \debug_ro_counts_reg_one_reg[11] ,
    \debug_ro_counts_reg_one_reg[10] ,
    \debug_ro_counts_reg_one_reg[9] ,
    \debug_ro_counts_reg_one_reg[8] ,
    \debug_ro_counts_reg_two_reg[15]_1 ,
    \debug_ro_counts_reg_two_reg[14] ,
    \debug_ro_counts_reg_two_reg[13] ,
    \debug_ro_counts_reg_two_reg[12] ,
    \debug_ro_counts_reg_two_reg[11] ,
    \debug_ro_counts_reg_two_reg[10] ,
    \debug_ro_counts_reg_two_reg[9] ,
    \debug_ro_counts_reg_two_reg[8] ,
    \debug_ro_counts_reg_three_reg[15] ,
    \debug_ro_counts_reg_three_reg[15]_0 ,
    \debug_ro_counts_reg_three_reg[15]_1 ,
    \debug_ro_counts_reg_three_reg[14] ,
    \debug_ro_counts_reg_three_reg[13] ,
    \debug_ro_counts_reg_three_reg[12] ,
    \debug_ro_counts_reg_three_reg[11] ,
    \debug_ro_counts_reg_three_reg[10] ,
    \debug_ro_counts_reg_three_reg[9] ,
    \debug_ro_counts_reg_three_reg[8] ,
    \debug_ro_counts_reg_four_reg[15]_1 ,
    \debug_ro_counts_reg_four_reg[14] ,
    \debug_ro_counts_reg_four_reg[13] ,
    \debug_ro_counts_reg_four_reg[12] ,
    \debug_ro_counts_reg_four_reg[11] ,
    \debug_ro_counts_reg_four_reg[10] ,
    \debug_ro_counts_reg_four_reg[9] ,
    \debug_ro_counts_reg_four_reg[8] ,
    \debug_ro_counts_reg_five_reg[15]_1 ,
    \debug_ro_counts_reg_five_reg[14] ,
    \debug_ro_counts_reg_five_reg[13] ,
    \debug_ro_counts_reg_five_reg[12] ,
    \debug_ro_counts_reg_five_reg[11] ,
    \debug_ro_counts_reg_five_reg[10] ,
    \debug_ro_counts_reg_five_reg[9] ,
    \debug_ro_counts_reg_five_reg[8] ,
    \debug_ro_counts_reg_six_reg[15] ,
    \debug_ro_counts_reg_six_reg[15]_0 ,
    \debug_ro_counts_reg_six_reg[15]_1 ,
    \debug_ro_counts_reg_six_reg[14] ,
    \debug_ro_counts_reg_six_reg[13] ,
    \debug_ro_counts_reg_six_reg[12] ,
    \debug_ro_counts_reg_six_reg[11] ,
    \debug_ro_counts_reg_six_reg[10] ,
    \debug_ro_counts_reg_six_reg[9] ,
    \debug_ro_counts_reg_six_reg[8] ,
    \debug_ro_counts_reg_six_reg[7] );
  output [1:0]D;
  output [7:0]\debug_ro_counts_four_reg_reg[31]_0 ;
  output \out32counter_four_reg[2] ;
  output \out32counter_four_reg[2]_0 ;
  output \out32counter_four_reg[2]_1 ;
  output \out32counter_four_reg[2]_2 ;
  output \out32counter_four_reg[2]_3 ;
  output \debug_ro_counts_one_reg_reg[1]_0 ;
  output [7:0]\debug_ro_counts_one_reg_reg[31]_0 ;
  output \debug_ro_counts_one_reg_reg[2]_0 ;
  output \debug_ro_counts_reg_one_reg[3] ;
  output [12:0]\debug_ro_counts_three_reg_reg[31]_0 ;
  output \debug_ro_counts_one_reg_reg[5]_0 ;
  output \debug_ro_counts_one_reg_reg[6]_0 ;
  output \debug_ro_counts_three_reg_reg[6]_0 ;
  output [8:0]\debug_ro_counts_seven_reg_reg[31]_0 ;
  output \debug_ro_counts_reg_five_reg[0] ;
  output [11:0]\debug_ro_counts_five_reg_reg[31]_0 ;
  output \out32counter_two_reg[2] ;
  output [12:0]\debug_ro_counts_two_reg_reg[31]_0 ;
  output \out32counter_two_reg[2]_0 ;
  output \out32counter_two_reg[2]_1 ;
  output [0:0]E;
  output [7:0]\data_reg_reg[7]_0 ;
  output rxHasData0;
  output \debug_ro_counts_four_reg_reg[0]_0 ;
  output [15:0]\debug_ro_counts_seven_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_zero_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_zero_reg_reg[31]_0 ;
  output [15:0]\debug_ro_counts_one_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_two_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_three_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_four_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_five_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_six_reg_reg[23]_0 ;
  output [15:0]\debug_ro_counts_six_reg_reg[31]_0 ;
  input reset_Data;
  input clk_BUFG;
  input send;
  input [31:0]Q;
  input [31:0]data_reg1_carry__2_0;
  input \tx_byte_reg[4] ;
  input [2:0]\tx_byte[0]_i_13_0 ;
  input \tx_byte_reg[4]_0 ;
  input \tx_byte_reg[7] ;
  input \tx_byte_reg[7]_0 ;
  input \tx_byte_reg[7]_1 ;
  input \tx_byte_reg[7]_2 ;
  input \tx_byte_reg[7]_3 ;
  input \tx_byte_reg[7]_4 ;
  input [15:0]\debug_ro_counts_reg_four_reg[7] ;
  input \tx_byte_reg[2] ;
  input \tx_byte_reg[2]_0 ;
  input \tx_byte_reg[2]_1 ;
  input [15:0]\debug_ro_counts_reg_one_reg[7] ;
  input \tx_byte_reg[4]_1 ;
  input [10:0]\debug_ro_counts_reg_three_reg[7] ;
  input \tx_byte_reg[4]_2 ;
  input \debug_ro_counts_reg_seven_reg[0] ;
  input \tx_byte[7]_i_3_0 ;
  input \tx_byte[7]_i_3_1 ;
  input [14:0]\debug_ro_counts_reg_seven_reg[7] ;
  input \tx_byte[7]_i_3_2 ;
  input [11:0]\debug_ro_counts_reg_five_reg[7] ;
  input \tx_byte_reg[0] ;
  input \tx_byte_reg[0]_0 ;
  input \tx_byte_reg[0]_1 ;
  input \tx_byte[7]_i_6 ;
  input [10:0]\debug_ro_counts_reg_two_reg[7] ;
  input \debug_ro_counts_reg_two_reg[15] ;
  input \debug_ro_counts_reg_two_reg[15]_0 ;
  input \tx_byte[7]_i_6_0 ;
  input beenReadFlag;
  input rxHasData;
  input tx_wire_debug;
  input tx_busy;
  input \tx_byte[7]_i_5_0 ;
  input \debug_ro_counts_reg_five_reg[15] ;
  input \debug_ro_counts_reg_five_reg[15]_0 ;
  input \debug_ro_counts_reg_four_reg[15] ;
  input \debug_ro_counts_reg_four_reg[15]_0 ;
  input \debug_ro_counts_reg_seven_reg[0]_0 ;
  input \debug_ro_counts_reg_seven_reg[0]_1 ;
  input \debug_ro_counts_reg_seven_reg[8] ;
  input \debug_ro_counts_reg_seven_reg[9] ;
  input \debug_ro_counts_reg_seven_reg[10] ;
  input \debug_ro_counts_reg_seven_reg[11] ;
  input \debug_ro_counts_reg_seven_reg[12] ;
  input \debug_ro_counts_reg_seven_reg[13] ;
  input \debug_ro_counts_reg_seven_reg[14] ;
  input \debug_ro_counts_reg_seven_reg[15] ;
  input \debug_ro_counts_reg_zero_reg[15] ;
  input \debug_ro_counts_reg_zero_reg[15]_0 ;
  input \debug_ro_counts_reg_zero_reg[15]_1 ;
  input \debug_ro_counts_reg_zero_reg[14] ;
  input \debug_ro_counts_reg_zero_reg[13] ;
  input \debug_ro_counts_reg_zero_reg[12] ;
  input \debug_ro_counts_reg_zero_reg[11] ;
  input \debug_ro_counts_reg_zero_reg[10] ;
  input \debug_ro_counts_reg_zero_reg[9] ;
  input \debug_ro_counts_reg_zero_reg[8] ;
  input [7:0]\debug_ro_counts_reg_zero_reg[7] ;
  input \debug_ro_counts_reg_one_reg[15] ;
  input \debug_ro_counts_reg_one_reg[15]_0 ;
  input \debug_ro_counts_reg_one_reg[15]_1 ;
  input \debug_ro_counts_reg_one_reg[14] ;
  input \debug_ro_counts_reg_one_reg[13] ;
  input \debug_ro_counts_reg_one_reg[12] ;
  input \debug_ro_counts_reg_one_reg[11] ;
  input \debug_ro_counts_reg_one_reg[10] ;
  input \debug_ro_counts_reg_one_reg[9] ;
  input \debug_ro_counts_reg_one_reg[8] ;
  input \debug_ro_counts_reg_two_reg[15]_1 ;
  input \debug_ro_counts_reg_two_reg[14] ;
  input \debug_ro_counts_reg_two_reg[13] ;
  input \debug_ro_counts_reg_two_reg[12] ;
  input \debug_ro_counts_reg_two_reg[11] ;
  input \debug_ro_counts_reg_two_reg[10] ;
  input \debug_ro_counts_reg_two_reg[9] ;
  input \debug_ro_counts_reg_two_reg[8] ;
  input \debug_ro_counts_reg_three_reg[15] ;
  input \debug_ro_counts_reg_three_reg[15]_0 ;
  input \debug_ro_counts_reg_three_reg[15]_1 ;
  input \debug_ro_counts_reg_three_reg[14] ;
  input \debug_ro_counts_reg_three_reg[13] ;
  input \debug_ro_counts_reg_three_reg[12] ;
  input \debug_ro_counts_reg_three_reg[11] ;
  input \debug_ro_counts_reg_three_reg[10] ;
  input \debug_ro_counts_reg_three_reg[9] ;
  input \debug_ro_counts_reg_three_reg[8] ;
  input \debug_ro_counts_reg_four_reg[15]_1 ;
  input \debug_ro_counts_reg_four_reg[14] ;
  input \debug_ro_counts_reg_four_reg[13] ;
  input \debug_ro_counts_reg_four_reg[12] ;
  input \debug_ro_counts_reg_four_reg[11] ;
  input \debug_ro_counts_reg_four_reg[10] ;
  input \debug_ro_counts_reg_four_reg[9] ;
  input \debug_ro_counts_reg_four_reg[8] ;
  input \debug_ro_counts_reg_five_reg[15]_1 ;
  input \debug_ro_counts_reg_five_reg[14] ;
  input \debug_ro_counts_reg_five_reg[13] ;
  input \debug_ro_counts_reg_five_reg[12] ;
  input \debug_ro_counts_reg_five_reg[11] ;
  input \debug_ro_counts_reg_five_reg[10] ;
  input \debug_ro_counts_reg_five_reg[9] ;
  input \debug_ro_counts_reg_five_reg[8] ;
  input \debug_ro_counts_reg_six_reg[15] ;
  input \debug_ro_counts_reg_six_reg[15]_0 ;
  input \debug_ro_counts_reg_six_reg[15]_1 ;
  input \debug_ro_counts_reg_six_reg[14] ;
  input \debug_ro_counts_reg_six_reg[13] ;
  input \debug_ro_counts_reg_six_reg[12] ;
  input \debug_ro_counts_reg_six_reg[11] ;
  input \debug_ro_counts_reg_six_reg[10] ;
  input \debug_ro_counts_reg_six_reg[9] ;
  input \debug_ro_counts_reg_six_reg[8] ;
  input [7:0]\debug_ro_counts_reg_six_reg[7] ;

  wire \<const0> ;
  wire \<const1> ;
  wire [1:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire \FSM_sequential_state[2]_i_6_n_0 ;
  wire [31:0]Q;
  wire beenReadFlag;
  wire clk_BUFG;
  wire [31:0]clk_count;
  wire [31:1]clk_count0;
  wire \clk_count[31]_i_1_n_0 ;
  wire \clk_count_reg[12]_i_2_n_0 ;
  wire \clk_count_reg[16]_i_2_n_0 ;
  wire \clk_count_reg[20]_i_2_n_0 ;
  wire \clk_count_reg[24]_i_2_n_0 ;
  wire \clk_count_reg[28]_i_2_n_0 ;
  wire \clk_count_reg[4]_i_2_n_0 ;
  wire \clk_count_reg[8]_i_2_n_0 ;
  wire \clk_count_reg_n_0_[0] ;
  wire \clk_count_reg_n_0_[10] ;
  wire \clk_count_reg_n_0_[11] ;
  wire \clk_count_reg_n_0_[12] ;
  wire \clk_count_reg_n_0_[13] ;
  wire \clk_count_reg_n_0_[14] ;
  wire \clk_count_reg_n_0_[15] ;
  wire \clk_count_reg_n_0_[16] ;
  wire \clk_count_reg_n_0_[17] ;
  wire \clk_count_reg_n_0_[18] ;
  wire \clk_count_reg_n_0_[19] ;
  wire \clk_count_reg_n_0_[1] ;
  wire \clk_count_reg_n_0_[20] ;
  wire \clk_count_reg_n_0_[21] ;
  wire \clk_count_reg_n_0_[22] ;
  wire \clk_count_reg_n_0_[23] ;
  wire \clk_count_reg_n_0_[24] ;
  wire \clk_count_reg_n_0_[25] ;
  wire \clk_count_reg_n_0_[26] ;
  wire \clk_count_reg_n_0_[27] ;
  wire \clk_count_reg_n_0_[28] ;
  wire \clk_count_reg_n_0_[29] ;
  wire \clk_count_reg_n_0_[2] ;
  wire \clk_count_reg_n_0_[30] ;
  wire \clk_count_reg_n_0_[31] ;
  wire \clk_count_reg_n_0_[3] ;
  wire \clk_count_reg_n_0_[4] ;
  wire \clk_count_reg_n_0_[5] ;
  wire \clk_count_reg_n_0_[6] ;
  wire \clk_count_reg_n_0_[7] ;
  wire \clk_count_reg_n_0_[8] ;
  wire \clk_count_reg_n_0_[9] ;
  wire coolDownCounter0_carry__0_n_0;
  wire coolDownCounter0_carry__1_n_0;
  wire coolDownCounter0_carry__2_n_0;
  wire coolDownCounter0_carry__3_n_0;
  wire coolDownCounter0_carry__4_n_0;
  wire coolDownCounter0_carry__5_n_0;
  wire coolDownCounter0_carry_n_0;
  wire \coolDownCounter[0]_i_1_n_0 ;
  wire \coolDownCounter[31]_i_10_n_0 ;
  wire \coolDownCounter[31]_i_11_n_0 ;
  wire \coolDownCounter[31]_i_12_n_0 ;
  wire \coolDownCounter[31]_i_13_n_0 ;
  wire \coolDownCounter[31]_i_1_n_0 ;
  wire \coolDownCounter[31]_i_2_n_0 ;
  wire \coolDownCounter[31]_i_3_n_0 ;
  wire \coolDownCounter[31]_i_4_n_0 ;
  wire \coolDownCounter[31]_i_5_n_0 ;
  wire \coolDownCounter[31]_i_6_n_0 ;
  wire \coolDownCounter[31]_i_7_n_0 ;
  wire \coolDownCounter[31]_i_8_n_0 ;
  wire \coolDownCounter[31]_i_9_n_0 ;
  wire \coolDownCounter_reg_n_0_[0] ;
  wire \coolDownCounter_reg_n_0_[10] ;
  wire \coolDownCounter_reg_n_0_[11] ;
  wire \coolDownCounter_reg_n_0_[12] ;
  wire \coolDownCounter_reg_n_0_[13] ;
  wire \coolDownCounter_reg_n_0_[14] ;
  wire \coolDownCounter_reg_n_0_[15] ;
  wire \coolDownCounter_reg_n_0_[16] ;
  wire \coolDownCounter_reg_n_0_[17] ;
  wire \coolDownCounter_reg_n_0_[18] ;
  wire \coolDownCounter_reg_n_0_[19] ;
  wire \coolDownCounter_reg_n_0_[1] ;
  wire \coolDownCounter_reg_n_0_[20] ;
  wire \coolDownCounter_reg_n_0_[21] ;
  wire \coolDownCounter_reg_n_0_[22] ;
  wire \coolDownCounter_reg_n_0_[23] ;
  wire \coolDownCounter_reg_n_0_[24] ;
  wire \coolDownCounter_reg_n_0_[25] ;
  wire \coolDownCounter_reg_n_0_[26] ;
  wire \coolDownCounter_reg_n_0_[27] ;
  wire \coolDownCounter_reg_n_0_[28] ;
  wire \coolDownCounter_reg_n_0_[29] ;
  wire \coolDownCounter_reg_n_0_[2] ;
  wire \coolDownCounter_reg_n_0_[30] ;
  wire \coolDownCounter_reg_n_0_[31] ;
  wire \coolDownCounter_reg_n_0_[3] ;
  wire \coolDownCounter_reg_n_0_[4] ;
  wire \coolDownCounter_reg_n_0_[5] ;
  wire \coolDownCounter_reg_n_0_[6] ;
  wire \coolDownCounter_reg_n_0_[7] ;
  wire \coolDownCounter_reg_n_0_[8] ;
  wire \coolDownCounter_reg_n_0_[9] ;
  wire data_reg1__15;
  wire data_reg1_carry__0_i_1_n_0;
  wire data_reg1_carry__0_i_2_n_0;
  wire data_reg1_carry__0_i_3_n_0;
  wire data_reg1_carry__0_i_4_n_0;
  wire data_reg1_carry__0_i_5_n_0;
  wire data_reg1_carry__0_i_6_n_0;
  wire data_reg1_carry__0_i_7_n_0;
  wire data_reg1_carry__0_i_8_n_0;
  wire data_reg1_carry__0_n_0;
  wire data_reg1_carry__1_i_1_n_0;
  wire data_reg1_carry__1_i_2_n_0;
  wire data_reg1_carry__1_i_3_n_0;
  wire data_reg1_carry__1_i_4_n_0;
  wire data_reg1_carry__1_i_5_n_0;
  wire data_reg1_carry__1_i_6_n_0;
  wire data_reg1_carry__1_i_7_n_0;
  wire data_reg1_carry__1_i_8_n_0;
  wire data_reg1_carry__1_n_0;
  wire [31:0]data_reg1_carry__2_0;
  wire data_reg1_carry__2_i_1_n_0;
  wire data_reg1_carry__2_i_2_n_0;
  wire data_reg1_carry__2_i_3_n_0;
  wire data_reg1_carry__2_i_4_n_0;
  wire data_reg1_carry__2_i_5_n_0;
  wire data_reg1_carry__2_i_6_n_0;
  wire data_reg1_carry__2_i_7_n_0;
  wire data_reg1_carry__2_i_8_n_0;
  wire data_reg1_carry_i_1_n_0;
  wire data_reg1_carry_i_2_n_0;
  wire data_reg1_carry_i_3_n_0;
  wire data_reg1_carry_i_4_n_0;
  wire data_reg1_carry_i_5_n_0;
  wire data_reg1_carry_i_6_n_0;
  wire data_reg1_carry_i_7_n_0;
  wire data_reg1_carry_i_8_n_0;
  wire data_reg1_carry_n_0;
  wire \data_reg[7]_i_1_n_0 ;
  wire \data_reg[7]_i_2_n_0 ;
  wire \data_reg[7]_i_3_n_0 ;
  wire [7:0]\data_reg_reg[7]_0 ;
  wire [23:0]debug_ro_counts_five;
  wire \debug_ro_counts_five_reg[31]_i_1_n_0 ;
  wire [15:0]\debug_ro_counts_five_reg_reg[23]_0 ;
  wire [11:0]\debug_ro_counts_five_reg_reg[31]_0 ;
  wire [23:0]debug_ro_counts_four;
  wire \debug_ro_counts_four_reg[31]_i_1_n_0 ;
  wire \debug_ro_counts_four_reg_reg[0]_0 ;
  wire [15:0]\debug_ro_counts_four_reg_reg[23]_0 ;
  wire [7:0]\debug_ro_counts_four_reg_reg[31]_0 ;
  wire [23:0]debug_ro_counts_one;
  wire \debug_ro_counts_one_reg[31]_i_1_n_0 ;
  wire \debug_ro_counts_one_reg_reg[1]_0 ;
  wire [15:0]\debug_ro_counts_one_reg_reg[23]_0 ;
  wire \debug_ro_counts_one_reg_reg[2]_0 ;
  wire [7:0]\debug_ro_counts_one_reg_reg[31]_0 ;
  wire \debug_ro_counts_one_reg_reg[5]_0 ;
  wire \debug_ro_counts_one_reg_reg[6]_0 ;
  wire \debug_ro_counts_reg_five_reg[0] ;
  wire \debug_ro_counts_reg_five_reg[10] ;
  wire \debug_ro_counts_reg_five_reg[11] ;
  wire \debug_ro_counts_reg_five_reg[12] ;
  wire \debug_ro_counts_reg_five_reg[13] ;
  wire \debug_ro_counts_reg_five_reg[14] ;
  wire \debug_ro_counts_reg_five_reg[15] ;
  wire \debug_ro_counts_reg_five_reg[15]_0 ;
  wire \debug_ro_counts_reg_five_reg[15]_1 ;
  wire [11:0]\debug_ro_counts_reg_five_reg[7] ;
  wire \debug_ro_counts_reg_five_reg[8] ;
  wire \debug_ro_counts_reg_five_reg[9] ;
  wire \debug_ro_counts_reg_four_reg[10] ;
  wire \debug_ro_counts_reg_four_reg[11] ;
  wire \debug_ro_counts_reg_four_reg[12] ;
  wire \debug_ro_counts_reg_four_reg[13] ;
  wire \debug_ro_counts_reg_four_reg[14] ;
  wire \debug_ro_counts_reg_four_reg[15] ;
  wire \debug_ro_counts_reg_four_reg[15]_0 ;
  wire \debug_ro_counts_reg_four_reg[15]_1 ;
  wire [15:0]\debug_ro_counts_reg_four_reg[7] ;
  wire \debug_ro_counts_reg_four_reg[8] ;
  wire \debug_ro_counts_reg_four_reg[9] ;
  wire \debug_ro_counts_reg_one_reg[10] ;
  wire \debug_ro_counts_reg_one_reg[11] ;
  wire \debug_ro_counts_reg_one_reg[12] ;
  wire \debug_ro_counts_reg_one_reg[13] ;
  wire \debug_ro_counts_reg_one_reg[14] ;
  wire \debug_ro_counts_reg_one_reg[15] ;
  wire \debug_ro_counts_reg_one_reg[15]_0 ;
  wire \debug_ro_counts_reg_one_reg[15]_1 ;
  wire \debug_ro_counts_reg_one_reg[3] ;
  wire [15:0]\debug_ro_counts_reg_one_reg[7] ;
  wire \debug_ro_counts_reg_one_reg[8] ;
  wire \debug_ro_counts_reg_one_reg[9] ;
  wire \debug_ro_counts_reg_seven_reg[0] ;
  wire \debug_ro_counts_reg_seven_reg[0]_0 ;
  wire \debug_ro_counts_reg_seven_reg[0]_1 ;
  wire \debug_ro_counts_reg_seven_reg[10] ;
  wire \debug_ro_counts_reg_seven_reg[11] ;
  wire \debug_ro_counts_reg_seven_reg[12] ;
  wire \debug_ro_counts_reg_seven_reg[13] ;
  wire \debug_ro_counts_reg_seven_reg[14] ;
  wire \debug_ro_counts_reg_seven_reg[15] ;
  wire [14:0]\debug_ro_counts_reg_seven_reg[7] ;
  wire \debug_ro_counts_reg_seven_reg[8] ;
  wire \debug_ro_counts_reg_seven_reg[9] ;
  wire \debug_ro_counts_reg_six_reg[10] ;
  wire \debug_ro_counts_reg_six_reg[11] ;
  wire \debug_ro_counts_reg_six_reg[12] ;
  wire \debug_ro_counts_reg_six_reg[13] ;
  wire \debug_ro_counts_reg_six_reg[14] ;
  wire \debug_ro_counts_reg_six_reg[15] ;
  wire \debug_ro_counts_reg_six_reg[15]_0 ;
  wire \debug_ro_counts_reg_six_reg[15]_1 ;
  wire [7:0]\debug_ro_counts_reg_six_reg[7] ;
  wire \debug_ro_counts_reg_six_reg[8] ;
  wire \debug_ro_counts_reg_six_reg[9] ;
  wire \debug_ro_counts_reg_three_reg[10] ;
  wire \debug_ro_counts_reg_three_reg[11] ;
  wire \debug_ro_counts_reg_three_reg[12] ;
  wire \debug_ro_counts_reg_three_reg[13] ;
  wire \debug_ro_counts_reg_three_reg[14] ;
  wire \debug_ro_counts_reg_three_reg[15] ;
  wire \debug_ro_counts_reg_three_reg[15]_0 ;
  wire \debug_ro_counts_reg_three_reg[15]_1 ;
  wire [10:0]\debug_ro_counts_reg_three_reg[7] ;
  wire \debug_ro_counts_reg_three_reg[8] ;
  wire \debug_ro_counts_reg_three_reg[9] ;
  wire \debug_ro_counts_reg_two_reg[10] ;
  wire \debug_ro_counts_reg_two_reg[11] ;
  wire \debug_ro_counts_reg_two_reg[12] ;
  wire \debug_ro_counts_reg_two_reg[13] ;
  wire \debug_ro_counts_reg_two_reg[14] ;
  wire \debug_ro_counts_reg_two_reg[15] ;
  wire \debug_ro_counts_reg_two_reg[15]_0 ;
  wire \debug_ro_counts_reg_two_reg[15]_1 ;
  wire [10:0]\debug_ro_counts_reg_two_reg[7] ;
  wire \debug_ro_counts_reg_two_reg[8] ;
  wire \debug_ro_counts_reg_two_reg[9] ;
  wire \debug_ro_counts_reg_zero_reg[10] ;
  wire \debug_ro_counts_reg_zero_reg[11] ;
  wire \debug_ro_counts_reg_zero_reg[12] ;
  wire \debug_ro_counts_reg_zero_reg[13] ;
  wire \debug_ro_counts_reg_zero_reg[14] ;
  wire \debug_ro_counts_reg_zero_reg[15] ;
  wire \debug_ro_counts_reg_zero_reg[15]_0 ;
  wire \debug_ro_counts_reg_zero_reg[15]_1 ;
  wire [7:0]\debug_ro_counts_reg_zero_reg[7] ;
  wire \debug_ro_counts_reg_zero_reg[8] ;
  wire \debug_ro_counts_reg_zero_reg[9] ;
  wire [23:1]debug_ro_counts_seven;
  wire \debug_ro_counts_seven_reg[31]_i_1_n_0 ;
  wire [15:0]\debug_ro_counts_seven_reg_reg[23]_0 ;
  wire [8:0]\debug_ro_counts_seven_reg_reg[31]_0 ;
  wire [23:8]debug_ro_counts_six;
  wire \debug_ro_counts_six_reg[31]_i_1_n_0 ;
  wire [15:0]\debug_ro_counts_six_reg_reg[23]_0 ;
  wire [15:0]\debug_ro_counts_six_reg_reg[31]_0 ;
  wire [23:4]debug_ro_counts_three;
  wire \debug_ro_counts_three_reg[31]_i_1_n_0 ;
  wire [15:0]\debug_ro_counts_three_reg_reg[23]_0 ;
  wire [12:0]\debug_ro_counts_three_reg_reg[31]_0 ;
  wire \debug_ro_counts_three_reg_reg[6]_0 ;
  wire [23:0]debug_ro_counts_two;
  wire \debug_ro_counts_two_reg[31]_i_1_n_0 ;
  wire [15:0]\debug_ro_counts_two_reg_reg[23]_0 ;
  wire [12:0]\debug_ro_counts_two_reg_reg[31]_0 ;
  wire [23:8]debug_ro_counts_zero;
  wire \debug_ro_counts_zero_reg[31]_i_1_n_0 ;
  wire \debug_ro_counts_zero_reg[31]_i_2_n_0 ;
  wire [15:0]\debug_ro_counts_zero_reg_reg[23]_0 ;
  wire [15:0]\debug_ro_counts_zero_reg_reg[31]_0 ;
  wire gotData;
  wire gotData_reg_i_1_n_0;
  wire [31:1]in10;
  wire [1:0]index;
  wire \index[2]_i_1_n_0 ;
  wire \index[3]_i_1_n_0 ;
  wire \index[3]_i_2_n_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire \index_reg_n_0_[3] ;
  wire myROOutput;
  wire \out32counter_four_reg[2] ;
  wire \out32counter_four_reg[2]_0 ;
  wire \out32counter_four_reg[2]_1 ;
  wire \out32counter_four_reg[2]_2 ;
  wire \out32counter_four_reg[2]_3 ;
  wire \out32counter_two_reg[2] ;
  wire \out32counter_two_reg[2]_0 ;
  wire \out32counter_two_reg[2]_1 ;
  wire [7:0]output_Data;
  wire reset_Data;
  (* DONT_TOUCH *) wire [31:0]ro_counter_count;
  (* DONT_TOUCH *) wire ro_counter_reset;
  wire ro_counter_reset_i_1_n_0;
  wire rxHasData;
  wire rxHasData0;
  wire send;
  wire [2:0]state;
  wire state1_carry__0_i_1_n_0;
  wire state1_carry__0_i_2_n_0;
  wire state1_carry__0_i_3_n_0;
  wire state1_carry__0_i_4_n_0;
  wire state1_carry__0_i_5_n_0;
  wire state1_carry__0_i_6_n_0;
  wire state1_carry__0_i_7_n_0;
  wire state1_carry__0_i_8_n_0;
  wire state1_carry__0_n_0;
  wire state1_carry__1_i_1_n_0;
  wire state1_carry__1_i_2_n_0;
  wire state1_carry__1_i_3_n_0;
  wire state1_carry__1_i_4_n_0;
  wire state1_carry__1_i_5_n_0;
  wire state1_carry__1_i_6_n_0;
  wire state1_carry__1_i_7_n_0;
  wire state1_carry__1_i_8_n_0;
  wire state1_carry__1_n_0;
  wire state1_carry__2_i_1_n_0;
  wire state1_carry__2_i_2_n_0;
  wire state1_carry__2_i_3_n_0;
  wire state1_carry__2_i_4_n_0;
  wire state1_carry__2_i_5_n_0;
  wire state1_carry__2_i_6_n_0;
  wire state1_carry__2_i_7_n_0;
  wire state1_carry__2_i_8_n_0;
  wire state1_carry__2_n_0;
  wire state1_carry_i_1_n_0;
  wire state1_carry_i_2_n_0;
  wire state1_carry_i_3_n_0;
  wire state1_carry_i_4_n_0;
  wire state1_carry_i_5_n_0;
  wire state1_carry_i_6_n_0;
  wire state1_carry_i_7_n_0;
  wire state1_carry_i_8_n_0;
  wire state1_carry_n_0;
  wire tx_busy;
  wire [2:0]\tx_byte[0]_i_13_0 ;
  wire \tx_byte[0]_i_13_n_0 ;
  wire \tx_byte[0]_i_16_n_0 ;
  wire \tx_byte[1]_i_9_n_0 ;
  wire \tx_byte[2]_i_7_n_0 ;
  wire \tx_byte[3]_i_7_n_0 ;
  wire \tx_byte[4]_i_3_n_0 ;
  wire \tx_byte[4]_i_4_n_0 ;
  wire \tx_byte[4]_i_5_n_0 ;
  wire \tx_byte[4]_i_7_n_0 ;
  wire \tx_byte[4]_i_8_n_0 ;
  wire \tx_byte[5]_i_11_n_0 ;
  wire \tx_byte[6]_i_10_n_0 ;
  wire \tx_byte[6]_i_13_n_0 ;
  wire \tx_byte[7]_i_14_n_0 ;
  wire \tx_byte[7]_i_3_0 ;
  wire \tx_byte[7]_i_3_1 ;
  wire \tx_byte[7]_i_3_2 ;
  wire \tx_byte[7]_i_3_n_0 ;
  wire \tx_byte[7]_i_4_n_0 ;
  wire \tx_byte[7]_i_5_0 ;
  wire \tx_byte[7]_i_5_n_0 ;
  wire \tx_byte[7]_i_6 ;
  wire \tx_byte[7]_i_6_0 ;
  wire \tx_byte[7]_i_9_n_0 ;
  wire \tx_byte_reg[0] ;
  wire \tx_byte_reg[0]_0 ;
  wire \tx_byte_reg[0]_1 ;
  wire \tx_byte_reg[2] ;
  wire \tx_byte_reg[2]_0 ;
  wire \tx_byte_reg[2]_1 ;
  wire \tx_byte_reg[4] ;
  wire \tx_byte_reg[4]_0 ;
  wire \tx_byte_reg[4]_1 ;
  wire \tx_byte_reg[4]_2 ;
  wire \tx_byte_reg[7] ;
  wire \tx_byte_reg[7]_0 ;
  wire \tx_byte_reg[7]_1 ;
  wire \tx_byte_reg[7]_2 ;
  wire \tx_byte_reg[7]_3 ;
  wire \tx_byte_reg[7]_4 ;
  wire tx_wire_debug;
  wire [3:0]\NLW_clk_count_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[20]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[28]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[4]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[8]_i_2_CO_UNCONNECTED ;
  wire [3:0]NLW_coolDownCounter0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_coolDownCounter0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_coolDownCounter0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_coolDownCounter0_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_coolDownCounter0_carry__3_CO_UNCONNECTED;
  wire [3:0]NLW_coolDownCounter0_carry__4_CO_UNCONNECTED;
  wire [3:0]NLW_coolDownCounter0_carry__5_CO_UNCONNECTED;
  wire [3:0]NLW_data_reg1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_data_reg1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_data_reg1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_data_reg1_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_state1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_state1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_state1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_state1_carry__2_CO_UNCONNECTED;

  LUT6 #(
    .INIT(64'h00880030008800FC)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(state[1]),
        .I2(send),
        .I3(state[2]),
        .I4(state[0]),
        .I5(state1_carry__2_n_0),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF11111151)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(\coolDownCounter[31]_i_5_n_0 ),
        .I1(\coolDownCounter_reg_n_0_[23] ),
        .I2(\coolDownCounter[31]_i_4_n_0 ),
        .I3(\coolDownCounter_reg_n_0_[22] ),
        .I4(\coolDownCounter_reg_n_0_[21] ),
        .I5(\FSM_sequential_state[0]_i_3_n_0 ),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[3] ),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0B0C)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[2]_i_3_n_0 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\FSM_sequential_state[2]_i_2_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\FSM_sequential_state[2]_i_3_n_0 ),
        .I4(state[0]),
        .I5(\FSM_sequential_state[2]_i_4_n_0 ),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000001110FFFF)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(\coolDownCounter_reg_n_0_[21] ),
        .I1(\coolDownCounter_reg_n_0_[22] ),
        .I2(\FSM_sequential_state[2]_i_5_n_0 ),
        .I3(\FSM_sequential_state[2]_i_6_n_0 ),
        .I4(\coolDownCounter_reg_n_0_[23] ),
        .I5(\coolDownCounter[31]_i_5_n_0 ),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(state[2]),
        .I1(state[1]),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(\coolDownCounter_reg_n_0_[20] ),
        .I1(\coolDownCounter_reg_n_0_[19] ),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000000111FFFF)) 
    \FSM_sequential_state[2]_i_6 
       (.I0(\coolDownCounter_reg_n_0_[13] ),
        .I1(\coolDownCounter_reg_n_0_[14] ),
        .I2(\coolDownCounter[31]_i_8_n_0 ),
        .I3(\coolDownCounter_reg_n_0_[12] ),
        .I4(\coolDownCounter_reg_n_0_[15] ),
        .I5(\coolDownCounter[31]_i_7_n_0 ),
        .O(\FSM_sequential_state[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,ROMEASURE:010,COOLDOWN:011,RECEIVE_BIT:001,FINISH:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(reset_Data));
  (* FSM_ENCODED_STATES = "IDLE:000,ROMEASURE:010,COOLDOWN:011,RECEIVE_BIT:001,FINISH:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(reset_Data));
  (* FSM_ENCODED_STATES = "IDLE:000,ROMEASURE:010,COOLDOWN:011,RECEIVE_BIT:001,FINISH:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(reset_Data));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \clk_count[0]_i_1 
       (.I0(\clk_count_reg_n_0_[0] ),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[10]_i_1 
       (.I0(clk_count0[10]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[10]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[11]_i_1 
       (.I0(clk_count0[11]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[11]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[12]_i_1 
       (.I0(clk_count0[12]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[12]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[13]_i_1 
       (.I0(clk_count0[13]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[13]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[14]_i_1 
       (.I0(clk_count0[14]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[14]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[15]_i_1 
       (.I0(clk_count0[15]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[15]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[16]_i_1 
       (.I0(clk_count0[16]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[16]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[17]_i_1 
       (.I0(clk_count0[17]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[17]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[18]_i_1 
       (.I0(clk_count0[18]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[18]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[19]_i_1 
       (.I0(clk_count0[19]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[19]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[1]_i_1 
       (.I0(clk_count0[1]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[20]_i_1 
       (.I0(clk_count0[20]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[20]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[21]_i_1 
       (.I0(clk_count0[21]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[21]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[22]_i_1 
       (.I0(clk_count0[22]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[22]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[23]_i_1 
       (.I0(clk_count0[23]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[23]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[24]_i_1 
       (.I0(clk_count0[24]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[24]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[25]_i_1 
       (.I0(clk_count0[25]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[25]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[26]_i_1 
       (.I0(clk_count0[26]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[26]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[27]_i_1 
       (.I0(clk_count0[27]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[27]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[28]_i_1 
       (.I0(clk_count0[28]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[28]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[29]_i_1 
       (.I0(clk_count0[29]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[29]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[2]_i_1 
       (.I0(clk_count0[2]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[30]_i_1 
       (.I0(clk_count0[30]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[30]));
  LUT2 #(
    .INIT(4'h1)) 
    \clk_count[31]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .O(\clk_count[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[31]_i_2 
       (.I0(clk_count0[31]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[31]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[3]_i_1 
       (.I0(clk_count0[3]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[3]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[4]_i_1 
       (.I0(clk_count0[4]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[5]_i_1 
       (.I0(clk_count0[5]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[5]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[6]_i_1 
       (.I0(clk_count0[6]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[6]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[7]_i_1 
       (.I0(clk_count0[7]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[7]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[8]_i_1 
       (.I0(clk_count0[8]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[8]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[9]_i_1 
       (.I0(clk_count0[9]),
        .I1(state1_carry__2_n_0),
        .I2(state[1]),
        .O(clk_count[9]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[0]),
        .Q(\clk_count_reg_n_0_[0] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[10]),
        .Q(\clk_count_reg_n_0_[10] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[11]),
        .Q(\clk_count_reg_n_0_[11] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[12]),
        .Q(\clk_count_reg_n_0_[12] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[12]_i_2 
       (.CI(\clk_count_reg[8]_i_2_n_0 ),
        .CO({\clk_count_reg[12]_i_2_n_0 ,\NLW_clk_count_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[12:9]),
        .S({\clk_count_reg_n_0_[12] ,\clk_count_reg_n_0_[11] ,\clk_count_reg_n_0_[10] ,\clk_count_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[13]),
        .Q(\clk_count_reg_n_0_[13] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[14] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[14]),
        .Q(\clk_count_reg_n_0_[14] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[15] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[15]),
        .Q(\clk_count_reg_n_0_[15] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[16] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[16]),
        .Q(\clk_count_reg_n_0_[16] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[16]_i_2 
       (.CI(\clk_count_reg[12]_i_2_n_0 ),
        .CO({\clk_count_reg[16]_i_2_n_0 ,\NLW_clk_count_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[16:13]),
        .S({\clk_count_reg_n_0_[16] ,\clk_count_reg_n_0_[15] ,\clk_count_reg_n_0_[14] ,\clk_count_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[17] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[17]),
        .Q(\clk_count_reg_n_0_[17] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[18] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[18]),
        .Q(\clk_count_reg_n_0_[18] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[19] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[19]),
        .Q(\clk_count_reg_n_0_[19] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[1]),
        .Q(\clk_count_reg_n_0_[1] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[20] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[20]),
        .Q(\clk_count_reg_n_0_[20] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[20]_i_2 
       (.CI(\clk_count_reg[16]_i_2_n_0 ),
        .CO({\clk_count_reg[20]_i_2_n_0 ,\NLW_clk_count_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[20:17]),
        .S({\clk_count_reg_n_0_[20] ,\clk_count_reg_n_0_[19] ,\clk_count_reg_n_0_[18] ,\clk_count_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[21] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[21]),
        .Q(\clk_count_reg_n_0_[21] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[22] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[22]),
        .Q(\clk_count_reg_n_0_[22] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[23] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[23]),
        .Q(\clk_count_reg_n_0_[23] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[24] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[24]),
        .Q(\clk_count_reg_n_0_[24] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[24]_i_2 
       (.CI(\clk_count_reg[20]_i_2_n_0 ),
        .CO({\clk_count_reg[24]_i_2_n_0 ,\NLW_clk_count_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[24:21]),
        .S({\clk_count_reg_n_0_[24] ,\clk_count_reg_n_0_[23] ,\clk_count_reg_n_0_[22] ,\clk_count_reg_n_0_[21] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[25] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[25]),
        .Q(\clk_count_reg_n_0_[25] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[26] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[26]),
        .Q(\clk_count_reg_n_0_[26] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[27] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[27]),
        .Q(\clk_count_reg_n_0_[27] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[28] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[28]),
        .Q(\clk_count_reg_n_0_[28] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[28]_i_2 
       (.CI(\clk_count_reg[24]_i_2_n_0 ),
        .CO({\clk_count_reg[28]_i_2_n_0 ,\NLW_clk_count_reg[28]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[28:25]),
        .S({\clk_count_reg_n_0_[28] ,\clk_count_reg_n_0_[27] ,\clk_count_reg_n_0_[26] ,\clk_count_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[29] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[29]),
        .Q(\clk_count_reg_n_0_[29] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[2]),
        .Q(\clk_count_reg_n_0_[2] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[30] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[30]),
        .Q(\clk_count_reg_n_0_[30] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[31] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[31]),
        .Q(\clk_count_reg_n_0_[31] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[31]_i_3 
       (.CI(\clk_count_reg[28]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[31:29]),
        .S({\<const0> ,\clk_count_reg_n_0_[31] ,\clk_count_reg_n_0_[30] ,\clk_count_reg_n_0_[29] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[3]),
        .Q(\clk_count_reg_n_0_[3] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[4]),
        .Q(\clk_count_reg_n_0_[4] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\clk_count_reg[4]_i_2_n_0 ,\NLW_clk_count_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\clk_count_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[4:1]),
        .S({\clk_count_reg_n_0_[4] ,\clk_count_reg_n_0_[3] ,\clk_count_reg_n_0_[2] ,\clk_count_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[5]),
        .Q(\clk_count_reg_n_0_[5] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[6]),
        .Q(\clk_count_reg_n_0_[6] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[7]),
        .Q(\clk_count_reg_n_0_[7] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[8]),
        .Q(\clk_count_reg_n_0_[8] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[8]_i_2 
       (.CI(\clk_count_reg[4]_i_2_n_0 ),
        .CO({\clk_count_reg[8]_i_2_n_0 ,\NLW_clk_count_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[8:5]),
        .S({\clk_count_reg_n_0_[8] ,\clk_count_reg_n_0_[7] ,\clk_count_reg_n_0_[6] ,\clk_count_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(clk_BUFG),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[9]),
        .Q(\clk_count_reg_n_0_[9] ),
        .R(reset_Data));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry
       (.CI(\<const0> ),
        .CO({coolDownCounter0_carry_n_0,NLW_coolDownCounter0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\coolDownCounter_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[4:1]),
        .S({\coolDownCounter_reg_n_0_[4] ,\coolDownCounter_reg_n_0_[3] ,\coolDownCounter_reg_n_0_[2] ,\coolDownCounter_reg_n_0_[1] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__0
       (.CI(coolDownCounter0_carry_n_0),
        .CO({coolDownCounter0_carry__0_n_0,NLW_coolDownCounter0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[8:5]),
        .S({\coolDownCounter_reg_n_0_[8] ,\coolDownCounter_reg_n_0_[7] ,\coolDownCounter_reg_n_0_[6] ,\coolDownCounter_reg_n_0_[5] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__1
       (.CI(coolDownCounter0_carry__0_n_0),
        .CO({coolDownCounter0_carry__1_n_0,NLW_coolDownCounter0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[12:9]),
        .S({\coolDownCounter_reg_n_0_[12] ,\coolDownCounter_reg_n_0_[11] ,\coolDownCounter_reg_n_0_[10] ,\coolDownCounter_reg_n_0_[9] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__2
       (.CI(coolDownCounter0_carry__1_n_0),
        .CO({coolDownCounter0_carry__2_n_0,NLW_coolDownCounter0_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[16:13]),
        .S({\coolDownCounter_reg_n_0_[16] ,\coolDownCounter_reg_n_0_[15] ,\coolDownCounter_reg_n_0_[14] ,\coolDownCounter_reg_n_0_[13] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__3
       (.CI(coolDownCounter0_carry__2_n_0),
        .CO({coolDownCounter0_carry__3_n_0,NLW_coolDownCounter0_carry__3_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[20:17]),
        .S({\coolDownCounter_reg_n_0_[20] ,\coolDownCounter_reg_n_0_[19] ,\coolDownCounter_reg_n_0_[18] ,\coolDownCounter_reg_n_0_[17] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__4
       (.CI(coolDownCounter0_carry__3_n_0),
        .CO({coolDownCounter0_carry__4_n_0,NLW_coolDownCounter0_carry__4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[24:21]),
        .S({\coolDownCounter_reg_n_0_[24] ,\coolDownCounter_reg_n_0_[23] ,\coolDownCounter_reg_n_0_[22] ,\coolDownCounter_reg_n_0_[21] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__5
       (.CI(coolDownCounter0_carry__4_n_0),
        .CO({coolDownCounter0_carry__5_n_0,NLW_coolDownCounter0_carry__5_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[28:25]),
        .S({\coolDownCounter_reg_n_0_[28] ,\coolDownCounter_reg_n_0_[27] ,\coolDownCounter_reg_n_0_[26] ,\coolDownCounter_reg_n_0_[25] }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 coolDownCounter0_carry__6
       (.CI(coolDownCounter0_carry__5_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in10[31:29]),
        .S({\<const0> ,\coolDownCounter_reg_n_0_[31] ,\coolDownCounter_reg_n_0_[30] ,\coolDownCounter_reg_n_0_[29] }));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \coolDownCounter[0]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(\coolDownCounter_reg_n_0_[0] ),
        .O(\coolDownCounter[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \coolDownCounter[31]_i_1 
       (.I0(\coolDownCounter[31]_i_2_n_0 ),
        .I1(state[2]),
        .I2(state[0]),
        .O(\coolDownCounter[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \coolDownCounter[31]_i_10 
       (.I0(\coolDownCounter_reg_n_0_[29] ),
        .I1(\coolDownCounter_reg_n_0_[30] ),
        .I2(\coolDownCounter_reg_n_0_[25] ),
        .I3(\coolDownCounter_reg_n_0_[26] ),
        .O(\coolDownCounter[31]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \coolDownCounter[31]_i_11 
       (.I0(\coolDownCounter_reg_n_0_[10] ),
        .I1(\coolDownCounter_reg_n_0_[9] ),
        .O(\coolDownCounter[31]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \coolDownCounter[31]_i_12 
       (.I0(\coolDownCounter_reg_n_0_[2] ),
        .I1(\coolDownCounter_reg_n_0_[4] ),
        .I2(\coolDownCounter_reg_n_0_[3] ),
        .O(\coolDownCounter[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \coolDownCounter[31]_i_13 
       (.I0(\coolDownCounter_reg_n_0_[5] ),
        .I1(\coolDownCounter_reg_n_0_[0] ),
        .I2(\coolDownCounter_reg_n_0_[1] ),
        .I3(\coolDownCounter_reg_n_0_[6] ),
        .O(\coolDownCounter[31]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h00000000555575FF)) 
    \coolDownCounter[31]_i_2 
       (.I0(state[0]),
        .I1(\coolDownCounter[31]_i_3_n_0 ),
        .I2(\coolDownCounter[31]_i_4_n_0 ),
        .I3(\coolDownCounter_reg_n_0_[23] ),
        .I4(\coolDownCounter[31]_i_5_n_0 ),
        .I5(\coolDownCounter[31]_i_6_n_0 ),
        .O(\coolDownCounter[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \coolDownCounter[31]_i_3 
       (.I0(\coolDownCounter_reg_n_0_[22] ),
        .I1(\coolDownCounter_reg_n_0_[21] ),
        .O(\coolDownCounter[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF11111555)) 
    \coolDownCounter[31]_i_4 
       (.I0(\coolDownCounter[31]_i_7_n_0 ),
        .I1(\coolDownCounter_reg_n_0_[15] ),
        .I2(\coolDownCounter_reg_n_0_[12] ),
        .I3(\coolDownCounter[31]_i_8_n_0 ),
        .I4(\coolDownCounter[31]_i_9_n_0 ),
        .I5(\FSM_sequential_state[2]_i_5_n_0 ),
        .O(\coolDownCounter[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \coolDownCounter[31]_i_5 
       (.I0(\coolDownCounter_reg_n_0_[31] ),
        .I1(\coolDownCounter_reg_n_0_[24] ),
        .I2(\coolDownCounter_reg_n_0_[28] ),
        .I3(\coolDownCounter_reg_n_0_[27] ),
        .I4(\coolDownCounter[31]_i_10_n_0 ),
        .O(\coolDownCounter[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hFFFFF4FF)) 
    \coolDownCounter[31]_i_6 
       (.I0(state[0]),
        .I1(state1_carry__2_n_0),
        .I2(state[2]),
        .I3(state[1]),
        .I4(reset_Data),
        .O(\coolDownCounter[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \coolDownCounter[31]_i_7 
       (.I0(\coolDownCounter_reg_n_0_[18] ),
        .I1(\coolDownCounter_reg_n_0_[16] ),
        .I2(\coolDownCounter_reg_n_0_[17] ),
        .O(\coolDownCounter[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBABBBABABABA)) 
    \coolDownCounter[31]_i_8 
       (.I0(\coolDownCounter_reg_n_0_[11] ),
        .I1(\coolDownCounter[31]_i_11_n_0 ),
        .I2(\coolDownCounter_reg_n_0_[8] ),
        .I3(\coolDownCounter[31]_i_12_n_0 ),
        .I4(\coolDownCounter[31]_i_13_n_0 ),
        .I5(\coolDownCounter_reg_n_0_[7] ),
        .O(\coolDownCounter[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \coolDownCounter[31]_i_9 
       (.I0(\coolDownCounter_reg_n_0_[14] ),
        .I1(\coolDownCounter_reg_n_0_[13] ),
        .O(\coolDownCounter[31]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[0] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(\coolDownCounter[0]_i_1_n_0 ),
        .Q(\coolDownCounter_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[10] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[10]),
        .Q(\coolDownCounter_reg_n_0_[10] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[11] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[11]),
        .Q(\coolDownCounter_reg_n_0_[11] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[12] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[12]),
        .Q(\coolDownCounter_reg_n_0_[12] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[13] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[13]),
        .Q(\coolDownCounter_reg_n_0_[13] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[14] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[14]),
        .Q(\coolDownCounter_reg_n_0_[14] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[15] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[15]),
        .Q(\coolDownCounter_reg_n_0_[15] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[16] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[16]),
        .Q(\coolDownCounter_reg_n_0_[16] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[17] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[17]),
        .Q(\coolDownCounter_reg_n_0_[17] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[18] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[18]),
        .Q(\coolDownCounter_reg_n_0_[18] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[19] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[19]),
        .Q(\coolDownCounter_reg_n_0_[19] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[1] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[1]),
        .Q(\coolDownCounter_reg_n_0_[1] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[20] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[20]),
        .Q(\coolDownCounter_reg_n_0_[20] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[21] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[21]),
        .Q(\coolDownCounter_reg_n_0_[21] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[22] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[22]),
        .Q(\coolDownCounter_reg_n_0_[22] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[23] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[23]),
        .Q(\coolDownCounter_reg_n_0_[23] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[24] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[24]),
        .Q(\coolDownCounter_reg_n_0_[24] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[25] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[25]),
        .Q(\coolDownCounter_reg_n_0_[25] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[26] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[26]),
        .Q(\coolDownCounter_reg_n_0_[26] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[27] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[27]),
        .Q(\coolDownCounter_reg_n_0_[27] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[28] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[28]),
        .Q(\coolDownCounter_reg_n_0_[28] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[29] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[29]),
        .Q(\coolDownCounter_reg_n_0_[29] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[2] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[2]),
        .Q(\coolDownCounter_reg_n_0_[2] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[30] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[30]),
        .Q(\coolDownCounter_reg_n_0_[30] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[31] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[31]),
        .Q(\coolDownCounter_reg_n_0_[31] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[3] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[3]),
        .Q(\coolDownCounter_reg_n_0_[3] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[4] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[4]),
        .Q(\coolDownCounter_reg_n_0_[4] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[5] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[5]),
        .Q(\coolDownCounter_reg_n_0_[5] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[6] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[6]),
        .Q(\coolDownCounter_reg_n_0_[6] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[7] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[7]),
        .Q(\coolDownCounter_reg_n_0_[7] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[8] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[8]),
        .Q(\coolDownCounter_reg_n_0_[8] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[9] 
       (.C(clk_BUFG),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in10[9]),
        .Q(\coolDownCounter_reg_n_0_[9] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  counter counter_RO
       (.clear(ro_counter_reset),
        .out(ro_counter_count),
        .ro_out(myROOutput));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 data_reg1_carry
       (.CI(\<const0> ),
        .CO({data_reg1_carry_n_0,NLW_data_reg1_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({data_reg1_carry_i_1_n_0,data_reg1_carry_i_2_n_0,data_reg1_carry_i_3_n_0,data_reg1_carry_i_4_n_0}),
        .S({data_reg1_carry_i_5_n_0,data_reg1_carry_i_6_n_0,data_reg1_carry_i_7_n_0,data_reg1_carry_i_8_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 data_reg1_carry__0
       (.CI(data_reg1_carry_n_0),
        .CO({data_reg1_carry__0_n_0,NLW_data_reg1_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({data_reg1_carry__0_i_1_n_0,data_reg1_carry__0_i_2_n_0,data_reg1_carry__0_i_3_n_0,data_reg1_carry__0_i_4_n_0}),
        .S({data_reg1_carry__0_i_5_n_0,data_reg1_carry__0_i_6_n_0,data_reg1_carry__0_i_7_n_0,data_reg1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__0_i_1
       (.I0(data_reg1_carry__2_0[15]),
        .I1(ro_counter_count[15]),
        .I2(data_reg1_carry__2_0[14]),
        .I3(ro_counter_count[14]),
        .O(data_reg1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__0_i_2
       (.I0(data_reg1_carry__2_0[13]),
        .I1(ro_counter_count[13]),
        .I2(data_reg1_carry__2_0[12]),
        .I3(ro_counter_count[12]),
        .O(data_reg1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__0_i_3
       (.I0(data_reg1_carry__2_0[11]),
        .I1(ro_counter_count[11]),
        .I2(data_reg1_carry__2_0[10]),
        .I3(ro_counter_count[10]),
        .O(data_reg1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__0_i_4
       (.I0(data_reg1_carry__2_0[9]),
        .I1(ro_counter_count[9]),
        .I2(data_reg1_carry__2_0[8]),
        .I3(ro_counter_count[8]),
        .O(data_reg1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__0_i_5
       (.I0(ro_counter_count[15]),
        .I1(data_reg1_carry__2_0[15]),
        .I2(ro_counter_count[14]),
        .I3(data_reg1_carry__2_0[14]),
        .O(data_reg1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__0_i_6
       (.I0(ro_counter_count[13]),
        .I1(data_reg1_carry__2_0[13]),
        .I2(ro_counter_count[12]),
        .I3(data_reg1_carry__2_0[12]),
        .O(data_reg1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__0_i_7
       (.I0(ro_counter_count[11]),
        .I1(data_reg1_carry__2_0[11]),
        .I2(ro_counter_count[10]),
        .I3(data_reg1_carry__2_0[10]),
        .O(data_reg1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__0_i_8
       (.I0(ro_counter_count[9]),
        .I1(data_reg1_carry__2_0[9]),
        .I2(ro_counter_count[8]),
        .I3(data_reg1_carry__2_0[8]),
        .O(data_reg1_carry__0_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 data_reg1_carry__1
       (.CI(data_reg1_carry__0_n_0),
        .CO({data_reg1_carry__1_n_0,NLW_data_reg1_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({data_reg1_carry__1_i_1_n_0,data_reg1_carry__1_i_2_n_0,data_reg1_carry__1_i_3_n_0,data_reg1_carry__1_i_4_n_0}),
        .S({data_reg1_carry__1_i_5_n_0,data_reg1_carry__1_i_6_n_0,data_reg1_carry__1_i_7_n_0,data_reg1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__1_i_1
       (.I0(data_reg1_carry__2_0[23]),
        .I1(ro_counter_count[23]),
        .I2(data_reg1_carry__2_0[22]),
        .I3(ro_counter_count[22]),
        .O(data_reg1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__1_i_2
       (.I0(data_reg1_carry__2_0[21]),
        .I1(ro_counter_count[21]),
        .I2(data_reg1_carry__2_0[20]),
        .I3(ro_counter_count[20]),
        .O(data_reg1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__1_i_3
       (.I0(data_reg1_carry__2_0[19]),
        .I1(ro_counter_count[19]),
        .I2(data_reg1_carry__2_0[18]),
        .I3(ro_counter_count[18]),
        .O(data_reg1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__1_i_4
       (.I0(data_reg1_carry__2_0[17]),
        .I1(ro_counter_count[17]),
        .I2(data_reg1_carry__2_0[16]),
        .I3(ro_counter_count[16]),
        .O(data_reg1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__1_i_5
       (.I0(ro_counter_count[23]),
        .I1(data_reg1_carry__2_0[23]),
        .I2(ro_counter_count[22]),
        .I3(data_reg1_carry__2_0[22]),
        .O(data_reg1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__1_i_6
       (.I0(ro_counter_count[21]),
        .I1(data_reg1_carry__2_0[21]),
        .I2(ro_counter_count[20]),
        .I3(data_reg1_carry__2_0[20]),
        .O(data_reg1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__1_i_7
       (.I0(ro_counter_count[19]),
        .I1(data_reg1_carry__2_0[19]),
        .I2(ro_counter_count[18]),
        .I3(data_reg1_carry__2_0[18]),
        .O(data_reg1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__1_i_8
       (.I0(ro_counter_count[17]),
        .I1(data_reg1_carry__2_0[17]),
        .I2(ro_counter_count[16]),
        .I3(data_reg1_carry__2_0[16]),
        .O(data_reg1_carry__1_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 data_reg1_carry__2
       (.CI(data_reg1_carry__1_n_0),
        .CO({data_reg1__15,NLW_data_reg1_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({data_reg1_carry__2_i_1_n_0,data_reg1_carry__2_i_2_n_0,data_reg1_carry__2_i_3_n_0,data_reg1_carry__2_i_4_n_0}),
        .S({data_reg1_carry__2_i_5_n_0,data_reg1_carry__2_i_6_n_0,data_reg1_carry__2_i_7_n_0,data_reg1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__2_i_1
       (.I0(data_reg1_carry__2_0[31]),
        .I1(ro_counter_count[31]),
        .I2(data_reg1_carry__2_0[30]),
        .I3(ro_counter_count[30]),
        .O(data_reg1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__2_i_2
       (.I0(data_reg1_carry__2_0[29]),
        .I1(ro_counter_count[29]),
        .I2(data_reg1_carry__2_0[28]),
        .I3(ro_counter_count[28]),
        .O(data_reg1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__2_i_3
       (.I0(data_reg1_carry__2_0[27]),
        .I1(ro_counter_count[27]),
        .I2(data_reg1_carry__2_0[26]),
        .I3(ro_counter_count[26]),
        .O(data_reg1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry__2_i_4
       (.I0(data_reg1_carry__2_0[25]),
        .I1(ro_counter_count[25]),
        .I2(data_reg1_carry__2_0[24]),
        .I3(ro_counter_count[24]),
        .O(data_reg1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__2_i_5
       (.I0(ro_counter_count[31]),
        .I1(data_reg1_carry__2_0[31]),
        .I2(ro_counter_count[30]),
        .I3(data_reg1_carry__2_0[30]),
        .O(data_reg1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__2_i_6
       (.I0(ro_counter_count[29]),
        .I1(data_reg1_carry__2_0[29]),
        .I2(ro_counter_count[28]),
        .I3(data_reg1_carry__2_0[28]),
        .O(data_reg1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__2_i_7
       (.I0(ro_counter_count[27]),
        .I1(data_reg1_carry__2_0[27]),
        .I2(ro_counter_count[26]),
        .I3(data_reg1_carry__2_0[26]),
        .O(data_reg1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry__2_i_8
       (.I0(ro_counter_count[25]),
        .I1(data_reg1_carry__2_0[25]),
        .I2(ro_counter_count[24]),
        .I3(data_reg1_carry__2_0[24]),
        .O(data_reg1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry_i_1
       (.I0(data_reg1_carry__2_0[7]),
        .I1(ro_counter_count[7]),
        .I2(data_reg1_carry__2_0[6]),
        .I3(ro_counter_count[6]),
        .O(data_reg1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry_i_2
       (.I0(data_reg1_carry__2_0[5]),
        .I1(ro_counter_count[5]),
        .I2(data_reg1_carry__2_0[4]),
        .I3(ro_counter_count[4]),
        .O(data_reg1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry_i_3
       (.I0(data_reg1_carry__2_0[3]),
        .I1(ro_counter_count[3]),
        .I2(data_reg1_carry__2_0[2]),
        .I3(ro_counter_count[2]),
        .O(data_reg1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    data_reg1_carry_i_4
       (.I0(data_reg1_carry__2_0[1]),
        .I1(ro_counter_count[1]),
        .I2(data_reg1_carry__2_0[0]),
        .I3(ro_counter_count[0]),
        .O(data_reg1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry_i_5
       (.I0(ro_counter_count[7]),
        .I1(data_reg1_carry__2_0[7]),
        .I2(ro_counter_count[6]),
        .I3(data_reg1_carry__2_0[6]),
        .O(data_reg1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry_i_6
       (.I0(ro_counter_count[5]),
        .I1(data_reg1_carry__2_0[5]),
        .I2(ro_counter_count[4]),
        .I3(data_reg1_carry__2_0[4]),
        .O(data_reg1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry_i_7
       (.I0(ro_counter_count[3]),
        .I1(data_reg1_carry__2_0[3]),
        .I2(ro_counter_count[2]),
        .I3(data_reg1_carry__2_0[2]),
        .O(data_reg1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    data_reg1_carry_i_8
       (.I0(ro_counter_count[1]),
        .I1(data_reg1_carry__2_0[1]),
        .I2(ro_counter_count[0]),
        .I3(data_reg1_carry__2_0[0]),
        .O(data_reg1_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    \data_reg[7]_i_1 
       (.I0(reset_Data),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\data_reg[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000007)) 
    \data_reg[7]_i_2 
       (.I0(state[1]),
        .I1(state1_carry__2_n_0),
        .I2(state[0]),
        .I3(state[2]),
        .I4(reset_Data),
        .O(\data_reg[7]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_reg[7]_i_3 
       (.I0(data_reg1__15),
        .O(\data_reg[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[1]),
        .Q(output_Data[0]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[2]),
        .Q(output_Data[1]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[3]),
        .Q(output_Data[2]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[4]),
        .Q(output_Data[3]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[5]),
        .Q(output_Data[4]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[6]),
        .Q(output_Data[5]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(output_Data[7]),
        .Q(output_Data[6]),
        .R(\data_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\data_reg[7]_i_2_n_0 ),
        .D(\data_reg[7]_i_3_n_0 ),
        .Q(output_Data[7]),
        .R(\data_reg[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \debug_ro_counts_five_reg[31]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(reset_Data),
        .I5(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .O(\debug_ro_counts_five_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(debug_ro_counts_five[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_five[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_five[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_five[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_five[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_five[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_five[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_five[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_five[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_five[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_five[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_five[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_five[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_five[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_five[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(debug_ro_counts_five[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(\debug_ro_counts_five_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(debug_ro_counts_five[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(debug_ro_counts_five[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_five[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_five_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_five_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_five[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \debug_ro_counts_four_reg[31]_i_1 
       (.I0(reset_Data),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .O(\debug_ro_counts_four_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(debug_ro_counts_four[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_four[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_four[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_four[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_four[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_four[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_four[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_four[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_four[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_four[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_four[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(debug_ro_counts_four[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_four[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_four[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_four[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_four[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(debug_ro_counts_four[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_four_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(debug_ro_counts_four[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(debug_ro_counts_four[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(debug_ro_counts_four[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(debug_ro_counts_four[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(debug_ro_counts_four[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_four[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_four_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_four_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_four[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \debug_ro_counts_one_reg[31]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .I4(\index_reg_n_0_[3] ),
        .I5(reset_Data),
        .O(\debug_ro_counts_one_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(debug_ro_counts_one[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_one[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_one[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_one[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_one[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_one[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_one[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_one[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_one[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_one[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_one[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(debug_ro_counts_one[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_one[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_one[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_one[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_one[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(debug_ro_counts_one[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_one_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(debug_ro_counts_one[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(debug_ro_counts_one[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(debug_ro_counts_one[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(debug_ro_counts_one[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(debug_ro_counts_one[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_one[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_one_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_one_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_one[9]),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[0]_i_1 
       (.I0(debug_ro_counts_five[8]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [4]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[10]_i_1 
       (.I0(debug_ro_counts_five[18]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[10] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[11]_i_1 
       (.I0(debug_ro_counts_five[19]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[11] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[12]_i_1 
       (.I0(debug_ro_counts_five[20]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[12] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[13]_i_1 
       (.I0(debug_ro_counts_five[21]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[13] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[14]_i_1 
       (.I0(debug_ro_counts_five[22]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[14] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[15]_i_2 
       (.I0(debug_ro_counts_five[23]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[15]_1 ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[1]_i_1 
       (.I0(debug_ro_counts_five[9]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [5]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[2]_i_1 
       (.I0(debug_ro_counts_five[10]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [6]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[3]_i_1 
       (.I0(debug_ro_counts_five[11]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [7]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[4]_i_1 
       (.I0(debug_ro_counts_five[12]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [8]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[5]_i_1 
       (.I0(debug_ro_counts_five[13]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [9]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[6]_i_1 
       (.I0(debug_ro_counts_five[14]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [10]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[7]_i_1 
       (.I0(debug_ro_counts_five[15]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[7] [11]),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[8]_i_1 
       (.I0(debug_ro_counts_five[16]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[8] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_five[9]_i_1 
       (.I0(debug_ro_counts_five[17]),
        .I1(\debug_ro_counts_reg_five_reg[15] ),
        .I2(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[9] ),
        .O(\debug_ro_counts_five_reg_reg[23]_0 [9]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[0]_i_1 
       (.I0(debug_ro_counts_four[8]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [8]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[10]_i_1 
       (.I0(debug_ro_counts_four[18]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[10] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[11]_i_1 
       (.I0(debug_ro_counts_four[19]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[11] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[12]_i_1 
       (.I0(debug_ro_counts_four[20]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[12] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[13]_i_1 
       (.I0(debug_ro_counts_four[21]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[13] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[14]_i_1 
       (.I0(debug_ro_counts_four[22]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[14] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[15]_i_2 
       (.I0(debug_ro_counts_four[23]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[15]_1 ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[1]_i_1 
       (.I0(debug_ro_counts_four[9]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [9]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[2]_i_1 
       (.I0(debug_ro_counts_four[10]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [10]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[3]_i_1 
       (.I0(debug_ro_counts_four[11]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [11]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[4]_i_1 
       (.I0(debug_ro_counts_four[12]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [12]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[5]_i_1 
       (.I0(debug_ro_counts_four[13]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [13]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[6]_i_1 
       (.I0(debug_ro_counts_four[14]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [14]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[7]_i_1 
       (.I0(debug_ro_counts_four[15]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[7] [15]),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[8]_i_1 
       (.I0(debug_ro_counts_four[16]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[8] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_four[9]_i_1 
       (.I0(debug_ro_counts_four[17]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[9] ),
        .O(\debug_ro_counts_four_reg_reg[23]_0 [9]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[0]_i_1 
       (.I0(debug_ro_counts_one[8]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [8]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[10]_i_1 
       (.I0(debug_ro_counts_one[18]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[10] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[11]_i_1 
       (.I0(debug_ro_counts_one[19]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[11] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[12]_i_1 
       (.I0(debug_ro_counts_one[20]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[12] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[13]_i_1 
       (.I0(debug_ro_counts_one[21]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[13] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[14]_i_1 
       (.I0(debug_ro_counts_one[22]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[14] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[15]_i_2 
       (.I0(debug_ro_counts_one[23]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[15]_1 ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[1]_i_1 
       (.I0(debug_ro_counts_one[9]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [9]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[2]_i_1 
       (.I0(debug_ro_counts_one[10]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [10]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[3]_i_1 
       (.I0(debug_ro_counts_one[11]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [11]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[4]_i_1 
       (.I0(debug_ro_counts_one[12]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [12]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[5]_i_1 
       (.I0(debug_ro_counts_one[13]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [13]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[6]_i_1 
       (.I0(debug_ro_counts_one[14]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [14]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[7]_i_1 
       (.I0(debug_ro_counts_one[15]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [15]),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[8]_i_1 
       (.I0(debug_ro_counts_one[16]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[8] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_one[9]_i_1 
       (.I0(debug_ro_counts_one[17]),
        .I1(\debug_ro_counts_reg_one_reg[15] ),
        .I2(\debug_ro_counts_reg_one_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[9] ),
        .O(\debug_ro_counts_one_reg_reg[23]_0 [9]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[0]_i_1 
       (.I0(debug_ro_counts_seven[8]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [7]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [0]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[10]_i_1 
       (.I0(debug_ro_counts_seven[18]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[10] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [10]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[11]_i_1 
       (.I0(debug_ro_counts_seven[19]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[11] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [11]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[12]_i_1 
       (.I0(debug_ro_counts_seven[20]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[12] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [12]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[13]_i_1 
       (.I0(debug_ro_counts_seven[21]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[13] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [13]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[14]_i_1 
       (.I0(debug_ro_counts_seven[22]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[14] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [14]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[15]_i_2 
       (.I0(debug_ro_counts_seven[23]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[15] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [15]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[1]_i_1 
       (.I0(debug_ro_counts_seven[9]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [8]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [1]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[2]_i_1 
       (.I0(debug_ro_counts_seven[10]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [9]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [2]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[3]_i_1 
       (.I0(debug_ro_counts_seven[11]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [10]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [3]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[4]_i_1 
       (.I0(debug_ro_counts_seven[12]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [11]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [4]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[5]_i_1 
       (.I0(debug_ro_counts_seven[13]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [12]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [5]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[6]_i_1 
       (.I0(debug_ro_counts_seven[14]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [13]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [6]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[7]_i_1 
       (.I0(debug_ro_counts_seven[15]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [14]),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [7]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[8]_i_1 
       (.I0(debug_ro_counts_seven[16]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[8] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [8]));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \debug_ro_counts_reg_seven[9]_i_1 
       (.I0(debug_ro_counts_seven[17]),
        .I1(\debug_ro_counts_reg_seven_reg[0]_0 ),
        .I2(\debug_ro_counts_reg_seven_reg[0]_1 ),
        .I3(\debug_ro_counts_reg_seven_reg[0] ),
        .I4(\debug_ro_counts_reg_seven_reg[9] ),
        .O(\debug_ro_counts_seven_reg_reg[23]_0 [9]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[0]_i_1 
       (.I0(debug_ro_counts_six[8]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [0]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[10]_i_1 
       (.I0(debug_ro_counts_six[18]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[10] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[11]_i_1 
       (.I0(debug_ro_counts_six[19]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[11] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[12]_i_1 
       (.I0(debug_ro_counts_six[20]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[12] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[13]_i_1 
       (.I0(debug_ro_counts_six[21]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[13] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[14]_i_1 
       (.I0(debug_ro_counts_six[22]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[14] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[15]_i_2 
       (.I0(debug_ro_counts_six[23]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[15]_1 ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[1]_i_1 
       (.I0(debug_ro_counts_six[9]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [1]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[2]_i_1 
       (.I0(debug_ro_counts_six[10]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [2]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[3]_i_1 
       (.I0(debug_ro_counts_six[11]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [3]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[4]_i_1 
       (.I0(debug_ro_counts_six[12]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [4]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[5]_i_1 
       (.I0(debug_ro_counts_six[13]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [5]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[6]_i_1 
       (.I0(debug_ro_counts_six[14]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [6]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[7]_i_1 
       (.I0(debug_ro_counts_six[15]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[7] [7]),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[8]_i_1 
       (.I0(debug_ro_counts_six[16]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[8] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_six[9]_i_1 
       (.I0(debug_ro_counts_six[17]),
        .I1(\debug_ro_counts_reg_six_reg[15] ),
        .I2(\debug_ro_counts_reg_six_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_six_reg[9] ),
        .O(\debug_ro_counts_six_reg_reg[23]_0 [9]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[0]_i_1 
       (.I0(debug_ro_counts_three[8]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [3]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[10]_i_1 
       (.I0(debug_ro_counts_three[18]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[10] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[11]_i_1 
       (.I0(debug_ro_counts_three[19]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[11] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[12]_i_1 
       (.I0(debug_ro_counts_three[20]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[12] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[13]_i_1 
       (.I0(debug_ro_counts_three[21]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[13] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[14]_i_1 
       (.I0(debug_ro_counts_three[22]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[14] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[15]_i_2 
       (.I0(debug_ro_counts_three[23]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[15]_1 ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[1]_i_1 
       (.I0(debug_ro_counts_three[9]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [4]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[2]_i_1 
       (.I0(debug_ro_counts_three[10]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [5]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[3]_i_1 
       (.I0(debug_ro_counts_three[11]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [6]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[4]_i_1 
       (.I0(debug_ro_counts_three[12]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [7]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[5]_i_1 
       (.I0(debug_ro_counts_three[13]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [8]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[6]_i_1 
       (.I0(debug_ro_counts_three[14]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [9]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[7]_i_1 
       (.I0(debug_ro_counts_three[15]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[7] [10]),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[8]_i_1 
       (.I0(debug_ro_counts_three[16]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[8] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_three[9]_i_1 
       (.I0(debug_ro_counts_three[17]),
        .I1(\debug_ro_counts_reg_three_reg[15] ),
        .I2(\debug_ro_counts_reg_three_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[9] ),
        .O(\debug_ro_counts_three_reg_reg[23]_0 [9]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[0]_i_1 
       (.I0(debug_ro_counts_two[8]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [3]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[10]_i_1 
       (.I0(debug_ro_counts_two[18]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[10] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[11]_i_1 
       (.I0(debug_ro_counts_two[19]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[11] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[12]_i_1 
       (.I0(debug_ro_counts_two[20]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[12] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[13]_i_1 
       (.I0(debug_ro_counts_two[21]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[13] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[14]_i_1 
       (.I0(debug_ro_counts_two[22]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[14] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[15]_i_2 
       (.I0(debug_ro_counts_two[23]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[15]_1 ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[1]_i_1 
       (.I0(debug_ro_counts_two[9]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [4]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[2]_i_1 
       (.I0(debug_ro_counts_two[10]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [5]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[3]_i_1 
       (.I0(debug_ro_counts_two[11]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [6]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[4]_i_1 
       (.I0(debug_ro_counts_two[12]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [7]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[5]_i_1 
       (.I0(debug_ro_counts_two[13]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [8]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[6]_i_1 
       (.I0(debug_ro_counts_two[14]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [9]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[7]_i_1 
       (.I0(debug_ro_counts_two[15]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[7] [10]),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[8]_i_1 
       (.I0(debug_ro_counts_two[16]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[8] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_two[9]_i_1 
       (.I0(debug_ro_counts_two[17]),
        .I1(\debug_ro_counts_reg_two_reg[15] ),
        .I2(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_two_reg[9] ),
        .O(\debug_ro_counts_two_reg_reg[23]_0 [9]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[0]_i_1 
       (.I0(debug_ro_counts_zero[8]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [0]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [0]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[10]_i_1 
       (.I0(debug_ro_counts_zero[18]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[10] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [10]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[11]_i_1 
       (.I0(debug_ro_counts_zero[19]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[11] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [11]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[12]_i_1 
       (.I0(debug_ro_counts_zero[20]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[12] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [12]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[13]_i_1 
       (.I0(debug_ro_counts_zero[21]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[13] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [13]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[14]_i_1 
       (.I0(debug_ro_counts_zero[22]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[14] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [14]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[15]_i_2 
       (.I0(debug_ro_counts_zero[23]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[15]_1 ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [15]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[1]_i_1 
       (.I0(debug_ro_counts_zero[9]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [1]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [1]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[2]_i_1 
       (.I0(debug_ro_counts_zero[10]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [2]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [2]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[3]_i_1 
       (.I0(debug_ro_counts_zero[11]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [3]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [3]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[4]_i_1 
       (.I0(debug_ro_counts_zero[12]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [4]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [4]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[5]_i_1 
       (.I0(debug_ro_counts_zero[13]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [5]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [5]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[6]_i_1 
       (.I0(debug_ro_counts_zero[14]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [6]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [6]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[7]_i_1 
       (.I0(debug_ro_counts_zero[15]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[7] [7]),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [7]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[8]_i_1 
       (.I0(debug_ro_counts_zero[16]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[8] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [8]));
  LUT4 #(
    .INIT(16'hFE02)) 
    \debug_ro_counts_reg_zero[9]_i_1 
       (.I0(debug_ro_counts_zero[17]),
        .I1(\debug_ro_counts_reg_zero_reg[15] ),
        .I2(\debug_ro_counts_reg_zero_reg[15]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[9] ),
        .O(\debug_ro_counts_zero_reg_reg[23]_0 [9]));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \debug_ro_counts_seven_reg[31]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(reset_Data),
        .I5(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .O(\debug_ro_counts_seven_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_seven[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_seven[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_seven[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_seven[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_seven[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_seven[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_seven[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_seven[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_seven[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_seven[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(debug_ro_counts_seven[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_seven[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_seven[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_seven[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_seven[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(debug_ro_counts_seven[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_seven_reg_reg[31]_0 [8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(debug_ro_counts_seven[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(debug_ro_counts_seven[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(debug_ro_counts_seven[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(debug_ro_counts_seven[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(debug_ro_counts_seven[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_seven[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_seven_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_seven_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_seven[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \debug_ro_counts_six_reg[31]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(reset_Data),
        .I5(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .O(\debug_ro_counts_six_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_six[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_six[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_six[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_six[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_six[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_six[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_six[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_six[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_six[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_six[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_six[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_six[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_six[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_six[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(\debug_ro_counts_six_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_six[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_six_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_six_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_six[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \debug_ro_counts_three_reg[31]_i_1 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(reset_Data),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[1] ),
        .O(\debug_ro_counts_three_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_three[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_three[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_three[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_three[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_three[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_three[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_three[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_three[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_three[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_three[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_three[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_three[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_three[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_three[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(debug_ro_counts_three[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(\debug_ro_counts_three_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(debug_ro_counts_three[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(debug_ro_counts_three[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_three[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_three_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_three_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_three[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \debug_ro_counts_two_reg[31]_i_1 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(reset_Data),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[1] ),
        .O(\debug_ro_counts_two_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(debug_ro_counts_two[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_two[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_two[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_two[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_two[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_two[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_two[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_two[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_two[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_two[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_two[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_two[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_two[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_two[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_two[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(debug_ro_counts_two[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(\debug_ro_counts_two_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(debug_ro_counts_two[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_two[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_two_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_two_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_two[9]),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \debug_ro_counts_zero_reg[31]_i_1 
       (.I0(reset_Data),
        .I1(\index_reg_n_0_[3] ),
        .I2(\debug_ro_counts_zero_reg[31]_i_2_n_0 ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[2] ),
        .O(\debug_ro_counts_zero_reg[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \debug_ro_counts_zero_reg[31]_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state1_carry__2_n_0),
        .O(\debug_ro_counts_zero_reg[31]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[0]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[10] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[10]),
        .Q(debug_ro_counts_zero[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[11] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[11]),
        .Q(debug_ro_counts_zero[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[12] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[12]),
        .Q(debug_ro_counts_zero[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[13] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[13]),
        .Q(debug_ro_counts_zero[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[14] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[14]),
        .Q(debug_ro_counts_zero[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[15] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[15]),
        .Q(debug_ro_counts_zero[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[16] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[16]),
        .Q(debug_ro_counts_zero[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[17] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[17]),
        .Q(debug_ro_counts_zero[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[18] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[18]),
        .Q(debug_ro_counts_zero[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[19] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[19]),
        .Q(debug_ro_counts_zero[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[1]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[20] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[20]),
        .Q(debug_ro_counts_zero[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[21] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[21]),
        .Q(debug_ro_counts_zero[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[22] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[22]),
        .Q(debug_ro_counts_zero[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[23] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[23]),
        .Q(debug_ro_counts_zero[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[24] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[24]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[25] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[25]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[26] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[26]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[27] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[27]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[28] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[28]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[29] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[29]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[2]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[30] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[30]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[31] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[31]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[3]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[4]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[5]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[6]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[7]),
        .Q(\debug_ro_counts_zero_reg_reg[31]_0 [7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[8] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[8]),
        .Q(debug_ro_counts_zero[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \debug_ro_counts_zero_reg_reg[9] 
       (.C(clk_BUFG),
        .CE(\debug_ro_counts_zero_reg[31]_i_1_n_0 ),
        .D(ro_counter_count[9]),
        .Q(debug_ro_counts_zero[9]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFE02)) 
    gotData_reg_i_1
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(gotData),
        .O(gotData_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gotData_reg_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(gotData_reg_i_1_n_0),
        .Q(gotData),
        .R(reset_Data));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \index[0]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(state[1]),
        .O(index[0]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \index[1]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(state[1]),
        .O(index[1]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \index[2]_i_1 
       (.I0(state[1]),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .O(\index[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0111)) 
    \index[3]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state1_carry__2_n_0),
        .I3(state[1]),
        .O(\index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \index[3]_i_2 
       (.I0(state[1]),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .O(\index[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(clk_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(index[0]),
        .Q(\index_reg_n_0_[0] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(clk_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(index[1]),
        .Q(\index_reg_n_0_[1] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(clk_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(\index[2]_i_1_n_0 ),
        .Q(\index_reg_n_0_[2] ),
        .R(reset_Data));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[3] 
       (.C(clk_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(\index[3]_i_2_n_0 ),
        .Q(\index_reg_n_0_[3] ),
        .R(reset_Data));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[0]_i_1 
       (.I0(output_Data[0]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[1]_i_1 
       (.I0(output_Data[1]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[2]_i_1 
       (.I0(output_Data[2]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[3]_i_1 
       (.I0(output_Data[3]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[4]_i_1 
       (.I0(output_Data[4]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[5]_i_1 
       (.I0(output_Data[5]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[6]_i_1 
       (.I0(output_Data[6]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \phantom_output_data[7]_i_1 
       (.I0(beenReadFlag),
        .I1(rxHasData),
        .I2(gotData),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \phantom_output_data[7]_i_2 
       (.I0(output_Data[7]),
        .I1(rxHasData),
        .I2(gotData),
        .O(\data_reg_reg[7]_0 [7]));
  (* DONT_TOUCH *) 
  (* LAST = "3" *) 
  (* RO_TYPE = "2" *) 
  (* STAGES = "2" *) 
  ring_oscillator ring_oscillator_INST
       (.enable(\<const1> ),
        .ro_out(myROOutput));
  LUT3 #(
    .INIT(8'h45)) 
    ro_counter_reset_i_1
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(ro_counter_reset_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b0)) 
    ro_counter_reset_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(ro_counter_reset_i_1_n_0),
        .Q(ro_counter_reset),
        .S(reset_Data));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    rxHasData_i_1
       (.I0(gotData),
        .I1(rxHasData),
        .O(rxHasData0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 state1_carry
       (.CI(\<const0> ),
        .CO({state1_carry_n_0,NLW_state1_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({state1_carry_i_1_n_0,state1_carry_i_2_n_0,state1_carry_i_3_n_0,state1_carry_i_4_n_0}),
        .S({state1_carry_i_5_n_0,state1_carry_i_6_n_0,state1_carry_i_7_n_0,state1_carry_i_8_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 state1_carry__0
       (.CI(state1_carry_n_0),
        .CO({state1_carry__0_n_0,NLW_state1_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({state1_carry__0_i_1_n_0,state1_carry__0_i_2_n_0,state1_carry__0_i_3_n_0,state1_carry__0_i_4_n_0}),
        .S({state1_carry__0_i_5_n_0,state1_carry__0_i_6_n_0,state1_carry__0_i_7_n_0,state1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__0_i_1
       (.I0(Q[15]),
        .I1(\clk_count_reg_n_0_[15] ),
        .I2(Q[14]),
        .I3(\clk_count_reg_n_0_[14] ),
        .O(state1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__0_i_2
       (.I0(Q[13]),
        .I1(\clk_count_reg_n_0_[13] ),
        .I2(Q[12]),
        .I3(\clk_count_reg_n_0_[12] ),
        .O(state1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__0_i_3
       (.I0(Q[11]),
        .I1(\clk_count_reg_n_0_[11] ),
        .I2(Q[10]),
        .I3(\clk_count_reg_n_0_[10] ),
        .O(state1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__0_i_4
       (.I0(Q[9]),
        .I1(\clk_count_reg_n_0_[9] ),
        .I2(Q[8]),
        .I3(\clk_count_reg_n_0_[8] ),
        .O(state1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__0_i_5
       (.I0(\clk_count_reg_n_0_[15] ),
        .I1(Q[15]),
        .I2(\clk_count_reg_n_0_[14] ),
        .I3(Q[14]),
        .O(state1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__0_i_6
       (.I0(\clk_count_reg_n_0_[13] ),
        .I1(Q[13]),
        .I2(\clk_count_reg_n_0_[12] ),
        .I3(Q[12]),
        .O(state1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__0_i_7
       (.I0(\clk_count_reg_n_0_[11] ),
        .I1(Q[11]),
        .I2(\clk_count_reg_n_0_[10] ),
        .I3(Q[10]),
        .O(state1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__0_i_8
       (.I0(\clk_count_reg_n_0_[9] ),
        .I1(Q[9]),
        .I2(\clk_count_reg_n_0_[8] ),
        .I3(Q[8]),
        .O(state1_carry__0_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 state1_carry__1
       (.CI(state1_carry__0_n_0),
        .CO({state1_carry__1_n_0,NLW_state1_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({state1_carry__1_i_1_n_0,state1_carry__1_i_2_n_0,state1_carry__1_i_3_n_0,state1_carry__1_i_4_n_0}),
        .S({state1_carry__1_i_5_n_0,state1_carry__1_i_6_n_0,state1_carry__1_i_7_n_0,state1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__1_i_1
       (.I0(Q[23]),
        .I1(\clk_count_reg_n_0_[23] ),
        .I2(Q[22]),
        .I3(\clk_count_reg_n_0_[22] ),
        .O(state1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__1_i_2
       (.I0(Q[21]),
        .I1(\clk_count_reg_n_0_[21] ),
        .I2(Q[20]),
        .I3(\clk_count_reg_n_0_[20] ),
        .O(state1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__1_i_3
       (.I0(Q[19]),
        .I1(\clk_count_reg_n_0_[19] ),
        .I2(Q[18]),
        .I3(\clk_count_reg_n_0_[18] ),
        .O(state1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__1_i_4
       (.I0(Q[17]),
        .I1(\clk_count_reg_n_0_[17] ),
        .I2(Q[16]),
        .I3(\clk_count_reg_n_0_[16] ),
        .O(state1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__1_i_5
       (.I0(\clk_count_reg_n_0_[23] ),
        .I1(Q[23]),
        .I2(\clk_count_reg_n_0_[22] ),
        .I3(Q[22]),
        .O(state1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__1_i_6
       (.I0(\clk_count_reg_n_0_[21] ),
        .I1(Q[21]),
        .I2(\clk_count_reg_n_0_[20] ),
        .I3(Q[20]),
        .O(state1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__1_i_7
       (.I0(\clk_count_reg_n_0_[19] ),
        .I1(Q[19]),
        .I2(\clk_count_reg_n_0_[18] ),
        .I3(Q[18]),
        .O(state1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__1_i_8
       (.I0(\clk_count_reg_n_0_[17] ),
        .I1(Q[17]),
        .I2(\clk_count_reg_n_0_[16] ),
        .I3(Q[16]),
        .O(state1_carry__1_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 state1_carry__2
       (.CI(state1_carry__1_n_0),
        .CO({state1_carry__2_n_0,NLW_state1_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({state1_carry__2_i_1_n_0,state1_carry__2_i_2_n_0,state1_carry__2_i_3_n_0,state1_carry__2_i_4_n_0}),
        .S({state1_carry__2_i_5_n_0,state1_carry__2_i_6_n_0,state1_carry__2_i_7_n_0,state1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__2_i_1
       (.I0(Q[31]),
        .I1(\clk_count_reg_n_0_[31] ),
        .I2(Q[30]),
        .I3(\clk_count_reg_n_0_[30] ),
        .O(state1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__2_i_2
       (.I0(Q[29]),
        .I1(\clk_count_reg_n_0_[29] ),
        .I2(Q[28]),
        .I3(\clk_count_reg_n_0_[28] ),
        .O(state1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__2_i_3
       (.I0(Q[27]),
        .I1(\clk_count_reg_n_0_[27] ),
        .I2(Q[26]),
        .I3(\clk_count_reg_n_0_[26] ),
        .O(state1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry__2_i_4
       (.I0(Q[25]),
        .I1(\clk_count_reg_n_0_[25] ),
        .I2(Q[24]),
        .I3(\clk_count_reg_n_0_[24] ),
        .O(state1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__2_i_5
       (.I0(\clk_count_reg_n_0_[31] ),
        .I1(Q[31]),
        .I2(\clk_count_reg_n_0_[30] ),
        .I3(Q[30]),
        .O(state1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__2_i_6
       (.I0(\clk_count_reg_n_0_[29] ),
        .I1(Q[29]),
        .I2(\clk_count_reg_n_0_[28] ),
        .I3(Q[28]),
        .O(state1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__2_i_7
       (.I0(\clk_count_reg_n_0_[27] ),
        .I1(Q[27]),
        .I2(\clk_count_reg_n_0_[26] ),
        .I3(Q[26]),
        .O(state1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry__2_i_8
       (.I0(\clk_count_reg_n_0_[25] ),
        .I1(Q[25]),
        .I2(\clk_count_reg_n_0_[24] ),
        .I3(Q[24]),
        .O(state1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry_i_1
       (.I0(Q[7]),
        .I1(\clk_count_reg_n_0_[7] ),
        .I2(Q[6]),
        .I3(\clk_count_reg_n_0_[6] ),
        .O(state1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry_i_2
       (.I0(Q[5]),
        .I1(\clk_count_reg_n_0_[5] ),
        .I2(Q[4]),
        .I3(\clk_count_reg_n_0_[4] ),
        .O(state1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry_i_3
       (.I0(Q[3]),
        .I1(\clk_count_reg_n_0_[3] ),
        .I2(Q[2]),
        .I3(\clk_count_reg_n_0_[2] ),
        .O(state1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    state1_carry_i_4
       (.I0(Q[1]),
        .I1(\clk_count_reg_n_0_[1] ),
        .I2(Q[0]),
        .I3(\clk_count_reg_n_0_[0] ),
        .O(state1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry_i_5
       (.I0(\clk_count_reg_n_0_[7] ),
        .I1(Q[7]),
        .I2(\clk_count_reg_n_0_[6] ),
        .I3(Q[6]),
        .O(state1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry_i_6
       (.I0(\clk_count_reg_n_0_[5] ),
        .I1(Q[5]),
        .I2(\clk_count_reg_n_0_[4] ),
        .I3(Q[4]),
        .O(state1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry_i_7
       (.I0(\clk_count_reg_n_0_[3] ),
        .I1(Q[3]),
        .I2(\clk_count_reg_n_0_[2] ),
        .I3(Q[2]),
        .O(state1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    state1_carry_i_8
       (.I0(\clk_count_reg_n_0_[1] ),
        .I1(Q[1]),
        .I2(\clk_count_reg_n_0_[0] ),
        .I3(Q[0]),
        .O(state1_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF01FFFD)) 
    \tx_byte[0]_i_10 
       (.I0(debug_ro_counts_four[0]),
        .I1(\debug_ro_counts_reg_four_reg[15] ),
        .I2(\debug_ro_counts_reg_four_reg[15]_0 ),
        .I3(\tx_byte_reg[7]_1 ),
        .I4(\debug_ro_counts_reg_four_reg[7] [0]),
        .I5(tx_busy),
        .O(\debug_ro_counts_four_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBABBBBBBBBB)) 
    \tx_byte[0]_i_13 
       (.I0(\tx_byte[0]_i_13_0 [0]),
        .I1(\tx_byte[0]_i_16_n_0 ),
        .I2(tx_wire_debug),
        .I3(tx_busy),
        .I4(\tx_byte[0]_i_13_0 [1]),
        .I5(\tx_byte[0]_i_13_0 [2]),
        .O(\tx_byte[0]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000AC0000000000)) 
    \tx_byte[0]_i_16 
       (.I0(debug_ro_counts_one[0]),
        .I1(\debug_ro_counts_reg_one_reg[7] [0]),
        .I2(\tx_byte_reg[2]_0 ),
        .I3(\tx_byte[0]_i_13_0 [1]),
        .I4(\tx_byte[0]_i_13_0 [2]),
        .I5(\tx_byte_reg[2]_1 ),
        .O(\tx_byte[0]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hA200A2A2AAAAAAAA)) 
    \tx_byte[0]_i_6 
       (.I0(\tx_byte[0]_i_13_n_0 ),
        .I1(\debug_ro_counts_reg_five_reg[7] [0]),
        .I2(\tx_byte_reg[0] ),
        .I3(\tx_byte_reg[0]_0 ),
        .I4(debug_ro_counts_five[0]),
        .I5(\tx_byte_reg[0]_1 ),
        .O(\debug_ro_counts_reg_five_reg[0] ));
  LUT6 #(
    .INIT(64'hF0F0F0EE00000000)) 
    \tx_byte[0]_i_7 
       (.I0(\tx_byte[7]_i_6 ),
        .I1(debug_ro_counts_two[0]),
        .I2(\debug_ro_counts_reg_two_reg[7] [0]),
        .I3(\debug_ro_counts_reg_two_reg[15] ),
        .I4(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I5(\tx_byte[7]_i_6_0 ),
        .O(\out32counter_two_reg[2] ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[1]_i_3 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[1]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [1]),
        .O(\out32counter_four_reg[2]_3 ));
  LUT6 #(
    .INIT(64'hBABBAAAABAAAAAAA)) 
    \tx_byte[1]_i_6 
       (.I0(\tx_byte[1]_i_9_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_one[1]),
        .I3(\tx_byte_reg[2]_0 ),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(\debug_ro_counts_reg_one_reg[7] [1]),
        .O(\debug_ro_counts_one_reg_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hE000E000F0000000)) 
    \tx_byte[1]_i_9 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[1]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\debug_ro_counts_reg_seven_reg[7] [0]),
        .I5(\tx_byte[7]_i_3_2 ),
        .O(\tx_byte[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hBABBAAAABAAAAAAA)) 
    \tx_byte[2]_i_3 
       (.I0(\tx_byte[2]_i_7_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_one[2]),
        .I3(\tx_byte_reg[2]_0 ),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(\debug_ro_counts_reg_one_reg[7] [2]),
        .O(\debug_ro_counts_one_reg_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[2]_i_4 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[2]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [2]),
        .O(\out32counter_four_reg[2]_2 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[2]_i_7 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[2]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\tx_byte[7]_i_3_2 ),
        .I5(\debug_ro_counts_reg_seven_reg[7] [1]),
        .O(\tx_byte[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hBBBAAAAAABAAAAAA)) 
    \tx_byte[3]_i_3 
       (.I0(\tx_byte[3]_i_7_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(\tx_byte_reg[2]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [3]),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(debug_ro_counts_one[3]),
        .O(\debug_ro_counts_reg_one_reg[3] ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[3]_i_4 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[3]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [3]),
        .O(\out32counter_four_reg[2]_1 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[3]_i_7 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[3]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\tx_byte[7]_i_3_2 ),
        .I5(\debug_ro_counts_reg_seven_reg[7] [2]),
        .O(\tx_byte[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0FDD)) 
    \tx_byte[4]_i_1 
       (.I0(\tx_byte_reg[4] ),
        .I1(\tx_byte[4]_i_3_n_0 ),
        .I2(\tx_byte[4]_i_4_n_0 ),
        .I3(\tx_byte[0]_i_13_0 [0]),
        .I4(\tx_byte[4]_i_5_n_0 ),
        .I5(\tx_byte_reg[4]_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hBBBAAAAAABAAAAAA)) 
    \tx_byte[4]_i_3 
       (.I0(\tx_byte[4]_i_7_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(\tx_byte_reg[2]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[7] [4]),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(debug_ro_counts_one[4]),
        .O(\tx_byte[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0E000EEEEEEEEEEE)) 
    \tx_byte[4]_i_4 
       (.I0(\tx_byte[4]_i_8_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_three[4]),
        .I3(\tx_byte_reg[4]_1 ),
        .I4(\debug_ro_counts_reg_three_reg[7] [0]),
        .I5(\tx_byte_reg[4]_2 ),
        .O(\tx_byte[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[4]_i_5 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[4]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [4]),
        .O(\tx_byte[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[4]_i_7 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[4]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\tx_byte[7]_i_3_2 ),
        .I5(\debug_ro_counts_reg_seven_reg[7] [3]),
        .O(\tx_byte[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFCFCFCFDFFFFFFFD)) 
    \tx_byte[4]_i_8 
       (.I0(debug_ro_counts_five[4]),
        .I1(\tx_byte[7]_i_5_0 ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_five_reg[15] ),
        .I4(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I5(\debug_ro_counts_reg_five_reg[7] [1]),
        .O(\tx_byte[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0EE00000000)) 
    \tx_byte[4]_i_9 
       (.I0(\tx_byte[7]_i_6 ),
        .I1(debug_ro_counts_two[4]),
        .I2(\debug_ro_counts_reg_two_reg[7] [1]),
        .I3(\debug_ro_counts_reg_two_reg[15] ),
        .I4(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I5(\tx_byte[7]_i_6_0 ),
        .O(\out32counter_two_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[5]_i_11 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[5]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\tx_byte[7]_i_3_2 ),
        .I5(\debug_ro_counts_reg_seven_reg[7] [4]),
        .O(\tx_byte[5]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[5]_i_3 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[5]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [5]),
        .O(\out32counter_four_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hBABBAAAABAAAAAAA)) 
    \tx_byte[5]_i_6 
       (.I0(\tx_byte[5]_i_11_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_one[5]),
        .I3(\tx_byte_reg[2]_0 ),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(\debug_ro_counts_reg_one_reg[7] [5]),
        .O(\debug_ro_counts_one_reg_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hFCFCFCFDFFFFFFFD)) 
    \tx_byte[6]_i_10 
       (.I0(debug_ro_counts_five[6]),
        .I1(\tx_byte[7]_i_5_0 ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_five_reg[15] ),
        .I4(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I5(\debug_ro_counts_reg_five_reg[7] [2]),
        .O(\tx_byte[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hBABBAAAABAAAAAAA)) 
    \tx_byte[6]_i_11 
       (.I0(\tx_byte[6]_i_13_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_one[6]),
        .I3(\tx_byte_reg[2]_0 ),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(\debug_ro_counts_reg_one_reg[7] [6]),
        .O(\debug_ro_counts_one_reg_reg[6]_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[6]_i_13 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[6]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\tx_byte[7]_i_3_2 ),
        .I5(\debug_ro_counts_reg_seven_reg[7] [5]),
        .O(\tx_byte[6]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0E000EEEEEEEEEEE)) 
    \tx_byte[6]_i_4 
       (.I0(\tx_byte[6]_i_10_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_three[6]),
        .I3(\tx_byte_reg[4]_1 ),
        .I4(\debug_ro_counts_reg_three_reg[7] [1]),
        .I5(\tx_byte_reg[4]_2 ),
        .O(\debug_ro_counts_three_reg_reg[6]_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[6]_i_5 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[6]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [6]),
        .O(\out32counter_four_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0FFFDFD)) 
    \tx_byte[7]_i_1 
       (.I0(\tx_byte_reg[7] ),
        .I1(\tx_byte[7]_i_3_n_0 ),
        .I2(\tx_byte[7]_i_4_n_0 ),
        .I3(\tx_byte[7]_i_5_n_0 ),
        .I4(\tx_byte[0]_i_13_0 [0]),
        .I5(\tx_byte_reg[7]_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFCFCFCFDFFFFFFFD)) 
    \tx_byte[7]_i_14 
       (.I0(debug_ro_counts_five[7]),
        .I1(\tx_byte[7]_i_5_0 ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_five_reg[15] ),
        .I4(\debug_ro_counts_reg_five_reg[15]_0 ),
        .I5(\debug_ro_counts_reg_five_reg[7] [3]),
        .O(\tx_byte[7]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0EE00000000)) 
    \tx_byte[7]_i_17 
       (.I0(\tx_byte[7]_i_6 ),
        .I1(debug_ro_counts_two[7]),
        .I2(\debug_ro_counts_reg_two_reg[7] [2]),
        .I3(\debug_ro_counts_reg_two_reg[15] ),
        .I4(\debug_ro_counts_reg_two_reg[15]_0 ),
        .I5(\tx_byte[7]_i_6_0 ),
        .O(\out32counter_two_reg[2]_1 ));
  LUT6 #(
    .INIT(64'hBABBAAAABAAAAAAA)) 
    \tx_byte[7]_i_3 
       (.I0(\tx_byte[7]_i_9_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(debug_ro_counts_one[7]),
        .I3(\tx_byte_reg[2]_0 ),
        .I4(\tx_byte_reg[2]_1 ),
        .I5(\debug_ro_counts_reg_one_reg[7] [7]),
        .O(\tx_byte[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[7]_i_4 
       (.I0(\tx_byte_reg[7]_1 ),
        .I1(debug_ro_counts_four[7]),
        .I2(\tx_byte_reg[7]_2 ),
        .I3(\tx_byte_reg[7]_3 ),
        .I4(\tx_byte_reg[7]_4 ),
        .I5(\debug_ro_counts_reg_four_reg[7] [7]),
        .O(\tx_byte[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0EEE0E0E0EEEEEEE)) 
    \tx_byte[7]_i_5 
       (.I0(\tx_byte[7]_i_14_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(\tx_byte_reg[4]_2 ),
        .I3(debug_ro_counts_three[7]),
        .I4(\tx_byte_reg[4]_1 ),
        .I5(\debug_ro_counts_reg_three_reg[7] [2]),
        .O(\tx_byte[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hE000F000E0000000)) 
    \tx_byte[7]_i_9 
       (.I0(\debug_ro_counts_reg_seven_reg[0] ),
        .I1(debug_ro_counts_seven[7]),
        .I2(\tx_byte[7]_i_3_0 ),
        .I3(\tx_byte[7]_i_3_1 ),
        .I4(\tx_byte[7]_i_3_2 ),
        .I5(\debug_ro_counts_reg_seven_reg[7] [6]),
        .O(\tx_byte[7]_i_9_n_0 ));
endmodule

(* LAST = "3" *) (* RO_TYPE = "2" *) (* STAGES = "2" *) 
module ring_oscillator
   (enable,
    .ro_out(ro_wire[3]));
  input enable;
     output [3:0]ro_wire;

  wire \<const1> ;
  wire GND_1;
  wire VCC_2;
  wire enable;
  (* DONT_TOUCH *) wire [3:0]ro_wire;

  GND GND
       (.G(GND_1));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h4)) 
    ro_inv
       (.I0(ro_wire[0]),
        .I1(enable),
        .O(ro_wire[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    ro_ld
       (.CLR(GND_1),
        .D(ro_wire[3]),
        .G(\<const1> ),
        .GE(VCC_2),
        .Q(ro_wire[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT1 #(
    .INIT(2'h2)) 
    \ro_stages[0].ro_buf 
       (.I0(ro_wire[1]),
        .O(ro_wire[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT1 #(
    .INIT(2'h2)) 
    \ro_stages[1].ro_buf 
       (.I0(ro_wire[2]),
        .O(ro_wire[3]));
endmodule

module rxuart
   (\in32counter_one_reg[1] ,
    \in32counter_one_reg[0] ,
    \in32counter_one_reg[2] ,
    \in32counter_two_reg[1] ,
    \in32counter_two_reg[0] ,
    \in32counter_two_reg[2] ,
    \out32counter_one_reg[0] ,
    \out32counter_one_reg[2] ,
    \state_reg[3]_0 ,
    \state_reg[3]_1 ,
    \state_reg[3]_2 ,
    \out32counter_three_reg[2] ,
    \out32counter_four_reg[0] ,
    \out32counter_four_reg[2] ,
    \state_reg[3]_3 ,
    \out32counter_five_reg[0] ,
    \out32counter_five_reg[2] ,
    \state_reg[3]_4 ,
    \out32counter_six_reg[0] ,
    \out32counter_six_reg[2] ,
    \state_reg[3]_5 ,
    \state_reg[4] ,
    \state_reg[4]_0 ,
    \out32counter_seven_reg[2] ,
    \out32counter_zero_reg[0] ,
    \out32counter_zero_reg[2] ,
    \state_reg[3]_6 ,
    \o_data_reg[2]_0 ,
    \o_data_reg[7]_0 ,
    \o_data_reg[0]_0 ,
    D,
    E,
    rst_reg,
    \in32counter_one_reg[2]_0 ,
    \in32counter_two_reg[2]_0 ,
    rst,
    uart_rx_IBUF,
    clk_BUFG,
    \in32counter_one_reg[2]_1 ,
    \in32counter_one_reg[2]_2 ,
    \in32counter_one_reg[2]_3 ,
    tx_busy,
    \in32counter_one_reg[2]_4 ,
    \in32counter_two_reg[2]_1 ,
    \in32counter_two_reg[2]_2 ,
    \in32counter_two_reg[2]_3 ,
    \in32counter_two_reg[2]_4 ,
    \out32counter_one_reg[2]_0 ,
    \out32counter_one_reg[2]_1 ,
    Q,
    \out32counter_one_reg[2]_2 ,
    \out32counter_three_reg[2]_0 ,
    \out32counter_three_reg[2]_1 ,
    \out32counter_three_reg[2]_2 ,
    \out32counter_four_reg[2]_0 ,
    \out32counter_four_reg[2]_1 ,
    \out32counter_four_reg[2]_2 ,
    \out32counter_five_reg[2]_0 ,
    \out32counter_five_reg[2]_1 ,
    \out32counter_five_reg[2]_2 ,
    \out32counter_six_reg[2]_0 ,
    \out32counter_six_reg[2]_1 ,
    \out32counter_six_reg[2]_2 ,
    \out32counter_seven_reg[2]_0 ,
    \out32counter_seven_reg[2]_1 ,
    \out32counter_seven_reg[2]_2 ,
    \out32counter_zero_reg[2]_0 ,
    \out32counter_zero_reg[2]_1 ,
    \out32counter_zero_reg[2]_2 ,
    \out32counter_three_reg[0] ,
    \state_reg[4]_1 ,
    \state_reg[0]_0 ,
    \state_reg[0]_1 ,
    \state_reg[0]_2 ,
    \state_reg[0]_3 ,
    \state_reg[1]_0 ,
    \state_reg[1]_1 ,
    \state_reg[2]_0 ,
    \out32counter_zero_reg[0]_0 ,
    \out32counter_five_reg[0]_0 ,
    \out32counter_four_reg[0]_0 ,
    \out32counter_seven_reg[0] ,
    \state_reg[4]_2 ,
    \state_reg[4]_3 ,
    \state_reg[4]_4 ,
    \input_Data_reg[0] ,
    \out32counter_three_reg[0]_0 );
  output \in32counter_one_reg[1] ;
  output \in32counter_one_reg[0] ;
  output \in32counter_one_reg[2] ;
  output \in32counter_two_reg[1] ;
  output \in32counter_two_reg[0] ;
  output \in32counter_two_reg[2] ;
  output \out32counter_one_reg[0] ;
  output \out32counter_one_reg[2] ;
  output \state_reg[3]_0 ;
  output \state_reg[3]_1 ;
  output \state_reg[3]_2 ;
  output \out32counter_three_reg[2] ;
  output \out32counter_four_reg[0] ;
  output \out32counter_four_reg[2] ;
  output \state_reg[3]_3 ;
  output \out32counter_five_reg[0] ;
  output \out32counter_five_reg[2] ;
  output \state_reg[3]_4 ;
  output \out32counter_six_reg[0] ;
  output \out32counter_six_reg[2] ;
  output \state_reg[3]_5 ;
  output \state_reg[4] ;
  output \state_reg[4]_0 ;
  output \out32counter_seven_reg[2] ;
  output \out32counter_zero_reg[0] ;
  output \out32counter_zero_reg[2] ;
  output \state_reg[3]_6 ;
  output \o_data_reg[2]_0 ;
  output [7:0]\o_data_reg[7]_0 ;
  output \o_data_reg[0]_0 ;
  output [3:0]D;
  output [0:0]E;
  output [0:0]rst_reg;
  output [1:0]\in32counter_one_reg[2]_0 ;
  output [1:0]\in32counter_two_reg[2]_0 ;
  input rst;
  input uart_rx_IBUF;
  input clk_BUFG;
  input \in32counter_one_reg[2]_1 ;
  input \in32counter_one_reg[2]_2 ;
  input \in32counter_one_reg[2]_3 ;
  input tx_busy;
  input \in32counter_one_reg[2]_4 ;
  input \in32counter_two_reg[2]_1 ;
  input \in32counter_two_reg[2]_2 ;
  input \in32counter_two_reg[2]_3 ;
  input \in32counter_two_reg[2]_4 ;
  input \out32counter_one_reg[2]_0 ;
  input \out32counter_one_reg[2]_1 ;
  input [4:0]Q;
  input \out32counter_one_reg[2]_2 ;
  input \out32counter_three_reg[2]_0 ;
  input \out32counter_three_reg[2]_1 ;
  input \out32counter_three_reg[2]_2 ;
  input \out32counter_four_reg[2]_0 ;
  input \out32counter_four_reg[2]_1 ;
  input \out32counter_four_reg[2]_2 ;
  input \out32counter_five_reg[2]_0 ;
  input \out32counter_five_reg[2]_1 ;
  input \out32counter_five_reg[2]_2 ;
  input \out32counter_six_reg[2]_0 ;
  input \out32counter_six_reg[2]_1 ;
  input \out32counter_six_reg[2]_2 ;
  input \out32counter_seven_reg[2]_0 ;
  input \out32counter_seven_reg[2]_1 ;
  input \out32counter_seven_reg[2]_2 ;
  input \out32counter_zero_reg[2]_0 ;
  input \out32counter_zero_reg[2]_1 ;
  input \out32counter_zero_reg[2]_2 ;
  input \out32counter_three_reg[0] ;
  input [3:0]\state_reg[4]_1 ;
  input \state_reg[0]_0 ;
  input \state_reg[0]_1 ;
  input \state_reg[0]_2 ;
  input \state_reg[0]_3 ;
  input \state_reg[1]_0 ;
  input \state_reg[1]_1 ;
  input \state_reg[2]_0 ;
  input \out32counter_zero_reg[0]_0 ;
  input \out32counter_five_reg[0]_0 ;
  input \out32counter_four_reg[0]_0 ;
  input \out32counter_seven_reg[0] ;
  input \state_reg[4]_2 ;
  input \state_reg[4]_3 ;
  input \state_reg[4]_4 ;
  input \input_Data_reg[0] ;
  input \out32counter_three_reg[0]_0 ;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]D;
  wire [0:0]E;
  wire [4:0]Q;
  wire [27:0]baud_counter;
  wire [27:1]baud_counter0__52;
  wire baud_counter0_carry__0_i_1_n_0;
  wire baud_counter0_carry__0_i_2_n_0;
  wire baud_counter0_carry__0_i_3_n_0;
  wire baud_counter0_carry__0_i_4_n_0;
  wire baud_counter0_carry__0_n_0;
  wire baud_counter0_carry__1_i_1_n_0;
  wire baud_counter0_carry__1_i_2_n_0;
  wire baud_counter0_carry__1_i_3_n_0;
  wire baud_counter0_carry__1_i_4_n_0;
  wire baud_counter0_carry__1_n_0;
  wire baud_counter0_carry__2_i_1_n_0;
  wire baud_counter0_carry__2_i_2_n_0;
  wire baud_counter0_carry__2_i_3_n_0;
  wire baud_counter0_carry__2_i_4_n_0;
  wire baud_counter0_carry__2_n_0;
  wire baud_counter0_carry__3_i_1_n_0;
  wire baud_counter0_carry__3_i_2_n_0;
  wire baud_counter0_carry__3_i_3_n_0;
  wire baud_counter0_carry__3_i_4_n_0;
  wire baud_counter0_carry__3_n_0;
  wire baud_counter0_carry__4_i_1_n_0;
  wire baud_counter0_carry__4_i_2_n_0;
  wire baud_counter0_carry__4_i_3_n_0;
  wire baud_counter0_carry__4_i_4_n_0;
  wire baud_counter0_carry__4_n_0;
  wire baud_counter0_carry__5_i_1_n_0;
  wire baud_counter0_carry__5_i_2_n_0;
  wire baud_counter0_carry__5_i_3_n_0;
  wire baud_counter0_carry_i_1_n_0;
  wire baud_counter0_carry_i_2_n_0;
  wire baud_counter0_carry_i_3_n_0;
  wire baud_counter0_carry_i_4_n_0;
  wire baud_counter0_carry_n_0;
  wire \baud_counter[0]_i_1_n_0 ;
  wire \baud_counter[27]_i_1__0_n_0 ;
  wire \chg_counter0_inferred__0/i__carry__0_n_0 ;
  wire \chg_counter0_inferred__0/i__carry_n_0 ;
  wire \chg_counter[0]_i_1_n_0 ;
  wire \chg_counter[0]_i_3_n_0 ;
  wire [27:0]chg_counter_reg;
  wire \chg_counter_reg[0]_i_2_n_0 ;
  wire \chg_counter_reg[0]_i_2_n_4 ;
  wire \chg_counter_reg[0]_i_2_n_5 ;
  wire \chg_counter_reg[0]_i_2_n_6 ;
  wire \chg_counter_reg[0]_i_2_n_7 ;
  wire \chg_counter_reg[12]_i_1_n_0 ;
  wire \chg_counter_reg[12]_i_1_n_4 ;
  wire \chg_counter_reg[12]_i_1_n_5 ;
  wire \chg_counter_reg[12]_i_1_n_6 ;
  wire \chg_counter_reg[12]_i_1_n_7 ;
  wire \chg_counter_reg[16]_i_1_n_0 ;
  wire \chg_counter_reg[16]_i_1_n_4 ;
  wire \chg_counter_reg[16]_i_1_n_5 ;
  wire \chg_counter_reg[16]_i_1_n_6 ;
  wire \chg_counter_reg[16]_i_1_n_7 ;
  wire \chg_counter_reg[20]_i_1_n_0 ;
  wire \chg_counter_reg[20]_i_1_n_4 ;
  wire \chg_counter_reg[20]_i_1_n_5 ;
  wire \chg_counter_reg[20]_i_1_n_6 ;
  wire \chg_counter_reg[20]_i_1_n_7 ;
  wire \chg_counter_reg[24]_i_1_n_4 ;
  wire \chg_counter_reg[24]_i_1_n_5 ;
  wire \chg_counter_reg[24]_i_1_n_6 ;
  wire \chg_counter_reg[24]_i_1_n_7 ;
  wire \chg_counter_reg[4]_i_1_n_0 ;
  wire \chg_counter_reg[4]_i_1_n_4 ;
  wire \chg_counter_reg[4]_i_1_n_5 ;
  wire \chg_counter_reg[4]_i_1_n_6 ;
  wire \chg_counter_reg[4]_i_1_n_7 ;
  wire \chg_counter_reg[8]_i_1_n_0 ;
  wire \chg_counter_reg[8]_i_1_n_4 ;
  wire \chg_counter_reg[8]_i_1_n_5 ;
  wire \chg_counter_reg[8]_i_1_n_6 ;
  wire \chg_counter_reg[8]_i_1_n_7 ;
  wire ck_uart_reg_n_0;
  wire clk_BUFG;
  wire [7:0]data_reg;
  wire data_reg0;
  wire half_baud_time;
  wire half_baud_time0;
  wire half_baud_time1__13;
  wire half_baud_time1_carry__0_i_1_n_0;
  wire half_baud_time1_carry__0_i_2_n_0;
  wire half_baud_time1_carry__0_i_3_n_0;
  wire half_baud_time1_carry__0_i_4_n_0;
  wire half_baud_time1_carry__0_i_5_n_0;
  wire half_baud_time1_carry__0_i_6_n_0;
  wire half_baud_time1_carry__0_i_7_n_0;
  wire half_baud_time1_carry__0_i_8_n_0;
  wire half_baud_time1_carry__0_n_0;
  wire half_baud_time1_carry__1_i_1_n_0;
  wire half_baud_time1_carry__1_i_2_n_0;
  wire half_baud_time1_carry__1_i_3_n_0;
  wire half_baud_time1_carry__1_i_4_n_0;
  wire half_baud_time1_carry__1_i_5_n_0;
  wire half_baud_time1_carry__1_i_6_n_0;
  wire half_baud_time1_carry__1_i_7_n_0;
  wire half_baud_time1_carry__1_i_8_n_0;
  wire half_baud_time1_carry__1_n_0;
  wire half_baud_time1_carry__2_i_1_n_0;
  wire half_baud_time1_carry__2_i_2_n_0;
  wire half_baud_time1_carry__2_i_3_n_0;
  wire half_baud_time1_carry__2_i_4_n_0;
  wire half_baud_time1_carry_i_1_n_0;
  wire half_baud_time1_carry_i_2_n_0;
  wire half_baud_time1_carry_i_3_n_0;
  wire half_baud_time1_carry_i_4_n_0;
  wire half_baud_time1_carry_i_5_n_0;
  wire half_baud_time1_carry_i_6_n_0;
  wire half_baud_time1_carry_n_0;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__1_i_1__0_n_0;
  wire i__carry__1_i_2__0_n_0;
  wire i__carry__1_i_3__0_n_0;
  wire i__carry__1_i_4__0_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire \in32counter_one_reg[0] ;
  wire \in32counter_one_reg[1] ;
  wire \in32counter_one_reg[2] ;
  wire [1:0]\in32counter_one_reg[2]_0 ;
  wire \in32counter_one_reg[2]_1 ;
  wire \in32counter_one_reg[2]_2 ;
  wire \in32counter_one_reg[2]_3 ;
  wire \in32counter_one_reg[2]_4 ;
  wire \in32counter_two_reg[0] ;
  wire \in32counter_two_reg[1] ;
  wire \in32counter_two_reg[2] ;
  wire [1:0]\in32counter_two_reg[2]_0 ;
  wire \in32counter_two_reg[2]_1 ;
  wire \in32counter_two_reg[2]_2 ;
  wire \in32counter_two_reg[2]_3 ;
  wire \in32counter_two_reg[2]_4 ;
  wire \input_Data_reg[0] ;
  wire line_synch;
  wire line_synch0;
  wire o_break0;
  wire o_break_reg_n_0;
  wire \o_data_reg[0]_0 ;
  wire \o_data_reg[2]_0 ;
  wire [7:0]\o_data_reg[7]_0 ;
  wire o_wr_i_1_n_0;
  wire o_wr_i_2_n_0;
  wire \out32counter_five[2]_i_2_n_0 ;
  wire \out32counter_five[2]_i_3_n_0 ;
  wire \out32counter_five[2]_i_5_n_0 ;
  wire \out32counter_five[2]_i_6_n_0 ;
  wire \out32counter_five_reg[0] ;
  wire \out32counter_five_reg[0]_0 ;
  wire \out32counter_five_reg[2] ;
  wire \out32counter_five_reg[2]_0 ;
  wire \out32counter_five_reg[2]_1 ;
  wire \out32counter_five_reg[2]_2 ;
  wire \out32counter_four[2]_i_2_n_0 ;
  wire \out32counter_four[2]_i_3_n_0 ;
  wire \out32counter_four[2]_i_5_n_0 ;
  wire \out32counter_four[2]_i_6_n_0 ;
  wire \out32counter_four_reg[0] ;
  wire \out32counter_four_reg[0]_0 ;
  wire \out32counter_four_reg[2] ;
  wire \out32counter_four_reg[2]_0 ;
  wire \out32counter_four_reg[2]_1 ;
  wire \out32counter_four_reg[2]_2 ;
  wire \out32counter_one[2]_i_2_n_0 ;
  wire \out32counter_one[2]_i_3_n_0 ;
  wire \out32counter_one[2]_i_4_n_0 ;
  wire \out32counter_one_reg[0] ;
  wire \out32counter_one_reg[2] ;
  wire \out32counter_one_reg[2]_0 ;
  wire \out32counter_one_reg[2]_1 ;
  wire \out32counter_one_reg[2]_2 ;
  wire \out32counter_seven[2]_i_2_n_0 ;
  wire \out32counter_seven[2]_i_3_n_0 ;
  wire \out32counter_seven[2]_i_5_n_0 ;
  wire \out32counter_seven_reg[0] ;
  wire \out32counter_seven_reg[2] ;
  wire \out32counter_seven_reg[2]_0 ;
  wire \out32counter_seven_reg[2]_1 ;
  wire \out32counter_seven_reg[2]_2 ;
  wire \out32counter_six[2]_i_2_n_0 ;
  wire \out32counter_six[2]_i_3_n_0 ;
  wire \out32counter_six[2]_i_4_n_0 ;
  wire \out32counter_six_reg[0] ;
  wire \out32counter_six_reg[2] ;
  wire \out32counter_six_reg[2]_0 ;
  wire \out32counter_six_reg[2]_1 ;
  wire \out32counter_six_reg[2]_2 ;
  wire \out32counter_three[2]_i_2_n_0 ;
  wire \out32counter_three[2]_i_3_n_0 ;
  wire \out32counter_three[2]_i_4_n_0 ;
  wire \out32counter_three[2]_i_6_n_0 ;
  wire \out32counter_three_reg[0] ;
  wire \out32counter_three_reg[0]_0 ;
  wire \out32counter_three_reg[2] ;
  wire \out32counter_three_reg[2]_0 ;
  wire \out32counter_three_reg[2]_1 ;
  wire \out32counter_three_reg[2]_2 ;
  wire \out32counter_zero[2]_i_2_n_0 ;
  wire \out32counter_zero[2]_i_3_n_0 ;
  wire \out32counter_zero[2]_i_4_n_0 ;
  wire \out32counter_zero_reg[0] ;
  wire \out32counter_zero_reg[0]_0 ;
  wire \out32counter_zero_reg[2] ;
  wire \out32counter_zero_reg[2]_0 ;
  wire \out32counter_zero_reg[2]_1 ;
  wire \out32counter_zero_reg[2]_2 ;
  wire pre_wr;
  wire pre_wr0;
  wire pre_wr_i_1_n_0;
  wire q_uart;
  wire qq_uart;
  wire rst;
  wire [0:0]rst_reg;
  wire rx_valid;
  wire sel;
  wire \state[0]_i_1__0_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[0]_i_3_n_0 ;
  wire \state[0]_i_4_n_0 ;
  wire \state[1]_i_1__0_n_0 ;
  wire \state[1]_i_2__0_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[2]_i_1__0_n_0 ;
  wire \state[2]_i_2_n_0 ;
  wire \state[2]_i_3_n_0 ;
  wire \state[2]_i_5_n_0 ;
  wire \state[3]_i_1__0_n_0 ;
  wire \state[3]_i_2__0_n_0 ;
  wire \state[3]_i_3__0_n_0 ;
  wire \state[3]_i_4_n_0 ;
  wire \state[4]_i_3_n_0 ;
  wire \state[4]_i_4_n_0 ;
  wire \state[4]_i_8_n_0 ;
  wire \state[4]_i_9_n_0 ;
  wire \state_reg[0]_0 ;
  wire \state_reg[0]_1 ;
  wire \state_reg[0]_2 ;
  wire \state_reg[0]_3 ;
  wire \state_reg[1]_0 ;
  wire \state_reg[1]_1 ;
  wire \state_reg[2]_0 ;
  wire \state_reg[3]_0 ;
  wire \state_reg[3]_1 ;
  wire \state_reg[3]_2 ;
  wire \state_reg[3]_3 ;
  wire \state_reg[3]_4 ;
  wire \state_reg[3]_5 ;
  wire \state_reg[3]_6 ;
  wire \state_reg[4] ;
  wire \state_reg[4]_0 ;
  wire [3:0]\state_reg[4]_1 ;
  wire \state_reg[4]_2 ;
  wire \state_reg[4]_3 ;
  wire \state_reg[4]_4 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire \state_reg_n_0_[3] ;
  wire tx_busy;
  wire uart_rx_IBUF;
  wire zero_baud_counter;
  wire zero_baud_counter_i_1__0_n_0;
  wire zero_baud_counter_i_2_n_0;
  wire zero_baud_counter_i_3_n_0;
  wire zero_baud_counter_i_4_n_0;
  wire zero_baud_counter_i_5__0_n_0;
  wire zero_baud_counter_i_6_n_0;
  wire zero_baud_counter_i_7_n_0;
  wire zero_baud_counter_i_8_n_0;
  wire [3:0]NLW_baud_counter0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_baud_counter0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_baud_counter0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_baud_counter0_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_baud_counter0_carry__3_CO_UNCONNECTED;
  wire [3:0]NLW_baud_counter0_carry__4_CO_UNCONNECTED;
  wire [3:0]\NLW_chg_counter0_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter0_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter0_inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter_reg[0]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_chg_counter_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_half_baud_time1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_half_baud_time1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_half_baud_time1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_half_baud_time1_carry__2_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry
       (.CI(\<const0> ),
        .CO({baud_counter0_carry_n_0,NLW_baud_counter0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(baud_counter[0]),
        .DI(baud_counter[4:1]),
        .O(baud_counter0__52[4:1]),
        .S({baud_counter0_carry_i_1_n_0,baud_counter0_carry_i_2_n_0,baud_counter0_carry_i_3_n_0,baud_counter0_carry_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry__0
       (.CI(baud_counter0_carry_n_0),
        .CO({baud_counter0_carry__0_n_0,NLW_baud_counter0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(baud_counter[8:5]),
        .O(baud_counter0__52[8:5]),
        .S({baud_counter0_carry__0_i_1_n_0,baud_counter0_carry__0_i_2_n_0,baud_counter0_carry__0_i_3_n_0,baud_counter0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__0_i_1
       (.I0(baud_counter[8]),
        .O(baud_counter0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__0_i_2
       (.I0(baud_counter[7]),
        .O(baud_counter0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__0_i_3
       (.I0(baud_counter[6]),
        .O(baud_counter0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__0_i_4
       (.I0(baud_counter[5]),
        .O(baud_counter0_carry__0_i_4_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry__1
       (.CI(baud_counter0_carry__0_n_0),
        .CO({baud_counter0_carry__1_n_0,NLW_baud_counter0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(baud_counter[12:9]),
        .O(baud_counter0__52[12:9]),
        .S({baud_counter0_carry__1_i_1_n_0,baud_counter0_carry__1_i_2_n_0,baud_counter0_carry__1_i_3_n_0,baud_counter0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__1_i_1
       (.I0(baud_counter[12]),
        .O(baud_counter0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__1_i_2
       (.I0(baud_counter[11]),
        .O(baud_counter0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__1_i_3
       (.I0(baud_counter[10]),
        .O(baud_counter0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__1_i_4
       (.I0(baud_counter[9]),
        .O(baud_counter0_carry__1_i_4_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry__2
       (.CI(baud_counter0_carry__1_n_0),
        .CO({baud_counter0_carry__2_n_0,NLW_baud_counter0_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(baud_counter[16:13]),
        .O(baud_counter0__52[16:13]),
        .S({baud_counter0_carry__2_i_1_n_0,baud_counter0_carry__2_i_2_n_0,baud_counter0_carry__2_i_3_n_0,baud_counter0_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__2_i_1
       (.I0(baud_counter[16]),
        .O(baud_counter0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__2_i_2
       (.I0(baud_counter[15]),
        .O(baud_counter0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__2_i_3
       (.I0(baud_counter[14]),
        .O(baud_counter0_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__2_i_4
       (.I0(baud_counter[13]),
        .O(baud_counter0_carry__2_i_4_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry__3
       (.CI(baud_counter0_carry__2_n_0),
        .CO({baud_counter0_carry__3_n_0,NLW_baud_counter0_carry__3_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(baud_counter[20:17]),
        .O(baud_counter0__52[20:17]),
        .S({baud_counter0_carry__3_i_1_n_0,baud_counter0_carry__3_i_2_n_0,baud_counter0_carry__3_i_3_n_0,baud_counter0_carry__3_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__3_i_1
       (.I0(baud_counter[20]),
        .O(baud_counter0_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__3_i_2
       (.I0(baud_counter[19]),
        .O(baud_counter0_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__3_i_3
       (.I0(baud_counter[18]),
        .O(baud_counter0_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__3_i_4
       (.I0(baud_counter[17]),
        .O(baud_counter0_carry__3_i_4_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry__4
       (.CI(baud_counter0_carry__3_n_0),
        .CO({baud_counter0_carry__4_n_0,NLW_baud_counter0_carry__4_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI(baud_counter[24:21]),
        .O(baud_counter0__52[24:21]),
        .S({baud_counter0_carry__4_i_1_n_0,baud_counter0_carry__4_i_2_n_0,baud_counter0_carry__4_i_3_n_0,baud_counter0_carry__4_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__4_i_1
       (.I0(baud_counter[24]),
        .O(baud_counter0_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__4_i_2
       (.I0(baud_counter[23]),
        .O(baud_counter0_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__4_i_3
       (.I0(baud_counter[22]),
        .O(baud_counter0_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__4_i_4
       (.I0(baud_counter[21]),
        .O(baud_counter0_carry__4_i_4_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 baud_counter0_carry__5
       (.CI(baud_counter0_carry__4_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,baud_counter[26:25]}),
        .O(baud_counter0__52[27:25]),
        .S({\<const0> ,baud_counter0_carry__5_i_1_n_0,baud_counter0_carry__5_i_2_n_0,baud_counter0_carry__5_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__5_i_1
       (.I0(baud_counter[27]),
        .O(baud_counter0_carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__5_i_2
       (.I0(baud_counter[26]),
        .O(baud_counter0_carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry__5_i_3
       (.I0(baud_counter[25]),
        .O(baud_counter0_carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry_i_1
       (.I0(baud_counter[4]),
        .O(baud_counter0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry_i_2
       (.I0(baud_counter[3]),
        .O(baud_counter0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry_i_3
       (.I0(baud_counter[2]),
        .O(baud_counter0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_counter0_carry_i_4
       (.I0(baud_counter[1]),
        .O(baud_counter0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \baud_counter[0]_i_1 
       (.I0(baud_counter[0]),
        .O(\baud_counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFCFCFCFCFCFC)) 
    \baud_counter[27]_i_1__0 
       (.I0(\state_reg_n_0_[0] ),
        .I1(zero_baud_counter),
        .I2(rst),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[3] ),
        .I5(\state_reg_n_0_[2] ),
        .O(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[0]_i_1_n_0 ),
        .Q(baud_counter[0]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[10] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[10]),
        .Q(baud_counter[10]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[11] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[11]),
        .Q(baud_counter[11]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[12] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[12]),
        .Q(baud_counter[12]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[13] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[13]),
        .Q(baud_counter[13]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[14] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[14]),
        .Q(baud_counter[14]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[15] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[15]),
        .Q(baud_counter[15]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[16] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[16]),
        .Q(baud_counter[16]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[17] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[17]),
        .Q(baud_counter[17]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[18] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[18]),
        .Q(baud_counter[18]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[19] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[19]),
        .Q(baud_counter[19]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[1]),
        .Q(baud_counter[1]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[20] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[20]),
        .Q(baud_counter[20]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[21] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[21]),
        .Q(baud_counter[21]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[22] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[22]),
        .Q(baud_counter[22]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[23] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[23]),
        .Q(baud_counter[23]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[24] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[24]),
        .Q(baud_counter[24]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[25] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[25]),
        .Q(baud_counter[25]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[26] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[26]),
        .Q(baud_counter[26]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[27] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[27]),
        .Q(baud_counter[27]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[2]),
        .Q(baud_counter[2]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDSE \baud_counter_reg[3] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[3]),
        .Q(baud_counter[3]),
        .S(\baud_counter[27]_i_1__0_n_0 ));
  FDSE \baud_counter_reg[4] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[4]),
        .Q(baud_counter[4]),
        .S(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[5] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[5]),
        .Q(baud_counter[5]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDSE \baud_counter_reg[6] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[6]),
        .Q(baud_counter[6]),
        .S(\baud_counter[27]_i_1__0_n_0 ));
  FDSE \baud_counter_reg[7] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[7]),
        .Q(baud_counter[7]),
        .S(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[8] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[8]),
        .Q(baud_counter[8]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  FDRE \baud_counter_reg[9] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(baud_counter0__52[9]),
        .Q(baud_counter[9]),
        .R(\baud_counter[27]_i_1__0_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter0_inferred__0/i__carry 
       (.CI(\<const0> ),
        .CO({\chg_counter0_inferred__0/i__carry_n_0 ,\NLW_chg_counter0_inferred__0/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter0_inferred__0/i__carry__0 
       (.CI(\chg_counter0_inferred__0/i__carry_n_0 ),
        .CO({\chg_counter0_inferred__0/i__carry__0_n_0 ,\NLW_chg_counter0_inferred__0/i__carry__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter0_inferred__0/i__carry__1 
       (.CI(\chg_counter0_inferred__0/i__carry__0_n_0 ),
        .CO({sel,\NLW_chg_counter0_inferred__0/i__carry__1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({i__carry__1_i_1__0_n_0,i__carry__1_i_2__0_n_0,i__carry__1_i_3__0_n_0,i__carry__1_i_4__0_n_0}));
  LUT3 #(
    .INIT(8'hBE)) 
    \chg_counter[0]_i_1 
       (.I0(rst),
        .I1(qq_uart),
        .I2(ck_uart_reg_n_0),
        .O(\chg_counter[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \chg_counter[0]_i_3 
       (.I0(chg_counter_reg[0]),
        .O(\chg_counter[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[0] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[0]_i_2_n_7 ),
        .Q(chg_counter_reg[0]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\chg_counter_reg[0]_i_2_n_0 ,\NLW_chg_counter_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\chg_counter_reg[0]_i_2_n_4 ,\chg_counter_reg[0]_i_2_n_5 ,\chg_counter_reg[0]_i_2_n_6 ,\chg_counter_reg[0]_i_2_n_7 }),
        .S({chg_counter_reg[3:1],\chg_counter[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[10] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[8]_i_1_n_5 ),
        .Q(chg_counter_reg[10]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[11] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[8]_i_1_n_4 ),
        .Q(chg_counter_reg[11]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[12] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[12]_i_1_n_7 ),
        .Q(chg_counter_reg[12]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[12]_i_1 
       (.CI(\chg_counter_reg[8]_i_1_n_0 ),
        .CO({\chg_counter_reg[12]_i_1_n_0 ,\NLW_chg_counter_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\chg_counter_reg[12]_i_1_n_4 ,\chg_counter_reg[12]_i_1_n_5 ,\chg_counter_reg[12]_i_1_n_6 ,\chg_counter_reg[12]_i_1_n_7 }),
        .S(chg_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[13] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[12]_i_1_n_6 ),
        .Q(chg_counter_reg[13]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[14] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[12]_i_1_n_5 ),
        .Q(chg_counter_reg[14]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[15] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[12]_i_1_n_4 ),
        .Q(chg_counter_reg[15]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[16] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[16]_i_1_n_7 ),
        .Q(chg_counter_reg[16]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[16]_i_1 
       (.CI(\chg_counter_reg[12]_i_1_n_0 ),
        .CO({\chg_counter_reg[16]_i_1_n_0 ,\NLW_chg_counter_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\chg_counter_reg[16]_i_1_n_4 ,\chg_counter_reg[16]_i_1_n_5 ,\chg_counter_reg[16]_i_1_n_6 ,\chg_counter_reg[16]_i_1_n_7 }),
        .S(chg_counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[17] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[16]_i_1_n_6 ),
        .Q(chg_counter_reg[17]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[18] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[16]_i_1_n_5 ),
        .Q(chg_counter_reg[18]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[19] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[16]_i_1_n_4 ),
        .Q(chg_counter_reg[19]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[1] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[0]_i_2_n_6 ),
        .Q(chg_counter_reg[1]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[20] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[20]_i_1_n_7 ),
        .Q(chg_counter_reg[20]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[20]_i_1 
       (.CI(\chg_counter_reg[16]_i_1_n_0 ),
        .CO({\chg_counter_reg[20]_i_1_n_0 ,\NLW_chg_counter_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\chg_counter_reg[20]_i_1_n_4 ,\chg_counter_reg[20]_i_1_n_5 ,\chg_counter_reg[20]_i_1_n_6 ,\chg_counter_reg[20]_i_1_n_7 }),
        .S(chg_counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[21] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[20]_i_1_n_6 ),
        .Q(chg_counter_reg[21]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[22] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[20]_i_1_n_5 ),
        .Q(chg_counter_reg[22]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[23] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[20]_i_1_n_4 ),
        .Q(chg_counter_reg[23]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[24] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[24]_i_1_n_7 ),
        .Q(chg_counter_reg[24]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[24]_i_1 
       (.CI(\chg_counter_reg[20]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\chg_counter_reg[24]_i_1_n_4 ,\chg_counter_reg[24]_i_1_n_5 ,\chg_counter_reg[24]_i_1_n_6 ,\chg_counter_reg[24]_i_1_n_7 }),
        .S(chg_counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[25] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[24]_i_1_n_6 ),
        .Q(chg_counter_reg[25]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[26] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[24]_i_1_n_5 ),
        .Q(chg_counter_reg[26]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[27] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[24]_i_1_n_4 ),
        .Q(chg_counter_reg[27]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[2] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[0]_i_2_n_5 ),
        .Q(chg_counter_reg[2]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[3] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[0]_i_2_n_4 ),
        .Q(chg_counter_reg[3]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[4] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[4]_i_1_n_7 ),
        .Q(chg_counter_reg[4]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[4]_i_1 
       (.CI(\chg_counter_reg[0]_i_2_n_0 ),
        .CO({\chg_counter_reg[4]_i_1_n_0 ,\NLW_chg_counter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\chg_counter_reg[4]_i_1_n_4 ,\chg_counter_reg[4]_i_1_n_5 ,\chg_counter_reg[4]_i_1_n_6 ,\chg_counter_reg[4]_i_1_n_7 }),
        .S(chg_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[5] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[4]_i_1_n_6 ),
        .Q(chg_counter_reg[5]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[6] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[4]_i_1_n_5 ),
        .Q(chg_counter_reg[6]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[7] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[4]_i_1_n_4 ),
        .Q(chg_counter_reg[7]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[8] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[8]_i_1_n_7 ),
        .Q(chg_counter_reg[8]),
        .R(\chg_counter[0]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \chg_counter_reg[8]_i_1 
       (.CI(\chg_counter_reg[4]_i_1_n_0 ),
        .CO({\chg_counter_reg[8]_i_1_n_0 ,\NLW_chg_counter_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\chg_counter_reg[8]_i_1_n_4 ,\chg_counter_reg[8]_i_1_n_5 ,\chg_counter_reg[8]_i_1_n_6 ,\chg_counter_reg[8]_i_1_n_7 }),
        .S(chg_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \chg_counter_reg[9] 
       (.C(clk_BUFG),
        .CE(sel),
        .D(\chg_counter_reg[8]_i_1_n_6 ),
        .Q(chg_counter_reg[9]),
        .R(\chg_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    ck_uart_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(qq_uart),
        .Q(ck_uart_reg_n_0),
        .R(rst));
  LUT6 #(
    .INIT(64'h0004000400040000)) 
    \clock_per_bit[31]_i_1 
       (.I0(\in32counter_one_reg[2]_3 ),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\in32counter_one_reg[2]_4 ),
        .I4(\in32counter_one_reg[2]_1 ),
        .I5(\in32counter_one_reg[2]_2 ),
        .O(\in32counter_one_reg[2]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \clock_per_bit[7]_i_1 
       (.I0(\in32counter_one_reg[2]_3 ),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\in32counter_one_reg[2]_4 ),
        .O(\in32counter_one_reg[2]_0 [0]));
  LUT5 #(
    .INIT(32'hAAAAA8AA)) 
    \data_reg[7]_i_1__0 
       (.I0(zero_baud_counter),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[3] ),
        .I4(\state_reg_n_0_[2] ),
        .O(data_reg0));
  FDRE \data_reg_reg[0] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[1]),
        .Q(data_reg[0]),
        .R(rst));
  FDRE \data_reg_reg[1] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[2]),
        .Q(data_reg[1]),
        .R(rst));
  FDRE \data_reg_reg[2] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[3]),
        .Q(data_reg[2]),
        .R(rst));
  FDRE \data_reg_reg[3] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[4]),
        .Q(data_reg[3]),
        .R(rst));
  FDRE \data_reg_reg[4] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[5]),
        .Q(data_reg[4]),
        .R(rst));
  FDRE \data_reg_reg[5] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[6]),
        .Q(data_reg[5]),
        .R(rst));
  FDRE \data_reg_reg[6] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(data_reg[7]),
        .Q(data_reg[6]),
        .R(rst));
  FDRE \data_reg_reg[7] 
       (.C(clk_BUFG),
        .CE(data_reg0),
        .D(ck_uart_reg_n_0),
        .Q(data_reg[7]),
        .R(rst));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 half_baud_time1_carry
       (.CI(\<const0> ),
        .CO({half_baud_time1_carry_n_0,NLW_half_baud_time1_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const1> ),
        .DI({chg_counter_reg[7],half_baud_time1_carry_i_1_n_0,half_baud_time1_carry_i_2_n_0,\<const0> }),
        .S({half_baud_time1_carry_i_3_n_0,half_baud_time1_carry_i_4_n_0,half_baud_time1_carry_i_5_n_0,half_baud_time1_carry_i_6_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 half_baud_time1_carry__0
       (.CI(half_baud_time1_carry_n_0),
        .CO({half_baud_time1_carry__0_n_0,NLW_half_baud_time1_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({half_baud_time1_carry__0_i_1_n_0,half_baud_time1_carry__0_i_2_n_0,half_baud_time1_carry__0_i_3_n_0,half_baud_time1_carry__0_i_4_n_0}),
        .S({half_baud_time1_carry__0_i_5_n_0,half_baud_time1_carry__0_i_6_n_0,half_baud_time1_carry__0_i_7_n_0,half_baud_time1_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__0_i_1
       (.I0(chg_counter_reg[15]),
        .I1(chg_counter_reg[14]),
        .O(half_baud_time1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__0_i_2
       (.I0(chg_counter_reg[13]),
        .I1(chg_counter_reg[12]),
        .O(half_baud_time1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__0_i_3
       (.I0(chg_counter_reg[10]),
        .I1(chg_counter_reg[11]),
        .O(half_baud_time1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__0_i_4
       (.I0(chg_counter_reg[8]),
        .I1(chg_counter_reg[9]),
        .O(half_baud_time1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__0_i_5
       (.I0(chg_counter_reg[14]),
        .I1(chg_counter_reg[15]),
        .O(half_baud_time1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__0_i_6
       (.I0(chg_counter_reg[12]),
        .I1(chg_counter_reg[13]),
        .O(half_baud_time1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__0_i_7
       (.I0(chg_counter_reg[11]),
        .I1(chg_counter_reg[10]),
        .O(half_baud_time1_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__0_i_8
       (.I0(chg_counter_reg[9]),
        .I1(chg_counter_reg[8]),
        .O(half_baud_time1_carry__0_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 half_baud_time1_carry__1
       (.CI(half_baud_time1_carry__0_n_0),
        .CO({half_baud_time1_carry__1_n_0,NLW_half_baud_time1_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({half_baud_time1_carry__1_i_1_n_0,half_baud_time1_carry__1_i_2_n_0,half_baud_time1_carry__1_i_3_n_0,half_baud_time1_carry__1_i_4_n_0}),
        .S({half_baud_time1_carry__1_i_5_n_0,half_baud_time1_carry__1_i_6_n_0,half_baud_time1_carry__1_i_7_n_0,half_baud_time1_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__1_i_1
       (.I0(chg_counter_reg[23]),
        .I1(chg_counter_reg[22]),
        .O(half_baud_time1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__1_i_2
       (.I0(chg_counter_reg[21]),
        .I1(chg_counter_reg[20]),
        .O(half_baud_time1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__1_i_3
       (.I0(chg_counter_reg[19]),
        .I1(chg_counter_reg[18]),
        .O(half_baud_time1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__1_i_4
       (.I0(chg_counter_reg[17]),
        .I1(chg_counter_reg[16]),
        .O(half_baud_time1_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__1_i_5
       (.I0(chg_counter_reg[22]),
        .I1(chg_counter_reg[23]),
        .O(half_baud_time1_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__1_i_6
       (.I0(chg_counter_reg[20]),
        .I1(chg_counter_reg[21]),
        .O(half_baud_time1_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__1_i_7
       (.I0(chg_counter_reg[18]),
        .I1(chg_counter_reg[19]),
        .O(half_baud_time1_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__1_i_8
       (.I0(chg_counter_reg[16]),
        .I1(chg_counter_reg[17]),
        .O(half_baud_time1_carry__1_i_8_n_0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 half_baud_time1_carry__2
       (.CI(half_baud_time1_carry__1_n_0),
        .CO({half_baud_time1__13,NLW_half_baud_time1_carry__2_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,half_baud_time1_carry__2_i_1_n_0,half_baud_time1_carry__2_i_2_n_0}),
        .S({\<const0> ,\<const0> ,half_baud_time1_carry__2_i_3_n_0,half_baud_time1_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__2_i_1
       (.I0(chg_counter_reg[27]),
        .I1(chg_counter_reg[26]),
        .O(half_baud_time1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    half_baud_time1_carry__2_i_2
       (.I0(chg_counter_reg[25]),
        .I1(chg_counter_reg[24]),
        .O(half_baud_time1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__2_i_3
       (.I0(chg_counter_reg[26]),
        .I1(chg_counter_reg[27]),
        .O(half_baud_time1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    half_baud_time1_carry__2_i_4
       (.I0(chg_counter_reg[24]),
        .I1(chg_counter_reg[25]),
        .O(half_baud_time1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    half_baud_time1_carry_i_1
       (.I0(chg_counter_reg[4]),
        .I1(chg_counter_reg[5]),
        .O(half_baud_time1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    half_baud_time1_carry_i_2
       (.I0(chg_counter_reg[3]),
        .I1(chg_counter_reg[2]),
        .O(half_baud_time1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    half_baud_time1_carry_i_3
       (.I0(chg_counter_reg[6]),
        .I1(chg_counter_reg[7]),
        .O(half_baud_time1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    half_baud_time1_carry_i_4
       (.I0(chg_counter_reg[5]),
        .I1(chg_counter_reg[4]),
        .O(half_baud_time1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    half_baud_time1_carry_i_5
       (.I0(chg_counter_reg[3]),
        .I1(chg_counter_reg[2]),
        .O(half_baud_time1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    half_baud_time1_carry_i_6
       (.I0(chg_counter_reg[0]),
        .I1(chg_counter_reg[1]),
        .O(half_baud_time1_carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    half_baud_time_i_1
       (.I0(half_baud_time1__13),
        .I1(ck_uart_reg_n_0),
        .O(half_baud_time0));
  FDRE #(
    .INIT(1'b0)) 
    half_baud_time_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(half_baud_time0),
        .Q(half_baud_time),
        .R(rst));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_1__0
       (.I0(chg_counter_reg[18]),
        .I1(chg_counter_reg[19]),
        .O(i__carry__0_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_2__0
       (.I0(chg_counter_reg[16]),
        .I1(chg_counter_reg[17]),
        .O(i__carry__0_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_3__0
       (.I0(chg_counter_reg[14]),
        .I1(chg_counter_reg[15]),
        .O(i__carry__0_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_4__0
       (.I0(chg_counter_reg[12]),
        .I1(chg_counter_reg[13]),
        .O(i__carry__0_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_1__0
       (.I0(chg_counter_reg[26]),
        .I1(chg_counter_reg[27]),
        .O(i__carry__1_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_2__0
       (.I0(chg_counter_reg[24]),
        .I1(chg_counter_reg[25]),
        .O(i__carry__1_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_3__0
       (.I0(chg_counter_reg[22]),
        .I1(chg_counter_reg[23]),
        .O(i__carry__1_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__1_i_4__0
       (.I0(chg_counter_reg[20]),
        .I1(chg_counter_reg[21]),
        .O(i__carry__1_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    i__carry_i_1__0
       (.I0(chg_counter_reg[10]),
        .I1(chg_counter_reg[11]),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_2__0
       (.I0(chg_counter_reg[9]),
        .I1(chg_counter_reg[8]),
        .O(i__carry_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__0
       (.I0(chg_counter_reg[7]),
        .O(i__carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_4__0
       (.I0(chg_counter_reg[4]),
        .I1(chg_counter_reg[5]),
        .O(i__carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_5
       (.I0(chg_counter_reg[11]),
        .I1(chg_counter_reg[10]),
        .O(i__carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_6
       (.I0(chg_counter_reg[8]),
        .I1(chg_counter_reg[9]),
        .O(i__carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_7
       (.I0(chg_counter_reg[7]),
        .I1(chg_counter_reg[6]),
        .O(i__carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_8
       (.I0(chg_counter_reg[4]),
        .I1(chg_counter_reg[5]),
        .O(i__carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'hFF510004)) 
    \in32counter_one[0]_i_1 
       (.I0(\in32counter_one_reg[2]_3 ),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\in32counter_one_reg[2]_4 ),
        .I4(\in32counter_one_reg[2]_2 ),
        .O(\in32counter_one_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFF331300000020)) 
    \in32counter_one[1]_i_1 
       (.I0(\in32counter_one_reg[2]_2 ),
        .I1(\in32counter_one_reg[2]_3 ),
        .I2(rx_valid),
        .I3(tx_busy),
        .I4(\in32counter_one_reg[2]_4 ),
        .I5(\in32counter_one_reg[2]_1 ),
        .O(\in32counter_one_reg[0] ));
  LUT6 #(
    .INIT(64'hF0F0F0F000000800)) 
    \in32counter_one[2]_i_1 
       (.I0(\in32counter_one_reg[2]_1 ),
        .I1(\in32counter_one_reg[2]_2 ),
        .I2(\in32counter_one_reg[2]_3 ),
        .I3(rx_valid),
        .I4(tx_busy),
        .I5(\in32counter_one_reg[2]_4 ),
        .O(\in32counter_one_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hFF510004)) 
    \in32counter_two[0]_i_1 
       (.I0(\in32counter_two_reg[2]_3 ),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\in32counter_two_reg[2]_4 ),
        .I4(\in32counter_two_reg[2]_2 ),
        .O(\in32counter_two_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFF331300000020)) 
    \in32counter_two[1]_i_1 
       (.I0(\in32counter_two_reg[2]_2 ),
        .I1(\in32counter_two_reg[2]_3 ),
        .I2(rx_valid),
        .I3(tx_busy),
        .I4(\in32counter_two_reg[2]_4 ),
        .I5(\in32counter_two_reg[2]_1 ),
        .O(\in32counter_two_reg[0] ));
  LUT6 #(
    .INIT(64'hF0F0F0F000000800)) 
    \in32counter_two[2]_i_1 
       (.I0(\in32counter_two_reg[2]_1 ),
        .I1(\in32counter_two_reg[2]_2 ),
        .I2(\in32counter_two_reg[2]_3 ),
        .I3(rx_valid),
        .I4(tx_busy),
        .I5(\in32counter_two_reg[2]_4 ),
        .O(\in32counter_two_reg[1] ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \input_Data[7]_i_1 
       (.I0(Q[0]),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\input_Data_reg[0] ),
        .I4(Q[3]),
        .I5(Q[1]),
        .O(E));
  LUT2 #(
    .INIT(4'h2)) 
    line_synch_i_1
       (.I0(ck_uart_reg_n_0),
        .I1(sel),
        .O(line_synch0));
  FDRE #(
    .INIT(1'b0)) 
    line_synch_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(line_synch0),
        .Q(line_synch),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h1)) 
    o_break_i_1
       (.I0(ck_uart_reg_n_0),
        .I1(sel),
        .O(o_break0));
  FDRE #(
    .INIT(1'b0)) 
    o_break_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(o_break0),
        .Q(o_break_reg_n_0),
        .R(rst));
  LUT5 #(
    .INIT(32'h00400000)) 
    \o_data[7]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(zero_baud_counter),
        .O(pre_wr0));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[0] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[0]),
        .Q(\o_data_reg[7]_0 [0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[1] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[1]),
        .Q(\o_data_reg[7]_0 [1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[2] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[2]),
        .Q(\o_data_reg[7]_0 [2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[3] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[3]),
        .Q(\o_data_reg[7]_0 [3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[4] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[4]),
        .Q(\o_data_reg[7]_0 [4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[5] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[5]),
        .Q(\o_data_reg[7]_0 [5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[6] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[6]),
        .Q(\o_data_reg[7]_0 [6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \o_data_reg[7] 
       (.C(clk_BUFG),
        .CE(pre_wr0),
        .D(data_reg[7]),
        .Q(\o_data_reg[7]_0 [7]),
        .R(rst));
  LUT6 #(
    .INIT(64'h00000000FF800000)) 
    o_wr_i_1
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(o_wr_i_2_n_0),
        .I3(zero_baud_counter),
        .I4(pre_wr),
        .I5(rst),
        .O(o_wr_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    o_wr_i_2
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(o_wr_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    o_wr_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(o_wr_i_1_n_0),
        .Q(rx_valid),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'h0F20)) 
    \out32counter_five[0]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_five_reg[2]_2 ),
        .I2(\out32counter_five[2]_i_2_n_0 ),
        .I3(\out32counter_five_reg[2]_0 ),
        .O(\state_reg[3]_4 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h04FF4000)) 
    \out32counter_five[1]_i_1 
       (.I0(\out32counter_five_reg[2]_2 ),
        .I1(Q[3]),
        .I2(\out32counter_five_reg[2]_0 ),
        .I3(\out32counter_five[2]_i_2_n_0 ),
        .I4(\out32counter_five_reg[2]_1 ),
        .O(\out32counter_five_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_five[2]_i_1 
       (.I0(\out32counter_five_reg[2]_0 ),
        .I1(\out32counter_five_reg[2]_1 ),
        .I2(Q[3]),
        .I3(\out32counter_five[2]_i_2_n_0 ),
        .I4(\out32counter_five_reg[2]_2 ),
        .O(\out32counter_five_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000000008002)) 
    \out32counter_five[2]_i_2 
       (.I0(\out32counter_five[2]_i_3_n_0 ),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(rst),
        .I5(\out32counter_five_reg[0]_0 ),
        .O(\out32counter_five[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDDDDDDD0F000000)) 
    \out32counter_five[2]_i_3 
       (.I0(tx_busy),
        .I1(\out32counter_five_reg[2]_2 ),
        .I2(\out32counter_five[2]_i_5_n_0 ),
        .I3(\out32counter_five[2]_i_6_n_0 ),
        .I4(\state[2]_i_5_n_0 ),
        .I5(Q[3]),
        .O(\out32counter_five[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \out32counter_five[2]_i_5 
       (.I0(\o_data_reg[7]_0 [0]),
        .I1(\o_data_reg[7]_0 [3]),
        .O(\out32counter_five[2]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out32counter_five[2]_i_6 
       (.I0(\o_data_reg[7]_0 [2]),
        .I1(\o_data_reg[7]_0 [1]),
        .O(\out32counter_five[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0F20)) 
    \out32counter_four[0]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_four_reg[2]_2 ),
        .I2(\out32counter_four[2]_i_2_n_0 ),
        .I3(\out32counter_four_reg[2]_0 ),
        .O(\state_reg[3]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h04FF4000)) 
    \out32counter_four[1]_i_1 
       (.I0(\out32counter_four_reg[2]_2 ),
        .I1(Q[3]),
        .I2(\out32counter_four_reg[2]_0 ),
        .I3(\out32counter_four[2]_i_2_n_0 ),
        .I4(\out32counter_four_reg[2]_1 ),
        .O(\out32counter_four_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_four[2]_i_1 
       (.I0(\out32counter_four_reg[2]_0 ),
        .I1(\out32counter_four_reg[2]_1 ),
        .I2(Q[3]),
        .I3(\out32counter_four[2]_i_2_n_0 ),
        .I4(\out32counter_four_reg[2]_2 ),
        .O(\out32counter_four_reg[0] ));
  LUT6 #(
    .INIT(64'h0200000000000002)) 
    \out32counter_four[2]_i_2 
       (.I0(\out32counter_four[2]_i_3_n_0 ),
        .I1(Q[1]),
        .I2(\out32counter_four_reg[0]_0 ),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[2]),
        .O(\out32counter_four[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDDDDDDD0F000000)) 
    \out32counter_four[2]_i_3 
       (.I0(tx_busy),
        .I1(\out32counter_four_reg[2]_2 ),
        .I2(\out32counter_four[2]_i_5_n_0 ),
        .I3(\out32counter_four[2]_i_6_n_0 ),
        .I4(\state[2]_i_5_n_0 ),
        .I5(Q[3]),
        .O(\out32counter_four[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \out32counter_four[2]_i_5 
       (.I0(\o_data_reg[7]_0 [3]),
        .I1(\o_data_reg[7]_0 [0]),
        .O(\out32counter_four[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out32counter_four[2]_i_6 
       (.I0(\o_data_reg[7]_0 [1]),
        .I1(\o_data_reg[7]_0 [2]),
        .O(\out32counter_four[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0F20)) 
    \out32counter_one[0]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_one_reg[2]_2 ),
        .I2(\out32counter_one[2]_i_2_n_0 ),
        .I3(\out32counter_one_reg[2]_0 ),
        .O(\state_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'h04FF4000)) 
    \out32counter_one[1]_i_1 
       (.I0(\out32counter_one_reg[2]_2 ),
        .I1(Q[3]),
        .I2(\out32counter_one_reg[2]_0 ),
        .I3(\out32counter_one[2]_i_2_n_0 ),
        .I4(\out32counter_one_reg[2]_1 ),
        .O(\out32counter_one_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_one[2]_i_1 
       (.I0(\out32counter_one_reg[2]_0 ),
        .I1(\out32counter_one_reg[2]_1 ),
        .I2(Q[3]),
        .I3(\out32counter_one[2]_i_2_n_0 ),
        .I4(\out32counter_one_reg[2]_2 ),
        .O(\out32counter_one_reg[0] ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \out32counter_one[2]_i_2 
       (.I0(\out32counter_one[2]_i_3_n_0 ),
        .I1(rst),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[0]),
        .O(\out32counter_one[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8088FFFF80888088)) 
    \out32counter_one[2]_i_3 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(\out32counter_one_reg[2]_2 ),
        .I3(tx_busy),
        .I4(\out32counter_one[2]_i_4_n_0 ),
        .I5(\state[2]_i_5_n_0 ),
        .O(\out32counter_one[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \out32counter_one[2]_i_4 
       (.I0(\o_data_reg[7]_0 [3]),
        .I1(\o_data_reg[7]_0 [0]),
        .I2(\o_data_reg[7]_0 [2]),
        .I3(\o_data_reg[7]_0 [1]),
        .I4(Q[3]),
        .I5(Q[1]),
        .O(\out32counter_one[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0F40)) 
    \out32counter_seven[0]_i_1 
       (.I0(\out32counter_seven_reg[2]_2 ),
        .I1(Q[4]),
        .I2(\out32counter_seven[2]_i_2_n_0 ),
        .I3(\out32counter_seven_reg[2]_0 ),
        .O(\out32counter_seven_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'h02FF2000)) 
    \out32counter_seven[1]_i_1 
       (.I0(Q[4]),
        .I1(\out32counter_seven_reg[2]_2 ),
        .I2(\out32counter_seven_reg[2]_0 ),
        .I3(\out32counter_seven[2]_i_2_n_0 ),
        .I4(\out32counter_seven_reg[2]_1 ),
        .O(\state_reg[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_seven[2]_i_1 
       (.I0(Q[4]),
        .I1(\out32counter_seven_reg[2]_0 ),
        .I2(\out32counter_seven_reg[2]_1 ),
        .I3(\out32counter_seven[2]_i_2_n_0 ),
        .I4(\out32counter_seven_reg[2]_2 ),
        .O(\state_reg[4] ));
  LUT6 #(
    .INIT(64'h00000000F000FF88)) 
    \out32counter_seven[2]_i_2 
       (.I0(\out32counter_seven[2]_i_3_n_0 ),
        .I1(rx_valid),
        .I2(\out32counter_seven_reg[2]_2 ),
        .I3(Q[4]),
        .I4(tx_busy),
        .I5(\out32counter_seven_reg[0] ),
        .O(\out32counter_seven[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \out32counter_seven[2]_i_3 
       (.I0(\out32counter_seven[2]_i_5_n_0 ),
        .I1(\o_data_reg[7]_0 [0]),
        .I2(\o_data_reg[7]_0 [3]),
        .I3(\o_data_reg[7]_0 [2]),
        .I4(\o_data_reg[7]_0 [1]),
        .O(\out32counter_seven[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \out32counter_seven[2]_i_5 
       (.I0(\o_data_reg[7]_0 [6]),
        .I1(\o_data_reg[7]_0 [5]),
        .I2(\o_data_reg[7]_0 [7]),
        .I3(\o_data_reg[7]_0 [4]),
        .O(\out32counter_seven[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0F20)) 
    \out32counter_six[0]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_six_reg[2]_2 ),
        .I2(\out32counter_six[2]_i_2_n_0 ),
        .I3(\out32counter_six_reg[2]_0 ),
        .O(\state_reg[3]_5 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h04FF4000)) 
    \out32counter_six[1]_i_1 
       (.I0(\out32counter_six_reg[2]_2 ),
        .I1(Q[3]),
        .I2(\out32counter_six_reg[2]_0 ),
        .I3(\out32counter_six[2]_i_2_n_0 ),
        .I4(\out32counter_six_reg[2]_1 ),
        .O(\out32counter_six_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_six[2]_i_1 
       (.I0(\out32counter_six_reg[2]_0 ),
        .I1(\out32counter_six_reg[2]_1 ),
        .I2(Q[3]),
        .I3(\out32counter_six[2]_i_2_n_0 ),
        .I4(\out32counter_six_reg[2]_2 ),
        .O(\out32counter_six_reg[0] ));
  LUT5 #(
    .INIT(32'h00800002)) 
    \out32counter_six[2]_i_2 
       (.I0(\out32counter_six[2]_i_3_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(rst),
        .I4(Q[2]),
        .O(\out32counter_six[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hD0D0D0D0D0FFD0D0)) 
    \out32counter_six[2]_i_3 
       (.I0(tx_busy),
        .I1(\out32counter_six_reg[2]_2 ),
        .I2(\out32counter_three_reg[0] ),
        .I3(\out32counter_six[2]_i_4_n_0 ),
        .I4(\state[2]_i_5_n_0 ),
        .I5(Q[2]),
        .O(\out32counter_six[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF7FFFF)) 
    \out32counter_six[2]_i_4 
       (.I0(\o_data_reg[7]_0 [0]),
        .I1(\o_data_reg[7]_0 [3]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(\o_data_reg[7]_0 [2]),
        .I5(\o_data_reg[7]_0 [1]),
        .O(\out32counter_six[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0F40)) 
    \out32counter_three[0]_i_1 
       (.I0(\out32counter_three_reg[2]_2 ),
        .I1(Q[3]),
        .I2(\out32counter_three[2]_i_2_n_0 ),
        .I3(\out32counter_three_reg[2]_0 ),
        .O(\out32counter_three_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h02FF2000)) 
    \out32counter_three[1]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_three_reg[2]_2 ),
        .I2(\out32counter_three_reg[2]_0 ),
        .I3(\out32counter_three[2]_i_2_n_0 ),
        .I4(\out32counter_three_reg[2]_1 ),
        .O(\state_reg[3]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_three[2]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_three_reg[2]_0 ),
        .I2(\out32counter_three_reg[2]_1 ),
        .I3(\out32counter_three[2]_i_2_n_0 ),
        .I4(\out32counter_three_reg[2]_2 ),
        .O(\state_reg[3]_1 ));
  LUT6 #(
    .INIT(64'hF222F2F200000000)) 
    \out32counter_three[2]_i_2 
       (.I0(\out32counter_three[2]_i_3_n_0 ),
        .I1(\out32counter_three[2]_i_4_n_0 ),
        .I2(\out32counter_three_reg[0] ),
        .I3(\out32counter_three_reg[2]_2 ),
        .I4(tx_busy),
        .I5(\out32counter_three_reg[0]_0 ),
        .O(\out32counter_three[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \out32counter_three[2]_i_3 
       (.I0(\out32counter_three[2]_i_6_n_0 ),
        .I1(\o_data_reg[7]_0 [6]),
        .I2(\o_data_reg[7]_0 [5]),
        .I3(\o_data_reg[7]_0 [7]),
        .I4(\o_data_reg[7]_0 [4]),
        .I5(Q[2]),
        .O(\out32counter_three[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFDFFFF)) 
    \out32counter_three[2]_i_4 
       (.I0(\o_data_reg[7]_0 [3]),
        .I1(\o_data_reg[7]_0 [0]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(\o_data_reg[7]_0 [1]),
        .I5(\o_data_reg[7]_0 [2]),
        .O(\out32counter_three[2]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out32counter_three[2]_i_6 
       (.I0(rx_valid),
        .I1(tx_busy),
        .O(\out32counter_three[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    \out32counter_two[2]_i_4 
       (.I0(\o_data_reg[7]_0 [0]),
        .I1(\o_data_reg[7]_0 [3]),
        .I2(\o_data_reg[7]_0 [1]),
        .I3(\o_data_reg[7]_0 [2]),
        .I4(Q[3]),
        .I5(\state[3]_i_4_n_0 ),
        .O(\o_data_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h0F20)) 
    \out32counter_zero[0]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_zero_reg[2]_2 ),
        .I2(\out32counter_zero[2]_i_2_n_0 ),
        .I3(\out32counter_zero_reg[2]_0 ),
        .O(\state_reg[3]_6 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h04FF4000)) 
    \out32counter_zero[1]_i_1 
       (.I0(\out32counter_zero_reg[2]_2 ),
        .I1(Q[3]),
        .I2(\out32counter_zero_reg[2]_0 ),
        .I3(\out32counter_zero[2]_i_2_n_0 ),
        .I4(\out32counter_zero_reg[2]_1 ),
        .O(\out32counter_zero_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_zero[2]_i_1 
       (.I0(\out32counter_zero_reg[2]_0 ),
        .I1(\out32counter_zero_reg[2]_1 ),
        .I2(Q[3]),
        .I3(\out32counter_zero[2]_i_2_n_0 ),
        .I4(\out32counter_zero_reg[2]_2 ),
        .O(\out32counter_zero_reg[0] ));
  LUT6 #(
    .INIT(64'h00000000FFFF0020)) 
    \out32counter_zero[2]_i_2 
       (.I0(\out32counter_zero[2]_i_3_n_0 ),
        .I1(\o_data_reg[7]_0 [3]),
        .I2(\o_data_reg[7]_0 [0]),
        .I3(\out32counter_zero[2]_i_4_n_0 ),
        .I4(Q[0]),
        .I5(\out32counter_zero_reg[0]_0 ),
        .O(\out32counter_zero[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \out32counter_zero[2]_i_3 
       (.I0(\out32counter_three[2]_i_6_n_0 ),
        .I1(\o_data_reg[7]_0 [6]),
        .I2(\o_data_reg[7]_0 [5]),
        .I3(\o_data_reg[7]_0 [7]),
        .I4(\o_data_reg[7]_0 [4]),
        .I5(Q[3]),
        .O(\out32counter_zero[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \out32counter_zero[2]_i_4 
       (.I0(\o_data_reg[7]_0 [2]),
        .I1(\o_data_reg[7]_0 [1]),
        .O(\out32counter_zero[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1575555500200000)) 
    pre_wr_i_1
       (.I0(zero_baud_counter),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[3] ),
        .I5(pre_wr),
        .O(pre_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pre_wr_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(pre_wr_i_1_n_0),
        .Q(pre_wr),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    q_uart_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(uart_rx_IBUF),
        .Q(q_uart),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    qq_uart_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(q_uart),
        .Q(qq_uart),
        .R(rst));
  LUT6 #(
    .INIT(64'hFCFCFCFCAAFCFCFC)) 
    \state[0]_i_1__0 
       (.I0(line_synch),
        .I1(\state[0]_i_2_n_0 ),
        .I2(o_break_reg_n_0),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state[0]_i_3_n_0 ),
        .I5(\state_reg_n_0_[0] ),
        .O(\state[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF2F2F2F2FFFFF2FF)) 
    \state[0]_i_1__1 
       (.I0(\state_reg[4]_1 [0]),
        .I1(\state_reg[0]_0 ),
        .I2(\state_reg[0]_1 ),
        .I3(\state_reg[0]_2 ),
        .I4(\state[0]_i_4_n_0 ),
        .I5(Q[4]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFF00FF4C0300FF)) 
    \state[0]_i_2 
       (.I0(half_baud_time),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[3] ),
        .I5(ck_uart_reg_n_0),
        .O(\state[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \state[0]_i_3 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[3] ),
        .O(\state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2AB20000)) 
    \state[0]_i_4 
       (.I0(\o_data_reg[7]_0 [0]),
        .I1(\o_data_reg[7]_0 [1]),
        .I2(\o_data_reg[7]_0 [2]),
        .I3(\o_data_reg[7]_0 [3]),
        .I4(\state[2]_i_2_n_0 ),
        .I5(\state_reg[0]_3 ),
        .O(\state[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h11F1111000111100)) 
    \state[1]_i_1__0 
       (.I0(o_break_reg_n_0),
        .I1(\state[1]_i_2_n_0 ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\state_reg_n_0_[3] ),
        .O(\state[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF11F1)) 
    \state[1]_i_1__1 
       (.I0(\state[1]_i_2__0_n_0 ),
        .I1(Q[4]),
        .I2(\state_reg[4]_1 [1]),
        .I3(\state_reg[0]_0 ),
        .I4(\state_reg[1]_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000000080800080)) 
    \state[1]_i_2 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(half_baud_time),
        .I5(ck_uart_reg_n_0),
        .O(\state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000006E45FFFF)) 
    \state[1]_i_2__0 
       (.I0(\o_data_reg[7]_0 [3]),
        .I1(\o_data_reg[7]_0 [0]),
        .I2(\o_data_reg[7]_0 [2]),
        .I3(\o_data_reg[7]_0 [1]),
        .I4(\state[2]_i_2_n_0 ),
        .I5(\state_reg[1]_1 ),
        .O(\state[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hBABBBBBBBBBABAAA)) 
    \state[2]_i_1__0 
       (.I0(o_break_reg_n_0),
        .I1(\state[3]_i_3__0_n_0 ),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[2] ),
        .O(\state[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h44444444FFFFF444)) 
    \state[2]_i_1__1 
       (.I0(\state_reg[0]_0 ),
        .I1(\state_reg[4]_1 [2]),
        .I2(\state[2]_i_2_n_0 ),
        .I3(\state[2]_i_3_n_0 ),
        .I4(\state_reg[2]_0 ),
        .I5(Q[4]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \state[2]_i_2 
       (.I0(Q[3]),
        .I1(\state[2]_i_5_n_0 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(\state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \state[2]_i_3 
       (.I0(\o_data_reg[7]_0 [3]),
        .I1(\o_data_reg[7]_0 [0]),
        .I2(\o_data_reg[7]_0 [1]),
        .I3(\o_data_reg[7]_0 [2]),
        .O(\state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \state[2]_i_5 
       (.I0(\o_data_reg[7]_0 [4]),
        .I1(\o_data_reg[7]_0 [7]),
        .I2(\o_data_reg[7]_0 [5]),
        .I3(\o_data_reg[7]_0 [6]),
        .I4(tx_busy),
        .I5(rx_valid),
        .O(\state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFAAAEAAA)) 
    \state[3]_i_1__0 
       (.I0(zero_baud_counter),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[3] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(o_break_reg_n_0),
        .O(\state[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hBBBABABABABABABA)) 
    \state[3]_i_2__0 
       (.I0(o_break_reg_n_0),
        .I1(\state[3]_i_3__0_n_0 ),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\state_reg_n_0_[0] ),
        .O(\state[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \state[3]_i_3__0 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[3] ),
        .I3(ck_uart_reg_n_0),
        .I4(half_baud_time),
        .I5(\state_reg_n_0_[1] ),
        .O(\state[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h000000002A802A00)) 
    \state[3]_i_3__1 
       (.I0(\state[3]_i_4_n_0 ),
        .I1(\o_data_reg[7]_0 [2]),
        .I2(\o_data_reg[7]_0 [1]),
        .I3(\o_data_reg[7]_0 [3]),
        .I4(\o_data_reg[7]_0 [0]),
        .I5(Q[2]),
        .O(\o_data_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \state[3]_i_4 
       (.I0(\state[2]_i_5_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\state[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h5554)) 
    \state[4]_i_1 
       (.I0(rst),
        .I1(\state[4]_i_3_n_0 ),
        .I2(Q[4]),
        .I3(Q[3]),
        .O(rst_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF4F44)) 
    \state[4]_i_2 
       (.I0(\state[4]_i_4_n_0 ),
        .I1(\state_reg[4]_2 ),
        .I2(\state_reg[0]_0 ),
        .I3(\state_reg[4]_1 [3]),
        .I4(\state_reg[4]_3 ),
        .I5(\state_reg[4]_4 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h5FFFFF5D5FFFFF59)) 
    \state[4]_i_3 
       (.I0(Q[0]),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(\state[4]_i_8_n_0 ),
        .O(\state[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFE7FFF7FFF7FFF)) 
    \state[4]_i_4 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(tx_busy),
        .I4(rx_valid),
        .I5(\state[4]_i_9_n_0 ),
        .O(\state[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \state[4]_i_8 
       (.I0(\o_data_reg[7]_0 [1]),
        .I1(\o_data_reg[7]_0 [2]),
        .I2(\o_data_reg[7]_0 [3]),
        .I3(\o_data_reg[7]_0 [0]),
        .I4(\out32counter_seven[2]_i_5_n_0 ),
        .O(\state[4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hD555D557)) 
    \state[4]_i_9 
       (.I0(\out32counter_seven[2]_i_5_n_0 ),
        .I1(\o_data_reg[7]_0 [3]),
        .I2(\o_data_reg[7]_0 [2]),
        .I3(\o_data_reg[7]_0 [1]),
        .I4(\o_data_reg[7]_0 [0]),
        .O(\state[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1__0_n_0 ),
        .D(\state[0]_i_1__0_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(rst));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[1] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1__0_n_0 ),
        .D(\state[1]_i_1__0_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[2] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1__0_n_0 ),
        .D(\state[2]_i_1__0_n_0 ),
        .Q(\state_reg_n_0_[2] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[3] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1__0_n_0 ),
        .D(\state[3]_i_2__0_n_0 ),
        .Q(\state_reg_n_0_[3] ),
        .S(rst));
  LUT6 #(
    .INIT(64'h0004000400040000)) 
    \threshold[31]_i_1 
       (.I0(\in32counter_two_reg[2]_3 ),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\in32counter_two_reg[2]_4 ),
        .I4(\in32counter_two_reg[2]_1 ),
        .I5(\in32counter_two_reg[2]_2 ),
        .O(\in32counter_two_reg[2]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \threshold[7]_i_1 
       (.I0(\in32counter_two_reg[2]_3 ),
        .I1(rx_valid),
        .I2(tx_busy),
        .I3(\in32counter_two_reg[2]_4 ),
        .O(\in32counter_two_reg[2]_0 [0]));
  LUT6 #(
    .INIT(64'h0222222222222222)) 
    zero_baud_counter_i_1__0
       (.I0(zero_baud_counter_i_2_n_0),
        .I1(zero_baud_counter_i_3_n_0),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[1] ),
        .O(zero_baud_counter_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    zero_baud_counter_i_2
       (.I0(zero_baud_counter_i_4_n_0),
        .I1(zero_baud_counter_i_5__0_n_0),
        .I2(zero_baud_counter_i_6_n_0),
        .I3(baud_counter[25]),
        .I4(baud_counter[26]),
        .I5(baud_counter[6]),
        .O(zero_baud_counter_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    zero_baud_counter_i_3
       (.I0(zero_baud_counter_i_7_n_0),
        .I1(zero_baud_counter_i_8_n_0),
        .I2(baud_counter[27]),
        .I3(baud_counter[22]),
        .I4(baud_counter[23]),
        .I5(baud_counter[1]),
        .O(zero_baud_counter_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    zero_baud_counter_i_4
       (.I0(baud_counter[15]),
        .I1(baud_counter[11]),
        .I2(baud_counter[16]),
        .I3(baud_counter[8]),
        .O(zero_baud_counter_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    zero_baud_counter_i_5__0
       (.I0(baud_counter[19]),
        .I1(baud_counter[0]),
        .I2(baud_counter[14]),
        .I3(baud_counter[9]),
        .O(zero_baud_counter_i_5__0_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    zero_baud_counter_i_6
       (.I0(baud_counter[21]),
        .I1(baud_counter[5]),
        .I2(baud_counter[2]),
        .I3(baud_counter[4]),
        .O(zero_baud_counter_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    zero_baud_counter_i_7
       (.I0(baud_counter[20]),
        .I1(rst),
        .I2(baud_counter[10]),
        .I3(baud_counter[7]),
        .I4(baud_counter[12]),
        .I5(baud_counter[17]),
        .O(zero_baud_counter_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    zero_baud_counter_i_8
       (.I0(baud_counter[24]),
        .I1(baud_counter[3]),
        .I2(baud_counter[18]),
        .I3(baud_counter[13]),
        .O(zero_baud_counter_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    zero_baud_counter_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(zero_baud_counter_i_1__0_n_0),
        .Q(zero_baud_counter),
        .R(\<const0> ));
endmodule

(* BIT_SIZE = "8" *) (* COOLDOWN = "3'b101" *) (* COOLDOWN_CYCLES = "10000000" *) 
(* DELAY = "3'b010" *) (* FINISH = "3'b011" *) (* IDLE = "3'b000" *) 
(* LOCAL_SIM_SYN_SWITCH = "1" *) (* SEND_BIT = "3'b001" *) (* WAIT_RETURN = "3'b100" *) 
module transmitter
   (send,
    clock,
    reset,
    clock_per_bit,
    data,
    tx_wire_debug_valid,
    .tx_wire_debug(tx_wire_end),
    done);
  input send;
  input clock;
  input reset;
  input [31:0]clock_per_bit;
  input [7:0]data;
  output tx_wire_debug_valid;
  output done;
  output tx_wire_end;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_state[0]_i_10_n_0 ;
  wire \FSM_sequential_state[0]_i_11_n_0 ;
  wire \FSM_sequential_state[0]_i_12_n_0 ;
  wire \FSM_sequential_state[0]_i_13_n_0 ;
  wire \FSM_sequential_state[0]_i_15_n_0 ;
  wire \FSM_sequential_state[0]_i_16_n_0 ;
  wire \FSM_sequential_state[0]_i_17_n_0 ;
  wire \FSM_sequential_state[0]_i_18_n_0 ;
  wire \FSM_sequential_state[0]_i_19_n_0 ;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_20_n_0 ;
  wire \FSM_sequential_state[0]_i_21_n_0 ;
  wire \FSM_sequential_state[0]_i_22_n_0 ;
  wire \FSM_sequential_state[0]_i_24_n_0 ;
  wire \FSM_sequential_state[0]_i_25_n_0 ;
  wire \FSM_sequential_state[0]_i_26_n_0 ;
  wire \FSM_sequential_state[0]_i_27_n_0 ;
  wire \FSM_sequential_state[0]_i_28_n_0 ;
  wire \FSM_sequential_state[0]_i_29_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[0]_i_30_n_0 ;
  wire \FSM_sequential_state[0]_i_31_n_0 ;
  wire \FSM_sequential_state[0]_i_32_n_0 ;
  wire \FSM_sequential_state[0]_i_33_n_0 ;
  wire \FSM_sequential_state[0]_i_34_n_0 ;
  wire \FSM_sequential_state[0]_i_35_n_0 ;
  wire \FSM_sequential_state[0]_i_36_n_0 ;
  wire \FSM_sequential_state[0]_i_37_n_0 ;
  wire \FSM_sequential_state[0]_i_38_n_0 ;
  wire \FSM_sequential_state[0]_i_39_n_0 ;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire \FSM_sequential_state[0]_i_6_n_0 ;
  wire \FSM_sequential_state[0]_i_7_n_0 ;
  wire \FSM_sequential_state[0]_i_8_n_0 ;
  wire \FSM_sequential_state[0]_i_9_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire \FSM_sequential_state_reg[0]_i_14_n_0 ;
  wire \FSM_sequential_state_reg[0]_i_23_n_0 ;
  wire \FSM_sequential_state_reg[0]_i_4_n_0 ;
  wire \FSM_sequential_state_reg[0]_i_5_n_0 ;
  wire [31:0]clk_count;
  wire [31:1]clk_count0;
  wire \clk_count[31]_i_1_n_0 ;
  wire \clk_count_reg[12]_i_2_n_0 ;
  wire \clk_count_reg[16]_i_2_n_0 ;
  wire \clk_count_reg[20]_i_2_n_0 ;
  wire \clk_count_reg[24]_i_2_n_0 ;
  wire \clk_count_reg[28]_i_2_n_0 ;
  wire \clk_count_reg[4]_i_2_n_0 ;
  wire \clk_count_reg[8]_i_2_n_0 ;
  wire \clk_count_reg_n_0_[0] ;
  wire \clk_count_reg_n_0_[10] ;
  wire \clk_count_reg_n_0_[11] ;
  wire \clk_count_reg_n_0_[12] ;
  wire \clk_count_reg_n_0_[13] ;
  wire \clk_count_reg_n_0_[14] ;
  wire \clk_count_reg_n_0_[15] ;
  wire \clk_count_reg_n_0_[16] ;
  wire \clk_count_reg_n_0_[17] ;
  wire \clk_count_reg_n_0_[18] ;
  wire \clk_count_reg_n_0_[19] ;
  wire \clk_count_reg_n_0_[1] ;
  wire \clk_count_reg_n_0_[20] ;
  wire \clk_count_reg_n_0_[21] ;
  wire \clk_count_reg_n_0_[22] ;
  wire \clk_count_reg_n_0_[23] ;
  wire \clk_count_reg_n_0_[24] ;
  wire \clk_count_reg_n_0_[25] ;
  wire \clk_count_reg_n_0_[26] ;
  wire \clk_count_reg_n_0_[27] ;
  wire \clk_count_reg_n_0_[28] ;
  wire \clk_count_reg_n_0_[29] ;
  wire \clk_count_reg_n_0_[2] ;
  wire \clk_count_reg_n_0_[30] ;
  wire \clk_count_reg_n_0_[31] ;
  wire \clk_count_reg_n_0_[3] ;
  wire \clk_count_reg_n_0_[4] ;
  wire \clk_count_reg_n_0_[5] ;
  wire \clk_count_reg_n_0_[6] ;
  wire \clk_count_reg_n_0_[7] ;
  wire \clk_count_reg_n_0_[8] ;
  wire \clk_count_reg_n_0_[9] ;
  wire clock;
  wire [31:0]clock_per_bit;
  wire \coolDownCounter[0]_i_1_n_0 ;
  wire \coolDownCounter[31]_i_10_n_0 ;
  wire \coolDownCounter[31]_i_11_n_0 ;
  wire \coolDownCounter[31]_i_12_n_0 ;
  wire \coolDownCounter[31]_i_13_n_0 ;
  wire \coolDownCounter[31]_i_14_n_0 ;
  wire \coolDownCounter[31]_i_15_n_0 ;
  wire \coolDownCounter[31]_i_1_n_0 ;
  wire \coolDownCounter[31]_i_2_n_0 ;
  wire \coolDownCounter[31]_i_4_n_0 ;
  wire \coolDownCounter[31]_i_5_n_0 ;
  wire \coolDownCounter[31]_i_6_n_0 ;
  wire \coolDownCounter[31]_i_7_n_0 ;
  wire \coolDownCounter[31]_i_8_n_0 ;
  wire \coolDownCounter[31]_i_9_n_0 ;
  wire \coolDownCounter_reg[12]_i_1_n_0 ;
  wire \coolDownCounter_reg[16]_i_1_n_0 ;
  wire \coolDownCounter_reg[20]_i_1_n_0 ;
  wire \coolDownCounter_reg[24]_i_1_n_0 ;
  wire \coolDownCounter_reg[28]_i_1_n_0 ;
  wire \coolDownCounter_reg[4]_i_1_n_0 ;
  wire \coolDownCounter_reg[8]_i_1_n_0 ;
  wire \coolDownCounter_reg_n_0_[0] ;
  wire \coolDownCounter_reg_n_0_[10] ;
  wire \coolDownCounter_reg_n_0_[11] ;
  wire \coolDownCounter_reg_n_0_[12] ;
  wire \coolDownCounter_reg_n_0_[13] ;
  wire \coolDownCounter_reg_n_0_[14] ;
  wire \coolDownCounter_reg_n_0_[15] ;
  wire \coolDownCounter_reg_n_0_[16] ;
  wire \coolDownCounter_reg_n_0_[17] ;
  wire \coolDownCounter_reg_n_0_[18] ;
  wire \coolDownCounter_reg_n_0_[19] ;
  wire \coolDownCounter_reg_n_0_[1] ;
  wire \coolDownCounter_reg_n_0_[20] ;
  wire \coolDownCounter_reg_n_0_[21] ;
  wire \coolDownCounter_reg_n_0_[22] ;
  wire \coolDownCounter_reg_n_0_[23] ;
  wire \coolDownCounter_reg_n_0_[24] ;
  wire \coolDownCounter_reg_n_0_[25] ;
  wire \coolDownCounter_reg_n_0_[26] ;
  wire \coolDownCounter_reg_n_0_[27] ;
  wire \coolDownCounter_reg_n_0_[28] ;
  wire \coolDownCounter_reg_n_0_[29] ;
  wire \coolDownCounter_reg_n_0_[2] ;
  wire \coolDownCounter_reg_n_0_[30] ;
  wire \coolDownCounter_reg_n_0_[31] ;
  wire \coolDownCounter_reg_n_0_[3] ;
  wire \coolDownCounter_reg_n_0_[4] ;
  wire \coolDownCounter_reg_n_0_[5] ;
  wire \coolDownCounter_reg_n_0_[6] ;
  wire \coolDownCounter_reg_n_0_[7] ;
  wire \coolDownCounter_reg_n_0_[8] ;
  wire \coolDownCounter_reg_n_0_[9] ;
  wire [7:0]data;
  wire [7:0]data_internal;
  wire \data_internal[7]_i_1_n_0 ;
  wire \data_internal_reg_n_0_[0] ;
  wire \data_internal_reg_n_0_[1] ;
  wire \data_internal_reg_n_0_[2] ;
  wire \data_internal_reg_n_0_[3] ;
  wire \data_internal_reg_n_0_[4] ;
  wire \data_internal_reg_n_0_[5] ;
  wire \data_internal_reg_n_0_[6] ;
  wire \data_internal_reg_n_0_[7] ;
  wire done;
  wire [31:1]in11;
  wire [3:0]index;
  wire \index[3]_i_1_n_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire \index_reg_n_0_[3] ;
  wire reset;
  wire send;
  wire [2:0]state;
  (* DONT_TOUCH *) wire txData;
  wire txData_i_1_n_0;
  wire txData_i_2_n_0;
  wire \tx_Done[0]_i_1_n_0 ;
  (* DONT_TOUCH *) wire tx_wire;
  wire tx_wire_debug_valid;
  wire tx_wire_debug_valid_internal_i_1_n_0;
  (* DONT_TOUCH *) wire tx_wire_end;
  wire [3:0]\NLW_FSM_sequential_state_reg[0]_i_14_CO_UNCONNECTED ;
  wire [3:0]\NLW_FSM_sequential_state_reg[0]_i_23_CO_UNCONNECTED ;
  wire [3:0]\NLW_FSM_sequential_state_reg[0]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_FSM_sequential_state_reg[0]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[20]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[28]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[4]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_clk_count_reg[8]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_coolDownCounter_reg[8]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hEAFAAAAAEAFAFAFA)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(\FSM_sequential_state[0]_i_3_n_0 ),
        .I3(\FSM_sequential_state[2]_i_3_n_0 ),
        .I4(state[0]),
        .I5(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_10 
       (.I0(\clk_count_reg_n_0_[31] ),
        .I1(clock_per_bit[31]),
        .I2(\clk_count_reg_n_0_[30] ),
        .I3(clock_per_bit[30]),
        .O(\FSM_sequential_state[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_11 
       (.I0(\clk_count_reg_n_0_[29] ),
        .I1(clock_per_bit[29]),
        .I2(\clk_count_reg_n_0_[28] ),
        .I3(clock_per_bit[28]),
        .O(\FSM_sequential_state[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_12 
       (.I0(\clk_count_reg_n_0_[27] ),
        .I1(clock_per_bit[27]),
        .I2(\clk_count_reg_n_0_[26] ),
        .I3(clock_per_bit[26]),
        .O(\FSM_sequential_state[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_13 
       (.I0(\clk_count_reg_n_0_[25] ),
        .I1(clock_per_bit[25]),
        .I2(\clk_count_reg_n_0_[24] ),
        .I3(clock_per_bit[24]),
        .O(\FSM_sequential_state[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_15 
       (.I0(clock_per_bit[23]),
        .I1(\clk_count_reg_n_0_[23] ),
        .I2(clock_per_bit[22]),
        .I3(\clk_count_reg_n_0_[22] ),
        .O(\FSM_sequential_state[0]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_16 
       (.I0(clock_per_bit[21]),
        .I1(\clk_count_reg_n_0_[21] ),
        .I2(clock_per_bit[20]),
        .I3(\clk_count_reg_n_0_[20] ),
        .O(\FSM_sequential_state[0]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_17 
       (.I0(clock_per_bit[19]),
        .I1(\clk_count_reg_n_0_[19] ),
        .I2(clock_per_bit[18]),
        .I3(\clk_count_reg_n_0_[18] ),
        .O(\FSM_sequential_state[0]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_18 
       (.I0(clock_per_bit[17]),
        .I1(\clk_count_reg_n_0_[17] ),
        .I2(clock_per_bit[16]),
        .I3(\clk_count_reg_n_0_[16] ),
        .O(\FSM_sequential_state[0]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_19 
       (.I0(\clk_count_reg_n_0_[23] ),
        .I1(clock_per_bit[23]),
        .I2(\clk_count_reg_n_0_[22] ),
        .I3(clock_per_bit[22]),
        .O(\FSM_sequential_state[0]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(state[0]),
        .I1(send),
        .I2(state[2]),
        .I3(state[1]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_20 
       (.I0(\clk_count_reg_n_0_[21] ),
        .I1(clock_per_bit[21]),
        .I2(\clk_count_reg_n_0_[20] ),
        .I3(clock_per_bit[20]),
        .O(\FSM_sequential_state[0]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_21 
       (.I0(\clk_count_reg_n_0_[19] ),
        .I1(clock_per_bit[19]),
        .I2(\clk_count_reg_n_0_[18] ),
        .I3(clock_per_bit[18]),
        .O(\FSM_sequential_state[0]_i_21_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_22 
       (.I0(\clk_count_reg_n_0_[17] ),
        .I1(clock_per_bit[17]),
        .I2(\clk_count_reg_n_0_[16] ),
        .I3(clock_per_bit[16]),
        .O(\FSM_sequential_state[0]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_24 
       (.I0(clock_per_bit[15]),
        .I1(\clk_count_reg_n_0_[15] ),
        .I2(clock_per_bit[14]),
        .I3(\clk_count_reg_n_0_[14] ),
        .O(\FSM_sequential_state[0]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_25 
       (.I0(clock_per_bit[13]),
        .I1(\clk_count_reg_n_0_[13] ),
        .I2(clock_per_bit[12]),
        .I3(\clk_count_reg_n_0_[12] ),
        .O(\FSM_sequential_state[0]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_26 
       (.I0(clock_per_bit[11]),
        .I1(\clk_count_reg_n_0_[11] ),
        .I2(clock_per_bit[10]),
        .I3(\clk_count_reg_n_0_[10] ),
        .O(\FSM_sequential_state[0]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_27 
       (.I0(clock_per_bit[9]),
        .I1(\clk_count_reg_n_0_[9] ),
        .I2(clock_per_bit[8]),
        .I3(\clk_count_reg_n_0_[8] ),
        .O(\FSM_sequential_state[0]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_28 
       (.I0(\clk_count_reg_n_0_[15] ),
        .I1(clock_per_bit[15]),
        .I2(\clk_count_reg_n_0_[14] ),
        .I3(clock_per_bit[14]),
        .O(\FSM_sequential_state[0]_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_29 
       (.I0(\clk_count_reg_n_0_[13] ),
        .I1(clock_per_bit[13]),
        .I2(\clk_count_reg_n_0_[12] ),
        .I3(clock_per_bit[12]),
        .O(\FSM_sequential_state[0]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(state[1]),
        .I1(state[2]),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_30 
       (.I0(\clk_count_reg_n_0_[11] ),
        .I1(clock_per_bit[11]),
        .I2(\clk_count_reg_n_0_[10] ),
        .I3(clock_per_bit[10]),
        .O(\FSM_sequential_state[0]_i_30_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_31 
       (.I0(\clk_count_reg_n_0_[9] ),
        .I1(clock_per_bit[9]),
        .I2(\clk_count_reg_n_0_[8] ),
        .I3(clock_per_bit[8]),
        .O(\FSM_sequential_state[0]_i_31_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_32 
       (.I0(clock_per_bit[7]),
        .I1(\clk_count_reg_n_0_[7] ),
        .I2(clock_per_bit[6]),
        .I3(\clk_count_reg_n_0_[6] ),
        .O(\FSM_sequential_state[0]_i_32_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_33 
       (.I0(clock_per_bit[5]),
        .I1(\clk_count_reg_n_0_[5] ),
        .I2(clock_per_bit[4]),
        .I3(\clk_count_reg_n_0_[4] ),
        .O(\FSM_sequential_state[0]_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_34 
       (.I0(clock_per_bit[3]),
        .I1(\clk_count_reg_n_0_[3] ),
        .I2(clock_per_bit[2]),
        .I3(\clk_count_reg_n_0_[2] ),
        .O(\FSM_sequential_state[0]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_35 
       (.I0(clock_per_bit[1]),
        .I1(\clk_count_reg_n_0_[1] ),
        .I2(clock_per_bit[0]),
        .I3(\clk_count_reg_n_0_[0] ),
        .O(\FSM_sequential_state[0]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_36 
       (.I0(\clk_count_reg_n_0_[7] ),
        .I1(clock_per_bit[7]),
        .I2(\clk_count_reg_n_0_[6] ),
        .I3(clock_per_bit[6]),
        .O(\FSM_sequential_state[0]_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_37 
       (.I0(\clk_count_reg_n_0_[5] ),
        .I1(clock_per_bit[5]),
        .I2(\clk_count_reg_n_0_[4] ),
        .I3(clock_per_bit[4]),
        .O(\FSM_sequential_state[0]_i_37_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_38 
       (.I0(\clk_count_reg_n_0_[3] ),
        .I1(clock_per_bit[3]),
        .I2(\clk_count_reg_n_0_[2] ),
        .I3(clock_per_bit[2]),
        .O(\FSM_sequential_state[0]_i_38_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \FSM_sequential_state[0]_i_39 
       (.I0(\clk_count_reg_n_0_[1] ),
        .I1(clock_per_bit[1]),
        .I2(\clk_count_reg_n_0_[0] ),
        .I3(clock_per_bit[0]),
        .O(\FSM_sequential_state[0]_i_39_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_6 
       (.I0(clock_per_bit[31]),
        .I1(\clk_count_reg_n_0_[31] ),
        .I2(clock_per_bit[30]),
        .I3(\clk_count_reg_n_0_[30] ),
        .O(\FSM_sequential_state[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_7 
       (.I0(clock_per_bit[29]),
        .I1(\clk_count_reg_n_0_[29] ),
        .I2(clock_per_bit[28]),
        .I3(\clk_count_reg_n_0_[28] ),
        .O(\FSM_sequential_state[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_8 
       (.I0(clock_per_bit[27]),
        .I1(\clk_count_reg_n_0_[27] ),
        .I2(clock_per_bit[26]),
        .I3(\clk_count_reg_n_0_[26] ),
        .O(\FSM_sequential_state[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    \FSM_sequential_state[0]_i_9 
       (.I0(clock_per_bit[25]),
        .I1(\clk_count_reg_n_0_[25] ),
        .I2(clock_per_bit[24]),
        .I3(\clk_count_reg_n_0_[24] ),
        .O(\FSM_sequential_state[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h007C)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[2]_i_3_n_0 ),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[2]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\FSM_sequential_state[2]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(\FSM_sequential_state[2]_i_3_n_0 ),
        .I4(state[0]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(\coolDownCounter_reg_n_0_[26] ),
        .I1(\coolDownCounter_reg_n_0_[25] ),
        .I2(\FSM_sequential_state[2]_i_4_n_0 ),
        .I3(\FSM_sequential_state[2]_i_5_n_0 ),
        .I4(\coolDownCounter[31]_i_6_n_0 ),
        .I5(\coolDownCounter[31]_i_7_n_0 ),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFCC80)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(\coolDownCounter_reg_n_0_[12] ),
        .I1(\coolDownCounter_reg_n_0_[15] ),
        .I2(\coolDownCounter[31]_i_10_n_0 ),
        .I3(\coolDownCounter_reg_n_0_[14] ),
        .I4(\coolDownCounter_reg_n_0_[18] ),
        .I5(\coolDownCounter[31]_i_12_n_0 ),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(\coolDownCounter_reg_n_0_[20] ),
        .I1(\coolDownCounter_reg_n_0_[19] ),
        .I2(\coolDownCounter_reg_n_0_[23] ),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,DELAY:010,COOLDOWN:011,SEND_BIT:001,FINISH:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \FSM_sequential_state_reg[0]_i_14 
       (.CI(\FSM_sequential_state_reg[0]_i_23_n_0 ),
        .CO({\FSM_sequential_state_reg[0]_i_14_n_0 ,\NLW_FSM_sequential_state_reg[0]_i_14_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\FSM_sequential_state[0]_i_24_n_0 ,\FSM_sequential_state[0]_i_25_n_0 ,\FSM_sequential_state[0]_i_26_n_0 ,\FSM_sequential_state[0]_i_27_n_0 }),
        .S({\FSM_sequential_state[0]_i_28_n_0 ,\FSM_sequential_state[0]_i_29_n_0 ,\FSM_sequential_state[0]_i_30_n_0 ,\FSM_sequential_state[0]_i_31_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \FSM_sequential_state_reg[0]_i_23 
       (.CI(\<const0> ),
        .CO({\FSM_sequential_state_reg[0]_i_23_n_0 ,\NLW_FSM_sequential_state_reg[0]_i_23_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\FSM_sequential_state[0]_i_32_n_0 ,\FSM_sequential_state[0]_i_33_n_0 ,\FSM_sequential_state[0]_i_34_n_0 ,\FSM_sequential_state[0]_i_35_n_0 }),
        .S({\FSM_sequential_state[0]_i_36_n_0 ,\FSM_sequential_state[0]_i_37_n_0 ,\FSM_sequential_state[0]_i_38_n_0 ,\FSM_sequential_state[0]_i_39_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \FSM_sequential_state_reg[0]_i_4 
       (.CI(\FSM_sequential_state_reg[0]_i_5_n_0 ),
        .CO({\FSM_sequential_state_reg[0]_i_4_n_0 ,\NLW_FSM_sequential_state_reg[0]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\FSM_sequential_state[0]_i_6_n_0 ,\FSM_sequential_state[0]_i_7_n_0 ,\FSM_sequential_state[0]_i_8_n_0 ,\FSM_sequential_state[0]_i_9_n_0 }),
        .S({\FSM_sequential_state[0]_i_10_n_0 ,\FSM_sequential_state[0]_i_11_n_0 ,\FSM_sequential_state[0]_i_12_n_0 ,\FSM_sequential_state[0]_i_13_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \FSM_sequential_state_reg[0]_i_5 
       (.CI(\FSM_sequential_state_reg[0]_i_14_n_0 ),
        .CO({\FSM_sequential_state_reg[0]_i_5_n_0 ,\NLW_FSM_sequential_state_reg[0]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\FSM_sequential_state[0]_i_15_n_0 ,\FSM_sequential_state[0]_i_16_n_0 ,\FSM_sequential_state[0]_i_17_n_0 ,\FSM_sequential_state[0]_i_18_n_0 }),
        .S({\FSM_sequential_state[0]_i_19_n_0 ,\FSM_sequential_state[0]_i_20_n_0 ,\FSM_sequential_state[0]_i_21_n_0 ,\FSM_sequential_state[0]_i_22_n_0 }));
  (* FSM_ENCODED_STATES = "IDLE:000,DELAY:010,COOLDOWN:011,SEND_BIT:001,FINISH:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(reset));
  (* FSM_ENCODED_STATES = "IDLE:000,DELAY:010,COOLDOWN:011,SEND_BIT:001,FINISH:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(reset));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \clk_count[0]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(\clk_count_reg_n_0_[0] ),
        .O(clk_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[10]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[10]),
        .O(clk_count[10]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[11]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[11]),
        .O(clk_count[11]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[12]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[12]),
        .O(clk_count[12]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[13]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[13]),
        .O(clk_count[13]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[14]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[14]),
        .O(clk_count[14]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[15]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[15]),
        .O(clk_count[15]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[16]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[16]),
        .O(clk_count[16]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[17]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[17]),
        .O(clk_count[17]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[18]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[18]),
        .O(clk_count[18]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[19]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[19]),
        .O(clk_count[19]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[1]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[1]),
        .O(clk_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[20]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[20]),
        .O(clk_count[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[21]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[21]),
        .O(clk_count[21]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[22]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[22]),
        .O(clk_count[22]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[23]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[23]),
        .O(clk_count[23]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[24]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[24]),
        .O(clk_count[24]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[25]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[25]),
        .O(clk_count[25]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[26]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[26]),
        .O(clk_count[26]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[27]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[27]),
        .O(clk_count[27]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[28]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[28]),
        .O(clk_count[28]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[29]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[29]),
        .O(clk_count[29]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[2]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[2]),
        .O(clk_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[30]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[30]),
        .O(clk_count[30]));
  LUT2 #(
    .INIT(4'h1)) 
    \clk_count[31]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .O(\clk_count[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[31]_i_2 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[31]),
        .O(clk_count[31]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[3]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[3]),
        .O(clk_count[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[4]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[4]),
        .O(clk_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[5]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[5]),
        .O(clk_count[5]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[6]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[6]),
        .O(clk_count[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[7]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[7]),
        .O(clk_count[7]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[8]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[8]),
        .O(clk_count[8]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \clk_count[9]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(clk_count0[9]),
        .O(clk_count[9]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[0] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[0]),
        .Q(\clk_count_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[10] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[10]),
        .Q(\clk_count_reg_n_0_[10] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[11] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[11]),
        .Q(\clk_count_reg_n_0_[11] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[12] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[12]),
        .Q(\clk_count_reg_n_0_[12] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[12]_i_2 
       (.CI(\clk_count_reg[8]_i_2_n_0 ),
        .CO({\clk_count_reg[12]_i_2_n_0 ,\NLW_clk_count_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[12:9]),
        .S({\clk_count_reg_n_0_[12] ,\clk_count_reg_n_0_[11] ,\clk_count_reg_n_0_[10] ,\clk_count_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[13] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[13]),
        .Q(\clk_count_reg_n_0_[13] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[14] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[14]),
        .Q(\clk_count_reg_n_0_[14] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[15] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[15]),
        .Q(\clk_count_reg_n_0_[15] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[16] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[16]),
        .Q(\clk_count_reg_n_0_[16] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[16]_i_2 
       (.CI(\clk_count_reg[12]_i_2_n_0 ),
        .CO({\clk_count_reg[16]_i_2_n_0 ,\NLW_clk_count_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[16:13]),
        .S({\clk_count_reg_n_0_[16] ,\clk_count_reg_n_0_[15] ,\clk_count_reg_n_0_[14] ,\clk_count_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[17] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[17]),
        .Q(\clk_count_reg_n_0_[17] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[18] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[18]),
        .Q(\clk_count_reg_n_0_[18] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[19] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[19]),
        .Q(\clk_count_reg_n_0_[19] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[1] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[1]),
        .Q(\clk_count_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[20] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[20]),
        .Q(\clk_count_reg_n_0_[20] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[20]_i_2 
       (.CI(\clk_count_reg[16]_i_2_n_0 ),
        .CO({\clk_count_reg[20]_i_2_n_0 ,\NLW_clk_count_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[20:17]),
        .S({\clk_count_reg_n_0_[20] ,\clk_count_reg_n_0_[19] ,\clk_count_reg_n_0_[18] ,\clk_count_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[21] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[21]),
        .Q(\clk_count_reg_n_0_[21] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[22] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[22]),
        .Q(\clk_count_reg_n_0_[22] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[23] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[23]),
        .Q(\clk_count_reg_n_0_[23] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[24] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[24]),
        .Q(\clk_count_reg_n_0_[24] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[24]_i_2 
       (.CI(\clk_count_reg[20]_i_2_n_0 ),
        .CO({\clk_count_reg[24]_i_2_n_0 ,\NLW_clk_count_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[24:21]),
        .S({\clk_count_reg_n_0_[24] ,\clk_count_reg_n_0_[23] ,\clk_count_reg_n_0_[22] ,\clk_count_reg_n_0_[21] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[25] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[25]),
        .Q(\clk_count_reg_n_0_[25] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[26] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[26]),
        .Q(\clk_count_reg_n_0_[26] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[27] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[27]),
        .Q(\clk_count_reg_n_0_[27] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[28] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[28]),
        .Q(\clk_count_reg_n_0_[28] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[28]_i_2 
       (.CI(\clk_count_reg[24]_i_2_n_0 ),
        .CO({\clk_count_reg[28]_i_2_n_0 ,\NLW_clk_count_reg[28]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[28:25]),
        .S({\clk_count_reg_n_0_[28] ,\clk_count_reg_n_0_[27] ,\clk_count_reg_n_0_[26] ,\clk_count_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[29] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[29]),
        .Q(\clk_count_reg_n_0_[29] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[2] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[2]),
        .Q(\clk_count_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[30] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[30]),
        .Q(\clk_count_reg_n_0_[30] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[31] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[31]),
        .Q(\clk_count_reg_n_0_[31] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[31]_i_3 
       (.CI(\clk_count_reg[28]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[31:29]),
        .S({\<const0> ,\clk_count_reg_n_0_[31] ,\clk_count_reg_n_0_[30] ,\clk_count_reg_n_0_[29] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[3] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[3]),
        .Q(\clk_count_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[4] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[4]),
        .Q(\clk_count_reg_n_0_[4] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\clk_count_reg[4]_i_2_n_0 ,\NLW_clk_count_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\clk_count_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[4:1]),
        .S({\clk_count_reg_n_0_[4] ,\clk_count_reg_n_0_[3] ,\clk_count_reg_n_0_[2] ,\clk_count_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[5] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[5]),
        .Q(\clk_count_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[6] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[6]),
        .Q(\clk_count_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[7] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[7]),
        .Q(\clk_count_reg_n_0_[7] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[8] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[8]),
        .Q(\clk_count_reg_n_0_[8] ),
        .R(reset));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \clk_count_reg[8]_i_2 
       (.CI(\clk_count_reg[4]_i_2_n_0 ),
        .CO({\clk_count_reg[8]_i_2_n_0 ,\NLW_clk_count_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(clk_count0[8:5]),
        .S({\clk_count_reg_n_0_[8] ,\clk_count_reg_n_0_[7] ,\clk_count_reg_n_0_[6] ,\clk_count_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_count_reg[9] 
       (.C(clock),
        .CE(\clk_count[31]_i_1_n_0 ),
        .D(clk_count[9]),
        .Q(\clk_count_reg_n_0_[9] ),
        .R(reset));
  LUT3 #(
    .INIT(8'h04)) 
    \coolDownCounter[0]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(\coolDownCounter_reg_n_0_[0] ),
        .O(\coolDownCounter[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \coolDownCounter[31]_i_1 
       (.I0(\coolDownCounter[31]_i_2_n_0 ),
        .I1(state[2]),
        .I2(state[0]),
        .O(\coolDownCounter[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFE00000)) 
    \coolDownCounter[31]_i_10 
       (.I0(\coolDownCounter[31]_i_13_n_0 ),
        .I1(\coolDownCounter[31]_i_14_n_0 ),
        .I2(\coolDownCounter_reg_n_0_[7] ),
        .I3(\coolDownCounter_reg_n_0_[8] ),
        .I4(\coolDownCounter[31]_i_15_n_0 ),
        .I5(\coolDownCounter_reg_n_0_[11] ),
        .O(\coolDownCounter[31]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \coolDownCounter[31]_i_11 
       (.I0(\coolDownCounter_reg_n_0_[14] ),
        .I1(\coolDownCounter_reg_n_0_[15] ),
        .I2(\coolDownCounter_reg_n_0_[18] ),
        .O(\coolDownCounter[31]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFEEE)) 
    \coolDownCounter[31]_i_12 
       (.I0(\coolDownCounter_reg_n_0_[17] ),
        .I1(\coolDownCounter_reg_n_0_[16] ),
        .I2(\coolDownCounter_reg_n_0_[13] ),
        .I3(\coolDownCounter_reg_n_0_[15] ),
        .O(\coolDownCounter[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \coolDownCounter[31]_i_13 
       (.I0(\coolDownCounter_reg_n_0_[4] ),
        .I1(\coolDownCounter_reg_n_0_[0] ),
        .I2(\coolDownCounter_reg_n_0_[1] ),
        .I3(\coolDownCounter_reg_n_0_[5] ),
        .O(\coolDownCounter[31]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \coolDownCounter[31]_i_14 
       (.I0(\coolDownCounter_reg_n_0_[3] ),
        .I1(\coolDownCounter_reg_n_0_[2] ),
        .I2(\coolDownCounter_reg_n_0_[6] ),
        .O(\coolDownCounter[31]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \coolDownCounter[31]_i_15 
       (.I0(\coolDownCounter_reg_n_0_[9] ),
        .I1(\coolDownCounter_reg_n_0_[10] ),
        .O(\coolDownCounter[31]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h02020202020202A2)) 
    \coolDownCounter[31]_i_2 
       (.I0(\coolDownCounter[31]_i_4_n_0 ),
        .I1(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I2(state[0]),
        .I3(\coolDownCounter[31]_i_5_n_0 ),
        .I4(\coolDownCounter[31]_i_6_n_0 ),
        .I5(\coolDownCounter[31]_i_7_n_0 ),
        .O(\coolDownCounter[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \coolDownCounter[31]_i_4 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(reset),
        .O(\coolDownCounter[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEAAAAAAAAA)) 
    \coolDownCounter[31]_i_5 
       (.I0(\coolDownCounter[31]_i_8_n_0 ),
        .I1(\coolDownCounter[31]_i_9_n_0 ),
        .I2(\coolDownCounter[31]_i_10_n_0 ),
        .I3(\coolDownCounter[31]_i_11_n_0 ),
        .I4(\coolDownCounter[31]_i_12_n_0 ),
        .I5(\FSM_sequential_state[2]_i_5_n_0 ),
        .O(\coolDownCounter[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \coolDownCounter[31]_i_6 
       (.I0(\coolDownCounter_reg_n_0_[30] ),
        .I1(\coolDownCounter_reg_n_0_[29] ),
        .I2(\coolDownCounter_reg_n_0_[28] ),
        .I3(\coolDownCounter_reg_n_0_[27] ),
        .O(\coolDownCounter[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFA8)) 
    \coolDownCounter[31]_i_7 
       (.I0(\coolDownCounter_reg_n_0_[23] ),
        .I1(\coolDownCounter_reg_n_0_[22] ),
        .I2(\coolDownCounter_reg_n_0_[21] ),
        .I3(\coolDownCounter_reg_n_0_[31] ),
        .I4(\coolDownCounter_reg_n_0_[24] ),
        .O(\coolDownCounter[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \coolDownCounter[31]_i_8 
       (.I0(\coolDownCounter_reg_n_0_[25] ),
        .I1(\coolDownCounter_reg_n_0_[26] ),
        .O(\coolDownCounter[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \coolDownCounter[31]_i_9 
       (.I0(\coolDownCounter_reg_n_0_[15] ),
        .I1(\coolDownCounter_reg_n_0_[12] ),
        .O(\coolDownCounter[31]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[0] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(\coolDownCounter[0]_i_1_n_0 ),
        .Q(\coolDownCounter_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[10] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[10]),
        .Q(\coolDownCounter_reg_n_0_[10] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[11] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[11]),
        .Q(\coolDownCounter_reg_n_0_[11] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[12] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[12]),
        .Q(\coolDownCounter_reg_n_0_[12] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[12]_i_1 
       (.CI(\coolDownCounter_reg[8]_i_1_n_0 ),
        .CO({\coolDownCounter_reg[12]_i_1_n_0 ,\NLW_coolDownCounter_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[12:9]),
        .S({\coolDownCounter_reg_n_0_[12] ,\coolDownCounter_reg_n_0_[11] ,\coolDownCounter_reg_n_0_[10] ,\coolDownCounter_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[13] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[13]),
        .Q(\coolDownCounter_reg_n_0_[13] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[14] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[14]),
        .Q(\coolDownCounter_reg_n_0_[14] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[15] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[15]),
        .Q(\coolDownCounter_reg_n_0_[15] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[16] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[16]),
        .Q(\coolDownCounter_reg_n_0_[16] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[16]_i_1 
       (.CI(\coolDownCounter_reg[12]_i_1_n_0 ),
        .CO({\coolDownCounter_reg[16]_i_1_n_0 ,\NLW_coolDownCounter_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[16:13]),
        .S({\coolDownCounter_reg_n_0_[16] ,\coolDownCounter_reg_n_0_[15] ,\coolDownCounter_reg_n_0_[14] ,\coolDownCounter_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[17] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[17]),
        .Q(\coolDownCounter_reg_n_0_[17] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[18] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[18]),
        .Q(\coolDownCounter_reg_n_0_[18] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[19] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[19]),
        .Q(\coolDownCounter_reg_n_0_[19] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[1] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[1]),
        .Q(\coolDownCounter_reg_n_0_[1] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[20] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[20]),
        .Q(\coolDownCounter_reg_n_0_[20] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[20]_i_1 
       (.CI(\coolDownCounter_reg[16]_i_1_n_0 ),
        .CO({\coolDownCounter_reg[20]_i_1_n_0 ,\NLW_coolDownCounter_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[20:17]),
        .S({\coolDownCounter_reg_n_0_[20] ,\coolDownCounter_reg_n_0_[19] ,\coolDownCounter_reg_n_0_[18] ,\coolDownCounter_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[21] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[21]),
        .Q(\coolDownCounter_reg_n_0_[21] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[22] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[22]),
        .Q(\coolDownCounter_reg_n_0_[22] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[23] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[23]),
        .Q(\coolDownCounter_reg_n_0_[23] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[24] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[24]),
        .Q(\coolDownCounter_reg_n_0_[24] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[24]_i_1 
       (.CI(\coolDownCounter_reg[20]_i_1_n_0 ),
        .CO({\coolDownCounter_reg[24]_i_1_n_0 ,\NLW_coolDownCounter_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[24:21]),
        .S({\coolDownCounter_reg_n_0_[24] ,\coolDownCounter_reg_n_0_[23] ,\coolDownCounter_reg_n_0_[22] ,\coolDownCounter_reg_n_0_[21] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[25] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[25]),
        .Q(\coolDownCounter_reg_n_0_[25] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[26] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[26]),
        .Q(\coolDownCounter_reg_n_0_[26] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[27] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[27]),
        .Q(\coolDownCounter_reg_n_0_[27] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[28] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[28]),
        .Q(\coolDownCounter_reg_n_0_[28] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[28]_i_1 
       (.CI(\coolDownCounter_reg[24]_i_1_n_0 ),
        .CO({\coolDownCounter_reg[28]_i_1_n_0 ,\NLW_coolDownCounter_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[28:25]),
        .S({\coolDownCounter_reg_n_0_[28] ,\coolDownCounter_reg_n_0_[27] ,\coolDownCounter_reg_n_0_[26] ,\coolDownCounter_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[29] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[29]),
        .Q(\coolDownCounter_reg_n_0_[29] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[2] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[2]),
        .Q(\coolDownCounter_reg_n_0_[2] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[30] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[30]),
        .Q(\coolDownCounter_reg_n_0_[30] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[31] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[31]),
        .Q(\coolDownCounter_reg_n_0_[31] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[31]_i_3 
       (.CI(\coolDownCounter_reg[28]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[31:29]),
        .S({\<const0> ,\coolDownCounter_reg_n_0_[31] ,\coolDownCounter_reg_n_0_[30] ,\coolDownCounter_reg_n_0_[29] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[3] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[3]),
        .Q(\coolDownCounter_reg_n_0_[3] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[4] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[4]),
        .Q(\coolDownCounter_reg_n_0_[4] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\coolDownCounter_reg[4]_i_1_n_0 ,\NLW_coolDownCounter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\coolDownCounter_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[4:1]),
        .S({\coolDownCounter_reg_n_0_[4] ,\coolDownCounter_reg_n_0_[3] ,\coolDownCounter_reg_n_0_[2] ,\coolDownCounter_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[5] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[5]),
        .Q(\coolDownCounter_reg_n_0_[5] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[6] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[6]),
        .Q(\coolDownCounter_reg_n_0_[6] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[7] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[7]),
        .Q(\coolDownCounter_reg_n_0_[7] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[8] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[8]),
        .Q(\coolDownCounter_reg_n_0_[8] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \coolDownCounter_reg[8]_i_1 
       (.CI(\coolDownCounter_reg[4]_i_1_n_0 ),
        .CO({\coolDownCounter_reg[8]_i_1_n_0 ,\NLW_coolDownCounter_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[8:5]),
        .S({\coolDownCounter_reg_n_0_[8] ,\coolDownCounter_reg_n_0_[7] ,\coolDownCounter_reg_n_0_[6] ,\coolDownCounter_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \coolDownCounter_reg[9] 
       (.C(clock),
        .CE(\coolDownCounter[31]_i_2_n_0 ),
        .D(in11[9]),
        .Q(\coolDownCounter_reg_n_0_[9] ),
        .R(\coolDownCounter[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[0]_i_1 
       (.I0(\data_internal_reg_n_0_[1] ),
        .I1(data[0]),
        .I2(state[1]),
        .O(data_internal[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[1]_i_1 
       (.I0(\data_internal_reg_n_0_[2] ),
        .I1(data[1]),
        .I2(state[1]),
        .O(data_internal[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[2]_i_1 
       (.I0(\data_internal_reg_n_0_[3] ),
        .I1(data[2]),
        .I2(state[1]),
        .O(data_internal[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[3]_i_1 
       (.I0(\data_internal_reg_n_0_[4] ),
        .I1(data[3]),
        .I2(state[1]),
        .O(data_internal[3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[4]_i_1 
       (.I0(\data_internal_reg_n_0_[5] ),
        .I1(data[4]),
        .I2(state[1]),
        .O(data_internal[4]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[5]_i_1 
       (.I0(\data_internal_reg_n_0_[6] ),
        .I1(data[5]),
        .I2(state[1]),
        .O(data_internal[5]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_internal[6]_i_1 
       (.I0(\data_internal_reg_n_0_[7] ),
        .I1(data[6]),
        .I2(state[1]),
        .O(data_internal[6]));
  LUT5 #(
    .INIT(32'h00000704)) 
    \data_internal[7]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(send),
        .I4(state[0]),
        .O(\data_internal[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \data_internal[7]_i_2 
       (.I0(state[1]),
        .I1(data[7]),
        .O(data_internal[7]));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[0] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[0]),
        .Q(\data_internal_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[1] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[1]),
        .Q(\data_internal_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[2] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[2]),
        .Q(\data_internal_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[3] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[3]),
        .Q(\data_internal_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[4] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[4]),
        .Q(\data_internal_reg_n_0_[4] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[5] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[5]),
        .Q(\data_internal_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[6] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[6]),
        .Q(\data_internal_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \data_internal_reg[7] 
       (.C(clock),
        .CE(\data_internal[7]_i_1_n_0 ),
        .D(data_internal[7]),
        .Q(\data_internal_reg_n_0_[7] ),
        .R(reset));
  LUT2 #(
    .INIT(4'h2)) 
    \index[0]_i_1 
       (.I0(state[1]),
        .I1(\index_reg_n_0_[0] ),
        .O(index[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \index[1]_i_1 
       (.I0(state[1]),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .O(index[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \index[2]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(state[1]),
        .I3(\index_reg_n_0_[2] ),
        .O(index[2]));
  LUT4 #(
    .INIT(16'h0013)) 
    \index[3]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_4_n_0 ),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .O(\index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \index[3]_i_2 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(state[1]),
        .O(index[3]));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(clock),
        .CE(\index[3]_i_1_n_0 ),
        .D(index[0]),
        .Q(\index_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(clock),
        .CE(\index[3]_i_1_n_0 ),
        .D(index[1]),
        .Q(\index_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(clock),
        .CE(\index[3]_i_1_n_0 ),
        .D(index[2]),
        .Q(\index_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[3] 
       (.C(clock),
        .CE(\index[3]_i_1_n_0 ),
        .D(index[3]),
        .Q(\index_reg_n_0_[3] ),
        .R(reset));
  LUT4 #(
    .INIT(16'hFF04)) 
    txData_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(reset),
        .O(txData_i_1_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    txData_i_2
       (.I0(txData),
        .I1(reset),
        .I2(\data_internal_reg_n_0_[0] ),
        .O(txData_i_2_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    txData_reg
       (.C(clock),
        .CE(txData_i_1_n_0),
        .D(txData_i_2_n_0),
        .Q(txData),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT1 #(
    .INIT(2'h2)) 
    txWireEnd
       (.I0(tx_wire),
        .O(tx_wire_end));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT1 #(
    .INIT(2'h2)) 
    txWireStart
       (.I0(txData),
        .O(tx_wire));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFF04)) 
    \tx_Done[0]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(done),
        .O(\tx_Done[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_Done_reg[0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\tx_Done[0]_i_1_n_0 ),
        .Q(done),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h88888B88)) 
    tx_wire_debug_valid_internal_i_1
       (.I0(tx_wire_debug_valid),
        .I1(reset),
        .I2(state[2]),
        .I3(state[0]),
        .I4(state[1]),
        .O(tx_wire_debug_valid_internal_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_wire_debug_valid_internal_reg
       (.C(clock),
        .CE(\<const1> ),
        .D(tx_wire_debug_valid_internal_i_1_n_0),
        .Q(tx_wire_debug_valid),
        .R(\<const0> ));
endmodule

module txuart
   (tx_busy,
    \out32counter_two_reg[0] ,
    \out32counter_two_reg[2] ,
    \state_reg[3]_0 ,
    D,
    \state_reg[2]_0 ,
    \phantom_output_data_reg[4] ,
    \phantom_output_data_reg[7] ,
    tx_valid,
    debug_ro_counts_reg_two,
    r_busy_reg_0,
    r_busy_reg_1,
    \in32counter_one_reg[2] ,
    debug_ro_counts_reg_four,
    debug_ro_counts_reg_zero,
    debug_ro_counts_reg_six,
    \out32counter_seven_reg[2] ,
    \state_reg[4] ,
    \state_reg[1]_0 ,
    debug_ro_counts_reg_one,
    debug_ro_counts_reg_five,
    \out32counter_five_reg[2] ,
    \out32counter_five_reg[2]_0 ,
    \state_reg[1]_1 ,
    r_busy_reg_2,
    debug_ro_counts_reg_three,
    \state_reg[2]_1 ,
    r_busy_reg_3,
    \state_reg[1]_2 ,
    \out32counter_two_reg[2]_0 ,
    \debug_ro_counts_zero_reg_reg[7] ,
    \debug_ro_counts_zero_reg_reg[4] ,
    \out32counter_four_reg[2] ,
    \out32counter_zero_reg[2] ,
    \out32counter_six_reg[2] ,
    \out32counter_one_reg[2] ,
    \out32counter_five_reg[2]_1 ,
    \out32counter_seven_reg[2]_0 ,
    E,
    \out32counter_three_reg[2] ,
    r_busy_reg_4,
    o_uart_tx_reg_0,
    rst,
    clk_BUFG,
    \out32counter_two_reg[2]_1 ,
    \out32counter_two_reg[2]_2 ,
    Q,
    \out32counter_two_reg[2]_3 ,
    o_uart_tx_reg_1,
    \state_reg[3]_1 ,
    \state_reg[3]_2 ,
    \state_reg[3]_3 ,
    \debug_ro_counts_reg_two_reg[16] ,
    \out32counter_two_reg[0]_0 ,
    \out32counter_two_reg[0]_1 ,
    \tx_byte_reg[0] ,
    \tx_byte_reg[0]_0 ,
    \tx_byte_reg[0]_1 ,
    \tx_byte_reg[1] ,
    \tx_byte_reg[7] ,
    \tx_byte_reg[0]_2 ,
    \tx_byte_reg[0]_3 ,
    \tx_byte_reg[1]_0 ,
    \tx_byte_reg[2] ,
    \tx_byte_reg[2]_0 ,
    \tx_byte_reg[3] ,
    \tx_byte_reg[3]_0 ,
    \tx_byte_reg[4] ,
    \tx_byte_reg[5] ,
    \tx_byte_reg[6] ,
    \tx_byte_reg[6]_0 ,
    \tx_byte_reg[7]_0 ,
    \state_reg[2]_2 ,
    \state_reg[2]_3 ,
    \state_reg[2]_4 ,
    \tx_byte_reg[7]_1 ,
    \tx_byte_reg[7]_2 ,
    \tx_byte_reg[6]_1 ,
    \tx_byte_reg[5]_0 ,
    \tx_byte_reg[1]_1 ,
    \debug_ro_counts_reg_four_reg[23] ,
    \debug_ro_counts_reg_zero_reg[23] ,
    \debug_ro_counts_reg_six_reg[16] ,
    \debug_ro_counts_reg_six_reg[23] ,
    \debug_ro_counts_reg_seven_reg[23] ,
    \state_reg[4]_0 ,
    \debug_ro_counts_reg_one_reg[16] ,
    \debug_ro_counts_reg_one_reg[23] ,
    \debug_ro_counts_reg_five_reg[16] ,
    \debug_ro_counts_reg_five_reg[23] ,
    \tx_byte_reg[5]_1 ,
    \tx_byte_reg[5]_2 ,
    rxHasData,
    \tx_byte[5]_i_4_0 ,
    \tx_byte[5]_i_4_1 ,
    \debug_ro_counts_reg_three_reg[23] ,
    \debug_ro_counts_reg_three_reg[23]_0 ,
    \tx_byte[5]_i_4_2 ,
    \debug_ro_counts_reg_three_reg[23]_1 ,
    \debug_ro_counts_reg_three_reg[16] ,
    \tx_byte_reg[6]_2 ,
    \tx_byte_reg[6]_3 ,
    \tx_byte_reg[5]_3 ,
    \debug_ro_counts_reg_seven_reg[23]_0 ,
    \debug_ro_counts_reg_seven_reg[23]_1 ,
    \tx_byte[0]_i_4_0 ,
    \tx_byte[0]_i_4_1 ,
    \debug_ro_counts_reg_five_reg[23]_0 ,
    \debug_ro_counts_reg_five_reg[23]_1 ,
    \tx_byte[7]_i_6_0 ,
    \debug_ro_counts_reg_six_reg[23]_0 ,
    \debug_ro_counts_reg_six_reg[23]_1 ,
    \tx_byte[7]_i_6_1 ,
    \lcl_data_reg[7]_0 ,
    \tx_byte_reg[0]_4 ,
    \debug_ro_counts_reg_zero_reg[23]_0 ,
    \debug_ro_counts_reg_zero_reg[23]_1 ,
    beenReadFlag,
    \debug_ro_counts_reg_four_reg[23]_0 ,
    \debug_ro_counts_reg_four_reg[23]_1 ,
    \debug_ro_counts_reg_one_reg[23]_0 ,
    \debug_ro_counts_reg_one_reg[23]_1 ,
    \debug_ro_counts_reg_seven_reg[15] );
  output tx_busy;
  output \out32counter_two_reg[0] ;
  output \out32counter_two_reg[2] ;
  output \state_reg[3]_0 ;
  output [0:0]D;
  output [5:0]\state_reg[2]_0 ;
  output \phantom_output_data_reg[4] ;
  output \phantom_output_data_reg[7] ;
  output tx_valid;
  output debug_ro_counts_reg_two;
  output r_busy_reg_0;
  output r_busy_reg_1;
  output \in32counter_one_reg[2] ;
  output debug_ro_counts_reg_four;
  output debug_ro_counts_reg_zero;
  output debug_ro_counts_reg_six;
  output \out32counter_seven_reg[2] ;
  output \state_reg[4] ;
  output \state_reg[1]_0 ;
  output debug_ro_counts_reg_one;
  output debug_ro_counts_reg_five;
  output \out32counter_five_reg[2] ;
  output \out32counter_five_reg[2]_0 ;
  output \state_reg[1]_1 ;
  output r_busy_reg_2;
  output debug_ro_counts_reg_three;
  output \state_reg[2]_1 ;
  output r_busy_reg_3;
  output \state_reg[1]_2 ;
  output \out32counter_two_reg[2]_0 ;
  output \debug_ro_counts_zero_reg_reg[7] ;
  output \debug_ro_counts_zero_reg_reg[4] ;
  output \out32counter_four_reg[2] ;
  output \out32counter_zero_reg[2] ;
  output \out32counter_six_reg[2] ;
  output \out32counter_one_reg[2] ;
  output \out32counter_five_reg[2]_1 ;
  output \out32counter_seven_reg[2]_0 ;
  output [0:0]E;
  output \out32counter_three_reg[2] ;
  output r_busy_reg_4;
  output o_uart_tx_reg_0;
  input rst;
  input clk_BUFG;
  input \out32counter_two_reg[2]_1 ;
  input \out32counter_two_reg[2]_2 ;
  input [4:0]Q;
  input \out32counter_two_reg[2]_3 ;
  input o_uart_tx_reg_1;
  input \state_reg[3]_1 ;
  input [0:0]\state_reg[3]_2 ;
  input \state_reg[3]_3 ;
  input \debug_ro_counts_reg_two_reg[16] ;
  input \out32counter_two_reg[0]_0 ;
  input \out32counter_two_reg[0]_1 ;
  input \tx_byte_reg[0] ;
  input \tx_byte_reg[0]_0 ;
  input \tx_byte_reg[0]_1 ;
  input \tx_byte_reg[1] ;
  input [7:0]\tx_byte_reg[7] ;
  input \tx_byte_reg[0]_2 ;
  input \tx_byte_reg[0]_3 ;
  input \tx_byte_reg[1]_0 ;
  input \tx_byte_reg[2] ;
  input \tx_byte_reg[2]_0 ;
  input \tx_byte_reg[3] ;
  input \tx_byte_reg[3]_0 ;
  input \tx_byte_reg[4] ;
  input \tx_byte_reg[5] ;
  input \tx_byte_reg[6] ;
  input \tx_byte_reg[6]_0 ;
  input \tx_byte_reg[7]_0 ;
  input \state_reg[2]_2 ;
  input \state_reg[2]_3 ;
  input \state_reg[2]_4 ;
  input [7:0]\tx_byte_reg[7]_1 ;
  input [7:0]\tx_byte_reg[7]_2 ;
  input \tx_byte_reg[6]_1 ;
  input \tx_byte_reg[5]_0 ;
  input \tx_byte_reg[1]_1 ;
  input \debug_ro_counts_reg_four_reg[23] ;
  input \debug_ro_counts_reg_zero_reg[23] ;
  input \debug_ro_counts_reg_six_reg[16] ;
  input \debug_ro_counts_reg_six_reg[23] ;
  input \debug_ro_counts_reg_seven_reg[23] ;
  input \state_reg[4]_0 ;
  input \debug_ro_counts_reg_one_reg[16] ;
  input \debug_ro_counts_reg_one_reg[23] ;
  input \debug_ro_counts_reg_five_reg[16] ;
  input \debug_ro_counts_reg_five_reg[23] ;
  input [3:0]\tx_byte_reg[5]_1 ;
  input [3:0]\tx_byte_reg[5]_2 ;
  input rxHasData;
  input [4:0]\tx_byte[5]_i_4_0 ;
  input \tx_byte[5]_i_4_1 ;
  input \debug_ro_counts_reg_three_reg[23] ;
  input \debug_ro_counts_reg_three_reg[23]_0 ;
  input [4:0]\tx_byte[5]_i_4_2 ;
  input \debug_ro_counts_reg_three_reg[23]_1 ;
  input \debug_ro_counts_reg_three_reg[16] ;
  input [4:0]\tx_byte_reg[6]_2 ;
  input [4:0]\tx_byte_reg[6]_3 ;
  input \tx_byte_reg[5]_3 ;
  input \debug_ro_counts_reg_seven_reg[23]_0 ;
  input \debug_ro_counts_reg_seven_reg[23]_1 ;
  input [0:0]\tx_byte[0]_i_4_0 ;
  input [0:0]\tx_byte[0]_i_4_1 ;
  input \debug_ro_counts_reg_five_reg[23]_0 ;
  input \debug_ro_counts_reg_five_reg[23]_1 ;
  input [7:0]\tx_byte[7]_i_6_0 ;
  input \debug_ro_counts_reg_six_reg[23]_0 ;
  input \debug_ro_counts_reg_six_reg[23]_1 ;
  input [7:0]\tx_byte[7]_i_6_1 ;
  input [7:0]\lcl_data_reg[7]_0 ;
  input \tx_byte_reg[0]_4 ;
  input \debug_ro_counts_reg_zero_reg[23]_0 ;
  input \debug_ro_counts_reg_zero_reg[23]_1 ;
  input beenReadFlag;
  input \debug_ro_counts_reg_four_reg[23]_0 ;
  input \debug_ro_counts_reg_four_reg[23]_1 ;
  input \debug_ro_counts_reg_one_reg[23]_0 ;
  input \debug_ro_counts_reg_one_reg[23]_1 ;
  input \debug_ro_counts_reg_seven_reg[15] ;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire [0:0]E;
  wire [4:0]Q;
  wire [27:1]baud_counter00_in;
  wire \baud_counter0_inferred__1/i__carry__0_n_0 ;
  wire \baud_counter0_inferred__1/i__carry__1_n_0 ;
  wire \baud_counter0_inferred__1/i__carry__2_n_0 ;
  wire \baud_counter0_inferred__1/i__carry__3_n_0 ;
  wire \baud_counter0_inferred__1/i__carry__4_n_0 ;
  wire \baud_counter0_inferred__1/i__carry_n_0 ;
  wire \baud_counter[0]_i_1__0_n_0 ;
  wire \baud_counter[10]_i_1_n_0 ;
  wire \baud_counter[11]_i_1_n_0 ;
  wire \baud_counter[12]_i_1_n_0 ;
  wire \baud_counter[13]_i_1_n_0 ;
  wire \baud_counter[14]_i_1_n_0 ;
  wire \baud_counter[15]_i_1_n_0 ;
  wire \baud_counter[16]_i_1_n_0 ;
  wire \baud_counter[17]_i_1_n_0 ;
  wire \baud_counter[18]_i_1_n_0 ;
  wire \baud_counter[19]_i_1_n_0 ;
  wire \baud_counter[1]_i_1_n_0 ;
  wire \baud_counter[20]_i_1_n_0 ;
  wire \baud_counter[21]_i_1_n_0 ;
  wire \baud_counter[22]_i_1_n_0 ;
  wire \baud_counter[23]_i_1_n_0 ;
  wire \baud_counter[24]_i_1_n_0 ;
  wire \baud_counter[25]_i_1_n_0 ;
  wire \baud_counter[26]_i_1_n_0 ;
  wire \baud_counter[27]_i_1_n_0 ;
  wire \baud_counter[27]_i_2_n_0 ;
  wire \baud_counter[27]_i_3_n_0 ;
  wire \baud_counter[2]_i_1_n_0 ;
  wire \baud_counter[2]_i_2_n_0 ;
  wire \baud_counter[3]_i_1_n_0 ;
  wire \baud_counter[3]_i_2_n_0 ;
  wire \baud_counter[4]_i_1_n_0 ;
  wire \baud_counter[5]_i_1_n_0 ;
  wire \baud_counter[6]_i_1_n_0 ;
  wire \baud_counter[7]_i_1_n_0 ;
  wire \baud_counter[8]_i_1_n_0 ;
  wire \baud_counter[9]_i_1_n_0 ;
  wire \baud_counter_reg_n_0_[0] ;
  wire \baud_counter_reg_n_0_[10] ;
  wire \baud_counter_reg_n_0_[11] ;
  wire \baud_counter_reg_n_0_[12] ;
  wire \baud_counter_reg_n_0_[13] ;
  wire \baud_counter_reg_n_0_[14] ;
  wire \baud_counter_reg_n_0_[15] ;
  wire \baud_counter_reg_n_0_[16] ;
  wire \baud_counter_reg_n_0_[17] ;
  wire \baud_counter_reg_n_0_[18] ;
  wire \baud_counter_reg_n_0_[19] ;
  wire \baud_counter_reg_n_0_[1] ;
  wire \baud_counter_reg_n_0_[20] ;
  wire \baud_counter_reg_n_0_[21] ;
  wire \baud_counter_reg_n_0_[22] ;
  wire \baud_counter_reg_n_0_[23] ;
  wire \baud_counter_reg_n_0_[24] ;
  wire \baud_counter_reg_n_0_[25] ;
  wire \baud_counter_reg_n_0_[26] ;
  wire \baud_counter_reg_n_0_[27] ;
  wire \baud_counter_reg_n_0_[2] ;
  wire \baud_counter_reg_n_0_[3] ;
  wire \baud_counter_reg_n_0_[4] ;
  wire \baud_counter_reg_n_0_[5] ;
  wire \baud_counter_reg_n_0_[6] ;
  wire \baud_counter_reg_n_0_[7] ;
  wire \baud_counter_reg_n_0_[8] ;
  wire \baud_counter_reg_n_0_[9] ;
  wire beenReadFlag;
  wire beenReadFlag_i_2_n_0;
  wire calc_parity_i_1_n_0;
  wire calc_parity_i_2_n_0;
  wire calc_parity_reg_n_0;
  wire ck_cts;
  wire ck_cts0;
  wire clk_BUFG;
  wire debug_ro_counts_reg_five;
  wire \debug_ro_counts_reg_five_reg[16] ;
  wire \debug_ro_counts_reg_five_reg[23] ;
  wire \debug_ro_counts_reg_five_reg[23]_0 ;
  wire \debug_ro_counts_reg_five_reg[23]_1 ;
  wire debug_ro_counts_reg_four;
  wire \debug_ro_counts_reg_four_reg[23] ;
  wire \debug_ro_counts_reg_four_reg[23]_0 ;
  wire \debug_ro_counts_reg_four_reg[23]_1 ;
  wire debug_ro_counts_reg_one;
  wire \debug_ro_counts_reg_one_reg[16] ;
  wire \debug_ro_counts_reg_one_reg[23] ;
  wire \debug_ro_counts_reg_one_reg[23]_0 ;
  wire \debug_ro_counts_reg_one_reg[23]_1 ;
  wire \debug_ro_counts_reg_seven_reg[15] ;
  wire \debug_ro_counts_reg_seven_reg[23] ;
  wire \debug_ro_counts_reg_seven_reg[23]_0 ;
  wire \debug_ro_counts_reg_seven_reg[23]_1 ;
  wire debug_ro_counts_reg_six;
  wire \debug_ro_counts_reg_six_reg[16] ;
  wire \debug_ro_counts_reg_six_reg[23] ;
  wire \debug_ro_counts_reg_six_reg[23]_0 ;
  wire \debug_ro_counts_reg_six_reg[23]_1 ;
  wire debug_ro_counts_reg_three;
  wire \debug_ro_counts_reg_three_reg[16] ;
  wire \debug_ro_counts_reg_three_reg[23] ;
  wire \debug_ro_counts_reg_three_reg[23]_0 ;
  wire \debug_ro_counts_reg_three_reg[23]_1 ;
  wire debug_ro_counts_reg_two;
  wire \debug_ro_counts_reg_two_reg[16] ;
  wire debug_ro_counts_reg_zero;
  wire \debug_ro_counts_reg_zero_reg[23] ;
  wire \debug_ro_counts_reg_zero_reg[23]_0 ;
  wire \debug_ro_counts_reg_zero_reg[23]_1 ;
  wire \debug_ro_counts_zero_reg_reg[4] ;
  wire \debug_ro_counts_zero_reg_reg[7] ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry__3_i_2_n_0;
  wire i__carry__3_i_3_n_0;
  wire i__carry__3_i_4_n_0;
  wire i__carry__4_i_1_n_0;
  wire i__carry__4_i_2_n_0;
  wire i__carry__4_i_3_n_0;
  wire i__carry__4_i_4_n_0;
  wire i__carry__5_i_1_n_0;
  wire i__carry__5_i_2_n_0;
  wire i__carry__5_i_3_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire \in32counter_one_reg[2] ;
  wire last_state;
  wire last_state_i_1_n_0;
  wire [0:0]lcl_data;
  wire \lcl_data[0]_i_1_n_0 ;
  wire \lcl_data[1]_i_1_n_0 ;
  wire \lcl_data[2]_i_1_n_0 ;
  wire \lcl_data[3]_i_1_n_0 ;
  wire \lcl_data[4]_i_1_n_0 ;
  wire \lcl_data[5]_i_1_n_0 ;
  wire \lcl_data[6]_i_1_n_0 ;
  wire \lcl_data[7]_i_1_n_0 ;
  wire \lcl_data[7]_i_2_n_0 ;
  wire [7:0]\lcl_data_reg[7]_0 ;
  wire \lcl_data_reg_n_0_[1] ;
  wire \lcl_data_reg_n_0_[2] ;
  wire \lcl_data_reg_n_0_[3] ;
  wire \lcl_data_reg_n_0_[4] ;
  wire \lcl_data_reg_n_0_[5] ;
  wire \lcl_data_reg_n_0_[6] ;
  wire \lcl_data_reg_n_0_[7] ;
  wire o_uart_tx_i_1_n_0;
  wire o_uart_tx_i_2_n_0;
  wire o_uart_tx_i_3_n_0;
  wire o_uart_tx_reg_0;
  wire o_uart_tx_reg_1;
  wire \out32counter_five_reg[2] ;
  wire \out32counter_five_reg[2]_0 ;
  wire \out32counter_five_reg[2]_1 ;
  wire \out32counter_four_reg[2] ;
  wire \out32counter_one_reg[2] ;
  wire \out32counter_seven_reg[2] ;
  wire \out32counter_seven_reg[2]_0 ;
  wire \out32counter_six_reg[2] ;
  wire \out32counter_three_reg[2] ;
  wire \out32counter_two[2]_i_2_n_0 ;
  wire \out32counter_two_reg[0] ;
  wire \out32counter_two_reg[0]_0 ;
  wire \out32counter_two_reg[0]_1 ;
  wire \out32counter_two_reg[2] ;
  wire \out32counter_two_reg[2]_0 ;
  wire \out32counter_two_reg[2]_1 ;
  wire \out32counter_two_reg[2]_2 ;
  wire \out32counter_two_reg[2]_3 ;
  wire \out32counter_zero_reg[2] ;
  wire p_0_in;
  wire p_1_in;
  wire [3:0]p_2_in;
  wire \phantom_output_data_reg[4] ;
  wire \phantom_output_data_reg[7] ;
  wire q_cts_n;
  wire qq_cts_n;
  wire r_busy0;
  wire r_busy_i_1_n_0;
  wire r_busy_reg_0;
  wire r_busy_reg_1;
  wire r_busy_reg_2;
  wire r_busy_reg_3;
  wire r_busy_reg_4;
  wire rst;
  wire rxHasData;
  wire \state[3]_i_1_n_0 ;
  wire \state[3]_i_2__1_n_0 ;
  wire \state_reg[1]_0 ;
  wire \state_reg[1]_1 ;
  wire \state_reg[1]_2 ;
  wire [5:0]\state_reg[2]_0 ;
  wire \state_reg[2]_1 ;
  wire \state_reg[2]_2 ;
  wire \state_reg[2]_3 ;
  wire \state_reg[2]_4 ;
  wire \state_reg[3]_0 ;
  wire \state_reg[3]_1 ;
  wire [0:0]\state_reg[3]_2 ;
  wire \state_reg[3]_3 ;
  wire \state_reg[4] ;
  wire \state_reg[4]_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire tx_busy;
  wire \tx_byte[0]_i_11_n_0 ;
  wire \tx_byte[0]_i_12_n_0 ;
  wire \tx_byte[0]_i_14_n_0 ;
  wire \tx_byte[0]_i_15_n_0 ;
  wire \tx_byte[0]_i_2_n_0 ;
  wire [0:0]\tx_byte[0]_i_4_0 ;
  wire [0:0]\tx_byte[0]_i_4_1 ;
  wire \tx_byte[0]_i_4_n_0 ;
  wire \tx_byte[0]_i_8_n_0 ;
  wire \tx_byte[0]_i_9_n_0 ;
  wire \tx_byte[1]_i_10_n_0 ;
  wire \tx_byte[1]_i_2_n_0 ;
  wire \tx_byte[1]_i_4_n_0 ;
  wire \tx_byte[1]_i_5_n_0 ;
  wire \tx_byte[1]_i_7_n_0 ;
  wire \tx_byte[1]_i_8_n_0 ;
  wire \tx_byte[2]_i_10_n_0 ;
  wire \tx_byte[2]_i_2_n_0 ;
  wire \tx_byte[2]_i_5_n_0 ;
  wire \tx_byte[2]_i_6_n_0 ;
  wire \tx_byte[2]_i_8_n_0 ;
  wire \tx_byte[2]_i_9_n_0 ;
  wire \tx_byte[3]_i_10_n_0 ;
  wire \tx_byte[3]_i_2_n_0 ;
  wire \tx_byte[3]_i_5_n_0 ;
  wire \tx_byte[3]_i_6_n_0 ;
  wire \tx_byte[3]_i_8_n_0 ;
  wire \tx_byte[3]_i_9_n_0 ;
  wire \tx_byte[4]_i_10_n_0 ;
  wire \tx_byte[5]_i_10_n_0 ;
  wire \tx_byte[5]_i_13_n_0 ;
  wire \tx_byte[5]_i_2_n_0 ;
  wire [4:0]\tx_byte[5]_i_4_0 ;
  wire \tx_byte[5]_i_4_1 ;
  wire [4:0]\tx_byte[5]_i_4_2 ;
  wire \tx_byte[5]_i_4_n_0 ;
  wire \tx_byte[5]_i_5_n_0 ;
  wire \tx_byte[5]_i_9_n_0 ;
  wire \tx_byte[6]_i_12_n_0 ;
  wire \tx_byte[6]_i_2_n_0 ;
  wire \tx_byte[6]_i_6_n_0 ;
  wire \tx_byte[6]_i_7_n_0 ;
  wire \tx_byte[7]_i_18_n_0 ;
  wire [7:0]\tx_byte[7]_i_6_0 ;
  wire [7:0]\tx_byte[7]_i_6_1 ;
  wire \tx_byte[7]_i_7_n_0 ;
  wire \tx_byte[7]_i_8_n_0 ;
  wire \tx_byte_reg[0] ;
  wire \tx_byte_reg[0]_0 ;
  wire \tx_byte_reg[0]_1 ;
  wire \tx_byte_reg[0]_2 ;
  wire \tx_byte_reg[0]_3 ;
  wire \tx_byte_reg[0]_4 ;
  wire \tx_byte_reg[0]_i_3_n_0 ;
  wire \tx_byte_reg[1] ;
  wire \tx_byte_reg[1]_0 ;
  wire \tx_byte_reg[1]_1 ;
  wire \tx_byte_reg[2] ;
  wire \tx_byte_reg[2]_0 ;
  wire \tx_byte_reg[3] ;
  wire \tx_byte_reg[3]_0 ;
  wire \tx_byte_reg[4] ;
  wire \tx_byte_reg[5] ;
  wire \tx_byte_reg[5]_0 ;
  wire [3:0]\tx_byte_reg[5]_1 ;
  wire [3:0]\tx_byte_reg[5]_2 ;
  wire \tx_byte_reg[5]_3 ;
  wire \tx_byte_reg[6] ;
  wire \tx_byte_reg[6]_0 ;
  wire \tx_byte_reg[6]_1 ;
  wire [4:0]\tx_byte_reg[6]_2 ;
  wire [4:0]\tx_byte_reg[6]_3 ;
  wire [7:0]\tx_byte_reg[7] ;
  wire \tx_byte_reg[7]_0 ;
  wire [7:0]\tx_byte_reg[7]_1 ;
  wire [7:0]\tx_byte_reg[7]_2 ;
  wire tx_valid;
  wire tx_valid_i_2_n_0;
  wire tx_valid_i_3_n_0;
  wire tx_valid_i_4_n_0;
  wire tx_valid_i_5_n_0;
  wire zero_baud_counter;
  wire zero_baud_counter_i_2__0_n_0;
  wire zero_baud_counter_i_3__0_n_0;
  wire zero_baud_counter_i_4__0_n_0;
  wire zero_baud_counter_i_5_n_0;
  wire zero_baud_counter_i_6__0_n_0;
  wire zero_baud_counter_i_7__0_n_0;
  wire zero_baud_counter_i_8__0_n_0;
  wire zero_baud_counter_i_9_n_0;
  wire [3:0]\NLW_baud_counter0_inferred__1/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_counter0_inferred__1/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_counter0_inferred__1/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_counter0_inferred__1/i__carry__2_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_counter0_inferred__1/i__carry__3_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_counter0_inferred__1/i__carry__4_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry 
       (.CI(\<const0> ),
        .CO({\baud_counter0_inferred__1/i__carry_n_0 ,\NLW_baud_counter0_inferred__1/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(\baud_counter_reg_n_0_[0] ),
        .DI({\baud_counter_reg_n_0_[4] ,\baud_counter_reg_n_0_[3] ,\baud_counter_reg_n_0_[2] ,\baud_counter_reg_n_0_[1] }),
        .O(baud_counter00_in[4:1]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry__0 
       (.CI(\baud_counter0_inferred__1/i__carry_n_0 ),
        .CO({\baud_counter0_inferred__1/i__carry__0_n_0 ,\NLW_baud_counter0_inferred__1/i__carry__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\baud_counter_reg_n_0_[8] ,\baud_counter_reg_n_0_[7] ,\baud_counter_reg_n_0_[6] ,\baud_counter_reg_n_0_[5] }),
        .O(baud_counter00_in[8:5]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry__1 
       (.CI(\baud_counter0_inferred__1/i__carry__0_n_0 ),
        .CO({\baud_counter0_inferred__1/i__carry__1_n_0 ,\NLW_baud_counter0_inferred__1/i__carry__1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\baud_counter_reg_n_0_[12] ,\baud_counter_reg_n_0_[11] ,\baud_counter_reg_n_0_[10] ,\baud_counter_reg_n_0_[9] }),
        .O(baud_counter00_in[12:9]),
        .S({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry__2 
       (.CI(\baud_counter0_inferred__1/i__carry__1_n_0 ),
        .CO({\baud_counter0_inferred__1/i__carry__2_n_0 ,\NLW_baud_counter0_inferred__1/i__carry__2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\baud_counter_reg_n_0_[16] ,\baud_counter_reg_n_0_[15] ,\baud_counter_reg_n_0_[14] ,\baud_counter_reg_n_0_[13] }),
        .O(baud_counter00_in[16:13]),
        .S({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry__3 
       (.CI(\baud_counter0_inferred__1/i__carry__2_n_0 ),
        .CO({\baud_counter0_inferred__1/i__carry__3_n_0 ,\NLW_baud_counter0_inferred__1/i__carry__3_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\baud_counter_reg_n_0_[20] ,\baud_counter_reg_n_0_[19] ,\baud_counter_reg_n_0_[18] ,\baud_counter_reg_n_0_[17] }),
        .O(baud_counter00_in[20:17]),
        .S({i__carry__3_i_1_n_0,i__carry__3_i_2_n_0,i__carry__3_i_3_n_0,i__carry__3_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry__4 
       (.CI(\baud_counter0_inferred__1/i__carry__3_n_0 ),
        .CO({\baud_counter0_inferred__1/i__carry__4_n_0 ,\NLW_baud_counter0_inferred__1/i__carry__4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\baud_counter_reg_n_0_[24] ,\baud_counter_reg_n_0_[23] ,\baud_counter_reg_n_0_[22] ,\baud_counter_reg_n_0_[21] }),
        .O(baud_counter00_in[24:21]),
        .S({i__carry__4_i_1_n_0,i__carry__4_i_2_n_0,i__carry__4_i_3_n_0,i__carry__4_i_4_n_0}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \baud_counter0_inferred__1/i__carry__5 
       (.CI(\baud_counter0_inferred__1/i__carry__4_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\baud_counter_reg_n_0_[26] ,\baud_counter_reg_n_0_[25] }),
        .O(baud_counter00_in[27:25]),
        .S({\<const0> ,i__carry__5_i_1_n_0,i__carry__5_i_2_n_0,i__carry__5_i_3_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h00B1)) 
    \baud_counter[0]_i_1__0 
       (.I0(zero_baud_counter),
        .I1(\baud_counter_reg_n_0_[0] ),
        .I2(\baud_counter[2]_i_2_n_0 ),
        .I3(\baud_counter[27]_i_3_n_0 ),
        .O(\baud_counter[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[10]_i_1 
       (.I0(baud_counter00_in[10]),
        .I1(zero_baud_counter),
        .O(\baud_counter[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[11]_i_1 
       (.I0(baud_counter00_in[11]),
        .I1(zero_baud_counter),
        .O(\baud_counter[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[12]_i_1 
       (.I0(baud_counter00_in[12]),
        .I1(zero_baud_counter),
        .O(\baud_counter[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[13]_i_1 
       (.I0(baud_counter00_in[13]),
        .I1(zero_baud_counter),
        .O(\baud_counter[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[14]_i_1 
       (.I0(baud_counter00_in[14]),
        .I1(zero_baud_counter),
        .O(\baud_counter[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[15]_i_1 
       (.I0(baud_counter00_in[15]),
        .I1(zero_baud_counter),
        .O(\baud_counter[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[16]_i_1 
       (.I0(baud_counter00_in[16]),
        .I1(zero_baud_counter),
        .O(\baud_counter[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[17]_i_1 
       (.I0(baud_counter00_in[17]),
        .I1(zero_baud_counter),
        .O(\baud_counter[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[18]_i_1 
       (.I0(baud_counter00_in[18]),
        .I1(zero_baud_counter),
        .O(\baud_counter[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[19]_i_1 
       (.I0(baud_counter00_in[19]),
        .I1(zero_baud_counter),
        .O(\baud_counter[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAFFFF2AAA0000)) 
    \baud_counter[1]_i_1 
       (.I0(last_state),
        .I1(p_0_in),
        .I2(\state_reg_n_0_[2] ),
        .I3(\baud_counter[3]_i_2_n_0 ),
        .I4(zero_baud_counter),
        .I5(baud_counter00_in[1]),
        .O(\baud_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[20]_i_1 
       (.I0(baud_counter00_in[20]),
        .I1(zero_baud_counter),
        .O(\baud_counter[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[21]_i_1 
       (.I0(baud_counter00_in[21]),
        .I1(zero_baud_counter),
        .O(\baud_counter[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[22]_i_1 
       (.I0(baud_counter00_in[22]),
        .I1(zero_baud_counter),
        .O(\baud_counter[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[23]_i_1 
       (.I0(baud_counter00_in[23]),
        .I1(zero_baud_counter),
        .O(\baud_counter[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[24]_i_1 
       (.I0(baud_counter00_in[24]),
        .I1(zero_baud_counter),
        .O(\baud_counter[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[25]_i_1 
       (.I0(baud_counter00_in[25]),
        .I1(zero_baud_counter),
        .O(\baud_counter[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[26]_i_1 
       (.I0(baud_counter00_in[26]),
        .I1(zero_baud_counter),
        .O(\baud_counter[26]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \baud_counter[27]_i_1 
       (.I0(rst),
        .I1(\baud_counter[27]_i_3_n_0 ),
        .O(\baud_counter[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[27]_i_2 
       (.I0(baud_counter00_in[27]),
        .I1(zero_baud_counter),
        .O(\baud_counter[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7000000000000000)) 
    \baud_counter[27]_i_3 
       (.I0(r_busy0),
        .I1(\state_reg_n_0_[0] ),
        .I2(zero_baud_counter),
        .I3(\state_reg_n_0_[1] ),
        .I4(p_0_in),
        .I5(\state_reg_n_0_[2] ),
        .O(\baud_counter[27]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    \baud_counter[2]_i_1 
       (.I0(baud_counter00_in[2]),
        .I1(zero_baud_counter),
        .I2(\baud_counter[2]_i_2_n_0 ),
        .I3(\baud_counter[27]_i_3_n_0 ),
        .O(\baud_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \baud_counter[2]_i_2 
       (.I0(last_state),
        .I1(p_0_in),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .O(\baud_counter[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hD555D555FFFF0000)) 
    \baud_counter[3]_i_1 
       (.I0(last_state),
        .I1(p_0_in),
        .I2(\state_reg_n_0_[2] ),
        .I3(\baud_counter[3]_i_2_n_0 ),
        .I4(baud_counter00_in[3]),
        .I5(zero_baud_counter),
        .O(\baud_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \baud_counter[3]_i_2 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .O(\baud_counter[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \baud_counter[4]_i_1 
       (.I0(zero_baud_counter),
        .I1(baud_counter00_in[4]),
        .O(\baud_counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[5]_i_1 
       (.I0(baud_counter00_in[5]),
        .I1(zero_baud_counter),
        .O(\baud_counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \baud_counter[6]_i_1 
       (.I0(zero_baud_counter),
        .I1(baud_counter00_in[6]),
        .O(\baud_counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \baud_counter[7]_i_1 
       (.I0(zero_baud_counter),
        .I1(baud_counter00_in[7]),
        .O(\baud_counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[8]_i_1 
       (.I0(baud_counter00_in[8]),
        .I1(zero_baud_counter),
        .O(\baud_counter[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baud_counter[9]_i_1 
       (.I0(baud_counter00_in[9]),
        .I1(zero_baud_counter),
        .O(\baud_counter[9]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \baud_counter_reg[0] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[0]_i_1__0_n_0 ),
        .Q(\baud_counter_reg_n_0_[0] ),
        .S(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[10] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[10]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[10] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[11] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[11]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[11] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[12] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[12]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[12] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[13] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[13]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[13] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[14] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[14]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[14] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[15] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[15]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[15] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[16] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[16]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[16] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[17] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[17]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[17] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[18] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[18]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[18] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[19] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[19]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[19] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[1] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[1]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[1] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[20] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[20]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[20] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[21] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[21]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[21] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[22] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[22]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[22] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[23] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[23]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[23] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[24] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[24]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[24] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[25] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[25]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[25] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[26] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[26]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[26] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[27] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[27]_i_2_n_0 ),
        .Q(\baud_counter_reg_n_0_[27] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \baud_counter_reg[2] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[2]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[2] ),
        .S(rst));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[3] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[3]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[3] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[4] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[4]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[4] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[5] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[5]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[5] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[6] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[6]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[6] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[7] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[7]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[7] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[8] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[8]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[8] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[9] 
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\baud_counter[9]_i_1_n_0 ),
        .Q(\baud_counter_reg_n_0_[9] ),
        .R(\baud_counter[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF800080)) 
    beenReadFlag_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(beenReadFlag_i_2_n_0),
        .I3(rst),
        .I4(beenReadFlag),
        .O(\state_reg[1]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    beenReadFlag_i_2
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(tx_busy),
        .O(beenReadFlag_i_2_n_0));
  LUT6 #(
    .INIT(64'hDDFFFFFFE200FFFF)) 
    calc_parity_i_1
       (.I0(lcl_data),
        .I1(p_0_in),
        .I2(calc_parity_i_2_n_0),
        .I3(zero_baud_counter),
        .I4(tx_busy),
        .I5(calc_parity_reg_n_0),
        .O(calc_parity_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h80)) 
    calc_parity_i_2
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .O(calc_parity_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    calc_parity_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(calc_parity_i_1_n_0),
        .Q(calc_parity_reg_n_0),
        .R(rst));
  LUT1 #(
    .INIT(2'h1)) 
    ck_cts_i_1
       (.I0(qq_cts_n),
        .O(ck_cts0));
  FDRE ck_cts_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(ck_cts0),
        .Q(ck_cts),
        .R(rst));
  LUT5 #(
    .INIT(32'h00000002)) 
    \debug_ro_counts_reg_five[15]_i_1 
       (.I0(\debug_ro_counts_reg_five_reg[16] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_five_reg[23] ),
        .I3(Q[4]),
        .I4(Q[0]),
        .O(debug_ro_counts_reg_five));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_five[23]_i_1 
       (.I0(debug_ro_counts_reg_five),
        .I1(\debug_ro_counts_reg_five_reg[23] ),
        .I2(\debug_ro_counts_reg_five_reg[23]_1 ),
        .I3(\debug_ro_counts_reg_five_reg[23]_0 ),
        .O(\out32counter_five_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'h00000400)) 
    \debug_ro_counts_reg_four[15]_i_1 
       (.I0(rst),
        .I1(\tx_byte_reg[0] ),
        .I2(\debug_ro_counts_reg_four_reg[23] ),
        .I3(Q[2]),
        .I4(tx_busy),
        .O(debug_ro_counts_reg_four));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_four[23]_i_1 
       (.I0(debug_ro_counts_reg_four),
        .I1(\debug_ro_counts_reg_four_reg[23] ),
        .I2(\debug_ro_counts_reg_four_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_four_reg[23]_1 ),
        .O(\out32counter_four_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \debug_ro_counts_reg_one[15]_i_1 
       (.I0(\debug_ro_counts_reg_one_reg[16] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_one_reg[23] ),
        .I3(rst),
        .I4(Q[2]),
        .O(debug_ro_counts_reg_one));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_one[23]_i_1 
       (.I0(debug_ro_counts_reg_one),
        .I1(\debug_ro_counts_reg_one_reg[23] ),
        .I2(\debug_ro_counts_reg_one_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_one_reg[23]_1 ),
        .O(\out32counter_one_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \debug_ro_counts_reg_seven[15]_i_1 
       (.I0(tx_busy),
        .I1(Q[2]),
        .I2(\debug_ro_counts_reg_seven_reg[15] ),
        .I3(rst),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(E));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_seven[23]_i_1 
       (.I0(E),
        .I1(\debug_ro_counts_reg_seven_reg[23] ),
        .I2(\debug_ro_counts_reg_seven_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_seven_reg[23]_1 ),
        .O(\out32counter_seven_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \debug_ro_counts_reg_six[15]_i_1 
       (.I0(\debug_ro_counts_reg_six_reg[16] ),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(Q[1]),
        .I4(rst),
        .I5(Q[4]),
        .O(debug_ro_counts_reg_six));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_six[23]_i_1 
       (.I0(debug_ro_counts_reg_six),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .O(\out32counter_six_reg[2] ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \debug_ro_counts_reg_three[15]_i_1 
       (.I0(\debug_ro_counts_reg_three_reg[16] ),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(tx_busy),
        .I4(Q[3]),
        .I5(\debug_ro_counts_reg_three_reg[23]_1 ),
        .O(debug_ro_counts_reg_three));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_three[23]_i_1 
       (.I0(debug_ro_counts_reg_three),
        .I1(\debug_ro_counts_reg_three_reg[23]_1 ),
        .I2(\debug_ro_counts_reg_three_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_three_reg[23] ),
        .O(\out32counter_three_reg[2] ));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    \debug_ro_counts_reg_two[15]_i_1 
       (.I0(\out32counter_two_reg[2]_3 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\debug_ro_counts_reg_two_reg[16] ),
        .I4(tx_busy),
        .I5(Q[3]),
        .O(debug_ro_counts_reg_two));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_two[23]_i_1 
       (.I0(debug_ro_counts_reg_two),
        .I1(\out32counter_two_reg[2]_3 ),
        .I2(\out32counter_two_reg[2]_2 ),
        .I3(\out32counter_two_reg[2]_1 ),
        .O(\out32counter_two_reg[2]_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \debug_ro_counts_reg_zero[15]_i_1 
       (.I0(rst),
        .I1(\tx_byte_reg[0] ),
        .I2(tx_busy),
        .I3(Q[2]),
        .I4(\debug_ro_counts_reg_zero_reg[23] ),
        .O(debug_ro_counts_reg_zero));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \debug_ro_counts_reg_zero[23]_i_1 
       (.I0(debug_ro_counts_reg_zero),
        .I1(\debug_ro_counts_reg_zero_reg[23] ),
        .I2(\debug_ro_counts_reg_zero_reg[23]_1 ),
        .I3(\debug_ro_counts_reg_zero_reg[23]_0 ),
        .O(\out32counter_zero_reg[2] ));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(\baud_counter_reg_n_0_[8] ),
        .O(i__carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2
       (.I0(\baud_counter_reg_n_0_[7] ),
        .O(i__carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3
       (.I0(\baud_counter_reg_n_0_[6] ),
        .O(i__carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4
       (.I0(\baud_counter_reg_n_0_[5] ),
        .O(i__carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1
       (.I0(\baud_counter_reg_n_0_[12] ),
        .O(i__carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2
       (.I0(\baud_counter_reg_n_0_[11] ),
        .O(i__carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_3
       (.I0(\baud_counter_reg_n_0_[10] ),
        .O(i__carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_4
       (.I0(\baud_counter_reg_n_0_[9] ),
        .O(i__carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_1
       (.I0(\baud_counter_reg_n_0_[16] ),
        .O(i__carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_2
       (.I0(\baud_counter_reg_n_0_[15] ),
        .O(i__carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_3
       (.I0(\baud_counter_reg_n_0_[14] ),
        .O(i__carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__2_i_4
       (.I0(\baud_counter_reg_n_0_[13] ),
        .O(i__carry__2_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_1
       (.I0(\baud_counter_reg_n_0_[20] ),
        .O(i__carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_2
       (.I0(\baud_counter_reg_n_0_[19] ),
        .O(i__carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_3
       (.I0(\baud_counter_reg_n_0_[18] ),
        .O(i__carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__3_i_4
       (.I0(\baud_counter_reg_n_0_[17] ),
        .O(i__carry__3_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__4_i_1
       (.I0(\baud_counter_reg_n_0_[24] ),
        .O(i__carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__4_i_2
       (.I0(\baud_counter_reg_n_0_[23] ),
        .O(i__carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__4_i_3
       (.I0(\baud_counter_reg_n_0_[22] ),
        .O(i__carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__4_i_4
       (.I0(\baud_counter_reg_n_0_[21] ),
        .O(i__carry__4_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__5_i_1
       (.I0(\baud_counter_reg_n_0_[27] ),
        .O(i__carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__5_i_2
       (.I0(\baud_counter_reg_n_0_[26] ),
        .O(i__carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__5_i_3
       (.I0(\baud_counter_reg_n_0_[25] ),
        .O(i__carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1
       (.I0(\baud_counter_reg_n_0_[4] ),
        .O(i__carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2
       (.I0(\baud_counter_reg_n_0_[3] ),
        .O(i__carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3
       (.I0(\baud_counter_reg_n_0_[2] ),
        .O(i__carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4
       (.I0(\baud_counter_reg_n_0_[1] ),
        .O(i__carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    last_state_i_1
       (.I0(\state_reg_n_0_[2] ),
        .I1(p_0_in),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .O(last_state_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    last_state_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(last_state_i_1_n_0),
        .Q(last_state),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[0]_i_1 
       (.I0(\lcl_data_reg_n_0_[1] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [0]),
        .O(\lcl_data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[1]_i_1 
       (.I0(\lcl_data_reg_n_0_[2] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [1]),
        .O(\lcl_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[2]_i_1 
       (.I0(\lcl_data_reg_n_0_[3] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [2]),
        .O(\lcl_data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[3]_i_1 
       (.I0(\lcl_data_reg_n_0_[4] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [3]),
        .O(\lcl_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[4]_i_1 
       (.I0(\lcl_data_reg_n_0_[5] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [4]),
        .O(\lcl_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[5]_i_1 
       (.I0(\lcl_data_reg_n_0_[6] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [5]),
        .O(\lcl_data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \lcl_data[6]_i_1 
       (.I0(\lcl_data_reg_n_0_[7] ),
        .I1(tx_busy),
        .I2(\lcl_data_reg[7]_0 [6]),
        .O(\lcl_data[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \lcl_data[7]_i_1 
       (.I0(zero_baud_counter),
        .I1(tx_busy),
        .O(\lcl_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \lcl_data[7]_i_2 
       (.I0(\lcl_data_reg[7]_0 [7]),
        .I1(tx_busy),
        .O(\lcl_data[7]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[0] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[0]_i_1_n_0 ),
        .Q(lcl_data),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[1] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[1]_i_1_n_0 ),
        .Q(\lcl_data_reg_n_0_[1] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[2] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[2]_i_1_n_0 ),
        .Q(\lcl_data_reg_n_0_[2] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[3] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[3]_i_1_n_0 ),
        .Q(\lcl_data_reg_n_0_[3] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[4] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[4]_i_1_n_0 ),
        .Q(\lcl_data_reg_n_0_[4] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[5] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[5]_i_1_n_0 ),
        .Q(\lcl_data_reg_n_0_[5] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[6] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[6]_i_1_n_0 ),
        .Q(\lcl_data_reg_n_0_[6] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \lcl_data_reg[7] 
       (.C(clk_BUFG),
        .CE(\lcl_data[7]_i_1_n_0 ),
        .D(\lcl_data[7]_i_2_n_0 ),
        .Q(\lcl_data_reg_n_0_[7] ),
        .S(rst));
  LUT3 #(
    .INIT(8'hBA)) 
    o_uart_tx_i_1
       (.I0(zero_baud_counter),
        .I1(tx_busy),
        .I2(o_uart_tx_reg_1),
        .O(o_uart_tx_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000FFF7CCC4)) 
    o_uart_tx_i_2
       (.I0(o_uart_tx_i_3_n_0),
        .I1(p_0_in),
        .I2(\state_reg_n_0_[2] ),
        .I3(calc_parity_reg_n_0),
        .I4(lcl_data),
        .I5(r_busy0),
        .O(o_uart_tx_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h1)) 
    o_uart_tx_i_3
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .O(o_uart_tx_i_3_n_0));
  FDSE #(
    .INIT(1'b1)) 
    o_uart_tx_reg
       (.C(clk_BUFG),
        .CE(o_uart_tx_i_1_n_0),
        .D(o_uart_tx_i_2_n_0),
        .Q(o_uart_tx_reg_0),
        .S(rst));
  LUT4 #(
    .INIT(16'h0F20)) 
    \out32counter_two[0]_i_1 
       (.I0(Q[3]),
        .I1(\out32counter_two_reg[2]_3 ),
        .I2(\out32counter_two[2]_i_2_n_0 ),
        .I3(\out32counter_two_reg[2]_1 ),
        .O(\state_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'h04FF4000)) 
    \out32counter_two[1]_i_1 
       (.I0(\out32counter_two_reg[2]_3 ),
        .I1(Q[3]),
        .I2(\out32counter_two_reg[2]_1 ),
        .I3(\out32counter_two[2]_i_2_n_0 ),
        .I4(\out32counter_two_reg[2]_2 ),
        .O(\out32counter_two_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'h00FF8000)) 
    \out32counter_two[2]_i_1 
       (.I0(\out32counter_two_reg[2]_1 ),
        .I1(\out32counter_two_reg[2]_2 ),
        .I2(Q[3]),
        .I3(\out32counter_two[2]_i_2_n_0 ),
        .I4(\out32counter_two_reg[2]_3 ),
        .O(\out32counter_two_reg[0] ));
  LUT6 #(
    .INIT(64'h0000A200AAAAAAAA)) 
    \out32counter_two[2]_i_2 
       (.I0(\debug_ro_counts_reg_two_reg[16] ),
        .I1(tx_busy),
        .I2(\out32counter_two_reg[2]_3 ),
        .I3(Q[0]),
        .I4(\out32counter_two_reg[0]_0 ),
        .I5(\out32counter_two_reg[0]_1 ),
        .O(\out32counter_two[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDFFFDDDDDFDFDDDD)) 
    \out32counter_zero[2]_i_5 
       (.I0(\debug_ro_counts_reg_two_reg[16] ),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(\debug_ro_counts_reg_zero_reg[23] ),
        .I4(Q[0]),
        .I5(tx_busy),
        .O(\state_reg[1]_0 ));
  FDSE q_cts_n_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(\<const0> ),
        .Q(q_cts_n),
        .S(rst));
  FDSE qq_cts_n_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(q_cts_n),
        .Q(qq_cts_n),
        .S(rst));
  LUT3 #(
    .INIT(8'hDF)) 
    r_busy_i_1
       (.I0(ck_cts),
        .I1(rst),
        .I2(\baud_counter[27]_i_3_n_0 ),
        .O(r_busy_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    r_busy_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(r_busy_i_1_n_0),
        .Q(tx_busy),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h70FF)) 
    \state[0]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(p_0_in),
        .I3(\state_reg_n_0_[0] ),
        .O(p_2_in[0]));
  LUT6 #(
    .INIT(64'h00000000A0300F00)) 
    \state[0]_i_7 
       (.I0(tx_busy),
        .I1(\state_reg[2]_3 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(r_busy_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h76E6)) 
    \state[1]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(p_0_in),
        .I3(\state_reg_n_0_[2] ),
        .O(p_2_in[1]));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \state[1]_i_3 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(tx_busy),
        .O(\state_reg[4] ));
  LUT6 #(
    .INIT(64'h00000000A03000F0)) 
    \state[1]_i_4 
       (.I0(tx_busy),
        .I1(\state_reg[2]_2 ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(r_busy_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h3FE8)) 
    \state[2]_i_1 
       (.I0(p_0_in),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[2] ),
        .O(p_2_in[2]));
  LUT6 #(
    .INIT(64'hCC550FCC00000000)) 
    \state[2]_i_4 
       (.I0(\state_reg[2]_3 ),
        .I1(tx_busy),
        .I2(\state_reg[2]_2 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\state_reg[2]_4 ),
        .O(\in32counter_one_reg[2] ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \state[3]_i_1 
       (.I0(zero_baud_counter),
        .I1(r_busy0),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .I5(p_0_in),
        .O(\state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h444444444444FFF4)) 
    \state[3]_i_1__1 
       (.I0(\state_reg[3]_1 ),
        .I1(\state_reg[3]_2 ),
        .I2(\state[3]_i_2__1_n_0 ),
        .I3(\state_reg[3]_3 ),
        .I4(Q[4]),
        .I5(Q[3]),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \state[3]_i_2 
       (.I0(p_0_in),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[2] ),
        .O(p_2_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \state[3]_i_2__1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(tx_busy),
        .O(\state[3]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \state[3]_i_3 
       (.I0(o_uart_tx_reg_1),
        .I1(tx_busy),
        .O(r_busy0));
  LUT6 #(
    .INIT(64'h0C05000000000000)) 
    \state[4]_i_7 
       (.I0(\debug_ro_counts_reg_seven_reg[23] ),
        .I1(tx_busy),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\state_reg[4]_0 ),
        .I5(Q[4]),
        .O(\out32counter_seven_reg[2] ));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[0] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(\state_reg_n_0_[0] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[1] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(\state_reg_n_0_[1] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[2] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(\state_reg_n_0_[2] ),
        .S(rst));
  FDSE #(
    .INIT(1'b1)) 
    \state_reg[3] 
       (.C(clk_BUFG),
        .CE(\state[3]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(p_0_in),
        .S(rst));
  LUT6 #(
    .INIT(64'hFFAEFFAEFFFFFFAE)) 
    \tx_byte[0]_i_1 
       (.I0(\tx_byte[0]_i_2_n_0 ),
        .I1(\tx_byte_reg[0] ),
        .I2(\tx_byte_reg[0]_i_3_n_0 ),
        .I3(\tx_byte[0]_i_4_n_0 ),
        .I4(\tx_byte_reg[0]_0 ),
        .I5(\tx_byte_reg[0]_1 ),
        .O(\state_reg[2]_0 [0]));
  LUT6 #(
    .INIT(64'h2222223322222230)) 
    \tx_byte[0]_i_11 
       (.I0(\tx_byte[5]_i_4_0 [0]),
        .I1(\tx_byte[0]_i_14_n_0 ),
        .I2(\tx_byte[5]_i_4_2 [0]),
        .I3(\debug_ro_counts_reg_three_reg[23] ),
        .I4(\debug_ro_counts_reg_three_reg[23]_0 ),
        .I5(\debug_ro_counts_reg_three_reg[23]_1 ),
        .O(\tx_byte[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h55555557FFF5FFF7)) 
    \tx_byte[0]_i_12 
       (.I0(\tx_byte[0]_i_15_n_0 ),
        .I1(\debug_ro_counts_reg_seven_reg[23] ),
        .I2(\debug_ro_counts_reg_seven_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_seven_reg[23]_1 ),
        .I4(\tx_byte[0]_i_4_0 ),
        .I5(\tx_byte[0]_i_4_1 ),
        .O(\tx_byte[0]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \tx_byte[0]_i_14 
       (.I0(\debug_ro_counts_reg_three_reg[23]_1 ),
        .I1(Q[3]),
        .I2(tx_busy),
        .I3(Q[2]),
        .I4(Q[4]),
        .O(\tx_byte[0]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \tx_byte[0]_i_15 
       (.I0(Q[3]),
        .I1(Q[4]),
        .I2(\debug_ro_counts_reg_seven_reg[23] ),
        .I3(Q[2]),
        .I4(tx_busy),
        .O(\tx_byte[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAA80AAAAAA80AA80)) 
    \tx_byte[0]_i_2 
       (.I0(\tx_byte_reg[1] ),
        .I1(beenReadFlag_i_2_n_0),
        .I2(\tx_byte_reg[7] [0]),
        .I3(\tx_byte_reg[0]_2 ),
        .I4(\tx_byte[0]_i_8_n_0 ),
        .I5(\tx_byte_reg[0]_3 ),
        .O(\tx_byte[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1110101011111111)) 
    \tx_byte[0]_i_4 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\tx_byte[0]_i_11_n_0 ),
        .I3(beenReadFlag_i_2_n_0),
        .I4(rxHasData),
        .I5(\tx_byte[0]_i_12_n_0 ),
        .O(\tx_byte[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[0]_i_8 
       (.I0(\tx_byte[7]_i_6_0 [0]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [0]),
        .O(\tx_byte[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[0]_i_9 
       (.I0(\tx_byte_reg[7]_1 [0]),
        .I1(\debug_ro_counts_reg_zero_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_zero_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_zero_reg[23]_1 ),
        .I5(\tx_byte_reg[7]_2 [0]),
        .O(\tx_byte[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hCFDDCFDDFFFFCFDD)) 
    \tx_byte[1]_i_1 
       (.I0(\tx_byte[1]_i_2_n_0 ),
        .I1(\tx_byte_reg[1]_0 ),
        .I2(\tx_byte[1]_i_4_n_0 ),
        .I3(Q[2]),
        .I4(\tx_byte_reg[1] ),
        .I5(\tx_byte[1]_i_5_n_0 ),
        .O(\state_reg[2]_0 [1]));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[1]_i_10 
       (.I0(\tx_byte[7]_i_6_0 [1]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [1]),
        .O(\tx_byte[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F755F7F7)) 
    \tx_byte[1]_i_2 
       (.I0(\tx_byte_reg[0] ),
        .I1(\tx_byte_reg[7]_1 [1]),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte[7]_i_7_n_0 ),
        .I4(\tx_byte_reg[7]_2 [1]),
        .I5(\tx_byte_reg[1]_1 ),
        .O(\tx_byte[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFD0DD)) 
    \tx_byte[1]_i_4 
       (.I0(\tx_byte_reg[5]_1 [0]),
        .I1(\out32counter_five_reg[2] ),
        .I2(\out32counter_five_reg[2]_0 ),
        .I3(\tx_byte_reg[5]_2 [0]),
        .I4(\debug_ro_counts_reg_one_reg[16] ),
        .I5(\tx_byte[1]_i_7_n_0 ),
        .O(\tx_byte[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000575757DF)) 
    \tx_byte[1]_i_5 
       (.I0(\state_reg[2]_1 ),
        .I1(\tx_byte_reg[5]_3 ),
        .I2(\tx_byte_reg[6]_2 [0]),
        .I3(\out32counter_two_reg[2]_3 ),
        .I4(\tx_byte_reg[6]_3 [0]),
        .I5(\tx_byte[1]_i_8_n_0 ),
        .O(\tx_byte[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h808080C080808000)) 
    \tx_byte[1]_i_7 
       (.I0(\tx_byte[5]_i_4_0 [1]),
        .I1(\tx_byte[5]_i_4_1 ),
        .I2(\state_reg[1]_1 ),
        .I3(\debug_ro_counts_reg_three_reg[23] ),
        .I4(\debug_ro_counts_reg_three_reg[23]_0 ),
        .I5(\tx_byte[5]_i_4_2 [1]),
        .O(\tx_byte[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h1000103010001000)) 
    \tx_byte[1]_i_8 
       (.I0(\tx_byte[1]_i_10_n_0 ),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(tx_busy),
        .I5(\tx_byte_reg[7] [1]),
        .O(\tx_byte[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0FFFDFD)) 
    \tx_byte[2]_i_1 
       (.I0(\tx_byte[2]_i_2_n_0 ),
        .I1(\tx_byte_reg[2] ),
        .I2(\tx_byte_reg[2]_0 ),
        .I3(\tx_byte[2]_i_5_n_0 ),
        .I4(Q[2]),
        .I5(\tx_byte[2]_i_6_n_0 ),
        .O(\state_reg[2]_0 [2]));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[2]_i_10 
       (.I0(\tx_byte[7]_i_6_0 [2]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [2]),
        .O(\tx_byte[2]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hD0DDFFFF)) 
    \tx_byte[2]_i_2 
       (.I0(\tx_byte_reg[7]_2 [2]),
        .I1(\tx_byte[7]_i_7_n_0 ),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte_reg[7]_1 [2]),
        .I4(\tx_byte_reg[0] ),
        .O(\tx_byte[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFD0DD)) 
    \tx_byte[2]_i_5 
       (.I0(\tx_byte_reg[5]_1 [1]),
        .I1(\out32counter_five_reg[2] ),
        .I2(\out32counter_five_reg[2]_0 ),
        .I3(\tx_byte_reg[5]_2 [1]),
        .I4(\debug_ro_counts_reg_one_reg[16] ),
        .I5(\tx_byte[2]_i_8_n_0 ),
        .O(\tx_byte[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA888AAAAA888A888)) 
    \tx_byte[2]_i_6 
       (.I0(\tx_byte_reg[1] ),
        .I1(\tx_byte[2]_i_9_n_0 ),
        .I2(beenReadFlag_i_2_n_0),
        .I3(\tx_byte_reg[7] [2]),
        .I4(\tx_byte[2]_i_10_n_0 ),
        .I5(\tx_byte_reg[0]_3 ),
        .O(\tx_byte[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h808080C080808000)) 
    \tx_byte[2]_i_8 
       (.I0(\tx_byte[5]_i_4_0 [2]),
        .I1(\tx_byte[5]_i_4_1 ),
        .I2(\state_reg[1]_1 ),
        .I3(\debug_ro_counts_reg_three_reg[23] ),
        .I4(\debug_ro_counts_reg_three_reg[23]_0 ),
        .I5(\tx_byte[5]_i_4_2 [2]),
        .O(\tx_byte[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8000A0008)) 
    \tx_byte[2]_i_9 
       (.I0(\state_reg[2]_1 ),
        .I1(\out32counter_two_reg[2]_3 ),
        .I2(\out32counter_two_reg[2]_2 ),
        .I3(\out32counter_two_reg[2]_1 ),
        .I4(\tx_byte_reg[6]_3 [1]),
        .I5(\tx_byte_reg[6]_2 [1]),
        .O(\tx_byte[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0FFFDFD)) 
    \tx_byte[3]_i_1 
       (.I0(\tx_byte[3]_i_2_n_0 ),
        .I1(\tx_byte_reg[3] ),
        .I2(\tx_byte_reg[3]_0 ),
        .I3(\tx_byte[3]_i_5_n_0 ),
        .I4(Q[2]),
        .I5(\tx_byte[3]_i_6_n_0 ),
        .O(\state_reg[2]_0 [3]));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[3]_i_10 
       (.I0(\tx_byte[7]_i_6_0 [3]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [3]),
        .O(\tx_byte[3]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hD0DDFFFF)) 
    \tx_byte[3]_i_2 
       (.I0(\tx_byte_reg[7]_2 [3]),
        .I1(\tx_byte[7]_i_7_n_0 ),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte_reg[7]_1 [3]),
        .I4(\tx_byte_reg[0] ),
        .O(\tx_byte[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFD0DD)) 
    \tx_byte[3]_i_5 
       (.I0(\tx_byte_reg[5]_1 [2]),
        .I1(\out32counter_five_reg[2] ),
        .I2(\out32counter_five_reg[2]_0 ),
        .I3(\tx_byte_reg[5]_2 [2]),
        .I4(\debug_ro_counts_reg_one_reg[16] ),
        .I5(\tx_byte[3]_i_8_n_0 ),
        .O(\tx_byte[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA888AAAAA888A888)) 
    \tx_byte[3]_i_6 
       (.I0(\tx_byte_reg[1] ),
        .I1(\tx_byte[3]_i_9_n_0 ),
        .I2(beenReadFlag_i_2_n_0),
        .I3(\tx_byte_reg[7] [3]),
        .I4(\tx_byte[3]_i_10_n_0 ),
        .I5(\tx_byte_reg[0]_3 ),
        .O(\tx_byte[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h808080C080808000)) 
    \tx_byte[3]_i_8 
       (.I0(\tx_byte[5]_i_4_0 [3]),
        .I1(\tx_byte[5]_i_4_1 ),
        .I2(\state_reg[1]_1 ),
        .I3(\debug_ro_counts_reg_three_reg[23] ),
        .I4(\debug_ro_counts_reg_three_reg[23]_0 ),
        .I5(\tx_byte[5]_i_4_2 [3]),
        .O(\tx_byte[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8000A0008)) 
    \tx_byte[3]_i_9 
       (.I0(\state_reg[2]_1 ),
        .I1(\out32counter_two_reg[2]_3 ),
        .I2(\out32counter_two_reg[2]_2 ),
        .I3(\out32counter_two_reg[2]_1 ),
        .I4(\tx_byte_reg[6]_3 [2]),
        .I5(\tx_byte_reg[6]_2 [2]),
        .O(\tx_byte[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[4]_i_10 
       (.I0(\tx_byte[7]_i_6_0 [4]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [4]),
        .O(\tx_byte[4]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hD0DDFFFF)) 
    \tx_byte[4]_i_2 
       (.I0(\tx_byte_reg[7]_2 [4]),
        .I1(\tx_byte[7]_i_7_n_0 ),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte_reg[7]_1 [4]),
        .I4(\tx_byte_reg[0] ),
        .O(\debug_ro_counts_zero_reg_reg[4] ));
  LUT6 #(
    .INIT(64'hA888AAAAA888A888)) 
    \tx_byte[4]_i_6 
       (.I0(\tx_byte_reg[1] ),
        .I1(\tx_byte_reg[4] ),
        .I2(beenReadFlag_i_2_n_0),
        .I3(\tx_byte_reg[7] [4]),
        .I4(\tx_byte[4]_i_10_n_0 ),
        .I5(\tx_byte_reg[0]_3 ),
        .O(\phantom_output_data_reg[4] ));
  LUT6 #(
    .INIT(64'hCFDDCFDDFFFFCFDD)) 
    \tx_byte[5]_i_1 
       (.I0(\tx_byte[5]_i_2_n_0 ),
        .I1(\tx_byte_reg[5] ),
        .I2(\tx_byte[5]_i_4_n_0 ),
        .I3(Q[2]),
        .I4(\tx_byte_reg[1] ),
        .I5(\tx_byte[5]_i_5_n_0 ),
        .O(\state_reg[2]_0 [4]));
  LUT6 #(
    .INIT(64'h1000103010001000)) 
    \tx_byte[5]_i_10 
       (.I0(\tx_byte[5]_i_13_n_0 ),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(tx_busy),
        .I5(\tx_byte_reg[7] [5]),
        .O(\tx_byte[5]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[5]_i_13 
       (.I0(\tx_byte[7]_i_6_0 [5]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [5]),
        .O(\tx_byte[5]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F755F7F7)) 
    \tx_byte[5]_i_2 
       (.I0(\tx_byte_reg[0] ),
        .I1(\tx_byte_reg[7]_1 [5]),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte[7]_i_7_n_0 ),
        .I4(\tx_byte_reg[7]_2 [5]),
        .I5(\tx_byte_reg[5]_0 ),
        .O(\tx_byte[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFD0DD)) 
    \tx_byte[5]_i_4 
       (.I0(\tx_byte_reg[5]_1 [3]),
        .I1(\out32counter_five_reg[2] ),
        .I2(\out32counter_five_reg[2]_0 ),
        .I3(\tx_byte_reg[5]_2 [3]),
        .I4(\debug_ro_counts_reg_one_reg[16] ),
        .I5(\tx_byte[5]_i_9_n_0 ),
        .O(\tx_byte[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000000535FFFF)) 
    \tx_byte[5]_i_5 
       (.I0(\tx_byte_reg[6]_2 [3]),
        .I1(\tx_byte_reg[6]_3 [3]),
        .I2(\tx_byte_reg[5]_3 ),
        .I3(\out32counter_two_reg[2]_3 ),
        .I4(\state_reg[2]_1 ),
        .I5(\tx_byte[5]_i_10_n_0 ),
        .O(\tx_byte[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tx_byte[5]_i_7 
       (.I0(\debug_ro_counts_reg_five_reg[23] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_five_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[23]_1 ),
        .O(\out32counter_five_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hEEEF)) 
    \tx_byte[5]_i_8 
       (.I0(\debug_ro_counts_reg_five_reg[23] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_five_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_five_reg[23]_1 ),
        .O(\out32counter_five_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h808080C080808000)) 
    \tx_byte[5]_i_9 
       (.I0(\tx_byte[5]_i_4_0 [4]),
        .I1(\tx_byte[5]_i_4_1 ),
        .I2(\state_reg[1]_1 ),
        .I3(\debug_ro_counts_reg_three_reg[23] ),
        .I4(\debug_ro_counts_reg_three_reg[23]_0 ),
        .I5(\tx_byte[5]_i_4_2 [4]),
        .O(\tx_byte[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF4F44FFFF4FFF)) 
    \tx_byte[6]_i_1 
       (.I0(\tx_byte[6]_i_2_n_0 ),
        .I1(\tx_byte_reg[1] ),
        .I2(\tx_byte_reg[6] ),
        .I3(Q[2]),
        .I4(\tx_byte_reg[6]_0 ),
        .I5(\tx_byte[6]_i_6_n_0 ),
        .O(\state_reg[2]_0 [5]));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[6]_i_12 
       (.I0(\tx_byte[7]_i_6_0 [6]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [6]),
        .O(\tx_byte[6]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h020002AAAAAAAAAA)) 
    \tx_byte[6]_i_2 
       (.I0(\tx_byte[6]_i_7_n_0 ),
        .I1(\tx_byte_reg[6]_3 [4]),
        .I2(\out32counter_two_reg[2]_3 ),
        .I3(\tx_byte_reg[5]_3 ),
        .I4(\tx_byte_reg[6]_2 [4]),
        .I5(\state_reg[2]_1 ),
        .O(\tx_byte[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F755F7F7)) 
    \tx_byte[6]_i_6 
       (.I0(\tx_byte_reg[0] ),
        .I1(\tx_byte_reg[7]_1 [6]),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte[7]_i_7_n_0 ),
        .I4(\tx_byte_reg[7]_2 [6]),
        .I5(\tx_byte_reg[6]_1 ),
        .O(\tx_byte[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFD0DFFFFFFFF)) 
    \tx_byte[6]_i_7 
       (.I0(\tx_byte_reg[7] [6]),
        .I1(tx_busy),
        .I2(Q[3]),
        .I3(\tx_byte[6]_i_12_n_0 ),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(\tx_byte[6]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    \tx_byte[6]_i_9 
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(tx_busy),
        .I3(Q[3]),
        .I4(\out32counter_two_reg[2]_3 ),
        .O(\state_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \tx_byte[7]_i_11 
       (.I0(tx_busy),
        .I1(\debug_ro_counts_reg_one_reg[23] ),
        .O(r_busy_reg_3));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \tx_byte[7]_i_12 
       (.I0(tx_busy),
        .I1(Q[2]),
        .I2(\debug_ro_counts_reg_four_reg[23] ),
        .O(r_busy_reg_4));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \tx_byte[7]_i_15 
       (.I0(tx_busy),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[4]),
        .I4(Q[3]),
        .I5(\debug_ro_counts_reg_three_reg[23]_1 ),
        .O(r_busy_reg_2));
  LUT6 #(
    .INIT(64'hFDFDFDFCFDFDFDFF)) 
    \tx_byte[7]_i_18 
       (.I0(\tx_byte[7]_i_6_0 [7]),
        .I1(\debug_ro_counts_reg_six_reg[23] ),
        .I2(tx_busy),
        .I3(\debug_ro_counts_reg_six_reg[23]_0 ),
        .I4(\debug_ro_counts_reg_six_reg[23]_1 ),
        .I5(\tx_byte[7]_i_6_1 [7]),
        .O(\tx_byte[7]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \tx_byte[7]_i_19 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(tx_busy),
        .O(\state_reg[1]_1 ));
  LUT5 #(
    .INIT(32'hD0DDFFFF)) 
    \tx_byte[7]_i_2 
       (.I0(\tx_byte_reg[7]_2 [7]),
        .I1(\tx_byte[7]_i_7_n_0 ),
        .I2(\tx_byte[7]_i_8_n_0 ),
        .I3(\tx_byte_reg[7]_1 [7]),
        .I4(\tx_byte_reg[0] ),
        .O(\debug_ro_counts_zero_reg_reg[7] ));
  LUT6 #(
    .INIT(64'hAA80AAAAAA80AA80)) 
    \tx_byte[7]_i_6 
       (.I0(\tx_byte_reg[1] ),
        .I1(beenReadFlag_i_2_n_0),
        .I2(\tx_byte_reg[7] [7]),
        .I3(\tx_byte_reg[7]_0 ),
        .I4(\tx_byte[7]_i_18_n_0 ),
        .I5(\tx_byte_reg[0]_3 ),
        .O(\phantom_output_data_reg[7] ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \tx_byte[7]_i_7 
       (.I0(\debug_ro_counts_reg_zero_reg[23] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_zero_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[23]_1 ),
        .O(\tx_byte[7]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hEEEF)) 
    \tx_byte[7]_i_8 
       (.I0(\debug_ro_counts_reg_zero_reg[23] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_zero_reg[23]_0 ),
        .I3(\debug_ro_counts_reg_zero_reg[23]_1 ),
        .O(\tx_byte[7]_i_8_n_0 ));
  MUXF7 \tx_byte_reg[0]_i_3 
       (.I0(\tx_byte[0]_i_9_n_0 ),
        .I1(\tx_byte_reg[0]_4 ),
        .O(\tx_byte_reg[0]_i_3_n_0 ),
        .S(Q[2]));
  LUT6 #(
    .INIT(64'hFFFF0131FFFFC1F1)) 
    tx_valid_i_1
       (.I0(tx_valid_i_2_n_0),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(tx_valid_i_3_n_0),
        .I4(tx_valid_i_4_n_0),
        .I5(tx_valid_i_5_n_0),
        .O(tx_valid));
  LUT6 #(
    .INIT(64'hFFFFEFCFFFFFEFC3)) 
    tx_valid_i_2
       (.I0(\debug_ro_counts_reg_three_reg[23]_1 ),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(tx_busy),
        .I5(\debug_ro_counts_reg_seven_reg[23] ),
        .O(tx_valid_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFCCFCEEFFFF)) 
    tx_valid_i_3
       (.I0(\debug_ro_counts_reg_one_reg[23] ),
        .I1(tx_busy),
        .I2(\debug_ro_counts_reg_five_reg[23] ),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(tx_valid_i_3_n_0));
  LUT5 #(
    .INIT(32'h00200222)) 
    tx_valid_i_4
       (.I0(\tx_byte_reg[0] ),
        .I1(tx_busy),
        .I2(Q[2]),
        .I3(\debug_ro_counts_reg_four_reg[23] ),
        .I4(\debug_ro_counts_reg_zero_reg[23] ),
        .O(tx_valid_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFA0FFFFFFCF)) 
    tx_valid_i_5
       (.I0(\debug_ro_counts_reg_six_reg[23] ),
        .I1(\out32counter_two_reg[2]_3 ),
        .I2(Q[3]),
        .I3(tx_busy),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(tx_valid_i_5_n_0));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    zero_baud_counter_i_1
       (.I0(\baud_counter[27]_i_3_n_0 ),
        .I1(zero_baud_counter_i_2__0_n_0),
        .I2(zero_baud_counter_i_3__0_n_0),
        .I3(zero_baud_counter_i_4__0_n_0),
        .I4(zero_baud_counter_i_5_n_0),
        .O(p_1_in));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    zero_baud_counter_i_2__0
       (.I0(\baud_counter_reg_n_0_[12] ),
        .I1(\baud_counter_reg_n_0_[25] ),
        .I2(\baud_counter_reg_n_0_[13] ),
        .I3(\baud_counter_reg_n_0_[16] ),
        .I4(zero_baud_counter_i_6__0_n_0),
        .O(zero_baud_counter_i_2__0_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    zero_baud_counter_i_3__0
       (.I0(\baud_counter_reg_n_0_[7] ),
        .I1(\baud_counter_reg_n_0_[27] ),
        .I2(\baud_counter_reg_n_0_[10] ),
        .I3(\baud_counter_reg_n_0_[6] ),
        .I4(zero_baud_counter_i_7__0_n_0),
        .O(zero_baud_counter_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    zero_baud_counter_i_4__0
       (.I0(\baud_counter_reg_n_0_[2] ),
        .I1(\baud_counter_reg_n_0_[1] ),
        .I2(\baud_counter_reg_n_0_[9] ),
        .I3(\baud_counter_reg_n_0_[18] ),
        .I4(zero_baud_counter_i_8__0_n_0),
        .O(zero_baud_counter_i_4__0_n_0));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    zero_baud_counter_i_5
       (.I0(\baud_counter_reg_n_0_[20] ),
        .I1(\baud_counter_reg_n_0_[23] ),
        .I2(\baud_counter_reg_n_0_[17] ),
        .I3(\baud_counter_reg_n_0_[15] ),
        .I4(zero_baud_counter_i_9_n_0),
        .O(zero_baud_counter_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    zero_baud_counter_i_6__0
       (.I0(\baud_counter_reg_n_0_[0] ),
        .I1(\baud_counter_reg_n_0_[11] ),
        .I2(\baud_counter_reg_n_0_[22] ),
        .I3(\baud_counter_reg_n_0_[3] ),
        .O(zero_baud_counter_i_6__0_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    zero_baud_counter_i_7__0
       (.I0(\baud_counter_reg_n_0_[26] ),
        .I1(\baud_counter_reg_n_0_[4] ),
        .I2(\baud_counter_reg_n_0_[14] ),
        .I3(\baud_counter_reg_n_0_[8] ),
        .O(zero_baud_counter_i_7__0_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    zero_baud_counter_i_8__0
       (.I0(\baud_counter_reg_n_0_[21] ),
        .I1(\baud_counter_reg_n_0_[19] ),
        .I2(\baud_counter_reg_n_0_[24] ),
        .I3(\baud_counter_reg_n_0_[5] ),
        .O(zero_baud_counter_i_8__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    zero_baud_counter_i_9
       (.I0(\state_reg_n_0_[2] ),
        .I1(p_0_in),
        .I2(\state_reg_n_0_[1] ),
        .I3(zero_baud_counter),
        .O(zero_baud_counter_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    zero_baud_counter_reg
       (.C(clk_BUFG),
        .CE(\<const1> ),
        .D(p_1_in),
        .Q(zero_baud_counter),
        .R(rst));
endmodule
