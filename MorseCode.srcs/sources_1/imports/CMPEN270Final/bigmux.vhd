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

entity big_mux is port
	( 
		s    	: in std_logic_vector(0 to 2);	
		d       : in std_logic_vector(0 to 7);
		myout  	: out std_logic	
	);
end big_mux;
----------------------------------------------------------------------

-- Architecture 
architecture big_mux_a of big_mux is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component MUX is port
        ( 
            s          : in std_logic_vector(0 to 1);
            d          : in std_logic_vector(0 to 3);
            myout      : out std_logic
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal mux_outputs : std_logic_vector(0 to 1);

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	MUX0 : MUX port map
	   (
	       s(1) => s(1),
	       s(0) => s(0),
	       d(0) => d(0),
	       d(1) => d(1),
	       d(2) => d(2),
	       d(3) => d(3),
	       myout => mux_outputs(0)
	   );
	   
	MUX1 : MUX port map
       (
            s(1) => s(1),
            s(0) => s(0),
            d(0) => d(4),
            d(1) => d(5),
            d(2) => d(6),
            d(3) => d(7),
            myout => mux_outputs(1)
       );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	myout <= (mux_outputs(0) and not s(2)) or (mux_outputs(1) and s(2));
 			 
end big_mux_a; -- .same name as the architecture