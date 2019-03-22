vlog Control_Unit.v tb.v
vsim -novopt work.tb
add wave sim:/tb/*
run 40ns