library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shifter is 
generic (N: integer := 16 );
port (
shift_in : in std_logic_vector ( 15 downto 0); 
shift_ctrl : in std_logic_vector ( 3 downto 0);
shift_out : out std_logic_vector ( 15 downto 0) 
); 
end shifter ;

architecture behavior of shifter is 
process (shift_in , shift_ctrl) 
begin
case (shift_ctrl ) is 
 when “0000“   => shiftout <= shift_in ( 7 downto 0) & shift_in ( 15 downto 8); -- & is for concat 
when “0001“     => shiftout <= shift_in ( 3 downto 0) & shift_in ( 15 downto 4);
when “0010”   => shiftout <= shift_in ( 1 downto 0) & shift_in ( 15 downto 2);
when “0011” => shiftout <= shift_in ( 5 downto 0) &  shift_in ( 15 downto 6);
when others =>     shiftout <= shift_in ( 5 downto 0) &  shift_in ( 15 downto 6);
end case; 
end behavior ; 
