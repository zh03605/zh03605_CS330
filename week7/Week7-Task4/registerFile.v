module registerFile
(
  input [4:0] rs1,
  input [4:0] rs2,
  input RegWrite,
  input [4:0] rd,
  input [63:0] writeData,
  output reg [63:0] ReadData1,
  output reg [63:0] ReadData2,
  input clk,
  input reset
);
	reg [63:0] Registar [31:0];
	
	initial 
	begin
		Registar[0] = 64'd56;
		Registar[1] = 64'd62;
		Registar[2] = 64'd24;
		Registar[3] = 64'd67;
		Registar[4] = 64'd58;
		Registar[5] = 64'd96;
		Registar[6] = 64'd53;
		Registar[7] = 64'd28;
		Registar[8] = 64'd74;
		Registar[9] = 64'd28;
		Registar[10] = 64'd24;
		Registar[11] = 64'd4;
		Registar[12] = 64'd4;
		Registar[13] = 64'd47;
		Registar[14] = 64'd75;
		Registar[15] = 64'd93;
		Registar[16] = 64'd2;
		Registar[17] = 64'd9;
		Registar[18] = 64'd26;
		Registar[19] = 64'd35;
		Registar[20] = 64'd1;
		Registar[21] = 64'd47;
		Registar[22] = 64'd9;
		Registar[23] = 64'd97;
		Registar[24] = 64'd14;
		Registar[25] = 64'd68;
		Registar[26] = 64'd43;
		Registar[27] = 64'd9;
		Registar[28] = 64'd9;
		Registar[29] = 64'd47;
		Registar[30] = 64'd3;
		Registar[31] = 64'd2;
	end
	
	always @ (posedge clk & RegWrite)
	begin
	  if (rd != 0)
		  Registar[rd] = writeData;
	end
	
	always @ (rs1 or rs2 or reset)
	begin
		if (reset)
		  begin
			 ReadData1 = 64'b0;
			 ReadData2 = 64'b0;
		  end
		else
		  begin 
			 ReadData1 = Registar[rs1];
			 ReadData2 = Registar[rs2];
		  end
	end 
endmodule
	
