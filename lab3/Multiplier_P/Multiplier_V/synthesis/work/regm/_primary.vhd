library verilog;
use verilog.vl_types.all;
entity regm is
    generic(
        Hold            : integer := 0;
        Load            : integer := 1
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
        C0              : in     vl_logic
    );
end regm;
