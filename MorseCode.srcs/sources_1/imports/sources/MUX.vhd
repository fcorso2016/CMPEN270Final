------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/15/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: A 4 to 1 MUX


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity MUX is port
	( 
		s1, s0      	: in std_logic;
		d0, d1, d2, d3  : in std_logic;
		myout  	        : out std_logic
	);
end MUX;
----------------------------------------------------------------------

-- Architecture 
architecture MUX_a of MUX is
----------------------------------------------------------------------
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	-- NONE


begin

	myout <= (not s1 and not s0 and d0) or (not s1 and s0 and d1) or (s1 and not s0 and d2) or (s1 and s0 and d3);
 			 
end MUX_a; 