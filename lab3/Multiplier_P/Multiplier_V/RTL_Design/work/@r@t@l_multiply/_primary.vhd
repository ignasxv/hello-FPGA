library verilog;
use verilog.vl_types.all;
entity RTL_multiply is
    port(
        multiplicand    : in     vl_logic_vector(3 downto 0);
        multiplier      : in     vl_logic_vector(3 downto 0);
        product         : out    vl_logic_vector(7 downto 0)
    );
end RTL_multiply;
