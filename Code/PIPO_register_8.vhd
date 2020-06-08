----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:29 06/07/2020 
-- Design Name: 
-- Module Name:    PIPO_Register_8 - Behavioral 
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

PACKAGE PIPO_package IS
	COMPONENT PIPO is
	port(
	Resetn,clk,E : in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
	);
	END COMPONENT PIPO ;
END PIPO_package ;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipo is
 port(
 Resetn,clk,E : in std_logic;
 D: in std_logic_vector(7 downto 0);
 Q: out std_logic_vector(7 downto 0)
 );
end pipo;
 
architecture arch of pipo is
 
begin
 
 process (Resetn,clk)
 begin
	
	if (Resetn='0') then
		Q <= "00000000";
	end if;
	
	if (CLK'event and CLK='1') then
		if (E='1') then
			Q <= D;
		end if;
	end if;
 end process;
 
end arch;