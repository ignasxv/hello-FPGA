library verilog;
use verilog.vl_types.all;
entity nand03 is
    port(
        Y               : out    vl_logic;
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic
    );
end nand03;
