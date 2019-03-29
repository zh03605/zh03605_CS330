module top_control 
  (
  input [6:0] Opcode,
  input [3:0] Funct,
  output Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
  output [3:0] Operation
  );
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
  
  ALU_Control control
  (
  .ALUOp(ALUOp),
  .Funct(Funct),
  .Operation(Operation)
  );
endmodule 