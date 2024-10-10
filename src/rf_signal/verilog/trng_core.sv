//--------------------------------------------------------------------------------------------------
//         TRNG Core Definition
//--------------------------------------------------------------------------------------------------
`timescale 1ns/1ps

module trng_core #(
    parameter TRNGCFG_WIDTH = 5,
    parameter TRNG_WIDTH    = 256
)(
    input logic                      clock,
    input logic                      reset,
    input logic                      enable,
    input logic  [TRNGCFG_WIDTH-1:0] fine_cfg,
    input logic  [TRNGCFG_WIDTH-1:0] coarse_cfg,
    output logic [TRNG_WIDTH-1:0]    out,
    output logic                     valid
);

    //----------------------------------------------------------------------------------------------
    //            generate enable signals
    //----------------------------------------------------------------------------------------------
    logic carry_reset, enable_A, enable_B, enable_C, enable_D, enable_E, carry_sel;
    logic enable_pulse;
    logic [2:0] counter;
    always_ff @(posedge clock)
    begin
        if(reset==1)
            counter<=0;
        else if (counter==0&&enable==1)
            counter<=counter+1;
        else if (counter==0&&enable!=1)
            counter<=counter;
        else if (counter==4)
            counter<=0;
        else
            counter<=counter+1;
    end
    assign enable_pulse=counter==0&&enable==1;
    dff #(.WIDTH(1)) a1(.d(enable_pulse),   .clk(clock), .q(enable_A), .reset(reset));
    dff #(.WIDTH(1)) a2(.d(enable_A), .clk(clock), .q(enable_B), .reset(reset));
    dff #(.WIDTH(1)) a3(.d(enable_B), .clk(clock), .q(enable_C), .reset(reset));
    dff #(.WIDTH(1)) a4(.d(enable_C), .clk(clock), .q(enable_D), .reset(reset));
    dff #(.WIDTH(1)) a5(.d(enable_D), .clk(clock), .q(enable_E), .reset(reset));
    and s5(carry_sel, enable_C, ~enable_D);                       //generating carry_sel
    and s6(carry_reset, enable_pulse, ~enable_A);                       //generating carry_reset
    assign valid = ~enable_E & enable_D;

    //----------------------------------------------------------------------------------------------
    //            Coarse Delay
    //----------------------------------------------------------------------------------------------
    logic [31:0] coarseTuning_sel;
    thermometer_decoder #(TRNGCFG_WIDTH) tdec_coarse ( .in(coarse_cfg), .out(coarseTuning_sel), .out_bar( ));

     logic [20:0] cd_out;
    logic [21:0] cd;

    genvar a;
    assign cd[0] = ~enable_B;
    for(a=0; a <= 20; a=a+1) begin: coarse
        (*dont_touch=1*)  coarse_delay_lut cd_stage( .lut_in(cd[a]), .lut_out(cd_out[a]) );
        (*dont_touch=1*)  mux_2x1 #(
            .WIDTH(1)
            ) cd_mux(
            .sel(coarseTuning_sel[20-a]),
            .a  (cd[a]),
            .b  (cd_out[a]),
            .y  (cd[a+1])
            );
    end

    //----------------------------------------------------------------------------------------------
    //         Fine Delay
    //----------------------------------------------------------------------------------------------
    logic [31:0] fineTuning_sel, fineTuning_sel_bar;
    thermometer_decoder #(TRNGCFG_WIDTH) tdec_fine ( .in(fine_cfg), .out(fineTuning_sel), .out_bar(fineTuning_sel_bar));

    logic [32:0] lut5_input;
    assign lut5_input[0]=cd[21];

    genvar j;
    generate
    for (j=0; j<=31;j=j+1) begin: fine
        (*dont_touch=1*) fine_delay_lut f_stage(.lut_in (lut5_input[j]), .lut_sel(fineTuning_sel[j]), .lut_sel_bar(fineTuning_sel_bar[j]), .lut_out(lut5_input[j+1]));
    end
    endgenerate

    //----------------------------------------------------------------------------------------------
    //            CARRY_CHAIN Instantiation
    //----------------------------------------------------------------------------------------------
    logic [TRNG_WIDTH-1:0]              rand_out;
    carry_chain #(32) cc_0 (.in(lut5_input[32]), .out(rand_out), .sel(carry_sel), .clk(clock), .reset(carry_reset) );
    assign out = rand_out;


endmodule : trng_core



//--------------------------------------------------------------------------------------------------
//         Coarse Delay Lut
//--------------------------------------------------------------------------------------------------
module coarse_delay_lut(lut_in,lut_out);
    input logic         lut_in;
    output logic        lut_out;

    (*dont_touch=1*) LUT1 #(
    .INIT(2'h2)         //Logicfunction
    )
    LUT1_inst_1 (
        .O(lut_out),    //1-bitoutput:LUT
        .I0(lut_in)     //1-bitinput:LUT
    );
endmodule

//--------------------------------------------------------------------------------------------------
//         Fine Delay Lut
//--------------------------------------------------------------------------------------------------
module fine_delay_lut(lut_in, lut_sel, lut_sel_bar, lut_out);
    input logic         lut_in;
    input logic         lut_sel,lut_sel_bar;
    output logic        lut_out;

    (*dont_touch=1*)  LUT5 #(
        .INIT(32'b00000011000010000000000000001000)
    )
        LUT5_inst (
        .O(lut_out),            // 1-bit output: LUT
        .I0(lut_in),            // 1-bit input: LUT
        .I1(lut_sel),           // 1-bit input: LUT
        .I2(1'b0),              // 1-bit input: LUT
        .I3(lut_sel_bar),          // 1-bit input: LUT
        .I4(lut_in)             // 1-bit input: LUT
        );
endmodule

//--------------------------------------------------------------------------------------------------
//         Carry Chain
//--------------------------------------------------------------------------------------------------
`timescale 1ps / 1ps
module carry_chain #(parameter NUM_STAGES=32) (
    input  logic         in,
    input  logic         clk,
    input  logic         reset,
    input  logic         sel,
    output logic [255:0] out
    );

    logic [255:0] carry_xor_out;
    logic [256:0] tdc_carry;
    logic [255:0] cdff;
    logic [255:0] rand_out, rand_out_next;

    logic [NUM_STAGES-1:0] sim_del;

    assign out = rand_out;

    ////////////////////////////////
    // instantiate LUTs
    ////////////////////////////////
    //// Old
    assign tdc_carry[0] = in;



    genvar i;
    generate
