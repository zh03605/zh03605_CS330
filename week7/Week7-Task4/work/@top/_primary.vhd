library verilog;
use verilog.vl_types.all;
entity Top is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        ReadData1       : out    vl_logic_vector(63 downto 0);
        ReadData2       : out    vl_logic_vector(63 downto 0)
    );
end Top;
