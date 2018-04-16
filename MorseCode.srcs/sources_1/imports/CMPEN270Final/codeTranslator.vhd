------------ HEADER ------------------------------------------------------------------------------------------------- 
-- Date				: 4/16/18
-- Lab # and name	: Lab 9 - Final Project
-- Student 1		: Francesco Corso
-- Student 2		: Sam Schultz
-- Student 3        : Cody Wiley

-- Description		: Translates input into a 5 digit number


-- Changes 
-- 			- Original

-- Formatting		: Edited using Xilinx ISE 13.2 or higher --> Open this file in ISE to properly view formatting

------------- END HEADER ------------------------------------------------------------------------------------------


-- Library Declarations 

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------

-- Entity 

entity codeTranslator is port
	( 
		enable   : in std_logic;		
		bitCount : in std_logic_vector(0 to 1);
		char     : in std_logic_vector(0 to 3);	
		number	 : out std_logic_vector(0 to 4)
	);
end codeTranslator;
----------------------------------------------------------------------

-- Architecture 
architecture codeTranslator_a of codeTranslator is
----------------------------------------------------------------------

	--------------------------------------------------------
	-- Component Declarations 
	-------------------------------------------------------

	-- NONE
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	
	-- NONE

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------

	-- NONE
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	number(0) <= enable and ((not bitCount(1) and not bitCount(0) and (not char(0))) or 
	   (not bitCount(1) and bitCount(0) and (not char(1) or char(0))) or
	   (not bitCount(1) and bitCount(0) and (char(0) or (char(2) and char(1)) or (not char(2) and not char(1) and not char(0)))) or 
	   (bitCount(1) and bitCount(0) and ((char(3) and char(2) and char(1)) or (char(3) and char(1)))));
	number(1) <= enable and ((not bitCount(1) and not bitCount(0) and ('0')) or 
       (not bitCount(1) and bitCount(0) and (char(0))) or
       (not bitCount(1) and bitCount(0) and (char(1) or (char(2) and char(0)) or (not char(2) and not char(0)))) or 
       (bitCount(1) and bitCount(0) and ((char(3) and char(1)) or (char(3) and char(2) and not char(0)))));
    number(2) <= enable and ((not bitCount(1) and not bitCount(0) and ('1')) or 
       (not bitCount(1) and bitCount(0) and (char(1))) or
       (not bitCount(1) and bitCount(0) and ((char(2) and char(1)) or (char(1) and char(0)) or (not char(2) and char(1) and char(0)) or (char(2) and not char(1) and not char(0)))) or 
       (bitCount(1) and bitCount(0) and ((not char(3) and not char(2) and char(1)) or (not char(3) and not char(2) and char(0)) or (not char(3) and char(2) and not char(1)))));
    number(3) <= enable and ((not bitCount(1) and not bitCount(0) and ('0')) or 
       (not bitCount(1) and bitCount(0) and (char(1) or not char(0))) or
       (not bitCount(1) and bitCount(0) and (char(2) and char(0))) or 
       (bitCount(1) and bitCount(0) and ((char(1) and char(0)) or (char(3) and not char(2) and char(0)) or (char(2) and not char(1) and not char(0)) or (not char(3) and not char(2) and char(1)))));
    number(4) <= enable and ((not bitCount(1) and not bitCount(0) and (char(0))) or 
       (not bitCount(1) and bitCount(0) and ('0')) or
       (not bitCount(1) and bitCount(0) and (not char(2))) or 
       (bitCount(1) and bitCount(0) and ((not char(1) and char(0)) or (char(3) and char(2)) or (char(3) and char(0)) or (char(2) and char(1) and not char(0)))));
 			 
end codeTranslator_a; -- .same name as the architecture