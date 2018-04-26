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
		button, clk, rst	: in std_logic;		
		speed_setting     : in std_logic_vector(0 to 3);	
		led, an             : out std_logic_vector(0 to 3);
		current_input       : out std_logic;
		seg  	            : out std_logic_vector(0 to 6)	
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
            button, clk, rst : in std_logic;
            speed_setting    : in std_logic_vector(0 to 3);
            store_out        : out std_logic;        
            output           : out std_logic;
            current_input    : out std_logic    
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
    
    component enable_led  is port
        (
            clk, rst, button	: in std_logic;	
            enabled             : out std_logic
        );
    end component;
    
    component error_display is port
        ( 
            enabled                 : in std_logic;
            num                     : in std_logic_vector(0 to 3);        
            bit_count               : in std_logic_vector(0 to 1);        
            error                   : out std_logic
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
	signal counter_enabled, counter_enabled_alpha : std_logic;
	signal should_count_input : std_logic;
	signal char : std_logic_vector(0 to 4);
    signal has_error : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	input_button : input_parser port map
	   (
	       button => button,
	       clk => clk,
	       rst => rst,
	       speed_setting => get_speed,
	       store_out => input_finished,
	       output => dot_dash,
	       current_input => current_input
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
	       count => should_count_input,
	       s0 => bit_count(0),
	       s1 => bit_count(1)
	   );
	   
	enable_counter_beta : enable_led port map
	   (
	       clk => clk,
	       rst => rst,
	       button => input_finished,
	       enabled => counter_enabled_alpha
	   );
	   
	enable_counter : enable_led port map
       (
           clk => clk,
           rst => rst,
           button => counter_enabled_alpha,
           enabled => counter_enabled
       );
	   
	character_getter : codeTranslator port map
	   (
	       bitCount => bit_count,
	       char => stored_bits,
	       number => char
	   );
	   
	get_segment : SevenSeg port map
	   (
	       B => char,
	       Segs => seg
	   );
	   
	get_error : error_display port map
	   (
	       enabled => counter_enabled,
	       num => stored_bits,
	       bit_count => bit_count,
	       error => has_error
	   );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	get_speed(0) <= speed_setting(0);
	get_speed(1) <= speed_setting(1);
	get_speed(2) <= speed_setting(2);
	get_speed(3) <= speed_setting(3);
	
	should_count_input <= counter_enabled AND input_finished AND (bit_count(0) NAND bit_count(1));
		
	led <= stored_bits;
	
	an(0) <= NOT counter_enabled;
	an(1) <= NOT has_error;
	an(2) <= NOT has_error;
	an(3) <= NOT has_error;
 			 
end toplevel_a; -- .same name as the architecture