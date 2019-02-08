module TFF
(
  input c, r,
  output q
);
  wire d;
  
  //instantiate DFF
  DFF dff0
  (
    .c(c),
    .r(r),
    .q(q),
    .d(d)
  );
  not n1(d,q);
endmodule

  