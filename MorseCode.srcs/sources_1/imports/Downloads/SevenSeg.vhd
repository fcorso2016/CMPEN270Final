------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 2/13/18
-- Lab # and name	: Lab 4:  The Zoo Lab
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz

-- Description		: Determines if the vacinated and danger lights should be on


-- Changes 
-- 			- Original
--          - Changed to use letters

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
		B	            : in std_logic_vector(0 to 4);     -- Binary Digits
		Segs             : out std_logic_vector(0 to 6)
		
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
	signal SegA	           : std_logic;    -- Segment A
    signal SegB            : std_logic;    -- Segment B
    signal SegC            : std_logic;    -- Segment C
    signal SegD            : std_logic;    -- Segment D
    signal SegE            : std_logic;    -- Segment E
    signal SegF            : std_logic;    -- Segment F
    signal SegG            : std_logic;    -- Segment G

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

	-- NONE
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	-- Kept for legacy purposes
--	SegA <= ((NOT B3) AND B2 AND (NOT B1) AND (NOT B0)) OR ((NOT B3) AND(NOT B2) AND (NOT B1) AND B0) OR (B3 AND B2 AND (NOT B1) AND B0) OR (B3 AND (NOT B2) AND B1 AND B0);
--	SegB <= (B3 AND B1 AND B0) OR (B2 AND B1 AND (NOT B0)) OR (B3 AND B2 AND (NOT B0)) OR ((NOT B3) AND B2 AND (NOT B1) AND B0);
--	SegC <= ((NOT B3) OR B2) AND (B1 OR (NOT B0)) AND (B3 OR (NOT B2)) AND (B3 OR B1) AND (B3 OR (NOT B0));
--	SegD <= ((NOT B2) AND (NOT B1) AND (B0) ) OR ((NOT B3) AND B2 AND (NOT B1) AND (NOT B0))  OR (B2 AND B1 AND B0)  OR (B3 AND (NOT B2) AND B1 AND (NOT B0));
--	SegE <= ((NOT B3) AND (B2) AND (NOT B1) ) OR ( (NOT B3) AND (B0) ) OR ((NOT B2) AND (NOT B1) and (B0));
--	SegF <= (B3 AND B2 AND (NOT B1) AND B0) OR ((NOT B3) AND (NOT B2) AND B0) OR ((NOT B3) AND (NOT B2) AND B1) OR ((NOT B3) AND B1 AND B0);
--	SegG <= (B3 AND B2 AND (NOT B1) AND (NOT B0)) OR ((NOT B3) AND (NOT B2) AND (NOT B1)) OR ((NOT B3) AND B2 AND B1 AND B0);
    
    -- New Segments
	SegA <= (NOT B(4) AND ((NOT B(3) AND NOT B(0)) OR (NOT B(2) AND B(1) AND NOT B(0)) OR (B(2) AND NOT B(1) AND NOT B(0)) OR (NOT B(3) AND B(2) AND NOT B(1)) OR (B(3) AND B(2) AND B(1) AND B(0)))) 
	   OR (B(4) AND (B(3) OR (NOT B(2) AND NOT B(0))));
	SegB <= (NOT B(4) AND ((NOT B(2) AND NOT B(1) AND NOT B(0)) OR (B(3) AND NOT B(2) AND NOT B(1)) OR (B(3) AND B(2) AND B(1) AND B(0)) OR (NOT B(3) AND B(2) AND B(1) AND NOT B(0)) OR (NOT B(3) AND B(2) AND B(1) AND B(0)))) 
	   OR (B(4) AND (B(3) OR (NOT B(2) AND NOT B(0)) OR (B(2) AND B(0)) OR (B(2) AND B(1))));
	SegC <= (NOT B(4) AND ((B(3) AND NOT B(1)) OR (B(3) AND NOT B(1)) OR (NOT B(2) AND NOT B(1)) OR (NOT B(3) AND B(1) AND B(0)) OR (B(2) AND B(1) AND NOT B(0)))) 
	   OR (B(4) AND ((B(1) AND NOT B(0)) OR (B(2) AND B(1)) OR (NOT B(3) AND NOT B(0))));
    SegD <= (NOT B(4) AND((B(0) AND NOT B(2)) OR (B(1) AND NOT B(2) AND NOT B(3)) OR (B(2) AND B(1) AND NOT B(0)) OR (B(2) AND NOT B(0) AND NOT B(3)))) OR 
        (B(4) AND((B(1) AND NOT B(2)) OR (B(3)) OR (B(2) AND NOT B(1)) OR (B(1) AND B(0))));
    SegE <= ( (NOT B(4))   AND  (  (NOT B(1) AND NOT B(3)) OR (NOT B(2) AND NOT B(3)) OR (B(2) AND B(3)) OR  ( (B(1) AND B(3)) OR (B(0) AND B(1)) OR (B(0) AND NOT B(1))  )   ) )     OR
        ((  B(4)  ) AND (  (B(3)) OR (NOT B(0) AND B(1) AND B(2) ) OR (B(0) AND NOT B(2) AND NOT B(3)) OR ((NOT B(0) AND NOT B(1) AND B(2))  ) ) ) ;
    SegF <= (  (NOT B(4)) AND ((NOT B(1) AND NOT B(3)) OR (B(2) AND NOT B(3)) OR (B(0) AND B(1) AND B(3)) OR (NOT B(0) AND B(1) AND NOT B(2)) ) ) 
        OR (B(4) AND (    (B(1)) OR (NOT B(0) AND NOT B(2) AND NOT B(3)) OR (B(0) AND B(2) AND NOT B(3)) ));
    SegG <= (NOT B(4) AND((NOT B(3) AND NOT B(1)) OR (B(0) AND NOT B(3)) OR (B(2) AND B(0)) OR (B(3) AND NOT B(0) AND B(1)) OR (B(2) AND NOT B(3)))) OR 
        (B(4) AND ((NOT B(2) AND NOT B(3)) OR (B(0)) OR (B(1))));
        
    -- Invert Segments
    Segs(0) <= NOT SegA;
    Segs(1) <= NOT SegB;
    Segs(2) <= NOT SegC;
    Segs(3) <= NOT SegD;
    Segs(4) <= NOT SegE;
    Segs(5) <= NOT SegF;
    Segs(6) <= NOT SegG;

 			 
end SevenSeg_a; -- .same name as the architecture