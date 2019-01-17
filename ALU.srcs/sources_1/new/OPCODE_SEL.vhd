----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 28.11.2018 15:47:32
-- Design Name:
-- Module Name: OPCODE_SEL - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OPCODE_SEL is
	Port( 	Button_0, Button_1, Button_2, Button_3 : in std_logic;

					OPCODE : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0')
			);
end OPCODE_SEL;

architecture Behavioral of OPCODE_SEL is
begin
	Opcode_Selection :	process(button_0, Button_1, Button_2, Button_3)
	begin
			if button_0 = '1' then
				OPCODE(0) <= '1';
			else
				OPCODE(0) <= '0';
			end if;

			if button_1 = '1' then
				OPCODE(1) <= '1';
			else
				OPCODE(1) <= '0';
			end if;

			if button_2 = '1' then
				OPCODE(2) <= '1';
			else
				OPCODE(2) <= '0';
			end if;

			if button_3 = '1' then
				OPCODE(3) <= '1';
			else
				OPCODE(3) <= '0';
			end if;
		end process Opcode_Selection;
end Behavioral;
