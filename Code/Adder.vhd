----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:52 06/08/2020 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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

entity Adder is
	port( X: in STD_LOGIC_VECTOR (7 downto 0);
			Y: in STD_LOGIC_VECTOR (7 downto 0);
			S: out STD_LOGIC_VECTOR (7 downto 0);
			carry: out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is
	component FA is
		PORT(Cin, x, y: IN STD_LOGIC;
			s, Cout : OUT STD_LOGIC);
	end component;
	signal c0: STD_LOGIC;
	signal c1: STD_LOGIC;
	signal c2: STD_LOGIC;
	signal c3: STD_LOGIC;
	signal c4: STD_LOGIC;
	signal c5: STD_LOGIC;
	signal c6: STD_LOGIC;
	signal c7: STD_LOGIC;
begin
	u0: FA port map('0', X(0), Y(0), S(0), c0);
	u1: FA port map(c0, X(1), Y(1), S(1), c1);
	u2: FA port map(c1, X(2), Y(2), S(2), c2);
	u3: FA port map(c2, X(3), Y(3), S(3), c3);
	u4: FA port map(c3, X(4), Y(4), S(4), c4);
	u5: FA port map(c4, X(5), Y(5), S(5), c5);
	u6: FA port map(c5, X(6), Y(6), S(6), c6);
	u7: FA port map(c6, X(7), Y(7), S(7), c7);
	carry <= c7;
  
end Behavioral;
