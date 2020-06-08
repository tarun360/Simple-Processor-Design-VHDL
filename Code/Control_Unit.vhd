----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:50 06/07/2020 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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
USE work.PIPO_package.all ;
USE work.UP_counter_package.all ;
USE work.ALU_package.all ;

entity Control_Unit is
	Port (
   A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
	ALU_Sel  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 1 input 4-bit for selecting function
   ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0); -- 1 output 8-bit     
	Resetn,clk,E : in std_logic; -- E is enable for registers storing A and B
	Carryout : out std_logic ;
	COUNT: inout STD_LOGIC_VECTOR(2 downto 0)
   );
end Control_Unit;


architecture Structure of Control_Unit is

	signal A_stored: std_logic_vector (7 downto 0);
	signal B_stored: std_logic_vector (7 downto 0);
 
begin
	
	stage0: UP_counter PORT MAP (Resetn,clk,COUNT);
	stage1: PIPO PORT MAP (Resetn,clk,E,A,A_stored); --storing value of A in A_stored
	stage2: PIPO PORT MAP (Resetn,clk,E,B,B_stored); --storing value of B in B_stored
	stage3: ALU PORT MAP (A_stored,B_stored,ALU_Sel,ALU_Out,Carryout);
end Structure;
