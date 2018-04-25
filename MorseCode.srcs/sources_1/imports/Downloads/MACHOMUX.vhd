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

entity MUX_matrix is port
	( 
		A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z   : in std_logic;
		invalid_input           : in std_logic;
		bit_sequence            : in std_logic_vector(0 to 3);		
		bit_count               : in std_logic_vector(0 to 1);
		output  	            : out std_logic		
	);
end MUX_matrix;
----------------------------------------------------------------------

-- Architecture 
architecture MUX_matrix_a of MUX_matrix is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
	component minimux is port
        ( 
            s          : in std_logic;
            d          : in std_logic_vector(0 to 1);        
            myout      : out std_logic    
        );
    end component;
    
    component MUX is port
        ( 
            s          : in std_logic_vector(0 to 1);
            d          : in std_logic_vector(0 to 3);
            myout      : out std_logic
        );
    end component;
    
    component big_mux is port
        ( 
            s        : in std_logic_vector(0 to 2);    
            d       : in std_logic_vector(0 to 7);
            myout      : out std_logic    
        );
    end component;
    
    component bigger_mux is port
        ( 
            s       : in std_logic_vector(0 to 3);
            d       : in std_logic_vector(0 to 15);        
            myout      : out std_logic    
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
    signal potential_bits : std_logic_vector(0 to 3);   

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	single_bit : minimux port map
	   (
	       s     => bit_sequence(0),
	       d(0)  => E,
	       d(1)  => T,
	       myout => potential_bits(0)
	   );
	   
	two_bits : MUX port map
	   (
	       s(0)  => bit_sequence(0),
	       s(1)  => bit_sequence(1),
	       d(0)  => I,
	       d(1)  => A,
	       d(2)  => N,
	       d(3)  => M,
	       myout => potential_bits(1)
	   );
	   
	three_bits : big_mux port map
	   (
	       s(0)  => bit_sequence(0),
	       s(1)  => bit_sequence(1),
	       s(2)  => bit_sequence(2),
	       d(0)  => S,
	       d(1)  => U,
	       d(2)  => R,
	       d(3)  => W,
	       d(4)  => D,
	       d(5)  => K,
	       d(6)  => G,
	       d(7)  => O,
	       myout => potential_bits(2)
	   );
	   
	four_bits : bigger_mux port map
	   (
	       s     => bit_sequence,
	       d(0)  => H,
	       d(1)  => V,
	       d(2)  => F,
	       d(3)  => invalid_input,
	       d(4)  => L,
	       d(5)  => invalid_input,
	       d(6)  => P,
	       d(7)  => J,
	       d(8)  => B,
	       d(9)  => X,
	       d(10) => C,
	       d(11) => Y,
	       d(12) => Z,
	       d(13) => Q,
	       d(14) => invalid_input,
	       d(15) => invalid_input,
	       myout => potential_bits(3)
	   );
	   
	final_selector : MUX port map
	   (
	       s     => bit_count,
	       d     => potential_bits,
	       myout => output
	   );
    
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	
    -- NONE	

 			 
end MUX_matrix_a;