module TB
(
);
	reg [4:0] rs1, rs2, rd;
	reg regWrite, clk, reset;
	reg [63:0] writeData;
	wire [63:0] readData1;
	wire [63:0] readData2;
	
	registerFile rf
	(
		.writeData(writeData),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.RegWrite(regWrite),
		.clk(clk),
		.reset(reset),
		.readData1(readData1),
		.readData2(readData2)
	);
	always
	#5 clk = ~clk;
	
		initial
		begin
		reset = 0;
		clk = 1'b0;
		regWrite = 0;
		rs1 = 5'd1;
		rs2 = 5'd2;
		rd = 5'd3;
		#10 regWrite = 1;
		writeData = 64'd100;
		#10 rs2 = 5'd3;
		#10 reset = 1;
		#10 reset = 0;
		rs2 = 5'd4;
		regWrite = 1;
		#10 rd = 5'd6;
		rs1 = 5'd6;
		#10 reset = 1;
		rs2 = 5'd6;
		#10 reset = 0;
		rd = 5'b0;
		
		regWrite = 0;
		#10 rd = 5'd7;
		rs1 = 5'd7;
		end
		
		
		

	
endmodule
