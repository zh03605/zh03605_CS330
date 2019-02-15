module TB2
  (
  );
  reg [31:0] instruction;
  wire [63:0] immData;
  
  IDE iDE1
  (
  .instruction(instruction),
  .immData(immData)
  );
  initial 
  instruction = 32'b00000001010110100000010010110011;
  
  always
  begin
  #50 instruction = 32'b00000001010110100000010010010111;
end
endmodule
