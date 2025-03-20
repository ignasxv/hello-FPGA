library verilog;
use verilog.vl_types.all;
entity addsub is
    port(
        co              : out    vl_logic;
        r3              : out    vl_logic;
        r2              : out    vl_logic;
        r1              : out    vl_logic;
        r0              : out    vl_logic;
        a3              : in     vl_logic;
        a2              : in     vl_logic;
        a1              : in     vl_logic;
        a0              : in     vl_logic;
        b3              : in     vl_logic;
        b2              : in     vl_logic;
        b1              : in     vl_logic;
        b0              : in     vl_logic;
        control         : in     vl_logic
    );
end addsub;
