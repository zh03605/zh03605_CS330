library verilog;
use verilog.vl_types.all;
entity registerFile is
    port(
        rs1             : in     vl_logic_vector(4 downto 0);
        rs2             : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        rd              : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(63 downto 0);
        readData1       : out    vl_logic_vector(63 downto 0);
        readData2       : out    vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end registerFile;
