------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/16/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: A 4 bit comparator


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity comparator is port
	( 
		A, B	 : in std_logic_vector(0 to 3);	
		negative : out std_logic
	);
end comparator;
----------------------------------------------------------------------

-- Architecture 
architecture comparator_a of comparator is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
    component fulladder is port
        (
            Cin              : in std_logic;
            A                : in std_logic;
            B                : in std_logic;
            Cout             : out std_logic;
            Sum              : out std_logic
         
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal not_B, sum : std_logic_vector(0 to 4);
	signal carry : std_logic_vector(0 to 4);

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	adder0 : fulladder port map
	   (
	       Cin => '1',
	       A => A(0),
	       B => not_B(0),
	       Cout => carry(0),
	       Sum => sum(0)
	   );
	
	adder1 : fulladder port map
        (
            Cin => carry(0),
            A => A(1),
            B => not_B(1),
            Cout => carry(1),
            Sum => sum(1)
        );
        
	adder2 : fulladder port map   
        (                      
            Cin => carry(1),   
            A => A(2),         
            B => not_B(2),     
            Cout => carry(2),  
            Sum => sum(2)      
        );                             

	adder3 : fulladder port map   
        (                      
            Cin => carry(2),   
            A => A(3),         
            B => not_B(3),     
            Cout => carry(3),  
            Sum => sum(3)      
        );  
        
    adder4 : fulladder port map   
        (                      
            Cin => carry(3),   
            A => '0',         
            B => '1',     
            Cout => carry(4),  
            Sum => sum(4)      
        );                   

	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	not_B(0) <= NOT B(0);
	not_B(1) <= NOT B(1);
	not_B(2) <= NOT B(2);
	not_B(3) <= NOT B(3);
	
	negative <= sum(4);
	
 			 
end comparator_a; -- .same name as the architecture