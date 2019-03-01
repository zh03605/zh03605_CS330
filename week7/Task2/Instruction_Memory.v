module Instruction_Memory
(
	input [63:0] Inst_Address,
	output reg [31:0] Instruction
);
	
	reg [7:0] mem [15:0];
	initial
	
	
	always @ (Inst_Address)
	begin
		
	end
	
endmodule
