module FSM(
    LM,         // Register M control: 0 = Hold, 1 = Load
    LA0, LA1,   // Register A control (2-bit)
    LQ0, LQ1,   // Register Q control (2-bit)
    AS,         // AddSub control: 0 = Add, 1 = Subtract
    done,       // Done signal: 1 indicates multiplication finished
    clock,      // System clock
    Qm1, Q0,    // Q(-1) and Q0 (from Register Q)
    start,      // Start signal: begin multiplication
    reset       // Asynchronous reset
);

  output LM, LA0, LA1, LQ0, LQ1, AS, done;
  input  clock, Qm1, Q0, start, reset;
  
  reg LM, LA0, LA1, LQ0, LQ1, AS, done;
  reg [1:0] count;         // Two-bit counter for iteration
  reg [2:0] NEXT_STATE; 
  reg [2:0] ST;
  
  // State encodings
  parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
  
  // Control Signal Encoding (for registers A and Q)
  // Using 2-bit codes:
  //   Load  = 2'b00, Reset = 2'b01, Shift = 2'b10, Hold = 2'b11.
  // For the add/sub unit:
  parameter Add = 1'b0, Sub = 1'b1;
  // For register M control (1-bit): LD = 1, HD = 0.
  parameter LD = 1'b1, HD = 1'b0;
  
  // done signal is handled in the sequential logic block
  
  // Combinational part: next-state logic and control assignments
  always @(start or ST or Qm1 or Q0 or count) begin
    // Default assignments: hold commands
    NEXT_STATE = ST;
    LM = HD;
    {LA1, LA0} = 2'b11; // Hold
    {LQ1, LQ0} = 2'b11; // Hold
    AS = Add;
    
    case (ST)
      s0: begin
        if (start == 1'b1) begin
          LM         = LD;         // M loads the multiplicand
          {LA1, LA0} = 2'b01;       // A reset (clear)
          {LQ1, LQ0} = 2'b00;       // Q loads the multiplier
          AS         = Add;         // Prepare for addition
          NEXT_STATE = s1;
        end else begin
          NEXT_STATE = s0;
        end
      end
      
      s1: begin
        case ({Q0, Qm1})
          2'b01: begin
            LM         = HD;
            {LA1, LA0} = 2'b00;   // A loads (will add M)
            {LQ1, LQ0} = 2'b11;   // Q holds
            AS         = Add;
            NEXT_STATE = s2;
          end
          2'b10: begin
            LM         = HD;
            {LA1, LA0} = 2'b00;   // A loads (will subtract M)
            {LQ1, LQ0} = 2'b11;   // Q holds
            AS         = Sub;
            NEXT_STATE = s3;
          end
          2'b00, 2'b11: begin
            LM         = HD;
            {LA1, LA0} = 2'b11;   // A holds
            {LQ1, LQ0} = 2'b11;   // Q holds
            AS         = Add;      // Default
            NEXT_STATE = s4;
          end
          default: begin
            NEXT_STATE = s4;
          end
        endcase
      end
      
      s2: begin
        // After addition, perform shift
        LM         = HD;
        {LA1, LA0} = 2'b10;       // A shift
        {LQ1, LQ0} = 2'b10;       // Q shift
        AS         = Add;
        NEXT_STATE = s4;
      end
      
      s3: begin
        // After subtraction, perform shift
        LM         = HD;
        {LA1, LA0} = 2'b10;       // A shift
        {LQ1, LQ0} = 2'b10;       // Q shift
        AS         = Sub;
        NEXT_STATE = s4;
      end
      
      s4: begin
        // In state s4, always perform shift.
        LM         = HD;
        {LA1, LA0} = 2'b10;       // A shift
        {LQ1, LQ0} = 2'b10;       // Q shift
        AS         = Add;         // Default add (not used here)
        // If counter has reached maximum, finish multiplication (go to s0)
        if (count == 2'b11)
          NEXT_STATE = s0;
        else
          NEXT_STATE = s1;
      end
      
      default: begin
        NEXT_STATE = s0;
        LM         = HD;
        {LA1, LA0} = 2'b11;
        {LQ1, LQ0} = 2'b11;
        AS         = Add;
      end
    endcase
  end
  
  // Sequential logic: update state and counter
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ST    <= s0;
      count <= 2'b00;
      done  <= 1'b0;
    end else begin
      ST <= NEXT_STATE;
      // In state s4, increment counter to track cycles
      if (ST == s4) begin
        count <= count + 1;
        // When count reaches maximum, done will be true (via assign done)
      end
      // If FSM goes to s0 with a new start, reset counter
      if (ST == s0 && start == 1'b1) begin
        count <= 2'b00;
        done  <= 1'b0;
      end
    end
  end

endmodule
