library verilog;
use verilog.vl_types.all;
entity rega is
    generic(
        LOAD            : integer := 0;
        RST             : integer := 1;
        SHIFT           : integer := 2;
        HOLD            : integer := 3
    );
    port(
        Q3              : out    vl_logic;
        Q2              : out    vl_logic;
        Q1              : out    vl_logic;
        Q0              : out    vl_logic;
        D3              : in     vl_logic;
        D2              : in     vl_logic;
        D1              : in     vl_logic;
        D0              : in     vl_logic;
        clock           : in     vl_logic;
        C1              : in     vl_logic;
        C0              : in     vl_logic
    );
end rega;
