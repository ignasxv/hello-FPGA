library verilog;
use verilog.vl_types.all;
entity DFFRS is
    port(
        set             : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end DFFRS;
