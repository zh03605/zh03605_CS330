module RISC_V_Processor
  (
  input clk, reset
  
  );
  wire [63:0] a, b;
  wire [63:0] pc_plus_4;
  wire [63:0] pc_plus_imm;
  wire [63:0] PC_In;
  wire sel_1, sel_2, sel_3;
  wire [31:0] Instruction;
  wire [6:0] opcode, funct7;
  wire [2:0] funct3;
  wire [4:0] rd, rs1, rs2;
  
  Adder adder1
  (
  .a(a),
  .b(64'd4),
  .out(pc_plus_4)
  );
  
  Adder adder2
  (
  .a(a),
  .b(b<<1),
  .out(pc_plus_imm)
  );
  
  Program_Counter PC
  (
  .clk(clk),
  .reset(reset),
  .PC_In(PC_In),
  .PC_Out(a)
  );
  
  
  
  Instruction_Memory IM
  (
  .Inst_Address(a),
  .Instruction(Instruction)
  );
  
  InstructionParser IP
  (
  .instruction(Instruction),
  .opcode(opcode),
  .rd(rd),
  .rs1(rs1),
  .rs2(rs2),
  .funct3(funct3),
  .funct7(funct7)
  );
  
  IDE ide
  (
  .instruction(Instruction),
  .immData(b)
  );
  
  wire [3:0] Funct = {Instruction[30] , Instruction[14:12] };
  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  wire [3:0] Operation;
  
  top_control top
  (
  .Opcode(opcode),
  .Funct(Funct),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .Operation(Operation)
  );
  wire [63:0] readData1, readData2, writeData, mux2_out;
  
  registerFile rf
  (
  .rs1(rs1),
  .rs2(rs2),
  .rd(rd),
  .RegWrite(RegWrite),
  .writeData(writeData),
  .readData1(readData1),
  .readData2(readData2),
  .clk(clk),
  .reset(reset)
  );
  wire zero;
  wire [63:0] alu_result;
  
  Mux mux1
  (
  .a(pc_plus_4),
  .b(pc_plus_imm),
  .sel(Branch & zero),
  .out(PC_In)
  );
  Mux mux2
  (
  .a(readData2),
  .b(b),
  .sel(ALUSrc),
  .out(mux2_out)
  );
  
  ALU_64_bit alu
  (
  .a(readData1),
  .b(mux2_out),
  .ALUOp(Operation),
  .Zero(zero),
  .Result(alu_result)
  );
  wire [63:0] read;
  
  Data_memory dm
  (
  .Mem_Add(alu_result),
  .Write_Data(readData2),
  .clk(clk),
  .MemWrite(MemWrite),
  .MemRead(MemRead),
  .Read_Data(read)
  );
  
  Mux mux3
  (
  .a(read),
  .b(alu_result),
  .sel(~MemtoReg),
  .out(writeData)
  );
  
endmodule

  
  
  
  
  