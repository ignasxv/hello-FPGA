library verilog;
use verilog.vl_types.all;
entity xnor2 is
    port(
        Y               : out    vl_logic;
        A0              : in     vl_logic;
        A1              : in     vl_logic
    );
end xnor2;
