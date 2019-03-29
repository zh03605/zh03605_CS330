library verilog;
use verilog.vl_types.all;
entity IDE is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        immData         : out    vl_logic_vector(63 downto 0)
    );
end IDE;
