-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity reg_dff is 
	port ( 
    	din : std_logic_vector ( 15 downto 0)="0000000000000000";
     clk : in std_logic ;
     reset : in std_logic;
     dout : out std_logic_vector ( 15 downto 0);
    );
end reg_dff;

architecture behave of reg_dff is 
begin
		if reset = '1' then 
        dout <= "0000000000000000";
        
        elsif clk'event and clk = '1' then 
        dout <= din ;
        else 
        	null;
            end if;   
			end process;
end behave;

-- top level ALU code with DFF instantiation and ALU instantiation 

entity mux_path is 
port (
in1,in2 : in std_logic_vector (15 downto 0);
sel : in std_logic;
OutTT : out std_logic_vector ( 15 downto 0);
);
end mux_path ;

architecture behave of mux_path is 
begin 
process (In1, In2, sel)
begin
	if sel='1' then outTT <= in1;
    else outt <= in2;
    end if;
end process;
end behave;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
entity DATA_PATH_GENERAL is
   port ( CLK        : in    std_logic;
          CONSTANT_1 : in    std_logic_vector (7 downto 0);
          DATA_INN   : in    std_logic_vector (7 downto 0);
          OP_0       : in    std_logic;
          OP_1       : in    std_logic;
          OP_2       : in    std_logic;
         reset      : in    std_logic;
          SELECTT    : in    std_logic;
          RESULT     : out   std_logic_vector (7 downto 0));
end DATA_PATH_GENERAL;
architecture behaviour  of DATA_PATH_GENERAL is
   signal XLXN_1       : std_logic_vector (7 downto 0);
   signal XLXN_2       : std_logic_vector (7 downto 0);
   signal RESULT_DUMMY : std_logic_vector (7 downto 0);
   component ALU
      port ( ALU2 : in    std_logic;
             ALU1 : in    std_logic;
             ALU0 : in    std_logic;
             A    : in    std_logic_vector (7 downto 0);
             B    : in    std_logic_vector (7 downto 0);
             C    : out   std_logic_vector (7 downto 0));
   end component;
   
   component reg_path 
 
   port (
  	 din : std_logic_vector ( 15 downto 0);
     clk : in std_logic ;
     reset : in std_logic;
     dout : out std_logic_vector ( 15 downto 0);
   
   );
   end component ; 
   component mux_path 
   port (
   sel : in std_logic ;
   IN1  : in    std_logic_vector (15 downto 0);
   IN2  : in    std_logic_vector (15 downto 0);
   OUTT : out   std_logic_vector (15 downto 0));
   );
   end component;
   -- The design is assmebled as a cascade of three blocks 
   -- Mux_path , ALU, REG_path 
   -- format for assmebling compomnent s 
   -- Instance_name : component_name 
   == port_name_component => top_level_wirename 

begin
   RESULT(7 downto 0) <= RESULT_DUMMY(7 downto 0);
   XLXI_1 : ALU
      port map (A(7 downto 0)=>XLXN_1(7 downto 0),
                ALU0=>OP_0,
                ALU1=>OP_1,
                ALU2=>OP_2,
                B(7 downto 0)=>RESULT_DUMMY(15 downto 0),
                C(7 downto 0)=>XLXN_2(7 downto 0));
  
   XLXI_2 : REG_PATH
      port map (CLK=>CLK,
                DIN(15 downto 0)=>XLXN_2(15 downto 0),
                RESETT=> reset,
                DOUT(15 downto 0)=>RESULT_DUMMY(15 downto 0));
  
   XLXI_4 : MUX_PATH
      port map (IN1(7 downto 0)=>DATA_INN(15 downto 0),
                IN2(7 downto 0)=>CONSTANT_1(15 downto 0),
                SEL=>SELECTT,
                OUTT(7 downto 0)=>XLXN_1(15 downto 0));
   end behaviour;
