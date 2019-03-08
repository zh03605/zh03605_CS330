vlog Top.v InstructionParser.v registerFile.v tb3.v
vsim -novopt work.tb3
add wave sim:/tb3/*
run 100ns
