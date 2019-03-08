vlog Program_Counter.v Adder.v Instruction_Memory.v Instruction_Fetch.v tb.v
vsim -novopt work.tb


add wave sim:/tb/*
run 100ns
