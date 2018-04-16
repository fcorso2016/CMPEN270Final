------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/16/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: A 32:1 MUX


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity MUXX is port
	( 
		a        	            : in std_logic_vector(0 to 31); 
		s                       : in std_logic_vector(0 to 4);		
		output  	            : out std_logic		
	);
end MUXX;
----------------------------------------------------------------------

-- Architecture 
architecture MUXX_a of MUXX is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
    component MUX is port
    (
 	s1, s0	: in std_logic		; 	-- input description comment	
    d0,d1,d2,d3 : std_logic;        
    myout      : out std_logic            -- output description comment    
);
end component;   
	
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal w1, w2, w3, w4, midw1 : std_logic;
	signal w5, w6, w7, w8, midw2 : std_logic;
    

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
    MUX1: MUX port map
    (
        s0 => s(0),
        s1 => s(1),
        d0 => a(0),
        d1 => a(1),
        d2 => a(2),
        d3 => a(3),
        myout => w1
    );
    MUX2: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(4),
    d1 => a(5),
    d2 => a(6),
    d3 => a(7),
    myout => w2
    );    
    MUX3: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(8),
    d1 => a(9),
    d2 => a(10),
    d3 => a(11),
    myout => w3
    );
    MUX4: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(12),
    d1 => a(13),
    d2 => a(14),
    d3 => a(15),
    myout => w4
    );
    MIDMUX1: MUX port map
    (
    s0 => s(1),
    s1 => s(3),
    d0 => w1,
    d1 => w2,
    d2 => w3,
    d3 => w4,
    myout => midw1
    );
    MUX5: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(16),
    d1 => a(17),
    d2 => a(18),
    d3 => a(19),
    myout => w5
    );
    MUX6: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(20),
    d1 => a(21),
    d2 => a(22),
    d3 => a(23),
    myout => w6
    );
    MUX7: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(24),
    d1 => a(25),
    d2 => a(26),
    d3 => a(27),
    myout => w7
    );
    MUX8: MUX port map
    (
    s0 => s(0),
    s1 => s(1),
    d0 => a(28),
    d1 => a(29),
    d2 => a(30),
    d3 => a(31),
    myout => w8
    );
    MIDMUX2: MUX port map
    (
    s0 => s(2),
    s1 => s(3),
    d0 => w5,
    d1 => w6,
    d2 => w7,
    d3 => w8,
    myout => midw2
    );    
    MACHOMUX: MUX port map
    (
    s0 => s(4),
    s1 => '0',
    d0 => midw1,
    d1 => midw2,
    d2 => '0',
    d3 => '0',
    myout => output
    );    
    
    
    
    
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	

 			 
end MUXX_a; -- .same name as the architecture