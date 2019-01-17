----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2018 01:56:08
-- Design Name: 
-- Module Name: BCDto7SEG - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDto7SEG is
    Port ( 
		CA : out STD_LOGIC;
		CB : out STD_LOGIC;
		CC : out STD_LOGIC;
		CD : out STD_LOGIC;
		CE : out STD_LOGIC;
		CF : out STD_LOGIC;
		CG : out STD_LOGIC;
        
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC);
end BCDto7SEG;

architecture Behavioral of BCDto7SEG is
begin
	CA <= (A AND NOT (B OR C OR D)) OR ((A NOR B) AND C);
	CB <= C AND (A XOR B);
	CC <= B AND (A NOR C);
	CD <= (A AND NOT (B OR C OR D)) OR ((A NOR B) AND C) OR (A AND B AND C);
	CE <= ((A NOR B) AND C) OR A; 
	CF <= (A AND B) OR (B AND NOT C) OR (A AND (C NOR D)); 
	CG <= (A AND B AND C) OR NOT (B OR C OR D);
end Behavioral;
