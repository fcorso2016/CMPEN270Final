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
		s      	: in std_logic_vector(0 to 1);
		d       : in std_logic_vector(0 to 3);
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

	myout <= (not s(1) and not s(0) and d(0)) or (not s(1) and s(0) and d(1)) or (s(1) and not s(0) and d(2)) or (s(1) and s(0) and d(3));
 			 
end MUX_a; 