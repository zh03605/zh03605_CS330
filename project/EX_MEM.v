module EX_MEM
(
	input clk, reset,
	input [63:0] adder_out,
	input [63:0] ALU_result,
	input zero,
	input [63:0] mux_2_out,
	input [4:0] Rd2,
	input Branch2, MemRead2, MemtoReg2, MemWrite2, RegWrite2,
	output reg Branch3, MemRead3, MemtoReg3, MemWrite3, RegWrite3,
	output reg [63:0] adder_out2,
	output reg [63:0] ALU_result2,
	output reg zero2,
	output reg [63:0] mux_2_out2,
	output reg [4:0] Rd23
);

always @ (reset)
  begin
    if (reset)
      begin
        adder_out2 <= 64'b0;
		ALU_result2 <= 64'b0;
		zero2 <= 0;
		mux_2_out2 <= 64'b0;
		Rd23 <= 64'b0;
        Branch3 <= 0;
        MemRead3 <= 0; 
        MemtoReg3 <= 0; 
        MemWrite3 <= 0;
        RegWrite3 <= 0;
      end
  end
   always @ (posedge clk)
  begin
    if (!reset)
      begin
        adder_out2 <= adder_out;
        ALU_result2 <= ALU_result;
        zero2 <= zero;
        mux_2_out2 <= mux_2_out;
        Rd23 <= Rd2;
        Branch3 <= Branch2;
        MemRead3 <= MemRead2; 
        MemtoReg3 <= MemtoReg2; 
        MemWrite3 <= MemWrite2;
        RegWrite3 <= RegWrite2;
      end
  end
  endmodule 