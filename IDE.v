module IDE
  (
  input [31:0] instruction,
  output reg [63:0] immData
  );
  always @ (instruction)
  begin
  if (instruction[6] == 1)
    immData[11:0] <= {instruction[31] , instruction[7] , instruction[30:25] , instruction[11:8]};
    
  if(instruction[5] == 1)
    immData[11:0] <= {instruction[31:25] , instruction[11:7]};
    
  else
    immData[11:0] <= instruction[31:20];
  if (instruction[31] == 0)
    immData[63:12] <= {52{1'b0}};
  else
    immData[63:12] <= {52{1'b1}};
  end
  
endmodule
