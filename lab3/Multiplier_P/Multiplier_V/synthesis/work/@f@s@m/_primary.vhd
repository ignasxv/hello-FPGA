library verilog;
use verilog.vl_types.all;
entity FSM is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2;
        s3              : integer := 3;
        s4              : integer := 4;
        LOAD            : integer := 0;
        RESETCTRL       : integer := 1;
        SHIFT           : integer := 2;
        HOLD            : integer := 3;
        Add             : integer := 0;
        Sub             : integer := 1;
        LD              : integer := 1;
        HD              : integer := 0
    );
    port(
        LM              : out    vl_logic;
        LA0             : out    vl_logic;
        LA1             : out    vl_logic;
        LQ0             : out    vl_logic;
        LQ1             : out    vl_logic;
        AS              : out    vl_logic;
        done            : out    vl_logic;
        clock           : in     vl_logic;
        Qm1             : in     vl_logic;
        Q0              : in     vl_logic;
        start           : in     vl_logic;
        reset           : in     vl_logic
    );
end FSM;
