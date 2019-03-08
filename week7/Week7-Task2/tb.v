module tb
();
	reg [63:0] inst_address;
	wire [31:0] instruction;
	
	Instruction_Memory Im
	(
		.Inst_Address(inst_address),
		.Instruction(instruction)
	);
	
		initial
		begin
		inst_address = 64'd4;
		end
		
endmodule
