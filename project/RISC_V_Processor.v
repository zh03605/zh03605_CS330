module RISC_V_Processor
  (
  input clk, reset
  
  );
  wire [63:0] a, b, c, d, e, a1, b1;
  wire [63:0] pc_plus_4;
  wire [63:0] pc_plus_imm;
  wire [63:0] PC_In;
  wire [31:0] Instruction;
  wire [31:0] Instruction3;
  wire [6:0] opcode, funct7;
  wire [2:0] funct3;
  wire [4:0] rd, rs1, rs2;
  wire Cout;
  wire [63:0] read;
  wire [3:0] Funct = {Instruction[30] , Instruction[14:12] };
  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  wire [3:0] Operation;
  wire [1:0] ALUOp, ALUOp2;
  wire [4:0] exmemrd;
  wire [63:0] mux_2_out2;
  wire [63:0] ALU_result2;
  wire zero2;
  wire [63: 0] data_out_mux32;
  wire [63: 0] data_out_mux31;
  wire [63:0] adder_out2;
  wire [1:0] mux3_1sel, mux3_2sel;
  wire [63:0] mux3_1out, mux3_2out;
  wire [2:0] out_instruction12_14;
  wire out_instruction30;
  wire [4:0] Rd2, outrs1, outrs2;
  wire Branch2, MemRead2, MemtoReg2, MemWrite2, ALUSrc2, RegWrite2;
  wire Branch3, MemRead3, MemtoReg3, MemWrite3, RegWrite3;
  wire [63:0] readData1, readData2, writeData, mux2_out, outreadData1, outreadData2;
  wire [4:0] Rd24;
  wire [63:0] memwbRead, ALU_result3;
  wire MemtoReg4, RegWrite4;
  wire zero;
  wire [63:0] alu_result;
  
  IF_ID if_id
  (
  .clk(clk),
  .reset(reset),
  .PC_Out1(a),
  .Instruction1(Instruction),
  .PC_Out2(c),
  .Instruction2(Instruction3)
  );
  
  Adder adder1
  (
  .a(a),
  .b(64'd4),
  .out(pc_plus_4)
  );
  
  Adder adder2
  (
  .a(d),
  .b(e<<1),
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
  .instruction(Instruction3),
  .opcode(opcode),
  .rd(rd),
  .rs1(rs1),
  .rs2(rs2),
  .funct3(funct3),
  .funct7(funct7)
  );
  
  IDE ide
  (
  .instruction(Instruction3),
  .immData(b)
  );
  
  Control_Unit CU 
  (
  .Opcode(opcode),
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
  
  ID_EX id_ex
  (
  .clk(clk),
  .reset(reset),
  .inReadData1(readData1),
  .inReadData2(readData2),
  .PC_Out1(c),
  .imm_data1(b),
  .Rd1(rd),
  .inrs1(rs1), 
  .inrs2(rs2),
  .in_instruction12_14(Instruction3[14:12]),
  .in_instruction30(Instruction3[30]),
  .Branch1(Branch),
  .MemRead1(MemRead), 
  .MemtoReg1(MemtoReg), 
  .MemWrite1(MemWrite), 
  .ALUSrc1(ALUSrc), 
  .RegWrite1(RegWrite),
  .PC_Out2(d),
  .ALUOp1(ALUOp),
  .outReadData1(outreadData1), 
  .outReadData2(outreadData2),
  .imm_data2(e),
  .Branch2(Branch2), 
  .MemRead2(MemRead2), 
  .MemtoReg2(MemtoReg2), 
  .MemWrite2(MemWrite2), 
  .ALUSrc2(ALUSrc2), 
  .RegWrite2(RegWrite2),
  .ALUOp2(ALUOp2),
  .Rd2(Rd2), 
  .outrs1(outrs1), 
  .outrs2(outrs2),
  .out_instruction12_14(out_instruction12_14),
  .out_instruction30(out_instruction30)
  );
  
  Forwarding_Unit FU
  (
  .rs1(outrs1), 
  .rs2(outrs2), 
  .EXMEMrd(exmemrd), 
  .MEMWBrd(Rd24),
  .EXMEMregWrite(RegWrite3), 
  .MEMWBregWrite(RegWrite4),
  .ForwardA(mux3_1sel), 
  .ForwardB(mux3_2sel) 
  );
  
  EX_MEM ex_mem
(
	.clk(clk),
    .reset(reset),
	.adder_out(pc_plus_imm),
	.ALU_result(alu_result),
	.zero(zero),
	.mux_2_out(mux3_2out),
	.Rd2(Rd2),
	.Branch2(Branch2), 
	.MemRead2(MemRead2), 
	.MemtoReg2(MemtoReg2), 
	.MemWrite2(MemWrite2), 
	.RegWrite2(RegWrite2),
	.Branch3(Branch3), 
	.MemRead3(MemRead3), 
	.MemtoReg3(MemtoReg3), 
	.MemWrite3(MemWrite3), 
	.RegWrite3(RegWrite3),
	.adder_out2(adder_out2),
	.ALU_result2(ALU_result2),
	.zero2(zero2),
	.mux_2_out2(mux_2_out2),
	.Rd23(exmemrd)
);
  
  mux3 m31
(
   .a(outreadData1), 
   .b(writeData),
   .c(ALU_result2),
   .sel(mux3_1sel),
   .data_out(data_out_mux31)
   
);
  

MEM_WB mem_wb
(
	.clk(clk),
    .reset(reset),
	.MemtoReg3(MemtoReg3), 
	.RegWrite3(RegWrite3),
	.Read_data(read),
	.ALU_result2(ALU_result2),
	.Rd23(exmemrd),
	.MemtoReg4(MemtoReg4), 
	.RegWrite4(RegWrite4),
	.Read_data1(memwbRead),
	.ALU_result3(ALU_result3),
	.Rd24(Rd24)
);

mux3 m32
(
   .a(outreadData2), 
   .b(writeData),
   .c(ALU_result2),
   .sel(mux3_2sel),
   .data_out(data_out_mux32)
   
);

  
  
  registerFile rf
  (
  .rs1(rs1),
  .rs2(rs2),
  .rd(Rd24),
  .RegWrite(RegWrite4),
  .writeData(writeData),
  .readData1(readData1),
  .readData2(readData2),
  .clk(clk),
  .reset(reset)
  );
  
  
  Mux mux1
  (
  .a(pc_plus_4),
  .b(adder_out2),
  .sel(Branch3 & zero2),
  .out(PC_In)
  );
  Mux mux2
  (
  .a(data_out_mux32),
  .b(e),
  .sel(ALUSrc),
  .out(mux2_out)
  );
  
  ALU_64_bit alu
  (
  .a(data_out_mux31),
  .b(mux2_out),
  .ALUOp(Operation),
  .Zero(zero),
  .Result(alu_result),
  .CarryIn(1'b0),
  .CarryOut(Cout)
  );
  
  Data_memory dm
  (
  .Mem_Add(ALU_result2),
  .Write_Data(mux_2_out2),
  .clk(clk),
  .MemWrite(MemWrite3),
  .MemRead(MemRead3),
  .Read_Data(read)
  );
  
  Mux mux3
  (
  .a(memwbRead),
  .b(ALU_result3),
  .sel(~MemtoReg4),
  .out(writeData)
  );
  
endmodule

  
  
  
  
  