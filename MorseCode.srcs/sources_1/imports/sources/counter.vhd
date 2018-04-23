------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/15/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: A 4 bit counter


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------
-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity fourBitCounter is port
	( 
		rst, clk, count, clken  : in std_logic;
		s3, s2, s1, s0 : out std_logic
	);
end fourBitCounter;
----------------------------------------------------------------------

-- Architecture 
architecture fourBitCounter_a of fourBitCounter is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------
    component DFF270_re is port
        (
		    clk 	: in std_logic ;
            clken   : in std_logic ;
            rst     : in std_logic ;
            d       : in std_logic ;
            q       : out std_logic
        );
    end component;

    component fulladder is port
        (
            Cin                   : in std_logic;
            A                     : in std_logic;
            B                     : in std_logic;
            Cout                  : out std_logic;
            Sum                   : out std_logic    
        );
    end component;

	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
    signal b0, b1, b2, b3: std_logic;
    signal s_int0, s_int1, s_int2, s_int3 : std_logic;
    signal co0, co1, co2, co3, LButton, RButton, LNeighbor, RNeighbor : std_logic;	

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
    fadder3: fulladder port map
        ( 
            cin =>co1,
            A => '0',
            B => b2,
            Sum => s_int2,
            Cout => co2
        );
    fadder4: fulladder port map
        ( 
            cin =>co2,
            A => '0',
            B => b3,
            Sum => s_int3,
            Cout => co3
         );
                
     result0 : DFF270_re port map
        (
            clk => clk,
            rst => rst,
            clken => clken,
            d => s_int0,
            q => b0
        );
        
     result1 : DFF270_re port map        
        (                                
            clk => clk,                  
            rst => rst,                  
            clken => clken,                
            d => s_int1,                 
            q => b1                      
        );                               
        
     result2 : DFF270_re port map        
        (                                
            clk => clk,                  
            rst => rst,                  
            clken => clken,                
            d => s_int2,                 
            q => b2                      
        );                               
        
     result3 : DFF270_re port map        
        (                                
            clk => clk,                  
            rst => rst,                  
            clken => clken,                        
            d => s_int3,                         
            q => b3                              
        ); 
                              
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	s0 <= b0;
	s1 <= b1;
	s2 <= b2;
	s3 <= b3;
	

 			 
end fourBitCounter_a; -- .same name as the architecture