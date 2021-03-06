module RCC
(
	input clk, reset,
	output [4:0] q
);

  //instantiate TFF
  TFF tff0
  (
     .c(clk),
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
  TFF tff4
  (
     .c(q[3]),
     .r(reset),
     .q(q[4])
  );
endmodule