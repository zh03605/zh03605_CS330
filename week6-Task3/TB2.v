module TB2
  (
  );
  
  reg [3:0] ALUOp;
  reg [63:0]a,b;
  reg CarryIn; 
  wire [63:0] Result;
  wire CarryOut;
  wire Zero;
  
  ALU_64_bit alu
  (
  .ALUOp(ALUOp),
  .a(a),
  .b(b),
  .CarryIn(CarryIn),
  .Result(Result),
  .CarryOut(CarryOut),
  .Zero(Zero)
  );
  
  initial 
  begin
    a <= 64'b1;
    b <= 64'b10;
    CarryIn = 1'b0;
    ALUOp = 4'b0; //and
  end

  always
  begin 
    #50 ALUOp = 4'b1; //or
    #50 ALUOp = 4'b1100; //nor 
    #50 ALUOp = 4'b10; //add
    CarryIn = 1'b1;
    #50 ALUOp = 4'b110; //subtract 
    
  end
  
endmodule
