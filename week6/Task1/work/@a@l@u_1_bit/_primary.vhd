library verilog;
use verilog.vl_types.all;
entity ALU_1_bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        CarryIn         : in     vl_logic;
        ALUOp           : in     vl_logic_vector(3 downto 0);
        Result          : out    vl_logic;
        CarryOut        : out    vl_logic
    );
end ALU_1_bit;
