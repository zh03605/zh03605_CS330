module tb3
();

	reg [31:0] instruction;
	wire [63:0] ReadData1;
	wire [63:0] ReadData2;
	
	
	Top tp
	(
	
		.instruction(instruction),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);
	
	initial
		begin
			instruction = 32'b00000000100110101000010010110011;
		end
endmodule	