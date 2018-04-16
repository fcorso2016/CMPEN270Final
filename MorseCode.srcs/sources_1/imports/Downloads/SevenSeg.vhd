------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 2/13/18
-- Lab # and name	: Lab 4:  The Zoo Lab
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz

-- Description		: Determines if the vacinated and danger lights should be on


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
library circuitComponents;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity SevenSeg is port
	( 
		B3	            : in std_logic;     -- Binary Digit
		B2              : in std_logic;     -- Binary Digit
      	B1              : in std_logic;     -- Binary Digit
        B0              : in std_logic;     -- Binary Digit	
		SegA	        : out std_logic;    -- Segment A
		SegB	        : out std_logic;    -- Segment B
		SegC	        : out std_logic;    -- Segment C
		SegD	        : out std_logic;    -- Segment D
		SegE	        : out std_logic;    -- Segment E
		SegF	        : out std_logic;    -- Segment F
		SegG	        : out std_logic    -- Segment G
		
	);
end SevenSeg;
----------------------------------------------------------------------

-- Architecture 
architecture SevenSeg_a of SevenSeg is
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
	SegA <= ((NOT B3) AND B2 AND (NOT B1) AND (NOT B0)) OR ((NOT B3) AND(NOT B2) AND (NOT B1) AND B0) OR (B3 AND B2 AND (NOT B1) AND B0) OR (B3 AND (NOT B2) AND B1 AND B0);
	SegB <= (B3 AND B1 AND B0) OR (B2 AND B1 AND (NOT B0)) OR (B3 AND B2 AND (NOT B0)) OR ((NOT B3) AND B2 AND (NOT B1) AND B0);
	SegC <= ((NOT B3) OR B2) AND (B1 OR (NOT B0)) AND (B3 OR (NOT B2)) AND (B3 OR B1) AND (B3 OR (NOT B0));
	SegD <= ((NOT B2) AND (NOT B1) AND (B0) ) OR ((NOT B3) AND B2 AND (NOT B1) AND (NOT B0))  OR (B2 AND B1 AND B0)  OR (B3 AND (NOT B2) AND B1 AND (NOT B0));
	SegE <= ((NOT B3) AND (B2) AND (NOT B1) ) OR ( (NOT B3) AND (B0) ) OR ((NOT B2) AND (NOT B1) and (B0));
	SegF <= (B3 AND B2 AND (NOT B1) AND B0) OR ((NOT B3) AND (NOT B2) AND B0) OR ((NOT B3) AND (NOT B2) AND B1) OR ((NOT B3) AND B1 AND B0);
	SegG <= (B3 AND B2 AND (NOT B1) AND (NOT B0)) OR ((NOT B3) AND (NOT B2) AND (NOT B1)) OR ((NOT B3) AND B2 AND B1 AND B0);
	

 			 
end SevenSeg_a; -- .same name as the architecture