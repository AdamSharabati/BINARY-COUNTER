library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity B_COUNTER is 
	port(clk: in std_logic;
		rst: in std_logic;
		Din: in std_logic;
		shift: in std_logic;
		Qout: out std_logic_vector(7 downto 0)
	);
end entity B_COUNTER;

architecture B_C of B_COUNTER is
	begin
	
	process(clk,rst)
		
		variable Qv: std_logic_vector(7 downto 0) := "00000000";
		begin
			if rst = '0' then
				Qv := "00000000";
				
			elsif rising_edge(clk) then
				if shift = '1' then
					Qv := Qv(6 downto 0) & Din;
				
				elsif shift = '0' then
					Qv := Qv + "1";
				
				end if;
		end if;
	
			
			Qout <= Qv;
			
		end process;
end architecture B_C;
			
