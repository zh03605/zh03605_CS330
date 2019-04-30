module Mux 
  (
  input [63:0] a,b,
  input sel,
  output reg [63:0] out
  );
  always @ (sel, a, b)
    begin
      if (sel)
        out <= b;
      else
        out <= a;
    end 
  
endmodule