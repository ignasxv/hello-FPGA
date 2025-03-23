//
// Verilog description for cell RTL_multiply, 
// Sun Mar 23 09:31:20 2025
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module RTL_multiply ( clk, reset, start, multiplicand, multiplier, product, done
                       ) ;

    input clk ;
    input reset ;
    input start ;
    input [3:0]multiplicand ;
    input [3:0]multiplier ;
    output [7:0]product ;
    output done ;

    wire busy, count_2, count_1, nx12, nx28, nx44, nx58, P_1, P_2, P_3, P_4, P_5, 
         P_0, nx78, nx94, nx96, nx114, nx132, nx154, nx162, nx174, nx186, nx648, 
         nx658, nx668, nx678, nx688, nx698, nx708, nx718, nx728, nx738, nx748, 
         nx758, nx768, nx778, nx788, nx798, nx808, nx818, nx828, nx842, nx850, 
         nx857, nx858, nx861, nx863, nx878, nx882, nx884, nx887, nx889, nx892, 
         nx896, nx898, nx901, nx903, nx907, nx910, nx912, nx914, nx916, nx918, 
         nx920, nx955, nx957, nx963, nx1021;
    wire [13:0] \$dummy ;




    fake_gnd ix620 (.Y (product[7])) ;
    dffr reg_done (.Q (done), .QB (\$dummy [0]), .D (nx828), .CLK (clk), .R (
         reset)) ;
    mux21_ni ix829 (.Y (nx828), .A0 (done), .A1 (busy), .S0 (nx44)) ;
    nand02_2x ix843 (.Y (nx842), .A0 (nx44), .A1 (nx963)) ;
    oai21 ix45 (.Y (nx44), .A0 (count_2), .A1 (nx850), .B0 (busy)) ;
    dffr reg_count_2 (.Q (count_2), .QB (\$dummy [1]), .D (nx668), .CLK (clk), .R (
         reset)) ;
    ao22 ix669 (.Y (nx668), .A0 (count_2), .A1 (nx1021), .B0 (busy), .B1 (nx28)
         ) ;
    xnor2 ix29 (.Y (nx28), .A0 (count_2), .A1 (nx850)) ;
    dffr reg_count_1 (.Q (count_1), .QB (nx858), .D (nx658), .CLK (clk), .R (
         reset)) ;
    ao32 ix659 (.Y (nx658), .A0 (nx12), .A1 (busy), .A2 (nx850), .B0 (count_1), 
         .B1 (nx1021)) ;
    dffr count_0 (.Q (\$dummy [2]), .QB (nx857), .D (nx648), .CLK (clk), .R (
         reset)) ;
    nand02_2x ix862 (.Y (nx861), .A0 (start), .A1 (nx863)) ;
    dffr reg_busy (.Q (busy), .QB (nx863), .D (nx678), .CLK (clk), .R (reset)) ;
    dffr reg_product_0 (.Q (product[0]), .QB (\$dummy [3]), .D (nx758), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix759 (.Y (nx758), .A0 (product[0]), .A1 (P_1), .S0 (nx955)) ;
    dffr reg_P_1 (.Q (P_1), .QB (\$dummy [4]), .D (nx748), .CLK (clk), .R (reset
         )) ;
    mux21_ni ix187 (.Y (nx186), .A0 (multiplier[1]), .A1 (P_2), .S0 (nx861)) ;
    dffr reg_P_2 (.Q (P_2), .QB (\$dummy [5]), .D (nx738), .CLK (clk), .R (reset
         )) ;
    mux21_ni ix175 (.Y (nx174), .A0 (multiplier[2]), .A1 (P_3), .S0 (nx861)) ;
    dffr reg_P_3 (.Q (P_3), .QB (\$dummy [6]), .D (nx728), .CLK (clk), .R (reset
         )) ;
    mux21_ni ix163 (.Y (nx162), .A0 (multiplier[3]), .A1 (nx154), .S0 (nx861)) ;
    oai22 ix155 (.Y (nx154), .A0 (nx878), .A1 (nx920), .B0 (nx918), .B1 (P_0)) ;
    oai22 ix719 (.Y (nx718), .A0 (nx863), .A1 (nx882), .B0 (nx918), .B1 (nx963)
          ) ;
    oai22 ix709 (.Y (nx708), .A0 (nx863), .A1 (nx887), .B0 (nx884), .B1 (nx963)
          ) ;
    oai22 ix699 (.Y (nx698), .A0 (nx892), .A1 (nx863), .B0 (nx889), .B1 (nx963)
          ) ;
    nand02_2x ix893 (.Y (nx892), .A0 (P_0), .A1 (nx94)) ;
    oai32 ix689 (.Y (nx688), .A0 (nx896), .A1 (start), .A2 (busy), .B0 (nx898), 
          .B1 (nx1021)) ;
    dffr reg_P_0 (.Q (P_0), .QB (nx896), .D (nx688), .CLK (clk), .R (reset)) ;
    aoi32 ix899 (.Y (nx898), .A0 (multiplier[0]), .A1 (start), .A2 (nx863), .B0 (
          P_1), .B1 (nx861)) ;
    xnor2 ix95 (.Y (nx94), .A0 (nx901), .A1 (multiplicand[3])) ;
    mux21_ni ix902 (.Y (nx901), .A0 (nx903), .A1 (nx889), .S0 (nx907)) ;
    aoi32 ix904 (.Y (nx903), .A0 (multiplicand[0]), .A1 (P_4), .A2 (nx78), .B0 (
          P_5), .B1 (multiplicand[1])) ;
    dffr reg_P_5 (.Q (P_5), .QB (nx884), .D (nx708), .CLK (clk), .R (reset)) ;
    dffr reg_P_6 (.Q (\$dummy [7]), .QB (nx889), .D (nx698), .CLK (clk), .R (
         reset)) ;
    xnor2 ix911 (.Y (nx910), .A0 (nx903), .A1 (nx907)) ;
    xnor2 ix913 (.Y (nx912), .A0 (nx914), .A1 (nx916)) ;
    nand02_2x ix915 (.Y (nx914), .A0 (multiplicand[0]), .A1 (P_4)) ;
    dffr reg_P_4 (.Q (P_4), .QB (nx918), .D (nx718), .CLK (clk), .R (reset)) ;
    ao21 ix921 (.Y (nx920), .A0 (multiplicand[0]), .A1 (P_4), .B0 (nx896)) ;
    nor04 ix59 (.Y (nx58), .A0 (nx863), .A1 (count_2), .A2 (nx858), .A3 (nx857)
          ) ;
    dffr reg_product_1 (.Q (product[1]), .QB (\$dummy [8]), .D (nx768), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix769 (.Y (nx768), .A0 (product[1]), .A1 (P_2), .S0 (nx955)) ;
    dffr reg_product_2 (.Q (product[2]), .QB (\$dummy [9]), .D (nx778), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix779 (.Y (nx778), .A0 (product[2]), .A1 (P_3), .S0 (nx955)) ;
    dffr reg_product_3 (.Q (product[3]), .QB (\$dummy [10]), .D (nx788), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix789 (.Y (nx788), .A0 (product[3]), .A1 (nx154), .S0 (nx955)) ;
    dffr reg_product_4 (.Q (product[4]), .QB (\$dummy [11]), .D (nx798), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix799 (.Y (nx798), .A0 (product[4]), .A1 (nx132), .S0 (nx955)) ;
    dffr reg_product_5 (.Q (product[5]), .QB (\$dummy [12]), .D (nx808), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix809 (.Y (nx808), .A0 (product[5]), .A1 (nx114), .S0 (nx955)) ;
    dffr reg_product_6 (.Q (product[6]), .QB (\$dummy [13]), .D (nx818), .CLK (
         clk), .R (reset)) ;
    mux21_ni ix819 (.Y (nx818), .A0 (product[6]), .A1 (nx96), .S0 (nx955)) ;
    inv02 ix133 (.Y (nx132), .A (nx882)) ;
    inv02 ix115 (.Y (nx114), .A (nx887)) ;
    inv02 ix97 (.Y (nx96), .A (nx892)) ;
    inv02 ix79 (.Y (nx78), .A (nx916)) ;
    buf02 ix954 (.Y (nx955), .A (nx58)) ;
    or02 ix851 (.Y (nx850), .A0 (nx858), .A1 (nx857)) ;
    nand02_2x ix13 (.Y (nx12), .A0 (nx857), .A1 (nx858)) ;
    xor2 ix908 (.Y (nx907), .A0 (multiplicand[2]), .A1 (nx889)) ;
    inv02 ix962 (.Y (nx963), .A (nx957)) ;
    mux21_ni ix679 (.Y (nx678), .A0 (start), .A1 (nx842), .S0 (busy)) ;
    nor02ii ix848 (.Y (nx957), .A0 (start), .A1 (nx863)) ;
    mux21_ni ix649 (.Y (nx648), .A0 (nx1021), .A1 (busy), .S0 (nx857)) ;
    mux21_ni ix749 (.Y (nx748), .A0 (nx186), .A1 (P_1), .S0 (nx1021)) ;
    mux21_ni ix739 (.Y (nx738), .A0 (nx174), .A1 (P_2), .S0 (nx1021)) ;
    mux21_ni ix729 (.Y (nx728), .A0 (nx162), .A1 (P_3), .S0 (nx1021)) ;
    nor02_2x ix879 (.Y (nx878), .A0 (multiplicand[0]), .A1 (P_4)) ;
    mux21_ni ix883 (.Y (nx882), .A0 (nx884), .A1 (nx912), .S0 (P_0)) ;
    mux21_ni ix888 (.Y (nx887), .A0 (nx889), .A1 (nx910), .S0 (P_0)) ;
    xnor2 ix917 (.Y (nx916), .A0 (multiplicand[1]), .A1 (P_5)) ;
    inv02 ix1020 (.Y (nx1021), .A (nx963)) ;
endmodule


module nor02_2x ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;

    wire NOT_A0, NOT_A1;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (Y, NOT_A0, NOT_A1) ;
endmodule


module nor02ii ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;

    wire NOT_A0;



    assign NOT_A0 = ~A0 ;
    and (Y, NOT_A0, A1) ;
endmodule


module xor2 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    xor (Y, A0, A1) ;
endmodule


module or02 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    or (Y, A1, A0) ;
endmodule


module buf02 ( Y, A ) ;

    output Y ;
    input A ;




    assign Y = A ;
endmodule


module inv02 ( Y, A ) ;

    output Y ;
    input A ;




    assign Y = ~A ;
endmodule


module nor04 ( Y, A0, A1, A2, A3 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input A3 ;

    wire NOT_A0, NOT_A1, nx4, NOT_A2, nx8, NOT_A3;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_A2 = ~A2 ;
    and (nx8, nx4, NOT_A2) ;
    assign NOT_A3 = ~A3 ;
    and (Y, nx8, NOT_A3) ;
endmodule


module ao21 ( Y, A0, A1, B0 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;

    wire nx0;



    and (nx0, A0, A1) ;
    or (Y, nx0, B0) ;
endmodule


module aoi32 ( Y, A0, A1, A2, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input B0 ;
    input B1 ;

    wire NOT_A2, NOT_B1, nx4, NOT_A1, nx8, nx10, NOT_A0, nx14, nx16, NOT_B0, 
         nx20, nx22, nx24, nx26, nx28;



    assign NOT_A2 = ~A2 ;
    assign NOT_B1 = ~B1 ;
    and (nx4, NOT_A2, NOT_B1) ;
    assign NOT_A1 = ~A1 ;
    and (nx8, NOT_A1, NOT_B1) ;
    or (nx10, nx4, nx8) ;
    assign NOT_A0 = ~A0 ;
    and (nx14, NOT_A0, NOT_B1) ;
    or (nx16, nx10, nx14) ;
    assign NOT_B0 = ~B0 ;
    and (nx20, NOT_A2, NOT_B0) ;
    or (nx22, nx16, nx20) ;
    and (nx24, NOT_A1, NOT_B0) ;
    or (nx26, nx22, nx24) ;
    and (nx28, NOT_A0, NOT_B0) ;
    or (Y, nx26, nx28) ;
endmodule


module oai32 ( Y, A0, A1, A2, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input B0 ;
    input B1 ;

    wire NOT_A0, NOT_A1, nx4, NOT_A2, nx8, NOT_B0, NOT_B1, nx14;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_A2 = ~A2 ;
    and (nx8, nx4, NOT_A2) ;
    assign NOT_B0 = ~B0 ;
    assign NOT_B1 = ~B1 ;
    and (nx14, NOT_B0, NOT_B1) ;
    or (Y, nx8, nx14) ;
endmodule


module oai22 ( Y, A0, A1, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;
    input B1 ;

    wire NOT_B0, NOT_B1, nx4, NOT_A0, NOT_A1, nx10;



    assign NOT_B0 = ~B0 ;
    assign NOT_B1 = ~B1 ;
    and (nx4, NOT_B0, NOT_B1) ;
    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx10, NOT_A0, NOT_A1) ;
    or (Y, nx4, nx10) ;
endmodule


module ao32 ( Y, A0, A1, A2, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input B0 ;
    input B1 ;

    wire nx0, nx2, nx4;



    and (nx0, A0, A1) ;
    and (nx2, nx0, A2) ;
    and (nx4, B0, B1) ;
    or (Y, nx2, nx4) ;
endmodule


module xnor2 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    xnor (Y, A0, A1) ;
endmodule


module ao22 ( Y, A0, A1, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;
    input B1 ;

    wire nx0, nx2;



    and (nx0, B0, B1) ;
    and (nx2, A0, A1) ;
    or (Y, nx0, nx2) ;
endmodule


module oai21 ( Y, A0, A1, B0 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;

    wire NOT_A0, NOT_A1, nx4, NOT_B0;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_B0 = ~B0 ;
    or (Y, nx4, NOT_B0) ;
endmodule


module nand02_2x ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;

    wire NOT_A1, NOT_A0;



    assign NOT_A1 = ~A1 ;
    assign NOT_A0 = ~A0 ;
    or (Y, NOT_A1, NOT_A0) ;
endmodule


module mux21_ni ( Y, A0, A1, S0 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input S0 ;

    wire NOT_S0, nx2, nx4;



    assign NOT_S0 = ~S0 ;
    and (nx2, A0, NOT_S0) ;
    and (nx4, A1, S0) ;
    or (Y, nx2, nx4) ;
endmodule


module dffr ( Q, QB, D, CLK, R ) ;

    output Q ;
    output QB ;
    input D ;
    input CLK ;
    input R ;

    wire nx2;



    DFFRS ix1 (.set (nx2), .reset (R), .in (D), .clk (CLK), .out (Q)) ;
    assign nx2 = 0 ;
    assign QB = ~Q ;
endmodule


module DFFRS ( set, reset, in, clk, out ) ;

    input set ;
    input reset ;
    input in ;
    input clk ;
    output out ;
reg out; 
always @ (posedge set or posedge reset or posedge clk)
begin
    if (set) out = 1;
    else if (reset) out = 0;
    else begin
     out = in;
    end
end

endmodule


module fake_gnd ( Y ) ;

    output Y ;




    assign Y = 0 ;
endmodule

