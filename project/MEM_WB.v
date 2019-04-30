module MEM_WB
(
	input clk, reset,
	input MemtoReg3, RegWrite3,
	input [63:0] Read_data,
	input [63:0] ALU_result2,
	input [4:0] Rd23,
	output reg MemtoReg4, RegWrite4,
	output reg [63:0] Read_data1,
	output reg [63:0] ALU_result3,
	output reg [4:0] Rd24
);
always @ (reset)
  begin
    if (reset)
      begin
        Read_data1 <= 64'b0;
		ALU_result3 <= 64'b0;
		Rd24 <= 5'b0; 
        MemtoReg4 <= 0; 
        RegWrite4 <= 0;
      end
  end
   always @ (posedge clk)
  begin
    if (!reset)
      begin
        Read_data1 <= Read_data;
		ALU_result3 <= ALU_result2;
		Rd24 <= Rd23; 
        MemtoReg4 <= MemtoReg3; 
        RegWrite4 <= RegWrite3;
      end
  end

endmodule 
  