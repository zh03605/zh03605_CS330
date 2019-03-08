#compling desgin modules
vlog Data_Memory.v tb2.v
#no optimization
vsim -novopt work.tb2

#view waves
view wave

#Adding waves
add wave sim:/tb2/*

run 300ns