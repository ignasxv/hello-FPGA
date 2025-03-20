library verilog;
use verilog.vl_types.all;
entity multiplier is
    port(
        Product         : out    vl_logic_vector(7 downto 0);
        Multiplicand    : in     vl_logic_vector(3 downto 0);
        Multiplier      : in     vl_logic_vector(3 downto 0);
        Start           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Done            : out    vl_logic
    );
end multiplier;
