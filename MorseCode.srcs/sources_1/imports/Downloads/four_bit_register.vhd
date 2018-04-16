------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/16/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: 4-bit register


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 
entity four_bit_register is port
	( 
		rst, clk, clken, input	: in std_logic		; 				
		ps0,ps1,ps2,ps3  	: out std_logic				
	);
end four_bit_register;
----------------------------------------------------------------------

-- Architecture 
architecture four_bit_register_a of four_bit_register is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
   component dff270_re is port
   (
        clken,clk,rst,d : in std_logic;
        q           : out std_logic
   );
   end component;
        

	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal q0, q1, q2, q3 : std_logic;
	-- NONE

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
    bit1 : dff270_re port map
    (
    clken => '1',
    clk => clk,
    rst => rst,
    d => input,
    q => q0
    );
     bit2 : dff270_re port map
    (
    clken => '1',
    clk => clk,
    rst => rst,
    d => q0,
    q => q1
    ); 
    bit3 : dff270_re port map
    (
    clken => '1',
    clk => clk,
    rst => rst,
    d => q1,
    q => q2
    );
    bit4 : dff270_re port map
    (
    clken => '1',
    clk => clk,
    rst => rst,
    d => q2,
    q => q3
    );
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
    ps0 <= q0;
    ps1 <= q1;
    ps2 <= q2;
    ps3 <= q3;
end four_bit_register_a; -- .same name as the architecture