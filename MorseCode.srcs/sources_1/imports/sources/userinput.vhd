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

entity userinput is port
    (
        input, clk, rst : in std_logic;
        pulse : out std_logic
     
    );
end userinput;
----------------------------------------------------------------------

-- Architecture 
architecture userinput_a of userinput is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component dff270_re is port
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
	signal PS1 : std_logic;
    signal PS0 : std_logic;
    signal NS1 : std_logic;
    signal NS0 : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
    latch1 : dff270_re port map 
        (
            clk    => clk,
            clken  => '1',
            rst    => rst,
            d      => NS1,
            q      => PS1
        );
        
    latch0 : dff270_re port map
        (                      
            clk    => clk,     
            clken  => '1',     
            rst    => rst,     
            d      => NS0,     
            q      => PS0      
        );                             
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	NS1 <= PS1 AND (NOT input);
	NS0 <= input;
	pulse <= PS1;
	
 			 
end userinput_a; -- .same name as the architecture