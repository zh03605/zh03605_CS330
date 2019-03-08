module tb2
();

	reg clk, memWrite, memRead;
	reg [63:0] mem_address, write_data;
	wire [63:0] read_data;
	
	Data_memory Dm
	(
		.clk(clk),
		.MemWrite(memWrite),
		.MemRead(memRead),
		.Mem_Add(mem_address),
		.Write_Data(write_data),
		.Read_Data(read_data)
	);
	
		initial clk = 1'b1;
		always # 5 clk = ~clk;
		
		initial
		begin
		mem_address = 64'd0;
		memRead = 1;
		
		#50
		memRead = 0;
		memWrite = 1;
		write_data = 64'd0;
		mem_address = 64'd0;
		
		#50
		memWrite = 0;
		memRead = 1;
		
		end
		
		
endmodule