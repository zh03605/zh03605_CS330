module Program_Counter
  (
  input clk, reset,
  input [63:0] PC_In,
  output reg [63:0] PC_Out
  );
  
  initial
  PC_Out = 64'b0;
  always @ (posedge clk)
  begin
    if (reset)
      PC_Out = 64'b0;
    else
      PC_Out = PC_In;
  end 
  
endmodule 