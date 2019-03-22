module tb
  ();
  reg [6:0] Opcode;
  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  wire [1:0] ALUOp;
  
  Control_Unit CU
  (
  .Opcode(Opcode),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .ALUOp(ALUOp)
  );
  
  initial 
  begin
  Opcode <= 7'b0110011;
  
  #10 Opcode <= 7'b0000011;
  #10 Opcode <= 7'b0100011;
  #10 Opcode <= 7'b1100011;
  end


endmodule
