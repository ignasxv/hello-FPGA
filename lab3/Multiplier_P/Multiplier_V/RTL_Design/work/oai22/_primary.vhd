library verilog;
use verilog.vl_types.all;
entity oai22 is
    port(
        Y               : out    vl_logic;
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        B0              : in     vl_logic;
        B1              : in     vl_logic
    );
end oai22;
