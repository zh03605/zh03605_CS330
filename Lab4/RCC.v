module RCC
(
	input clk, reset,
	output [3:0] q
);
wire div_clk;
  //instanting clock_divider module
  clock_divider CD0
  (
	.clock_n(clk),
	.reset_p(reset),
	.div_clk(div_clk)
  );
  //instantiate TFF
  TFF tff0
  (
     .c(div_clk),
     .r(reset),
     .q(q[0])
  );
  TFF tff1
  (
     .c(q[0]),
     .r(reset),
     .q(q[1])
  );
  TFF tff2
  (
     .c(q[1]),
     .r(reset),
     .q(q[2])
  );
  TFF tff3
  (
     .c(q[2]),
     .r(reset),
     .q(q[3])
  );
 
endmodule
