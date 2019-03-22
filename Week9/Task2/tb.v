module tb 
  ();
  
  reg [1:0] ALUOp;
  reg [3:0] Funct;
  wire [3:0] Operation;
  
  ALU_Control control
  (
  .ALUOp(ALUOp),
  .Funct(Funct),
  .Operation(Operation)
  );
  initial 
  begin 
    Funct <= 4'b0;
    ALUOp <= 2'b0;
   
  #10 ALUOp <= 2'b1;
  #10 ALUOp <= 2'b10;
  #10 Funct <= 4'd8;
  #10 Funct <= 4'd7;
  #10 Funct <= 4'd6;
  end
endmodule 
