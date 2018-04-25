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

entity bigger_mux is port
	( 
		s   	: in std_logic_vector(0 to 3);
		d       : in std_logic_vector(0 to 15);		
		myout  	: out std_logic	
	);
end bigger_mux;
----------------------------------------------------------------------

-- Architecture 
architecture bigger_mux_a of bigger_mux is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component big_mux is port
        ( 
            s        : in std_logic_vector(0 to 2);    
            d        : in std_logic_vector(0 to 7);
            myout    : out std_logic    
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
	mux0 : big_mux port map
	   (
	       s(2)  => s(2),
	       s(1)  => s(1),
	       s(0)  => s(0),
	       d(0)  => d(0),
	       d(1)  => d(1),
	       d(2)  => d(2),
	       d(3)  => d(3),
	       d(4)  => d(4),
	       d(5)  => d(5),
	       d(6)  => d(6),
	       d(7)  => d(7),
	       myout => mux_outputs(0)
	   );
	   
	mux1 : big_mux port map       	   
	   (                          	   
	       s(2)  => s(2),         	   
	       s(1)  => s(1),         	   
	       s(0)  => s(0),         	   
	       d(0)  => d(8),         	   
	       d(1)  => d(9),         	   
	       d(2)  => d(10),         	   
	       d(3)  => d(11),         	   
	       d(4)  => d(12),         	   
	       d(5)  => d(13),         	   
	       d(6)  => d(14),         	   
	       d(7)  => d(15),         	   
	       myout => mux_outputs(1)	   
	   );                         	   
	   
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	myout <= (mux_outputs(0) and not s(3)) or (mux_outputs(1) and s(3));
 			 
end bigger_mux_a; -- .same name as the architecture