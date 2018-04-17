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

entity toplevel is port
	( 
		button, clk, rst	: in std_logic		; 	-- input description comment		
		--speed_setting : in std_logic_vector(0 to 3);	
		seg  	: out std_logic_vector(0 to 6)			-- output description comment	
	);
end toplevel;
----------------------------------------------------------------------

-- Architecture 
architecture toplevel_a of toplevel is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component input_parser is port
        ( 
            button, clk    : in std_logic;
            speed_setting : in std_logic_vector(0 to 3);
            store_out   : out std_logic;        
            output      : out std_logic    
        );
    end component;
    
    component four_bit_register is port
        ( 
            rst, clk, clken, input    : in std_logic        ;                 
            ps0,ps1,ps2,ps3      : out std_logic                
        );
    end component;
    
    component twobitcounter is port
        ( 
            rst, clk, count : in std_logic        ;     -- input description comment            
            s0, s1      : out std_logic            -- output description comment    
        );
    end component;
    
    component codeTranslator is port
        ( 
            enable   : in std_logic;        
            bitCount : in std_logic_vector(0 to 1);
            char     : in std_logic_vector(0 to 3);    
            number     : out std_logic_vector(0 to 4)
        );
    end component;
    
    component SevenSeg is port
        ( 
            B                : in std_logic_vector(0 to 4);     -- Binary Digits
            Segs             : out std_logic_vector(0 to 6)
            
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal get_speed : std_logic_vector(0 to 3);
	signal input_finished : std_logic;
	signal dot_dash : std_logic;
	signal stored_bits : std_logic_vector(0 to 3);
	signal bit_count : std_logic_vector(0 to 1);
	signal char : std_logic_vector(0 to 3);

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	input_button : input_parser port map
	   (
	       button => button,
	       clk => clk,
	       speed_setting => get_speed,
	       store_out => input_finished,
	       output => dot_dash
	       
	   );
	
	shift_register : four_bit_register port map
	   (
	       rst => rst,
	       clk => clk,
	       clken => input_finished,
	       input => dot_dash,
	       ps0 => stored_bits(0),
	       ps1 => stored_bits(1),
	       ps2 => stored_bits(2),
	       ps3 => stored_bits(3)
	   );
	   
	length_checker : twobitcounter port map
	   (
	       rst => rst,
	       clk => clk,
	       count => input_finished,
	       s0 => bit_count(0),
	       s1 => bit_count(1)
	   );
	   
	character_getter : codeTranslator port map
	   (
	       enable => '1',
	       bitCount => bit_count,
	       char => stored_bits,
	       number => char
	   );
	   
	get_segment : SevenSeg port map
	   (
	       B => char,
	       Segs => seg
	   );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	
	-- NONE
 			 
end toplevel_a; -- .same name as the architecture