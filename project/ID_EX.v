module ID_EX 
  (
  input clk, reset, 
  input [63:0] inReadData1, inReadData2, PC_Out1,imm_data1,
  input [4:0] Rd1, inrs1, inrs2, 
  input [2:0] in_instruction12_14,
  input in_instruction30,
  input Branch1, MemRead1, MemtoReg1, MemWrite1, ALUSrc1, RegWrite1,
  input [1:0] ALUOp1,
  output reg [63:0] outReadData1, outReadData2, PC_Out2, imm_data2,
  output reg Branch2, MemRead2, MemtoReg2, MemWrite2, ALUSrc2, RegWrite2,
  output reg [1:0] ALUOp2,
  output reg [4:0] Rd2, outrs1, outrs2, 
  output reg [2:0] out_instruction12_14,
  output reg out_instruction30
  
  );
  always @ (reset)
  begin
    if (reset)
      begin
        outReadData1 <= 64'b0;
        outReadData2 <= 64'b0;
        PC_Out2 <= 64'b0;
        imm_data2 <= 64'b0;
        Rd2 <= 5'b0;
        outrs1 <= 5'b0;
        outrs2 <= 5'b0;
        out_instruction12_14 <= 3'b0;
        out_instruction30 <= 0;
        Branch2 <= 0;
        MemRead2 <= 0; 
        MemtoReg2 <= 0; 
        MemWrite2 <= 0;
        ALUSrc2 <= 0; 
        RegWrite2 <= 0;
        ALUOp2 <= 2'b0;
      end
  end
  always @ (posedge clk)
  begin
    if (!reset)
      begin
        outReadData1 <= inReadData1;
        outReadData2 <= inReadData2;
        PC_Out2 <= PC_Out1;
        imm_data2 <= imm_data1;
        Rd2 <= Rd1;
        outrs1 <= inrs1;
        outrs2 <= inrs2;
        out_instruction12_14 <= in_instruction12_14;
        out_instruction30 <= in_instruction30;
        Branch2 <= Branch1;
        MemRead2 <= MemRead1; 
        MemtoReg2 <= MemtoReg1; 
        MemWrite2 <= MemWrite1;
        ALUSrc2 <= ALUSrc1; 
        RegWrite2 <= RegWrite1;
        ALUOp2 <= ALUOp1;
      end
  end
  
  
endmodule