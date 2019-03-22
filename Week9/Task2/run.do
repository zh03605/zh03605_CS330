vlog ALU_Control.v tb.v
vsim -novopt work.tb
add wave sim:/tb/*
run 60ns