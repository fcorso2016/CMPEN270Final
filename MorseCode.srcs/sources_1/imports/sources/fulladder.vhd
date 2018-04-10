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

entity fulladder is port
    (
        Cin, clk, rst         : in std_logic;
        A                     : in std_logic;
        B                     : in std_logic;
        Cout                  : out std_logic;
        Sum                   : out std_logic
     
    );
end fulladder;
----------------------------------------------------------------------

-- Architecture 
architecture fulladder_a of fulladder is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component dff270_r is port
        ( 
            clk     : in std_logic ;
            rst     : in std_logic ;
            d       : in std_logic ;
            q       : out std_logic
         );
     end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal Cout_int : std_logic;
	signal Sum_int  : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	cout_latch : dff270_r port map
	   (
	   clk => clk,
	   rst => rst,
	   d  => Cout_int,
	   q  => Cout
	   ); 
	    
	sum_latch : dff270_r port map
          (                          
          clk => clk,                
          rst => rst,                
          d  => Sum_int,            
          q  => Sum                 
          );                                               
        
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------

	Cout_int <= (A AND B) OR (Cin AND (A XOR B) );
	Sum_int <= (A XOR B) XOR Cin;
 			 
end fulladder_a; -- .same name as the architecture