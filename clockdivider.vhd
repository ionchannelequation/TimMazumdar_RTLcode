entity clockdivider is 
port (
		i_clk : in std_logic;
		reset : in std_logic;
		clk_out :  out std_logic;
		);
end clockdivider;
architecture behavior of clockdivider is 
	signal divider : std_logic_vector ( 2 downto 0);
	begin 
		process (clk) -- synchronous reset 
		begin
		    if reset = '1' then 
			divider <= "000";
			else 
				divider <= divider + '1';
			end if ;
		end process;
		clk_out <= divider(2);
end behavior;
