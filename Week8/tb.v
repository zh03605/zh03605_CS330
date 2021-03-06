module tb
  (
  );
  reg clk, reset;
  wire [31:0] inst;
  Instruction_Fetch IF
  (
  .clk(clk),
  .reset(reset),
  .Instruction(inst)
  );
  always 
  begin 
    #10 clk = ~clk;
  end 
 

  initial 
  begin
  clk = 1'b0;
  reset = 1;
  #15 reset = 0;
  end
  
  
  endmodule