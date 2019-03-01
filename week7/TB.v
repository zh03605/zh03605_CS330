module TB
(
);
	reg [4:0] rs1, rs2, rd;
	reg regWrite, clk, reset;
	reg [63:0] writeData;
	wire [63:0] readData1, readData2;
	
	registerFile rf
	(
		.writeData(writeData),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.regWrite(regWrite),
		.clk(clk),
		.reset(reset),
		.readData1(readData1),
		.readData2(readData2)
	);
	always
	#10 clk = ~clk;
	
		initial
		begin
		reset = 0;
		clk = 1'b0;
		regWrite = 0;
		rs1 = 5'd1;
		rs2 = 5'd2;
		rd = 5'd3;
		#50 regWrite = 1;
		writeData = 100;
		#10 rs2 = 5'd3;
		#50 reset = 1;
		
		end
		
		
		

	
endmodule
