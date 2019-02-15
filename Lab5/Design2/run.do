

vlog TB2.v IDE.v

vsim -novopt work.TB2

view wave 

add wave sim:/TB2/instruction
add wave sim:/TB2/immData

run 100ns 

