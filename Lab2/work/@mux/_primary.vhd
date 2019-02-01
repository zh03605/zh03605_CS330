library verilog;
use verilog.vl_types.all;
entity Mux is
    port(
        a               : in     vl_logic_vector(63 downto 0);
        b               : in     vl_logic_vector(63 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(63 downto 0)
    );
end Mux;
