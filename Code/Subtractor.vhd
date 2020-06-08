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

entity Subtractor is
	port( X: in STD_LOGIC_VECTOR (7 downto 0);
			Y: in STD_LOGIC_VECTOR (7 downto 0);
			Diff: out STD_LOGIC_VECTOR (7 downto 0);
			Borrow: out STD_LOGIC);
end Subtractor;

architecture Behavioral of Subtractor is
	component Sub is
		PORT(a, b, c: IN STD_LOGIC;
			dif, bor: OUT STD_LOGIC);
	end component;
	signal b0: STD_LOGIC;
	signal b1: STD_LOGIC;
	signal b2: STD_LOGIC;
	signal b3: STD_LOGIC;
	signal b4: STD_LOGIC;
	signal b5: STD_LOGIC;
	signal b6: STD_LOGIC;
	signal b7: STD_LOGIC;
begin
	u0: Sub port map(X(0), Y(0), '0', Diff(0), b0);
	u1: Sub port map(X(1), Y(1), b0, Diff(1), b1);
	u2: Sub port map(X(2), Y(2), b1, Diff(2), b2);
	u3: Sub port map(X(3), Y(3), b2, Diff(3), b3);
	u4: Sub port map(X(4), Y(4), b3, Diff(4), b4);
	u5: Sub port map(X(5), Y(5), b4, Diff(5), b5);
	u6: Sub port map(X(6), Y(6), b5, Diff(6), b6);
	u7: Sub port map(X(7), Y(7), b6, Diff(7), b7);
	borrow <= b7;
  
end Behavioral;
