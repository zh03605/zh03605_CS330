vlog TB1.v ALU_1_bit.v ALU_6_bit.v

vsim -novopt work.TB1

view wave 

add wave sim:/TB1/*

run 500ns 
