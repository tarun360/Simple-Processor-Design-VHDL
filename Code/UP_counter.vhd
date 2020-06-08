----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:00:39 06/07/2020 
-- Design Name: 
-- Module Name:    UP_counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE UP_counter_package IS
	COMPONENT UP_counter is
	Port ( Resetn,clk : in  STD_LOGIC;
			COUNT : inout  STD_LOGIC_VECTOR (2 downto 0)
			);
	END COMPONENT UP_counter ;
END UP_counter_package ;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UP_counter is
	Port ( Resetn,clk : in  STD_LOGIC;
			COUNT : inout  STD_LOGIC_VECTOR (2 downto 0)
			);
end UP_counter;

architecture Behavioral of UP_counter is

begin

process (clk,Resetn)

	begin
	
		if (Resetn = '0')then
			COUNT <= "000";
		elsif(rising_edge(CLK)) then
			COUNT <= COUNT+1;
		end if;
		
	end process;

end Behavioral;
