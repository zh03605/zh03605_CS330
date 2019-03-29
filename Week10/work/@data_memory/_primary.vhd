library verilog;
use verilog.vl_types.all;
entity Data_memory is
    port(
        clk             : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        Mem_Add         : in     vl_logic_vector(63 downto 0);
        Write_Data      : in     vl_logic_vector(63 downto 0);
        Read_Data       : out    vl_logic_vector(63 downto 0)
    );
end Data_memory;
