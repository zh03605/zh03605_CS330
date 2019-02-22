module ALU_6_bit
  (
  input [5:0] a,b, 
  input CarryIn,
  input [3:0] ALUOp,
  output [5:0]Result,
  output CarryOut
  );
  wire w1, w2, w3, w4, w5;
  ALU_1_bit alu0
  (
  .ALUOp(ALUOp),
  .a(a[0]),
  .b(b[0]),
  .CarryIn(CarryIn),
  .Result(Result[0]),
  .CarryOut(w1)
  );
  ALU_1_bit alu1
  (
  .ALUOp(ALUOp),
  .a(a[1]),
  .b(b[1]),
  .CarryIn(w1),
  .Result(Result[1]),
  .CarryOut(w2)
  );
  ALU_1_bit alu2
  (
  .ALUOp(ALUOp),
  .a(a[2]),
  .b(b[2]),
  .CarryIn(w2),
  .Result(Result[2]),
  .CarryOut(w3)
  );
  ALU_1_bit alu3
  (
  .ALUOp(ALUOp),
  .a(a[3]),
  .b(b[3]),
  .CarryIn(w3),
  .Result(Result[3]),
  .CarryOut(w4)
  );
  ALU_1_bit alu4
  (
  .ALUOp(ALUOp),
  .a(a[4]),
  .b(b[4]),
  .CarryIn(w4),
  .Result(Result[4]),
  .CarryOut(w5)
  );
  ALU_1_bit alu5
  (
  .ALUOp(ALUOp),
  .a(a[5]),
  .b(b[5]),
  .CarryIn(w5),
  .Result(Result[5]),
  .CarryOut(CarryOut)
  );
  
endmodule
