module tb 
  ();
  reg [6:0] Opcode;
  reg [3:0] Funct;
  
  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  wire [3:0] Operation;
  
  top_control top
  (
  .Opcode(Opcode),
  .Funct(Funct),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .Operation(Operation)
  );
  
  initial 
  begin
  Opcode <= 7'b0000011;
  Funct <= 4'b0;
  #10 Opcode <= 7'b0100011;
  #10 Opcode <= 7'b1100011;
  #10 Opcode <= 7'b0110011;
  
  #10 Funct <= 4'd8;
  #10 Funct <= 4'd7;
  #10 Funct <= 4'd6;
  
  end
  
  
endmodule