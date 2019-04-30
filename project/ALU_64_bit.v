module ALU_64_bit
  (
  input [63:0] a,b, 
  input CarryIn,
  input [3:0] ALUOp,
  output reg [63:0]Result,
  output reg CarryOut,
  output reg Zero
  );
  
  always @(a, b, CarryIn, ALUOp, Result)
  
  begin
    Zero = 1'b0;
    CarryOut <= 0;

    if (ALUOp == 4'b0000) //and 
      Result = a & b;
    
    if (ALUOp == 4'b001) //or
      Result = a | b;
    
    if (ALUOp == 4'b1100) //nor
      Result = ~(a | b);
    
    if (ALUOp == 4'b0110) //subtract
    begin
      Result = a - b;
    end 
    
    if (ALUOp == 4'b0010) //add
    begin
      Result = a + b;
    end
    if (Result == 64'b0)
      Zero = 1'b1;
  end
endmodule