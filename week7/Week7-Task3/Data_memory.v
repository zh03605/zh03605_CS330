module Data_memory
(
	input clk, MemWrite, MemRead,
	input [63:0] Mem_Add, Write_Data,
	output reg [63:0] Read_Data
);

	reg [7:0] DataMemory [63:0];
	initial
		begin
		DataMemory[0]= 8'b01010110;
		DataMemory[1]= 8'b10110001;
		DataMemory[2]= 8'b11011110;
		DataMemory[3]= 8'b01100001;
		DataMemory[4]= 8'b11010110;
		DataMemory[5]= 8'b00000110;
		DataMemory[6]= 8'b01010010;
		DataMemory[7]= 8'b01001100;
		DataMemory[8]= 8'b01110010;
		DataMemory[9]= 8'b01000100;
		DataMemory[10]= 8'b00111000;
		DataMemory[11]= 8'b10110000;
		DataMemory[12]= 8'b00100001;
		DataMemory[13]= 8'b10111000;
		DataMemory[14]= 8'b10110011;
		DataMemory[15]= 8'b11000000;
		DataMemory[16]= 8'b00010111;
		DataMemory[17]= 8'b10110110;
		DataMemory[18]= 8'b10111111;
		DataMemory[19]= 8'b11111111;
		DataMemory[20]= 8'b10001100;
		DataMemory[21]= 8'b10100100;
		DataMemory[22]= 8'b01010111;
		DataMemory[23]= 8'b01111000;
		DataMemory[24]= 8'b00100010;
		DataMemory[25]= 8'b11111011;
		DataMemory[26]= 8'b10111011;
		DataMemory[27]= 8'b10001110;
		DataMemory[28]= 8'b01111000;
		DataMemory[29]= 8'b10001000;
		DataMemory[30]= 8'b10110110;
		DataMemory[31]= 8'b10011101;
		DataMemory[32]= 8'b11011001;
		DataMemory[33]= 8'b00100011;
		DataMemory[34]= 8'b11011101;
		DataMemory[35]= 8'b11011110;
		DataMemory[36]= 8'b10111001;
		DataMemory[37]= 8'b11000001;
		DataMemory[38]= 8'b11111010;
		DataMemory[39]= 8'b10101000;
		DataMemory[40]= 8'b00111000;
		DataMemory[41]= 8'b01001101;
		DataMemory[42]= 8'b11000101;
		DataMemory[43]= 8'b00100011;
		DataMemory[44]= 8'b10011000;
		DataMemory[45]= 8'b00110110;
		DataMemory[46]= 8'b01001000;
		DataMemory[47]= 8'b11111010;
		DataMemory[48]= 8'b10111101;
		DataMemory[49]= 8'b10100010;
		DataMemory[50]= 8'b00000111;
		DataMemory[51]= 8'b10100100;
		DataMemory[52]= 8'b10101110;
		DataMemory[53]= 8'b00001101;
		DataMemory[54]= 8'b01111110;
		DataMemory[55]= 8'b00110010;
		DataMemory[56]= 8'b11100111;
		DataMemory[57]= 8'b01111010;
		DataMemory[58]= 8'b10000101;
		DataMemory[59]= 8'b00111000;
		DataMemory[60]= 8'b01000100;
		DataMemory[61]= 8'b01010100;
		DataMemory[62]= 8'b00001100;
		DataMemory[63]= 8'b11011001;
		end
	
	always @ (posedge clk)
	begin
		if (MemWrite)
			{DataMemory[Mem_Add+7], DataMemory[Mem_Add+6], DataMemory[Mem_Add+5],
		DataMemory[Mem_Add+4], DataMemory[Mem_Add+3], DataMemory[Mem_Add+2], DataMemory[Mem_Add+1],
		DataMemory[Mem_Add]} = Write_Data;
		
	end
	
	always @ (Mem_Add or MemRead or DataMemory)
	begin
		if (MemRead)
			Read_Data = {DataMemory[Mem_Add+7], DataMemory[Mem_Add+6], DataMemory[Mem_Add+5],
		DataMemory[Mem_Add+4], DataMemory[Mem_Add+3], DataMemory[Mem_Add+2], DataMemory[Mem_Add+1],
		DataMemory[Mem_Add]};
	end
	
endmodule
		
		
		
		
		
		
		
		
		
		