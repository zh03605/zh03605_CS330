module ALU_1_bit
  (
  input a,b, CarryIn,
  input [3:0] ALUOp,
  output reg Result, CarryOut
  );
  wire abar, bbar,mux1out, mux2out;
  assign abar = ~a;
  assign bbar = ~b;
  assign mux2out = ALUOp[2] ? ~b : b;
  assign mux1out = ALUOp[3] ? ~a : a;
  always @(a, b, CarryIn, ALUOp)
  begin
    CarryOut = 0;
    
    
    if (ALUOp == 4'b0000) //and 
      Result = mux1out & mux2out;
    
    if (ALUOp == 4'b001) //or
      Result = mux1out | mux2out;
    
    if (ALUOp == 4'b1100) //nor
      Result = (mux1out & mux2out);
    
    if (ALUOp == 4'b0110) //subtract
    begin
      CarryOut = (mux1out & CarryIn) | (mux2out & CarryIn) | (mux1out & mux2out);
      Result = (mux1out & ~mux2out & ~CarryIn) | (~mux1out & mux2out & ~CarryIn) | (~mux1out & ~mux2out & CarryIn) | (mux1out & mux2out & CarryIn);
    end 
    
    if (ALUOp == 4'b0010) //add
    begin
      CarryOut = (mux1out & CarryIn) | (mux2out & CarryIn) | (mux1out & mux2out);
      Result = (mux1out & ~mux2out & ~CarryIn) | (~mux1out & mux2out & ~CarryIn) | (~mux1out & ~mux2out & CarryIn) | (mux1out & mux2out & CarryIn);
    end
    
  end
endmodule 