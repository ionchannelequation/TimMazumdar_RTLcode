entity ring_counter_vhd is 
port (
		data_out : out unisgned ( 3 downto 0);
		i_rst : in std_logic ;
		i_clk : in std_logic; 
);
end ring_counter;
architecture behavior of ring_counter is 
signal 	temp (3 downto 0)					; ----
signal 						; ----
begin
			data_out <= temp;
process (i_clk)
	begin 
		if (rising)_edge(i_clk) then 
			-- use the synchronous reset 
			if ( i_rst = '1') then 
				temp <= ( 0=>'1', oithers => '0'); -- concat is simple bracket and 
									--  only bit(0) = 1 
			else 
				temp(1)	<=	temp(0);
				temp(2)	<=	temp(1);
				temp(3) 	<= 	temp(2);
				temp(0)	<=	temp(3); 	-- loopback 
-- Complete RTL code for Ring counter
			end if ;
	end if ;
end process ;
end behave; 