// carry8
    // for (i = 0; i <= 31; i = i + 1) begin: carry_chain_loop
    //     (*dont_touch=1*)  CARRY8 #(
    //         .CARRY_TYPE("SINGLE_CY8")
    //     ) CARRY8_inst(
    //         .CO       (tdc_carry[i*8+8:(i*8)+1]),     //8-bitoutput:Carry-out
    //         .O        (carry_xor_out[i*8+7:i*8]),     //8-bitoutput:CarrychainXORdataout
    //         `ifdef SIM_CARRY_DELAY
    //             .CI       (sim_del[i]),               //1-bitinput:LowerCarry-In
    //         `else
    //             .CI       (tdc_carry[i*8]),           //1-bitinput:LowerCarry-In
    //         `endif
    //         .CI_TOP   (gnd),                          //1-bitinput:UpperCarry-In
    //         .DI       (8'b11111111),                  //8-bitinput:Carry-MUXdatain
    //         .S        (8'b11111111)                   //8-bitinput:Carry-muxselect
    //     );
//replaced carry8 with carry4 since 7 series has no carry8


    for (i=0; i<=63;i=i+1) begin: carry_chain_loop
        (*dont_touch=1*)  CARRY4 CARRY4_inst(
            .CO       (tdc_carry[i*4+4:(i*4)+1]),     //4-bitoutput:Carry-out
            .O        (carry_xor_out[i*4+3:i*4]),     //4-bitoutput:CarrychainXORdataout
            `ifdef SIM_CARRY_DELAY
                .CI       (sim_del[i]),               //1-bitinput:LowerCarry-In
            `else
                .CI       (tdc_carry[i*4]),           //1-bitinput:LowerCarry-In
            `endif
            .CYINIT   (gnd),                          //1-bitinput:UpperCarry-In
            .DI       (4'b1111),                  //4-bitinput:Carry-MUXdatain
            .S        (4'b1111)                   //4-bitinput:Carry-muxselect
        );

        `ifdef SIM_CARRY_DELAY
            always_comb sim_del[i] <= #($urandom_range(3000, 1000)) tdc_carry[i*8];
        `endif
    end
    endgenerate

    dff #(.WIDTH(256)) carry_ff_0(.d(tdc_carry),.clk(clk),.q(cdff),.reset(reset));

    mux_2x1 #(
        .WIDTH(256)
    ) cd_mux(
        .sel(sel),
        .a  (rand_out),
        .b  (cdff),
        .y  (rand_out_next)
    );

    dff #(.WIDTH(256)) carry_ff_1(.d(rand_out_next),.clk(clk),.q(rand_out),.reset(reset));
endmodule
