

vlog tb.v Mux.v

vsim -novopt work.TB

view wave 

add wave sim:/TB/sel
add wave sim:/TB/a
add wave sim:/TB/b
add wave sim:/TB/out 

run 100ns 

