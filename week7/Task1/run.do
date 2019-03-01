vlog registerFile.v TB.v
vsim -novopt work.TB
add wave sim:/TB/*
run 200ns