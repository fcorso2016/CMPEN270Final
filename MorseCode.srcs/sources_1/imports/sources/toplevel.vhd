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
		input_count : in std_logic_vector(0 to 1);
		input_enabled : in std_logic;
		letter        : in std_logic_vector(0 to 3);
		led, an    : out std_logic_vector(0 to 3);
		seg  	    : out std_logic_vector(0 to 6)			-- output description comment	
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
    
    component adder_subtracter is port
        ( 
            A, B     : in std_logic_vector(0 to 5);     -- input description comment
            add_sub  : in std_logic;            
            sum       : out std_logic_vector(0 to 5);
            overflow : out std_logic
        );
    end component;
    
    component SevenSeg is port
        ( 
            B                : in std_logic_vector(0 to 4);     -- Binary Digits
            Segs             : out std_logic_vector(0 to 6)
            
        );
    end component;
    
    component enabler  is port
        (
            clk, rst, button	: in std_logic;	
            enabled             : out std_logic
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
	signal counter_enabled : std_logic;
	signal should_count_input : std_logic;
	signal char_code, char : std_logic_vector(0 to 4);
	signal throwaway : std_logic;

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
	       input => dot_dash
	       --ps0 => stored_bits(0),
	      -- ps1 => stored_bits(1),
	       --ps2 => stored_bits(2),
	       --ps3 => stored_bits(3)
	   );
	   
	length_checker : twobitcounter port map
	   (
	       rst => rst,
	       clk => clk,
	       count => should_count_input
	       --s0 => bit_count(0),
	       --s1 => bit_count(1)
	   );
	   
	enable_counter : enabler port map
	   (
	       clk => clk,
	       rst => rst,
	       button => button
	       --enabled => counter_enabled
	   );
	   
	character_getter : codeTranslator port map
	   (
	       enable => counter_enabled,
	       bitCount => bit_count,
	       char => stored_bits,
	       number => char_code
	   );
	   
	decrementer : adder_subtracter port map
	   (
	       A(0) => char_code(0),
	       A(1) => char_code(1),
	       A(2) => char_code(2),
	       A(3) => char_code(3),
	       A(4) => char_code(4),
	       A(5) => '0',
	       B(0) => '1',
	       B(1) => '0',
           B(2) => '0',
           B(3) => '0',
           B(4) => '0',
           B(5) => '0',
           add_sub => '1',
           sum(0) => char(0),
           sum(1) => char(1),
           sum(2) => char(2),
           sum(3) => char(3),
           sum(4) => char(4),
           sum(5) => throwaway
	   );
	   
	get_segment : SevenSeg port map
	   (
	       B => char,
	       Segs => seg
	   );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	get_speed(0) <= '0';
	get_speed(1) <= '1';
	get_speed(2) <= '1';
	get_speed(3) <= '1';
	
	counter_enabled <= input_enabled;
	bit_count <= input_count;
	stored_bits <= letter;

	
	should_count_input <= counter_enabled AND input_finished;
		
	led <= stored_bits;
	
	an(0) <= NOT counter_enabled;
	an(1) <= '1';
	an(2) <= '1';
	an(3) <= '1';
 			 
end toplevel_a; -- .same name as the architecture