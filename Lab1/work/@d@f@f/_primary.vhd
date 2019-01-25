library verilog;
use verilog.vl_types.all;
entity DFF is
    port(
        c               : in     vl_logic;
        r               : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end DFF;
