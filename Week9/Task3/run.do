vlog Control_Unit.v ALU_Control.v top_control.v tb.v
vsim -novopt work.tb
add wave sim:/tb/*
run 100ns