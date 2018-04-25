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
	component MUX_matrix is port
        ( 
            A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z   : in std_logic;
            invalid_input           : in std_logic;
            bit_sequence            : in std_logic_vector(0 to 3);        
            bit_count               : in std_logic_vector(0 to 1);
            output                  : out std_logic        
        );
    end component;
	
	-------------------------------------------------------
	-- Internal Signal Declarations
	-------------------------------------------------------
	signal A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z   : std_logic_vector(0 to 4);
    signal invalid_input           : std_logic_vector(0 to 4);

begin
	
	-------------------------------------------------------
	-- Component Instantiations
	-------------------------------------------------------
	mux_matrix0 : MUX_matrix port map
        (
            A => A(0),
            B => B(0),
            C => C(0),
            D => D(0),
            E => E(0),
            F => F(0),
            G => G(0),
            H => H(0),
            I => I(0),
            J => J(0),
            K => K(0),
            L => L(0),
            M => M(0),
            N => N(0),
            O => O(0),
            P => P(0),
            Q => Q(0),
            R => R(0),
            S => S(0),
            T => T(0),
            U => U(0),
            V => V(0),
            W => W(0),
            X => X(0),
            Y => Y(0),
            Z => Z(0),
            invalid_input => invalid_input(0),
            bit_sequence => char,
            bit_count => bitCount,
            output => number(0)
        );
    
    mux_matrix1 : MUX_matrix port map
        (
            A => A(1),
            B => B(1),
            C => C(1),
            D => D(1),
            E => E(1),
            F => F(1),
            G => G(1),
            H => H(1),
            I => I(1),
            J => J(1),
            K => K(1),
            L => L(1),
            M => M(1),
            N => N(1),
            O => O(1),
            P => P(1),
            Q => Q(1),
            R => R(1),
            S => S(1),
            T => T(1),
            U => U(1),
            V => V(1),
            W => W(1),
            X => X(1),
            Y => Y(1),
            Z => Z(1),
            invalid_input => invalid_input(1),
            bit_sequence => char,
            bit_count => bitCount,
            output => number(1)
        );
    
    mux_matrix2 : MUX_matrix port map
        (
            A => A(2),
            B => B(2),
            C => C(2),
            D => D(2),
            E => E(2),
            F => F(2),
            G => G(2),
            H => H(2),
            I => I(2),
            J => J(2),
            K => K(2),
            L => L(2),
            M => M(2),
            N => N(2),
            O => O(2),
            P => P(2),
            Q => Q(2),
            R => R(2),
            S => S(2),
            T => T(2),
            U => U(2),
            V => V(2),
            W => W(2),
            X => X(2),
            Y => Y(2),
            Z => Z(2),
            invalid_input => invalid_input(2),
            bit_sequence => char,
            bit_count => bitCount,
            output => number(2)
        );
    
    mux_matrix3 : MUX_matrix port map
        (
            A => A(3),
            B => B(3),
            C => C(3),
            D => D(3),
            E => E(3),
            F => F(3),
            G => G(3),
            H => H(3),
            I => I(3),
            J => J(3),
            K => K(3),
            L => L(3),
            M => M(3),
            N => N(3),
            O => O(3),
            P => P(3),
            Q => Q(3),
            R => R(3),
            S => S(3),
            T => T(3),
            U => U(3),
            V => V(3),
            W => W(3),
            X => X(3),
            Y => Y(3),
            Z => Z(3),
            invalid_input => invalid_input(3),
            bit_sequence => char,
            bit_count => bitCount,
            output => number(3)
        );
    
    mux_matrix4 : MUX_matrix port map
        (
            A => A(4),
            B => B(4),
            C => C(4),
            D => D(4),
            E => E(4),
            F => F(4),
            G => G(4),
            H => H(4),
            I => I(4),
            J => J(4),
            K => K(4),
            L => L(4),
            M => M(4),
            N => N(4),
            O => O(4),
            P => P(4),
            Q => Q(4),
            R => R(4),
            S => S(4),
            T => T(4),
            U => U(4),
            V => V(4),
            W => W(4),
            X => X(4),
            Y => Y(4),
            Z => Z(4),
            invalid_input => invalid_input(4),
            bit_sequence => char,
            bit_count => bitCount,
            output => number(4)
        );
	
	-------------------------------------------------------------
	-- Begin Design Description of Gates and how to connect them
	-------------------------------------------------------------
	
	-- Create lookup table for letters
    A(0) <= '0';
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    A(4) <= '0';
    
    B(0) <= '1';
    B(1) <= '0';
    B(2) <= '0';
    B(3) <= '0';
    B(4) <= '0';
    
    C(0) <= '0';
    C(1) <= '1';
    C(2) <= '0';
    C(3) <= '0';
    C(4) <= '0';
    
    D(0) <= '1';
    D(1) <= '1';
    D(2) <= '0';
    D(3) <= '0';
    D(4) <= '0';
    
    E(0) <= '0';
    E(1) <= '0';
    E(2) <= '1';
    E(3) <= '0';
    E(4) <= '0';
    
    F(0) <= '1';
    F(1) <= '0';
    F(2) <= '1';
    F(3) <= '0';
    F(4) <= '0';
    
    G(0) <= '0';
    G(1) <= '1';
    G(2) <= '1';
    G(3) <= '0';
    G(4) <= '0';
    
    H(0) <= '1';
    H(1) <= '1';
    H(2) <= '1';
    H(3) <= '0';
    H(4) <= '0';
    
    I(0) <= '0';
    I(1) <= '0';
    I(2) <= '0';
    I(3) <= '1';
    I(4) <= '0';
    
    J(0) <= '1';
    J(1) <= '0';
    J(2) <= '0';
    J(3) <= '1';
    J(4) <= '0';
    
    K(0) <= '0';
    K(1) <= '1';
    K(2) <= '0';
    K(3) <= '1';
    K(4) <= '0';
    
    L(0) <= '1';
    L(1) <= '1';
    L(2) <= '0';
    L(3) <= '1';
    L(4) <= '0';
    
    M(0) <= '0';
    M(1) <= '0';
    M(2) <= '1';
    M(3) <= '1';
    M(4) <= '0';
    
    N(0) <= '1';
    N(1) <= '0';
    N(2) <= '1';
    N(3) <= '1';
    N(4) <= '0';
    
    O(0) <= '0';
    O(1) <= '1';
    O(2) <= '1';
    O(3) <= '1';
    O(4) <= '0';
    
    P(0) <= '1';
    P(1) <= '1';
    P(2) <= '1';
    P(3) <= '1';
    P(4) <= '0';
    
    Q(0) <= '0';
    Q(1) <= '0';
    Q(2) <= '0';
    Q(3) <= '0';
    Q(4) <= '1';
    
    R(0) <= '1';
    R(1) <= '0';
    R(2) <= '0';
    R(3) <= '0';
    R(4) <= '1';
    
    S(0) <= '0';
    S(1) <= '1';
    S(2) <= '0';
    S(3) <= '0';
    S(4) <= '1';
    
    T(0) <= '1';
    T(1) <= '1';
    T(2) <= '0';
    T(3) <= '0';
    T(4) <= '1';
    
    U(0) <= '0';
    U(1) <= '0';
    U(2) <= '1';
    U(3) <= '0';
    U(4) <= '1';
    
    V(0) <= '1';
    V(1) <= '0';
    V(2) <= '1';
    V(3) <= '0';
    V(4) <= '1';
    
    W(0) <= '0';
    W(1) <= '1';
    W(2) <= '1';
    W(3) <= '0';
    W(4) <= '1';
    
    X(0) <= '1';
    X(1) <= '1';
    X(2) <= '1';
    X(3) <= '0';
    X(4) <= '1';
    
    Y(0) <= '0';
    Y(1) <= '0';
    Y(2) <= '0';
    Y(3) <= '1';
    Y(4) <= '1';
    
    Z(0) <= '1';
    Z(1) <= '0';
    Z(2) <= '0';
    Z(3) <= '1';
    Z(4) <= '1';
    
    -- Create lookup value for invalid input
    invalid_input(0) <= '1';
    invalid_input(1) <= '1';
    invalid_input(2) <= '1';
    invalid_input(3) <= '1';
    invalid_input(4) <= '1';
 			 
end codeTranslator_a; -- .same name as the architecture