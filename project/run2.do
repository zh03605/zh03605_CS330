vlog Program_Counter.v Mux.v mux3.v IF_ID.v MEM_WB.v EX_MEM.v ID_EX.v Forwarding_Unit.v Instruction_Memory.v InstructionParser.v IDE.v Control_Unit.v top_control.v ALU_Control.v registerFile.v ALU_64_bit.v Data_memory.v tb.v RISC_V_Processor.v Adder.v
vsim -novopt work.tb
do wave.do
run 60ns