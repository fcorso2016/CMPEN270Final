------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 3/20/18
-- Lab # and name	: 	Lab 7 - Tug of War
-- Student 1		: 	Samantha Schultz
-- Student 2		: 	Frank Corso

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

entity fulladder is port
    (
        Cin, clk, rst         : in std_logic;
        A                     : in std_logic;
        B                     : in std_logic;
        Cout                  : out std_logic;
        Sum                   : out std_logic
     
    );
end fulladder;
----------------------------------------------------------------------

-- Architecture 
architecture fulladder_a of fulladder is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

        -- NONE
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------

        -- NONE

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------                                        
        
        -- NONE
        
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------

	Cout <= (A AND B) OR (Cin AND (A XOR B) );
	Sum <= (A XOR B) XOR Cin;
 			 
end fulladder_a; -- .same name as the architecture