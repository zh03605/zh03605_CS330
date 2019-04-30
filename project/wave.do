onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /tb/clk
add wave -noupdate -format Logic -radix hexadecimal /tb/reset
add wave -noupdate -format Literal -radix hexadecimal /tb/proc/rf/Registar
add wave -noupdate -format Literal -radix hexadecimal /tb/proc/dm/DataMemory
add wave -noupdate -format Literal /tb/proc/a
add wave -noupdate -format Literal /tb/proc/b
add wave -noupdate -format Literal /tb/proc/pc_plus_4
add wave -noupdate -format Literal /tb/proc/pc_plus_imm
add wave -noupdate -format Literal /tb/proc/PC_In
add wave -noupdate -format Literal /tb/proc/Instruction
add wave -noupdate -format Literal /tb/proc/opcode
add wave -noupdate -format Literal /tb/proc/funct7
add wave -noupdate -format Literal /tb/proc/funct3
add wave -noupdate -format Literal /tb/proc/rd
add wave -noupdate -format Literal /tb/proc/rs1
add wave -noupdate -format Literal /tb/proc/rs2
add wave -noupdate -format Literal /tb/proc/Funct
add wave -noupdate -format Logic /tb/proc/Branch
add wave -noupdate -format Logic /tb/proc/MemRead
add wave -noupdate -format Logic /tb/proc/MemtoReg
add wave -noupdate -format Logic /tb/proc/MemWrite
add wave -noupdate -format Logic /tb/proc/ALUSrc
add wave -noupdate -format Logic /tb/proc/RegWrite
add wave -noupdate -format Literal /tb/proc/Operation
add wave -noupdate -format Literal /tb/proc/readData1
add wave -noupdate -format Literal /tb/proc/readData2
add wave -noupdate -format Literal /tb/proc/writeData
add wave -noupdate -format Literal /tb/proc/mux2_out
add wave -noupdate -format Logic /tb/proc/zero
add wave -noupdate -format Literal /tb/proc/alu_result
add wave -noupdate -format Literal /tb/proc/read
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {16 ns}
