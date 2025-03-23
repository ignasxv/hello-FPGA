library verilog;
use verilog.vl_types.all;
entity mux21_ni is
    port(
        Y               : out    vl_logic;
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        S0              : in     vl_logic
    );
end mux21_ni;
