library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

PACKAGE ALU_package IS
	COMPONENT ALU is
	Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 1 input 3-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0); -- 1 output 8-bit 
    Carryout : out std_logic        -- Carryout flag
    );
	END COMPONENT ALU ;
END ALU_package ;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
  generic ( 
     constant N: natural := 1  -- number of shited or rotated bits
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 1 input 3-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0); -- 1 output 8-bit 
    Carryout : out std_logic        -- Carryout flag
    );
end ALU; 

architecture Behavioral of ALU is

	component Decoder is
		Port(
			A: in STD_LOGIC_VECTOR (2 downto 0);
			X: out STD_LOGIC_VECTOR (7 downto 0);
			EN: in STD_LOGIC);
	end component;
	
	component Adder is
		port( X: in STD_LOGIC_VECTOR (7 downto 0);
			Y: in STD_LOGIC_VECTOR (7 downto 0);
			S: out STD_LOGIC_VECTOR (7 downto 0);
			carry: out STD_LOGIC);
	end component;

	component Subtractor is
		port( X: in STD_LOGIC_VECTOR (7 downto 0);
				Y: in STD_LOGIC_VECTOR (7 downto 0);
				Diff: out STD_LOGIC_VECTOR (7 downto 0);
				Borrow: out STD_LOGIC);
		end component;
		
signal ALU_Result : std_logic_vector (7 downto 0);
signal tmp: std_logic_vector (8 downto 0);
signal Decoded_Sel : std_logic_vector (7 downto 0);
signal Add_Result: std_logic_vector (7 downto 0);
signal Add_Carry: std_logic;
signal Sub_Result: std_logic_vector (7 downto 0);
signal Sub_Borrow: std_logic;

begin
	u1: Decoder port map(A => ALU_Sel, X => Decoded_Sel, EN => '1');
	u2: Adder port map(A, B, Add_Result, Add_Carry);
	u3: Subtractor port map(A, B, Sub_Result, Sub_Borrow);
   process(A,B,Decoded_Sel, Add_Result, Add_Carry, Sub_Result, Sub_Borrow)
 begin
 Carryout <= '0';
  case(Decoded_Sel) is
  when "00000001" => -- Addition
	ALU_Result <= Add_Result;
	Carryout <= Add_Carry;
  when "00000010" => -- Subtraction
	ALU_Result <= Sub_Result;
	Carryout <= Sub_Borrow;
  when "00000100" => -- Logical and
   ALU_Result <= A and B;
  when "00001000" => -- Logical or
   ALU_Result <= A or B;
  when "00010000" => -- Logical xor
   ALU_Result <= A xor B;
  when "00100000" => -- Logical nand
   ALU_Result <= A nand B;
  when "01000000" => --  Logical not A
   ALU_Result <= not A;
  when "10000000" => -- Logical not B
   ALU_Result <= not B;
  when others => 
   ALU_Result <= (others => 'X');
  end case;
 end process;
 ALU_Out <= ALU_Result; -- ALU out
end Behavioral;
