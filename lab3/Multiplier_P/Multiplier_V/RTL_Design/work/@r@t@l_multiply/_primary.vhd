library verilog;
use verilog.vl_types.all;
entity RTL_multiply is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        multiplicand    : in     vl_logic_vector(3 downto 0);
        multiplier      : in     vl_logic_vector(3 downto 0);
        product         : out    vl_logic_vector(7 downto 0);
        done            : out    vl_logic
    );
end RTL_multiply;
