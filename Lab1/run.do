#compiling
vlog lab1.v TB.v TFF.v DFF.v

#no optimization 
vsim -novopt work.TB

view wave 

#add waves 
add wave sim:/TB/clk
add wave sim:/TB/reset
add wave sim:/TB/q

run 1000ns 