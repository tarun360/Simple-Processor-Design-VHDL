----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:39 06/08/2020 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
	Port( A : in STD_LOGIC_VECTOR (2 downto 0);  -- 3-bit input
			X : out STD_LOGIC_VECTOR (7 downto 0); -- 8-bit output
			EN : in STD_LOGIC);                   -- Enable input
end Decoder;

architecture Behavioral of Decoder is

begin

process(A, EN)

begin
	
	X <= "00000000";
												  --default output value
	if (EN = '1') then                 -- active high enable pin
		case A is
			when "000" => X(0) <= '1';
			when "001" => X(1) <= '1';
			when "010" => X(2) <= '1';
			when "011" => X(3) <= '1';
			when "100" => X(4) <= '1';
			when "101" => X(5) <= '1';
			when "110" => X(6) <= '1';
			when "111" => X(7) <= '1';
			when others => X <= (others => 'X');
		end case;
	end if;
	
end process;

end Behavioral;
