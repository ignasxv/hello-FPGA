`timescale 1ns/1ps

module regm (Q3, Q2, Q1, Q0, D3, D2, D1, D0, clock, C0);
  input   D3, D2, D1, D0, clock, C0;
  output  Q3, Q2, Q1, Q0;
  reg     Q3, Q2, Q1, Q0;
  parameter Hold = 1'b0, Load = 1'b1;
  always @(posedge clock) begin
    case (C0)
      Hold: ;
      Load: {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0};
      default: ;
    endcase
  end
endmodule

module regq (Q3, Q2, Q1, Q0, Qm1, D3, D2, D1, D0, A0, clock, C1, C0);
  input   D3, D2, D1, D0, A0, clock, C1, C0;
  output  Q3, Q2, Q1, Q0, Qm1;
  reg     Q3, Q2, Q1, Q0, Qm1;
  parameter Load = 2'b00, Reset = 2'b01, Shift = 2'b10, Hold = 2'b11;
  always @(posedge clock) begin
    case ({C1, C0})
      Load:  {Q3, Q2, Q1, Q0, Qm1} <= {D3, D2, D1, D0, 1'b0};
      Shift: begin Qm1 <= Q0; Q0 <= Q1; Q1 <= Q2; Q2 <= Q3; Q3 <= A0; end
      Hold:  ;
      default: ;
    endcase
  end
endmodule

module rega (Q3, Q2, Q1, Q0, D3, D2, D1, D0, clock, C1, C0);
  input   D3, D2, D1, D0, clock, C1, C0;
  output  Q3, Q2, Q1, Q0;
  reg     Q3, Q2, Q1, Q0;
  parameter LOAD = 2'b00, RST = 2'b01, SHIFT = 2'b10, HOLD = 2'b11;
  always @(posedge clock or posedge RST) begin
    case ({C1, C0})
      RST:   {Q3, Q2, Q1, Q0} <= 4'b0000;
      LOAD:  {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0};
      SHIFT: {Q3, Q2, Q1, Q0} <= {Q3, Q3, Q2, Q1};
      HOLD:  {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0};
      default: {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0};
    endcase
  end
endmodule

module addsub(co, r3, r2, r1, r0, a3, a2, a1, a0, b3, b2, b1, b0, control);
  output co, r3, r2, r1, r0;
  input  a3, a2, a1, a0, b3, b2, b1, b0, control;
  assign {co, r3, r2, r1, r0} = (control == 0 ? {a3, a2, a1, a0} + {b3, b2, b1, b0} :
                          {a3, a2, a1, a0} - {b3, b2, b1, b0});
endmodule

module FSM(LM, LA0, LA1, LQ0, LQ1, AS, done, clock, Qm1, Q0, start, reset);
  output LM, LA0, LA1, LQ0, LQ1, AS, done;
  input  clock, Qm1, Q0, start, reset;
  reg LM, LA0, LA1, LQ0, LQ1, AS, done;
  reg [1:0] count;
  reg [2:0] NEXT_STATE, ST;
  parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
  parameter LOAD = 2'b00, RESETCTRL = 2'b01, SHIFT = 2'b10, HOLD = 2'b11;
  parameter Add = 1'b0, Sub = 1'b1, LD = 1'b1, HD = 1'b0;
  
  always @(start or ST or Qm1 or Q0 or count) begin
    NEXT_STATE = ST; LM = HD; {LA1, LA0} = HOLD; {LQ1, LQ0} = HOLD; AS = Add;
    case (ST)
      s0: begin
        if (start == 1'b1) begin
          LM = LD; {LA1, LA0} = RESETCTRL; {LQ1, LQ0} = LOAD; AS = Add; NEXT_STATE = s1;
        end else NEXT_STATE = s0;
      end
      s1: begin
        case ({Q0, Qm1})
          2'b01: begin LM = HD; {LA1, LA0} = LOAD; {LQ1, LQ0} = HOLD; AS = Add; NEXT_STATE = s2; end
          2'b10: begin LM = HD; {LA1, LA0} = LOAD; {LQ1, LQ0} = HOLD; AS = Sub; NEXT_STATE = s3; end
          2'b00, 2'b11: begin LM = HD; {LA1, LA0} = HOLD; {LQ1, LQ0} = HOLD; AS = Add; NEXT_STATE = s4; end
          default: NEXT_STATE = s4;
        endcase
      end
      s2: begin LM = HD; {LA1, LA0} = HOLD; {LQ1, LQ0} = HOLD; AS = Add; NEXT_STATE = s4; end
      s3: begin LM = HD; {LA1, LA0} = HOLD; {LQ1, LQ0} = HOLD; AS = Add; NEXT_STATE = s4; end
      s4: begin
        LM = HD; {LA1, LA0} = SHIFT; {LQ1, LQ0} = SHIFT; AS = Add;
        NEXT_STATE = (count == 2'b11) ? s0 : s1;
      end
      default: begin NEXT_STATE = s0; LM = HD; {LA1, LA0} = HOLD; {LQ1, LQ0} = HOLD; AS = Add; end
    endcase
  end
  
  always @(posedge clock or posedge reset) begin
    if (reset) begin ST <= s0; count <= 2'b00; done <= 1'b0; end
    else begin
      ST <= NEXT_STATE;
      if (ST == s4) count <= count + 1;
      if (ST == s0 && start == 1'b1) begin count <= 2'b00; done <= 1'b0; end
      done <= (NEXT_STATE == s0 && count == 2'b11) ? 1'b1 : 1'b0;
    end
  end
endmodule

`define HOLD 2'b11
`define LOAD 2'b00
`define RESETCTRL 2'b01
`define SHIFT 2'b10

module multiplier(Product, Multiplicand, Multiplier, Start, Reset, Clock, Done);
  input  [3:0] Multiplicand, Multiplier;
  input        Start, Reset, Clock;
  output [7:0] Product;
  output       Done;
  wire [3:0] M, A, Q, sum;
  wire       Qm1, LM, LA0, LA1, LQ0, LQ1, AS, co;
  
  regm M_reg(.Q3(M[3]), .Q2(M[2]), .Q1(M[1]), .Q0(M[0]),
         .D3(Multiplicand[3]), .D2(Multiplicand[2]), .D1(Multiplicand[1]), .D0(Multiplicand[0]),
         .clock(Clock), .C0(LM));
  
  regq Q_reg(.Q3(Q[3]), .Q2(Q[2]), .Q1(Q[1]), .Q0(Q[0]), .Qm1(Qm1),
         .D3(Multiplier[3]), .D2(Multiplier[2]), .D1(Multiplier[1]), .D0(Multiplier[0]),
         .A0(A[0]), .clock(Clock), .C1(LQ1), .C0(LQ0));
  
  rega A_reg(.Q3(A[3]), .Q2(A[2]), .Q1(A[1]), .Q0(A[0]),
         .D3(sum[3]), .D2(sum[2]), .D1(sum[1]), .D0(sum[0]),
         .clock(Clock), .C1(LA1), .C0(LA0));
  
  addsub addsub_unit(.co(co),
             .r3(sum[3]), .r2(sum[2]), .r1(sum[1]), .r0(sum[0]),
             .a3(A[3]), .a2(A[2]), .a1(A[1]), .a0(A[0]),
             .b3(M[3]), .b2(M[2]), .b1(M[1]), .b0(M[0]),
             .control(AS));
  
  FSM controller(.LM(LM), .LA0(LA0), .LA1(LA1), .LQ0(LQ0), .LQ1(LQ1),
          .Qm1(Qm1), .Q0(Q[0]), .AS(AS), .reset(Reset),
          .start(Start), .done(Done), .clock(Clock));
  
  assign Product = {A, Q};
endmodule
