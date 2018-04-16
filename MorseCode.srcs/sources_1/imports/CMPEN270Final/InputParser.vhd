------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/16/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: Parses the input of the user and outputs if its going to be counted


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity input_parser is port
	( 
		button, clk	: in std_logic;
		speed_setting : in std_logic_vector(0 to 3);
		store_out   : out std_logic;		
		output  	: out std_logic	
	);
end input_parser;
----------------------------------------------------------------------

-- Architecture 
architecture input_parser_a of input_parser is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component fourBitCounter is port
	   ( 
		  rst, clk, count  : in std_logic;
		  s3, s2, s1, s0 : out std_logic
	   );
    end component;
    
    component userinput is port
        (
            input, clk, rst : in std_logic;
            pulse : out std_logic
         
        );
    end component;
    
    component clkdiv is port 
        ( 
            clk : in  std_logic;
            Sclk: out std_logic
        );
    end component;
    
    component comparator is port
        ( 
            A, B     : in std_logic_vector(0 to 3);    
            negative : out std_logic
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal slowed_clock : std_logic;
	signal inverse_count : std_logic;
	signal count_up : std_logic;
	signal not_button : std_logic;
	signal count_output : std_logic_vector(0 to 3);
	signal button_released : std_logic;
	signal long_press : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	clock_divider : clkdiv port map
	   (
	       clk => clk,
	       Sclk => slowed_clock
	   );
	   
	parse_count : userinput port map
	   (
	       input => slowed_clock,
	       clk => clk,
	       rst => '0',
	       pulse => inverse_count
	   ); 
	
	counter : fourBitCounter port map
	   ( 
	       clk => clk,
	       rst => not_button,
	       count => button,
	       s3 => count_output(3),
	       s2 => count_output(2),
	       s1 => count_output(1),
	       s0 => count_output(0)
	   );
	   
	button_release : userinput port map
	   (
	       input => button,
	       clk => clk,
	       rst => '0',
	       pulse => button_released
	   );
	   
	length_checker : comparator port map
	   (
	       A => count_output,
	       B => speed_setting,
	       negative => long_press
	   );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	count_up <= NOT inverse_count;
	not_button <= NOT button;
	store_out <= button_released;
	output <= long_press AND button_released;
 			 
end input_parser_a; -- .same name as the architecture