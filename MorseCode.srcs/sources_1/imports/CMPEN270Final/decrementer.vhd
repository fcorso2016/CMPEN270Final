------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 
-- Lab # and name	: 
-- Student 1		: 
-- Student 2		: 

-- Description		: 


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity adder_subtracter is port
	( 
		A, B	 : in std_logic_vector(0 to 5); 	-- input description comment
		add_sub  : in std_logic;			
		sum  	 : out std_logic_vector(0 to 5);
		overflow : out std_logic
	);
end adder_subtracter;
----------------------------------------------------------------------

-- Architecture 
architecture adder_subtracter_a of adder_subtracter is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
    component fulladder is port
        (
            Cin                   : in std_logic;
            A                     : in std_logic;
            B                     : in std_logic;
            Cout                  : out std_logic;
            Sum                   : out std_logic    
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal effective_B : std_logic_vector(0 to 5);
	signal cout : std_logic_vector(0 to 5);

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	FA0 : fulladder port map
	   (
	       Cin => add_sub,
	       A => A(0),
	       B => effective_B(0),
	       Cout => cout(0),
	       sum => sum(0)
	   );
	  
	FA1 : fulladder port map
          (
              Cin => cout(0),
              A => A(1),
              B => effective_B(1),
              Cout => cout(1),
              sum => sum(1)
          );
          
    FA2 : fulladder port map
          (
              Cin => cout(1),
              A => A(2),
              B => effective_B(2),
              Cout => cout(2),
              sum => sum(2)
           );
                    
    FA3 : fulladder port map
          (
             Cin => cout(2),
             A => A(3),
             B => effective_B(3),
             Cout => cout(3),
             sum => sum(3)
          );
                              
    FA4 : fulladder port map
          (
             Cin => cout(3),
             A => A(4),
             B => effective_B(4),
             Cout => cout(4),
             sum => sum(4)
           );
           
    FA5 : fulladder port map
          (
             Cin => cout(4),
             A => A(5),
             B => effective_B(5),
             Cout => cout(5),
             sum => sum(5)
          );

	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	effective_B(0) <= add_sub XOR B(0);
	effective_B(1) <= add_sub XOR B(1);
	effective_B(2) <= add_sub XOR B(2);
	effective_B(3) <= add_sub XOR B(3);
	effective_B(4) <= add_sub XOR B(4);
	
	overflow <= cout(4) XNOR cout(5);
 			 
end adder_subtracter_a;