module addsub(co, r3, r2, r1, r0, a3, a2, a1, a0, b3, b2, b1, b0, control);
  output co, r3, r2, r1, r0;
  input  a3, a2, a1, a0, b3, b2, b1, b0, control;

  // When control is 0, perform addition.
  // When control is 1, perform subtraction.
  assign {co, r3, r2, r1, r0} = (control == 0 ? {a3, a2, a1, a0} + {b3, b2, b1, b0} :
                                               {a3, a2, a1, a0} - {b3, b2, b1, b0});
endmodule
