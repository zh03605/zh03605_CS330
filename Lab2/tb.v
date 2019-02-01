module TB
  (
  );
  reg sel;
  reg [63:0] a;
  reg [63:0] b;
  wire [63:0] out;
  
  Mux mux
  (
  .sel(sel),
  .a(a),
  .b(b),
  .out(out)
  );
  
  initial 
  begin
  sel = 1'b0;
  a = 64'b0;
  b = 64'b1;
  #50 sel = 1'b1;
  end 
endmodule 