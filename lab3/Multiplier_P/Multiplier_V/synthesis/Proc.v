//
// Verilog description for cell multiplier, 
// Thu Mar 20 12:31:20 2025
//
// LeonardoSpectrum Level 3, 2009a.6 
//


module multiplier ( Product, Multiplicand, Multiplier, Start, Reset, Clock, Done
                     ) ;

    output [7:0]Product ;
    input [3:0]Multiplicand ;
    input [3:0]Multiplier ;
    input Start ;
    input Reset ;
    input Clock ;
    output Done ;

    wire controller_ST_0, controller_ST_2, nx217, Qm1, nx10, nx16, nx46, nx64, 
         nx72, M_0, nx84, nx88, nx100, M_1, nx110, nx112, M_2, nx136, nx146, 
         nx148, M_3, nx156, nx158, nx176, nx188, nx200, nx210, nx220, nx230, 
         nx240, nx256, nx262, controller_count_1, controller_count_0, nx312, 
         nx330, nx346, nx231, nx241, nx251, nx261, nx269, nx271, nx281, nx291, 
         nx301, nx311, nx321, nx331, nx341, nx349, nx351, nx359, nx361, nx369, 
         nx371, nx386, nx390, nx393, nx397, nx399, nx401, nx412, nx416, nx418, 
         nx420, nx424, nx428, nx448, nx450, nx463, nx465, nx467, nx471, nx474, 
         nx480, nx482, nx490, nx502, nx511, nx519, nx527, nx535, nx593, nx595, 
         nx597, nx599;
    wire [14:0] \$dummy ;




    dffr controller_reg_done (.Q (Done), .QB (\$dummy [0]), .D (nx346), .CLK (
         Clock), .R (Reset)) ;
    nor04 ix347 (.Y (nx346), .A0 (nx330), .A1 (nx418), .A2 (nx511), .A3 (nx312)
          ) ;
    nor04 ix263 (.Y (nx262), .A0 (nx599), .A1 (controller_ST_2), .A2 (nx390), .A3 (
          nx256)) ;
    dffr controller_reg_ST_1 (.Q (\$dummy [1]), .QB (nx386), .D (nx262), .CLK (
         Clock), .R (Reset)) ;
    nand03 ix313 (.Y (nx312), .A0 (nx393), .A1 (nx416), .A2 (nx448)) ;
    ao21 ix394 (.Y (nx393), .A0 (controller_count_0), .A1 (controller_count_1), 
         .B0 (nx16)) ;
    dffr reg_controller_count_0 (.Q (controller_count_0), .QB (\$dummy [2]), .D (
         nx361), .CLK (Clock), .R (Reset)) ;
    ao21 ix362 (.Y (nx361), .A0 (controller_count_0), .A1 (nx397), .B0 (nx359)
         ) ;
    dffr controller_reg_ST_2 (.Q (controller_ST_2), .QB (nx401), .D (nx217), .CLK (
         Clock), .R (Reset)) ;
    dffr controller_reg_ST_0 (.Q (controller_ST_0), .QB (nx390), .D (nx312), .CLK (
         Clock), .R (Reset)) ;
    nor04 ix360 (.Y (nx359), .A0 (controller_count_0), .A1 (nx599), .A2 (nx401)
          , .A3 (controller_ST_0)) ;
    dffr reg_controller_count_1 (.Q (controller_count_1), .QB (\$dummy [3]), .D (
         nx371), .CLK (Clock), .R (Reset)) ;
    ao21 ix372 (.Y (nx371), .A0 (controller_count_1), .A1 (nx397), .B0 (nx369)
         ) ;
    nor04 ix370 (.Y (nx369), .A0 (nx599), .A1 (nx401), .A2 (controller_ST_0), .A3 (
          nx412)) ;
    xnor2 ix413 (.Y (nx412), .A0 (controller_count_1), .A1 (controller_count_0)
          ) ;
    nand03 ix417 (.Y (nx416), .A0 (nx418), .A1 (nx420), .A2 (Product[0])) ;
    ao21 ix352 (.Y (nx351), .A0 (Qm1), .A1 (nx424), .B0 (nx349)) ;
    dff Q_reg_reg_Qm1 (.Q (Qm1), .QB (nx420), .D (nx351), .CLK (Clock)) ;
    dff Q_reg_reg_Q0 (.Q (Product[0]), .QB (nx428), .D (nx341), .CLK (Clock)) ;
    mux21_ni ix241 (.Y (nx240), .A0 (Multiplier[0]), .A1 (Product[1]), .S0 (nx10
             )) ;
    dff Q_reg_reg_Q1 (.Q (Product[1]), .QB (\$dummy [4]), .D (nx331), .CLK (
        Clock)) ;
    mux21_ni ix231 (.Y (nx230), .A0 (Multiplier[1]), .A1 (Product[2]), .S0 (nx10
             )) ;
    dff Q_reg_reg_Q2 (.Q (Product[2]), .QB (\$dummy [5]), .D (nx321), .CLK (
        Clock)) ;
    mux21_ni ix221 (.Y (nx220), .A0 (Multiplier[2]), .A1 (Product[3]), .S0 (nx10
             )) ;
    dff Q_reg_reg_Q3 (.Q (Product[3]), .QB (\$dummy [6]), .D (nx311), .CLK (
        Clock)) ;
    mux21_ni ix211 (.Y (nx210), .A0 (Multiplier[3]), .A1 (Product[4]), .S0 (nx10
             )) ;
    dff A_reg_reg_Q0 (.Q (Product[4]), .QB (\$dummy [7]), .D (nx301), .CLK (
        Clock)) ;
    mux21_ni ix302 (.Y (nx301), .A0 (Product[4]), .A1 (nx200), .S0 (nx64)) ;
    ao22 ix201 (.Y (nx200), .A0 (nx84), .A1 (nx527), .B0 (Product[5]), .B1 (
         nx463)) ;
    xor2 ix85 (.Y (nx84), .A0 (Product[4]), .A1 (M_0)) ;
    dff M_reg_reg_Q0 (.Q (M_0), .QB (\$dummy [8]), .D (nx231), .CLK (Clock)) ;
    mux21_ni ix232 (.Y (nx231), .A0 (Multiplicand[0]), .A1 (M_0), .S0 (nx448)) ;
    nand02_2x ix449 (.Y (nx448), .A0 (Start), .A1 (nx450)) ;
    dff A_reg_reg_Q1 (.Q (Product[5]), .QB (\$dummy [9]), .D (nx291), .CLK (
        Clock)) ;
    mux21_ni ix292 (.Y (nx291), .A0 (Product[5]), .A1 (nx188), .S0 (nx64)) ;
    ao22 ix189 (.Y (nx188), .A0 (Product[6]), .A1 (nx463), .B0 (nx112), .B1 (
         nx527)) ;
    dff A_reg_reg_Q2 (.Q (Product[6]), .QB (\$dummy [10]), .D (nx281), .CLK (
        Clock)) ;
    mux21_ni ix282 (.Y (nx281), .A0 (Product[6]), .A1 (nx176), .S0 (nx64)) ;
    ao22 ix177 (.Y (nx176), .A0 (Product[7]), .A1 (nx463), .B0 (nx136), .B1 (
         nx527)) ;
    dff A_reg_reg_Q3 (.Q (Product[7]), .QB (\$dummy [11]), .D (nx271), .CLK (
        Clock)) ;
    ao21 ix272 (.Y (nx271), .A0 (Product[7]), .A1 (nx463), .B0 (nx269)) ;
    nand04 ix464 (.Y (nx463), .A0 (nx465), .A1 (nx467), .A2 (nx535), .A3 (nx401)
           ) ;
    nand02_2x ix466 (.Y (nx465), .A0 (nx418), .A1 (nx256)) ;
    nor03 ix270 (.Y (nx269), .A0 (nx46), .A1 (nx471), .A2 (nx463)) ;
    oai21 ix47 (.Y (nx46), .A0 (nx399), .A1 (nx418), .B0 (nx465)) ;
    xnor2 ix472 (.Y (nx471), .A0 (nx148), .A1 (nx158)) ;
    ao21 ix149 (.Y (nx148), .A0 (nx474), .A1 (Product[6]), .B0 (nx146)) ;
    xnor2 ix475 (.Y (nx474), .A0 (M_2), .A1 (nx416)) ;
    dff M_reg_reg_Q2 (.Q (M_2), .QB (\$dummy [12]), .D (nx251), .CLK (Clock)) ;
    mux21_ni ix252 (.Y (nx251), .A0 (Multiplicand[2]), .A1 (M_2), .S0 (nx448)) ;
    nor02_2x ix147 (.Y (nx146), .A0 (nx480), .A1 (nx490)) ;
    aoi22 ix481 (.Y (nx480), .A0 (nx482), .A1 (Product[5]), .B0 (nx100), .B1 (
          nx110)) ;
    xnor2 ix483 (.Y (nx482), .A0 (M_1), .A1 (nx416)) ;
    dff M_reg_reg_Q1 (.Q (M_1), .QB (\$dummy [13]), .D (nx241), .CLK (Clock)) ;
    mux21_ni ix242 (.Y (nx241), .A0 (Multiplicand[1]), .A1 (M_1), .S0 (nx448)) ;
    mux21_ni ix101 (.Y (nx100), .A0 (nx72), .A1 (Product[4]), .S0 (M_0)) ;
    xnor2 ix491 (.Y (nx490), .A0 (Product[6]), .A1 (nx474)) ;
    xnor2 ix159 (.Y (nx158), .A0 (Product[7]), .A1 (nx156)) ;
    dff M_reg_reg_Q3 (.Q (M_3), .QB (\$dummy [14]), .D (nx261), .CLK (Clock)) ;
    mux21_ni ix262 (.Y (nx261), .A0 (Multiplicand[3]), .A1 (M_3), .S0 (nx448)) ;
    xor2 ix137 (.Y (nx136), .A0 (nx480), .A1 (nx490)) ;
    nand02_2x ix65 (.Y (nx64), .A0 (nx463), .A1 (nx46)) ;
    xnor2 ix113 (.Y (nx112), .A0 (nx100), .A1 (nx502)) ;
    xnor2 ix503 (.Y (nx502), .A0 (Product[5]), .A1 (nx482)) ;
    nand02_2x ix11 (.Y (nx10), .A0 (Start), .A1 (nx450)) ;
    nand02_2x ix512 (.Y (nx511), .A0 (controller_count_1), .A1 (
              controller_count_0)) ;
    inv02 ix111 (.Y (nx110), .A (nx502)) ;
    inv02 ix73 (.Y (nx72), .A (nx416)) ;
    inv02 ix17 (.Y (nx16), .A (nx399)) ;
    inv02 ix518 (.Y (nx519), .A (nx386)) ;
    buf02 ix526 (.Y (nx527), .A (nx88)) ;
    nor02ii ix398 (.Y (nx397), .A0 (nx399), .A1 (nx448)) ;
    mux21_ni ix342 (.Y (nx341), .A0 (nx240), .A1 (Product[0]), .S0 (nx424)) ;
    mux21_ni ix332 (.Y (nx331), .A0 (nx230), .A1 (Product[1]), .S0 (nx424)) ;
    mux21_ni ix322 (.Y (nx321), .A0 (nx220), .A1 (Product[2]), .S0 (nx424)) ;
    mux21_ni ix312 (.Y (nx311), .A0 (nx210), .A1 (Product[3]), .S0 (nx424)) ;
    xor2 ix157 (.Y (nx156), .A0 (M_3), .A1 (nx416)) ;
    inv02 ix534 (.Y (nx535), .A (nx599)) ;
    ao21 ix333 (.Y (nx217), .A0 (nx401), .A1 (nx599), .B0 (nx593)) ;
    inv02 ix592 (.Y (nx593), .A (nx465)) ;
    and04 ix89 (.Y (nx88), .A0 (nx535), .A1 (nx401), .A2 (controller_ST_0), .A3 (
          nx595)) ;
    inv02 ix594 (.Y (nx595), .A (nx256)) ;
    nor02ii ix331 (.Y (nx330), .A0 (controller_ST_2), .A1 (nx599)) ;
    nor03_2x ix400 (.Y (nx399), .A0 (nx519), .A1 (nx401), .A2 (controller_ST_0)
             ) ;
    nor03_2x ix419 (.Y (nx418), .A0 (nx519), .A1 (controller_ST_2), .A2 (nx390)
             ) ;
    or04 ix9 (.Y (nx467), .A0 (Start), .A1 (nx599), .A2 (controller_ST_2), .A3 (
         controller_ST_0)) ;
    nor04 ix350 (.Y (nx349), .A0 (nx428), .A1 (nx519), .A2 (nx401), .A3 (
          controller_ST_0)) ;
    nor03_2x ix451 (.Y (nx450), .A0 (nx519), .A1 (controller_ST_2), .A2 (
             controller_ST_0)) ;
    xnor2 ix257 (.Y (nx256), .A0 (Qm1), .A1 (Product[0])) ;
    or03 ix27 (.Y (nx424), .A0 (nx597), .A1 (nx519), .A2 (controller_ST_0)) ;
    inv02 ix596 (.Y (nx597), .A (nx467)) ;
    inv02 ix598 (.Y (nx599), .A (nx386)) ;
