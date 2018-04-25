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

entity error_display is port
	( 
	    enabled                 : in std_logic;
		num                     : in std_logic_vector(0 to 3);        
        bit_count               : in std_logic_vector(0 to 1);		
		error               	: out std_logic
	);
end error_display;
----------------------------------------------------------------------

-- Architecture 
architecture error_display_a of error_display is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

	-- NONE
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal bad_sequences : std_logic_vector(0 to 3);
	signal input_bad     : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

	-- NONE
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	bad_sequences(0) <= not num(3) and not num(2) and num(1) and num(0);
	bad_sequences(1) <= not num(3) and num(2) and not num(1) and num(0);
	bad_sequences(2) <= num(3) and num(2) and num(1) and not num(0);
    bad_sequences(3) <= num(3) and num(2) and num(1) and num(0);
    input_bad <= bad_sequences(0) or bad_sequences(1) or bad_sequences(2) or bad_sequences(3);
	error <= enabled and bit_count(0) and bit_count(1) and input_bad;
 			 
end error_display_a; -- .same name as the architecture