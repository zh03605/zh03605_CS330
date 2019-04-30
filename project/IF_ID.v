module IF_ID
  (
    input [63:0] PC_Out1,
    input [31:0] Instruction1,
    input clk,
    input reset,
    output reg [63:0] PC_Out2,
    output reg [31:0] Instruction2
  );
  
  always @ (reset)
  begin 
    if (reset)
      begin 
        PC_Out2 <= 64'b0;
        Instruction2 = 32'b0;
        end
  end
  always @ (posedge clk)
  begin
  if (! reset)
  begin 
    PC_Out2 <= PC_Out1;
    Instruction2 <= Instruction1;
end  
  end
  
endmodule 

  