vlog Instruction_Memory.v tb.v

vsim -novopt work.tb

add wave sim:/tb/*

run 200 ns
