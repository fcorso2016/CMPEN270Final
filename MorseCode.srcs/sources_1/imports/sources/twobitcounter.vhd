------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/17/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: A 2-bit counter


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity twobitcounter is port
	( 
		rst, clk, count : in std_logic		; 	-- input description comment			
		s0, s1  	: out std_logic			-- output description comment	
	);
end twobitcounter;
----------------------------------------------------------------------

-- Architecture 
architecture twobitcounter_a of twobitcounter is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
component fulladder is port
        (
            Cin                   : in std_logic;
            A                     : in std_logic;
            B                     : in std_logic;
            Cout                  : out std_logic;
            Sum                   : out std_logic    
        );
    end component;
    
    component DFF270_re is port
    (
            clk     : in std_logic ;
            clken    : in std_logic ;
            rst     : in std_logic ;
            d     : in std_logic ;
            q     : out std_logic
    );
    end component;
	-- NONE
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal b0, b1, co0, co1 : std_logic;
	signal s_int0, s_int1 : std_logic;

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
fadder1: fulladder port map
        ( 
        cin =>'0',
        A => count,
        B => b0,
        Sum => s_int0,
        Cout => co0
        );
       
fadder2: fulladder port map
            ( 
            cin =>co0,
            A => '0',
            B => b1,
            Sum => s_int1,
            Cout => co1
            );
            
            
    store1 : DFF270_re port map
        (
            clk => clk,
            rst => rst,
            clken => '1',
            d => s_int0,
            q => b0
        );
	
	 store2 : DFF270_re port map
                (
                    clk => clk,
                    rst => rst,
                    clken => '1',
                    d => s_int1,
                    q => b1
                );   

	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	s0 <= b0;
	s1 <= b1;
	

 			 
end twobitcounter_a; -- .same name as the architecture