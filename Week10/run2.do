vlog Program_Counter.v Mux.v Instruction_Memory.v InstructionParser.v IDE.v Control_Unit.v top_control.v ALU_Control.v registerFile.v ALU_64_bit.v Data_memory.v tb.v RISC_V_Processor.v Adder.v
vsim -novopt work.tb
add wave sim:/tb/*
run 200ns