endmodule


module or03 ( Y, A0, A1, A2 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;

    wire nx0;



    or (nx0, A2, A1) ;
    or (Y, nx0, A0) ;
endmodule


module or04 ( Y, A0, A1, A2, A3 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input A3 ;

    wire nx0, nx2;



    or (nx0, A3, A2) ;
    or (nx2, nx0, A1) ;
    or (Y, nx2, A0) ;
endmodule


module nor03_2x ( Y, A0, A1, A2 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;

    wire NOT_A0, NOT_A1, nx4, NOT_A2;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_A2 = ~A2 ;
    and (Y, nx4, NOT_A2) ;
endmodule


module and04 ( Y, A0, A1, A2, A3 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input A3 ;

    wire nx0, nx2;



    and (nx0, A0, A1) ;
    and (nx2, nx0, A2) ;
    and (Y, nx2, A3) ;
endmodule


module nor02ii ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;

    wire NOT_A0;



    assign NOT_A0 = ~A0 ;
    and (Y, NOT_A0, A1) ;
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


module aoi22 ( Y, A0, A1, B0, B1 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input B0 ;
    input B1 ;

    wire NOT_A1, NOT_B1, nx4, NOT_A0, nx8, nx10, NOT_B0, nx14, nx16, nx18;



    assign NOT_A1 = ~A1 ;
    assign NOT_B1 = ~B1 ;
    and (nx4, NOT_A1, NOT_B1) ;
    assign NOT_A0 = ~A0 ;
    and (nx8, NOT_A0, NOT_B1) ;
    or (nx10, nx4, nx8) ;
    assign NOT_B0 = ~B0 ;
    and (nx14, NOT_A1, NOT_B0) ;
    or (nx16, nx10, nx14) ;
    and (nx18, NOT_A0, NOT_B0) ;
    or (Y, nx16, nx18) ;
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


module nor03 ( Y, A0, A1, A2 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;

    wire NOT_A0, NOT_A1, nx4, NOT_A2;



    assign NOT_A0 = ~A0 ;
    assign NOT_A1 = ~A1 ;
    and (nx4, NOT_A0, NOT_A1) ;
    assign NOT_A2 = ~A2 ;
    and (Y, nx4, NOT_A2) ;
endmodule


module nand04 ( Y, A0, A1, A2, A3 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;
    input A3 ;

    wire NOT_A3, NOT_A2, nx4, NOT_A1, nx8, NOT_A0;



    assign NOT_A3 = ~A3 ;
    assign NOT_A2 = ~A2 ;
    or (nx4, NOT_A3, NOT_A2) ;
    assign NOT_A1 = ~A1 ;
    or (nx8, nx4, NOT_A1) ;
    assign NOT_A0 = ~A0 ;
    or (Y, nx8, NOT_A0) ;
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


module xor2 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    xor (Y, A0, A1) ;
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


module dff ( Q, QB, D, CLK ) ;

    output Q ;
    output QB ;
    input D ;
    input CLK ;

    wire nx2, nx4;



    DFFRS ix1 (.set (nx4), .reset (nx2), .in (D), .clk (CLK), .out (Q)) ;
    assign nx2 = 0 ;
    assign nx4 = 0 ;
    assign QB = ~Q ;
endmodule


module xnor2 ( Y, A0, A1 ) ;

    output Y ;
    input A0 ;
    input A1 ;




    xnor (Y, A0, A1) ;
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


module nand03 ( Y, A0, A1, A2 ) ;

    output Y ;
    input A0 ;
    input A1 ;
    input A2 ;

    wire NOT_A2, NOT_A1, nx4, NOT_A0;



    assign NOT_A2 = ~A2 ;
    assign NOT_A1 = ~A1 ;
    or (nx4, NOT_A2, NOT_A1) ;
    assign NOT_A0 = ~A0 ;
    or (Y, nx4, NOT_A0) ;
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

