vlog InstructionParser.v TB.v
vsim -novopt work.TB
view wave
add wave sim:/TB/instruction
add wave sim:/TB/opcode
add wave sim:/TB/rd
add wave sim:/TB/funct3
add wave sim:/TB/rs1
add wave sim:/TB/rs2
add wave sim:/TB/funct7

run 100ns
