
-- 
-- Definition of  multiplier
-- 
--      Thu Mar 20 12:09:36 2025
--      
--      LeonardoSpectrum Level 3, 2009a.6
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dffr is
   port (
      Q : OUT std_logic ;
      QB : OUT std_logic ;
      D : IN std_logic ;
      CLK : IN std_logic ;
      R : IN std_logic) ;
end dffr ;

architecture NETLIST of dffr is
   procedure DFFPC (
      constant data   : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (clk'event and clk'last_value = '0' and clk = '1') then
           q <= data and data ;    -- takes care of q<='X' if data='Z'
       end if ;
       if ((clear/='1' or preset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFPC ;
   signal \[876_\, nx2: std_logic ;

begin
   Q <= \[876_\ ;
   DFFPC (D,nx2,R,CLK,\[876_\) ;
   nx2 <= '0' ;
   QB <= NOT \[876_\ ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor04 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic ;
      A3 : IN std_logic) ;
end nor04 ;

architecture NETLIST of nor04 is
   signal NOT_A0, NOT_A1, nx4, NOT_A2, nx8, NOT_A3: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_A2 <= NOT A2 ;
   nx8 <= nx4 AND NOT_A2 ;
   NOT_A3 <= NOT A3 ;
   Y <= nx8 AND NOT_A3 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand03 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic) ;
end nand03 ;

architecture NETLIST of nand03 is
   signal NOT_A2, NOT_A1, nx4, NOT_A0: std_logic ;

begin
   NOT_A2 <= NOT A2 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A2 OR NOT_A1 ;
   NOT_A0 <= NOT A0 ;
   Y <= nx4 OR NOT_A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ao21 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic) ;
end ao21 ;

architecture NETLIST of ao21 is
   signal nx0: std_logic ;

begin
   nx0 <= A0 AND A1 ;
   Y <= nx0 OR B0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xnor2 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end xnor2 ;

architecture NETLIST of xnor2 is
begin
   Y <= NOT (A0 XOR A1) ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dff is
   port (
      Q : OUT std_logic ;
      QB : OUT std_logic ;
      D : IN std_logic ;
      CLK : IN std_logic) ;
end dff ;

architecture NETLIST of dff is
   procedure DFFPC (
      constant data   : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (clk'event and clk'last_value = '0' and clk = '1') then
           q <= data and data ;    -- takes care of q<='X' if data='Z'
       end if ;
       if ((clear/='1' or preset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFPC ;
   signal \[869_\, nx2, nx4: std_logic ;

begin
   Q <= \[869_\ ;
   DFFPC (D,nx4,nx2,CLK,\[869_\) ;
   nx2 <= '0' ;
   nx4 <= '0' ;
   QB <= NOT \[869_\ ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux21_ni is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      S0 : IN std_logic) ;
end mux21_ni ;

architecture NETLIST of mux21_ni is
   signal NOT_S0, nx2, nx4: std_logic ;

begin
   NOT_S0 <= NOT S0 ;
   nx2 <= A0 AND NOT_S0 ;
   nx4 <= A1 AND S0 ;
   Y <= nx2 OR nx4 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ao22 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic ;
      B1 : IN std_logic) ;
end ao22 ;

architecture NETLIST of ao22 is
   signal nx0, nx2: std_logic ;

begin
   nx0 <= B0 AND B1 ;
   nx2 <= A0 AND A1 ;
   Y <= nx0 OR nx2 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xor2 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end xor2 ;

architecture NETLIST of xor2 is
begin
   Y <= A0 XOR A1 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand02_2x is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end nand02_2x ;

architecture NETLIST of nand02_2x is
   signal NOT_A1, NOT_A0: std_logic ;

begin
   NOT_A1 <= NOT A1 ;
   NOT_A0 <= NOT A0 ;
   Y <= NOT_A1 OR NOT_A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand04 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic ;
      A3 : IN std_logic) ;
end nand04 ;

architecture NETLIST of nand04 is
   signal NOT_A3, NOT_A2, nx4, NOT_A1, nx8, NOT_A0: std_logic ;

begin
   NOT_A3 <= NOT A3 ;
   NOT_A2 <= NOT A2 ;
   nx4 <= NOT_A3 OR NOT_A2 ;
   NOT_A1 <= NOT A1 ;
   nx8 <= nx4 OR NOT_A1 ;
   NOT_A0 <= NOT A0 ;
   Y <= nx8 OR NOT_A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor03 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic) ;
end nor03 ;

architecture NETLIST of nor03 is
   signal NOT_A0, NOT_A1, nx4, NOT_A2: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_A2 <= NOT A2 ;
   Y <= nx4 AND NOT_A2 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity oai21 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic) ;
end oai21 ;

architecture NETLIST of oai21 is
   signal NOT_A0, NOT_A1, nx4, NOT_B0: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_B0 <= NOT B0 ;
   Y <= nx4 OR NOT_B0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor02_2x is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end nor02_2x ;

architecture NETLIST of nor02_2x is
   signal NOT_A0, NOT_A1: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   Y <= NOT_A0 AND NOT_A1 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity aoi22 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic ;
      B1 : IN std_logic) ;
end aoi22 ;

architecture NETLIST of aoi22 is
   signal NOT_A1, NOT_B1, nx4, NOT_A0, nx8, nx10, NOT_B0, nx14, nx16, nx18: 
   std_logic ;

begin
   NOT_A1 <= NOT A1 ;
   NOT_B1 <= NOT B1 ;
   nx4 <= NOT_A1 AND NOT_B1 ;
   NOT_A0 <= NOT A0 ;
   nx8 <= NOT_A0 AND NOT_B1 ;
   nx10 <= nx4 OR nx8 ;
   NOT_B0 <= NOT B0 ;
   nx14 <= NOT_A1 AND NOT_B0 ;
   nx16 <= nx10 OR nx14 ;
   nx18 <= NOT_A0 AND NOT_B0 ;
   Y <= nx16 OR nx18 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv02 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end inv02 ;

architecture NETLIST of inv02 is
begin
   Y <= NOT A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity buf02 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end buf02 ;

architecture NETLIST of buf02 is
begin
   Y <= A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor02ii is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end nor02ii ;

architecture NETLIST of nor02ii is
   signal NOT_A0: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   Y <= NOT_A0 AND A1 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and04 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic ;
      A3 : IN std_logic) ;
end and04 ;

architecture NETLIST of and04 is
   signal nx0, nx2: std_logic ;

begin
   nx0 <= A0 AND A1 ;
   nx2 <= nx0 AND A2 ;
   Y <= nx2 AND A3 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor03_2x is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic) ;
end nor03_2x ;

architecture NETLIST of nor03_2x is
   signal NOT_A0, NOT_A1, nx4, NOT_A2: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_A2 <= NOT A2 ;
   Y <= nx4 AND NOT_A2 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or04 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic ;
      A3 : IN std_logic) ;
end or04 ;

architecture NETLIST of or04 is
   signal nx0, nx2: std_logic ;

begin
   nx0 <= A3 OR A2 ;
   nx2 <= nx0 OR A1 ;
   Y <= nx2 OR A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or03 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic) ;
end or03 ;

architecture NETLIST of or03 is
   signal nx0: std_logic ;

begin
   nx0 <= A2 OR A1 ;
   Y <= nx0 OR A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity multiplier is
   port (
      Product : OUT std_logic_vector (7 DOWNTO 0) ;
      Multiplicand : IN std_logic_vector (3 DOWNTO 0) ;
      Multiplier : IN std_logic_vector (3 DOWNTO 0) ;
      Start : IN std_logic ;
      Reset : IN std_logic ;
      Clock : IN std_logic ;
      Done : OUT std_logic) ;
end multiplier ;

architecture INTERFACE of multiplier is
   signal Product_7_EXMPLR, Product_6_EXMPLR, Product_5_EXMPLR, 
      Product_4_EXMPLR, Product_3_EXMPLR, Product_2_EXMPLR, Product_1_EXMPLR, 
      Product_0_EXMPLR, controller_ST_0, controller_ST_2, nx217, Qm1, nx10, 
      nx16, nx46, nx64, nx72, M_0, nx84, nx88, nx100, M_1, nx110, nx112, M_2, 
      nx136, nx146, nx148, M_3, nx156, nx158, nx176, nx188, nx200, nx210, 
      nx220, nx230, nx240, nx256, nx262, controller_count_1, 
      controller_count_0, nx312, nx330, nx346, nx231, nx241, nx251, nx261, 
      nx269, nx271, nx281, nx291, nx301, nx311, nx321, nx331, nx341, nx349, 
      nx351, nx359, nx361, nx369, nx371, nx386, nx390, nx393, nx397, nx399, 
      nx401, nx412, nx416, nx418, nx420, nx424, nx428, nx448, nx450, nx463, 
      nx465, nx467, nx471, nx474, nx480, nx482, nx490, nx502, nx511, nx519, 
      nx527, nx535, nx593, nx595, nx597, nx599: std_logic ;

begin
   Product(7) <= Product_7_EXMPLR ;
   Product(6) <= Product_6_EXMPLR ;
   Product(5) <= Product_5_EXMPLR ;
   Product(4) <= Product_4_EXMPLR ;
   Product(3) <= Product_3_EXMPLR ;
   Product(2) <= Product_2_EXMPLR ;
   Product(1) <= Product_1_EXMPLR ;
   Product(0) <= Product_0_EXMPLR ;
   controller_reg_done : dffr port map ( Q=>Done, QB=>OPEN, D=>nx346, CLK=>
      Clock, R=>Reset);
   ix347 : nor04 port map ( Y=>nx346, A0=>nx330, A1=>nx418, A2=>nx511, A3=>
      nx312);
   ix263 : nor04 port map ( Y=>nx262, A0=>nx599, A1=>controller_ST_2, A2=>
      nx390, A3=>nx256);
   controller_reg_ST_1 : dffr port map ( Q=>OPEN, QB=>nx386, D=>nx262, CLK=>
      Clock, R=>Reset);
   ix313 : nand03 port map ( Y=>nx312, A0=>nx393, A1=>nx416, A2=>nx448);
   ix394 : ao21 port map ( Y=>nx393, A0=>controller_count_0, A1=>
      controller_count_1, B0=>nx16);
   reg_controller_count_0 : dffr port map ( Q=>controller_count_0, QB=>OPEN, 
      D=>nx361, CLK=>Clock, R=>Reset);
   ix362 : ao21 port map ( Y=>nx361, A0=>controller_count_0, A1=>nx397, B0=>
      nx359);
   controller_reg_ST_2 : dffr port map ( Q=>controller_ST_2, QB=>nx401, D=>
      nx217, CLK=>Clock, R=>Reset);
   controller_reg_ST_0 : dffr port map ( Q=>controller_ST_0, QB=>nx390, D=>
      nx312, CLK=>Clock, R=>Reset);
   ix360 : nor04 port map ( Y=>nx359, A0=>controller_count_0, A1=>nx599, A2
      =>nx401, A3=>controller_ST_0);
   reg_controller_count_1 : dffr port map ( Q=>controller_count_1, QB=>OPEN, 
      D=>nx371, CLK=>Clock, R=>Reset);
   ix372 : ao21 port map ( Y=>nx371, A0=>controller_count_1, A1=>nx397, B0=>
      nx369);
   ix370 : nor04 port map ( Y=>nx369, A0=>nx599, A1=>nx401, A2=>
      controller_ST_0, A3=>nx412);
   ix413 : xnor2 port map ( Y=>nx412, A0=>controller_count_1, A1=>
      controller_count_0);
   ix417 : nand03 port map ( Y=>nx416, A0=>nx418, A1=>nx420, A2=>
      Product_0_EXMPLR);
   ix352 : ao21 port map ( Y=>nx351, A0=>Qm1, A1=>nx424, B0=>nx349);
   Q_reg_reg_Qm1 : dff port map ( Q=>Qm1, QB=>nx420, D=>nx351, CLK=>Clock);
   Q_reg_reg_Q0 : dff port map ( Q=>Product_0_EXMPLR, QB=>nx428, D=>nx341, 
      CLK=>Clock);
   ix241 : mux21_ni port map ( Y=>nx240, A0=>Multiplier(0), A1=>
      Product_1_EXMPLR, S0=>nx10);
   Q_reg_reg_Q1 : dff port map ( Q=>Product_1_EXMPLR, QB=>OPEN, D=>nx331, 
      CLK=>Clock);
   ix231 : mux21_ni port map ( Y=>nx230, A0=>Multiplier(1), A1=>
      Product_2_EXMPLR, S0=>nx10);
   Q_reg_reg_Q2 : dff port map ( Q=>Product_2_EXMPLR, QB=>OPEN, D=>nx321, 
      CLK=>Clock);
   ix221 : mux21_ni port map ( Y=>nx220, A0=>Multiplier(2), A1=>
      Product_3_EXMPLR, S0=>nx10);
   Q_reg_reg_Q3 : dff port map ( Q=>Product_3_EXMPLR, QB=>OPEN, D=>nx311, 
      CLK=>Clock);
   ix211 : mux21_ni port map ( Y=>nx210, A0=>Multiplier(3), A1=>
      Product_4_EXMPLR, S0=>nx10);
   A_reg_reg_Q0 : dff port map ( Q=>Product_4_EXMPLR, QB=>OPEN, D=>nx301, 
      CLK=>Clock);
   ix302 : mux21_ni port map ( Y=>nx301, A0=>Product_4_EXMPLR, A1=>nx200, S0
      =>nx64);
   ix201 : ao22 port map ( Y=>nx200, A0=>nx84, A1=>nx527, B0=>
      Product_5_EXMPLR, B1=>nx463);
   ix85 : xor2 port map ( Y=>nx84, A0=>Product_4_EXMPLR, A1=>M_0);
   M_reg_reg_Q0 : dff port map ( Q=>M_0, QB=>OPEN, D=>nx231, CLK=>Clock);
   ix232 : mux21_ni port map ( Y=>nx231, A0=>Multiplicand(0), A1=>M_0, S0=>
      nx448);
   ix449 : nand02_2x port map ( Y=>nx448, A0=>Start, A1=>nx450);
   A_reg_reg_Q1 : dff port map ( Q=>Product_5_EXMPLR, QB=>OPEN, D=>nx291, 
      CLK=>Clock);
   ix292 : mux21_ni port map ( Y=>nx291, A0=>Product_5_EXMPLR, A1=>nx188, S0
      =>nx64);
   ix189 : ao22 port map ( Y=>nx188, A0=>Product_6_EXMPLR, A1=>nx463, B0=>
      nx112, B1=>nx527);
   A_reg_reg_Q2 : dff port map ( Q=>Product_6_EXMPLR, QB=>OPEN, D=>nx281, 
      CLK=>Clock);
   ix282 : mux21_ni port map ( Y=>nx281, A0=>Product_6_EXMPLR, A1=>nx176, S0
      =>nx64);
   ix177 : ao22 port map ( Y=>nx176, A0=>Product_7_EXMPLR, A1=>nx463, B0=>
      nx136, B1=>nx527);
   A_reg_reg_Q3 : dff port map ( Q=>Product_7_EXMPLR, QB=>OPEN, D=>nx271, 
      CLK=>Clock);
   ix272 : ao21 port map ( Y=>nx271, A0=>Product_7_EXMPLR, A1=>nx463, B0=>
      nx269);
   ix464 : nand04 port map ( Y=>nx463, A0=>nx465, A1=>nx467, A2=>nx535, A3=>
      nx401);
   ix466 : nand02_2x port map ( Y=>nx465, A0=>nx418, A1=>nx256);
   ix270 : nor03 port map ( Y=>nx269, A0=>nx46, A1=>nx471, A2=>nx463);
   ix47 : oai21 port map ( Y=>nx46, A0=>nx399, A1=>nx418, B0=>nx465);
   ix472 : xnor2 port map ( Y=>nx471, A0=>nx148, A1=>nx158);
   ix149 : ao21 port map ( Y=>nx148, A0=>nx474, A1=>Product_6_EXMPLR, B0=>
      nx146);
   ix475 : xnor2 port map ( Y=>nx474, A0=>M_2, A1=>nx416);
   M_reg_reg_Q2 : dff port map ( Q=>M_2, QB=>OPEN, D=>nx251, CLK=>Clock);
   ix252 : mux21_ni port map ( Y=>nx251, A0=>Multiplicand(2), A1=>M_2, S0=>
      nx448);
   ix147 : nor02_2x port map ( Y=>nx146, A0=>nx480, A1=>nx490);
   ix481 : aoi22 port map ( Y=>nx480, A0=>nx482, A1=>Product_5_EXMPLR, B0=>
      nx100, B1=>nx110);
   ix483 : xnor2 port map ( Y=>nx482, A0=>M_1, A1=>nx416);
   M_reg_reg_Q1 : dff port map ( Q=>M_1, QB=>OPEN, D=>nx241, CLK=>Clock);
   ix242 : mux21_ni port map ( Y=>nx241, A0=>Multiplicand(1), A1=>M_1, S0=>
      nx448);
   ix101 : mux21_ni port map ( Y=>nx100, A0=>nx72, A1=>Product_4_EXMPLR, S0
      =>M_0);
   ix491 : xnor2 port map ( Y=>nx490, A0=>Product_6_EXMPLR, A1=>nx474);
   ix159 : xnor2 port map ( Y=>nx158, A0=>Product_7_EXMPLR, A1=>nx156);
   M_reg_reg_Q3 : dff port map ( Q=>M_3, QB=>OPEN, D=>nx261, CLK=>Clock);
   ix262 : mux21_ni port map ( Y=>nx261, A0=>Multiplicand(3), A1=>M_3, S0=>
      nx448);
   ix137 : xor2 port map ( Y=>nx136, A0=>nx480, A1=>nx490);
   ix65 : nand02_2x port map ( Y=>nx64, A0=>nx463, A1=>nx46);
   ix113 : xnor2 port map ( Y=>nx112, A0=>nx100, A1=>nx502);
   ix503 : xnor2 port map ( Y=>nx502, A0=>Product_5_EXMPLR, A1=>nx482);
   ix11 : nand02_2x port map ( Y=>nx10, A0=>Start, A1=>nx450);
   ix512 : nand02_2x port map ( Y=>nx511, A0=>controller_count_1, A1=>
      controller_count_0);
   ix111 : inv02 port map ( Y=>nx110, A=>nx502);
   ix73 : inv02 port map ( Y=>nx72, A=>nx416);
   ix17 : inv02 port map ( Y=>nx16, A=>nx399);
   ix518 : inv02 port map ( Y=>nx519, A=>nx386);
   ix526 : buf02 port map ( Y=>nx527, A=>nx88);
   ix398 : nor02ii port map ( Y=>nx397, A0=>nx399, A1=>nx448);
   ix342 : mux21_ni port map ( Y=>nx341, A0=>nx240, A1=>Product_0_EXMPLR, S0
      =>nx424);
   ix332 : mux21_ni port map ( Y=>nx331, A0=>nx230, A1=>Product_1_EXMPLR, S0
      =>nx424);
   ix322 : mux21_ni port map ( Y=>nx321, A0=>nx220, A1=>Product_2_EXMPLR, S0
      =>nx424);
   ix312 : mux21_ni port map ( Y=>nx311, A0=>nx210, A1=>Product_3_EXMPLR, S0
      =>nx424);
   ix157 : xor2 port map ( Y=>nx156, A0=>M_3, A1=>nx416);
   ix534 : inv02 port map ( Y=>nx535, A=>nx599);
   ix333 : ao21 port map ( Y=>nx217, A0=>nx401, A1=>nx599, B0=>nx593);
   ix592 : inv02 port map ( Y=>nx593, A=>nx465);
   ix89 : and04 port map ( Y=>nx88, A0=>nx535, A1=>nx401, A2=>
      controller_ST_0, A3=>nx595);
   ix594 : inv02 port map ( Y=>nx595, A=>nx256);
   ix331 : nor02ii port map ( Y=>nx330, A0=>controller_ST_2, A1=>nx599);
   ix400 : nor03_2x port map ( Y=>nx399, A0=>nx519, A1=>nx401, A2=>
      controller_ST_0);
   ix419 : nor03_2x port map ( Y=>nx418, A0=>nx519, A1=>controller_ST_2, A2
      =>nx390);
   ix9 : or04 port map ( Y=>nx467, A0=>Start, A1=>nx599, A2=>controller_ST_2, 
      A3=>controller_ST_0);
   ix350 : nor04 port map ( Y=>nx349, A0=>nx428, A1=>nx519, A2=>nx401, A3=>
      controller_ST_0);
   ix451 : nor03_2x port map ( Y=>nx450, A0=>nx519, A1=>controller_ST_2, A2
      =>controller_ST_0);
   ix257 : xnor2 port map ( Y=>nx256, A0=>Qm1, A1=>Product_0_EXMPLR);
   ix27 : or03 port map ( Y=>nx424, A0=>nx597, A1=>nx519, A2=>
      controller_ST_0);
   ix596 : inv02 port map ( Y=>nx597, A=>nx467);
   ix598 : inv02 port map ( Y=>nx599, A=>nx386);
end INTERFACE ;

