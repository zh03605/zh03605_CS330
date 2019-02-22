vlog TB2.v ALU_64_bit.v

vsim -novopt work.TB2

view wave 

add wave sim:/TB2/*

run 300ns 