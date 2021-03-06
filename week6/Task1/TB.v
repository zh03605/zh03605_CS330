module TB
  (
  );
  
  reg [3:0] ALUOp;
  reg a,b,CarryIn; 
  wire Result, CarryOut;
  
  ALU_1_bit alu
  (
  .ALUOp(ALUOp),
  .a(a),
  .b(b),
  .CarryIn(CarryIn),
  .Result(Result),
  .CarryOut(CarryOut)
  );
  
  initial 
  begin
    a <= 1'b1;
    b <= 1'b1;
    CarryIn = 1'b0;
    ALUOp = 4'b0; //and
  end

  always
  begin 
    #50 ALUOp = 4'b1; //or
    #50 ALUOp = 4'b1100; //nor 
    #50 ALUOp = 4'b10; //add
    #50 CarryIn = 1'b1;
    #50 ALUOp = 4'b110; //subtract 
    
  end
  
endmodule