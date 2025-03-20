library verilog;
use verilog.vl_types.all;
entity dff is
    port(
        Q               : out    vl_logic;
        QB              : out    vl_logic;
        D               : in     vl_logic;
        CLK             : in     vl_logic
    );
end dff;
