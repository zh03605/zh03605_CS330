module tb
  (
  );
  
  reg clk, reset;
  RISC_V_Processor proc
  (
  .clk(clk),
  .reset(reset)
  );
  
  initial 
  begin
  clk = 0;
  reset = 1;
  #6 reset = 0;

  end 

  always 
    #5 clk = ~clk;
  
 
  
endmodule
