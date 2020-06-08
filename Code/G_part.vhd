--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:39:53 06/08/2020
-- Design Name:   
-- Module Name:   /home/tarun360/Documents/Xilinx_Files/ProcessorDesignProject/G_part.vhd
-- Project Name:  ProcessorDesignProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control_Unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY G_part IS
END G_part;
 
ARCHITECTURE behavior OF G_part IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Unit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         ALU_Sel : IN  std_logic_vector(2 downto 0);
         ALU_Out : OUT  std_logic_vector(7 downto 0);
         Resetn : IN  std_logic;
         clk : IN  std_logic;
         E : IN  std_logic;
         Carryout : OUT  std_logic;
         COUNT : INOUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(2 downto 0) := (others => '0');
   signal Resetn : std_logic := '0';
   signal clk : std_logic := '0';
   signal E : std_logic := '0';

	--BiDirs
   signal COUNT : std_logic_vector(2 downto 0);

 	--Outputs
   signal ALU_Out : std_logic_vector(7 downto 0);
   signal Carryout : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unit PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Resetn => Resetn,
          clk => clk,
          E => E,
          Carryout => Carryout,
          COUNT => COUNT
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
	
   input_proc: process
	begin

		--  INPUTS A AND B ARE AVAILABLE FOR ONLY 1st CLOCK-CYCLE, THEY ARE STORED IN LATCHES. AFTER 1st CLOCK-CYCLE, INPUTS ARE MADE 0s
		Resetn <= '0';
		E <= '1'; -- E is enable for registers storing A and B
		A <= "11100010";
		B <= "01001111";
		
		wait for clk_period;
		
		Resetn <= '1';
		E <= '0'; -- E is enable for registers storing A and B
		--  INPUTS A AND B ARE UN-AVAILABLE AFTER 1st CLOCK-CYCLE
		A <= "00000000";
		B <= "00000000";
		
		wait;
		
	end process;
	
   stim_proc: process
   begin		
		
		if(COUNT="000") then -- XOR
			ALU_Sel <= "100";
		end if;	
		
		wait for clk_period;
	
   end process;

END;
