`timescale 1ns/1ps

//=====================================================================
// M Register Module (regm)
// This module stores a 4-bit value.
// C0 = 1'b1 indicates "load" and C0 = 1'b0 indicates "hold".
module regm (Q3, Q2, Q1, Q0, D3, D2, D1, D0, clock, C0);
    input   D3, D2, D1, D0, clock, C0;
    output  Q3, Q2, Q1, Q0;
    reg     Q3, Q2, Q1, Q0;
    parameter Hold = 1'b0, Load = 1'b1;
    
    always @(posedge clock) begin
        case (C0)
            Hold: ; // Do nothing
            Load: {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0};
            default: ; // Do nothing
        endcase
    end
endmodule

//=====================================================================
// Q Register Module (regq)
// This module stores a 4-bit value plus an extra bit Qm1.
// It uses a 2-bit control input {C1,C0}.
// When {C1,C0} == 2'b00 (Load), it loads the 4-bit input and sets Qm1=0.
// When {C1,C0} == 2'b10 (Shift), it shifts right:
//    Qm1 gets Q0, Q0 gets Q1, Q1 gets Q2, Q2 gets Q3, and Q3 is replaced by A0.
module regq (Q3, Q2, Q1, Q0, Qm1, D3, D2, D1, D0, A0, clock, C1, C0);
    input   D3, D2, D1, D0, A0, clock, C1, C0;
    output  Q3, Q2, Q1, Q0, Qm1;
    reg     Q3, Q2, Q1, Q0, Qm1;
    parameter Load = 2'b00, Reset = 2'b01, Shift = 2'b10, Hold = 2'b11;
    
    always @(posedge clock) begin
        case ({C1, C0})
            Load:  {Q3, Q2, Q1, Q0, Qm1} <= {D3, D2, D1, D0, 1'b0};
            Shift: begin
                     Qm1 <= Q0;
                     Q0 <= Q1;
                     Q1 <= Q2;
                     Q2 <= Q3;
                     Q3 <= A0;  // Use A0 from A register as new MSB
                   end
            Hold:  ; // Do nothing
            default: ; // Do nothing for Reset case as well
        endcase
    end
endmodule

//=====================================================================
// A Register Module (rega)
// This module stores a 4-bit value and supports load, reset, shift, or hold.
// Control {C1,C0} encodings:
//    LOAD  : 2'b00  -> load new data
//    RST   : 2'b01  -> reset to 0
//    SHIFT : 2'b10  -> arithmetic right shift (sign extension)
//    HOLD  : 2'b11  -> retain current value
module rega (Q3, Q2, Q1, Q0, D3, D2, D1, D0, clock, C1, C0);
    input   D3, D2, D1, D0, clock, C1, C0;
    output  Q3, Q2, Q1, Q0;
    reg     Q3, Q2, Q1, Q0;
    parameter LOAD  = 2'b00, RST = 2'b01, SHIFT = 2'b10, HOLD = 2'b11;
    
    always @(posedge clock or posedge RST) begin
        // For simulation, reset is handled via control code.
        case ({C1, C0})
            RST:   {Q3, Q2, Q1, Q0} <= 4'b0000;
            LOAD:  {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0};
            SHIFT: {Q3, Q2, Q1, Q0} <= {Q3, Q3, Q2, Q1};  // Arithmetic right shift (sign extend)
            HOLD:  {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0};
            default: {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0};
        endcase
    end
endmodule

//=====================================================================
// Add/Sub Module (addsub)
// When control==0, performs addition; when control==1, performs subtraction.
module addsub(co, r3, r2, r1, r0, a3, a2, a1, a0, b3, b2, b1, b0, control);
  output co, r3, r2, r1, r0;
  input  a3, a2, a1, a0, b3, b2, b1, b0, control;

  assign {co, r3, r2, r1, r0} = 
      (control == 0 ? {a3, a2, a1, a0} + {b3, b2, b1, b0} :
                      {a3, a2, a1, a0} - {b3, b2, b1, b0});
endmodule

//=====================================================================
// FSM Controller Module (FSM)
// Generates control signals for the multiplier submodules based on Booth algorithm.
// Note: The "done" signal is updated exclusively in the sequential block.
module FSM(
    LM,         // M register control (1 = load, 0 = hold)
    LA0, LA1,   // A register control (2-bit)
    LQ0, LQ1,   // Q register control (2-bit)
    AS,         // Add/Sub control (0 = add, 1 = subtract)
    done,       // Done signal: multiplication complete
    clock,      // System clock
    Qm1, Q0,    // Q(-1) and Q0 from Q register
    start,      // Start signal: begin multiplication
    reset       // Asynchronous reset
);
    output LM, LA0, LA1, LQ0, LQ1, AS, done;
    input  clock, Qm1, Q0, start, reset;
    
    reg LM, LA0, LA1, LQ0, LQ1, AS, done;
    reg [1:0] count;
    reg [2:0] NEXT_STATE;
    reg [2:0] ST;
    
    // State encodings
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
    
    // Control signal encoding for registers A and Q:
    //    LOAD      = 2'b00, RESETCTRL = 2'b01, SHIFT = 2'b10, HOLD = 2'b11.
    parameter LOAD     = 2'b00, 
              RESETCTRL= 2'b01, 
              SHIFT    = 2'b10, 
              HOLD     = 2'b11;
    // For add/sub unit: 0 = Add, 1 = Subtract.
    parameter Add = 1'b0, Sub = 1'b1;
    // For M register control: LD = 1, HD = 0.
    parameter LD = 1'b1, HD = 1'b0;
    
    // Combinational logic for next state and control signals.
    always @(start or ST or Qm1 or Q0 or count) begin
        NEXT_STATE = ST;  // Default: remain in current state.
        LM = HD;
        {LA1, LA0} = HOLD;
        {LQ1, LQ0} = HOLD;
        AS = Add;
        
        case (ST)
          s0: begin
            if (start == 1'b1) begin
              LM         = LD;             // M loads multiplicand.
              {LA1, LA0} = RESETCTRL;       // A is reset (clear).
              {LQ1, LQ0} = LOAD;            // Q loads multiplier.
              AS         = Add;             // Prepare for addition.
              NEXT_STATE = s1;
            end else begin
              NEXT_STATE = s0;
            end
          end
          
          s1: begin
            case ({Q0, Qm1})
              2'b01: begin
                LM         = HD;
                {LA1, LA0} = LOAD;   // A loads: will add.
                {LQ1, LQ0} = HOLD;   // Q holds.
                AS         = Add;
                NEXT_STATE = s2;
              end
              2'b10: begin
                LM         = HD;
                {LA1, LA0} = LOAD;   // A loads: will subtract.
                {LQ1, LQ0} = HOLD;
                AS         = Sub;
                NEXT_STATE = s3;
              end
              2'b00, 2'b11: begin
                LM         = HD;
                {LA1, LA0} = HOLD;
                {LQ1, LQ0} = HOLD;
                AS         = Add;
                NEXT_STATE = s4;
              end
              default: NEXT_STATE = s4;
            endcase
          end
          
          s2: begin
            LM         = HD;
            {LA1, LA0} = HOLD;
            {LQ1, LQ0} = HOLD;
            AS         = Add;
            NEXT_STATE = s4;
          end
          
          s3: begin
            LM         = HD;
            {LA1, LA0} = HOLD;
            {LQ1, LQ0} = HOLD;
            AS         = Add;
            NEXT_STATE = s4;
          end
          
          s4: begin
            LM         = HD;
            {LA1, LA0} = SHIFT;   // Shift operation.
            {LQ1, LQ0} = SHIFT;
            AS         = Add;     // Default (unused here).
            if (count == 2'b11)
              NEXT_STATE = s0;
            else
              NEXT_STATE = s1;
          end
          
          default: begin
            NEXT_STATE = s0;
            LM         = HD;
            {LA1, LA0} = HOLD;
            {LQ1, LQ0} = HOLD;
            AS         = Add;
          end
        endcase
    end
    
    // Sequential logic: update state, counter, and the done signal.
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            ST <= s0;
            count <= 2'b00;
            done <= 1'b0;
        end else begin
            ST <= NEXT_STATE;
            if (ST == s4)
              count <= count + 1;
            if (ST == s0 && start == 1'b1) begin
              count <= 2'b00;
              done <= 1'b0;
            end
            if (NEXT_STATE == s0 && count == 2'b11)
              done <= 1'b1;
            else
              done <= 1'b0;
        end
    end
endmodule

// Define constants for control signals for clarity.
`define HOLD 2'b11
`define LOAD 2'b00
`define RESETCTRL 2'b01
`define SHIFT 2'b10

//=====================================================================
// Top-Level Multiplier Module
// Instantiates regm, regq, rega, addsub, and FSM.
// The product is formed by concatenating the outputs of the A and Q registers.
module multiplier(
    Product,         // 8-bit product: {A, Q}
    Multiplicand,    // 4-bit multiplicand (for M register)
    Multiplier,      // 4-bit multiplier (for Q register)
    Start,           // Start signal: initiates multiplication
    Reset,           // Asynchronous reset signal
    Clock,           // System clock
    Done             // Done signal: multiplication complete
);
    input  [3:0] Multiplicand, Multiplier;
    input        Start, Reset, Clock;
    output [7:0] Product;
    output       Done;
    
    // Internal wires for submodule interconnection.
    wire [3:0] M;   // Output from M register (regm)
    wire [3:0] A;   // Output from A register (rega)
    wire [3:0] Q;   // Output from Q register (regq)
    wire       Qm1; // Extra bit from Q register
    wire       LM;  // Control for M register
    wire       LA0, LA1; // 2-bit control for A register
    wire       LQ0, LQ1; // 2-bit control for Q register
    wire       AS;       // Control for add/sub unit
    wire [3:0] sum;      // 4-bit result from addsub
    wire       co;       // Carry-out (unused)
    
    // Instantiate the M register module (regm)
    regm M_reg(
        .Q3(M[3]), .Q2(M[2]), .Q1(M[1]), .Q0(M[0]),
        .D3(Multiplicand[3]), .D2(Multiplicand[2]), .D1(Multiplicand[1]), .D0(Multiplicand[0]),
        .clock(Clock),
        .C0(LM)
    );
    
    // Instantiate the Q register module (regq)
    regq Q_reg(
        .Q3(Q[3]), .Q2(Q[2]), .Q1(Q[1]), .Q0(Q[0]),
        .Qm1(Qm1),
        .D3(Multiplier[3]), .D2(Multiplier[2]), .D1(Multiplier[1]), .D0(Multiplier[0]),
        .A0(A[0]),   // A[0] is used during shift.
        .clock(Clock),
        .C1(LQ1), .C0(LQ0)
    );
    
    // Instantiate the A register module (rega)
    rega A_reg(
        .Q3(A[3]), .Q2(A[2]), .Q1(A[1]), .Q0(A[0]),
        .D3(sum[3]), .D2(sum[2]), .D1(sum[1]), .D0(sum[0]),
        .clock(Clock),
        .C1(LA1), .C0(LA0)
    );
    
    // Instantiate the add/sub module
    addsub addsub_unit(
        .co(co),
        .r3(sum[3]), .r2(sum[2]), .r1(sum[1]), .r0(sum[0]),
        .a3(A[3]), .a2(A[2]), .a1(A[1]), .a0(A[0]),
        .b3(M[3]), .b2(M[2]), .b1(M[1]), .b0(M[0]),
        .control(AS)
    );
    
    // Instantiate the FSM Controller module
    FSM controller(
        .LM(LM),
        .LA0(LA0), .LA1(LA1),
        .LQ0(LQ0), .LQ1(LQ1),
        .Qm1(Qm1), .Q0(Q[0]),
        .AS(AS),
        .reset(Reset),
        .start(Start),
        .done(Done),
        .clock(Clock)
    );
    
    // The final product is the concatenation of A and Q.
    assign Product = {A, Q};

endmodule
