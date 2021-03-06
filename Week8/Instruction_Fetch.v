module Instruction_Fetch
  (
  input clk, reset,
  output [31:0] Instruction
  );
  wire [63:0] a, b, out;
  
  Program_Counter PC
  (
  .clk(clk),
  .reset(reset),
  .PC_In(out),
  .PC_Out(a)
  
  );
  
  Adder adder
  (
  .a(a),
  .b(64'd4),
  .out(out)
  );
  
  Instruction_Memory IM
  (
  .Inst_Address(a),
  .Instruction(Instruction)
  );
  
  
endmodule