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

entity enabler is port
	( 
		clk, rst, button	: in std_logic;	
		enabled         	: out std_logic
	);
end enabler;
----------------------------------------------------------------------

-- Architecture 
architecture enabler_a of enabler is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
    component DFF270_re is port
        (
            clk     : in std_logic ;
            clken   : in std_logic ;
            rst     : in std_logic ;
            d       : in std_logic ;
            q       : out std_logic
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal PS, NS : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	store_state : DFF270_re port map
	   (
	       clk => clk,
	       clken => '1',
	       rst => rst,
	       d => NS,
	       q => PS
	   );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	NS <= PS OR button;
	enabled <= PS;
	
 			 
end enabler_a; -- .same name as the architecture