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

entity MUX is port
	( 
		s1, s0	: in std_logic		; 	-- input description comment	
		d0,d1,d2,d3 : std_logic;		
		myout  	: out std_logic			-- output description comment	
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