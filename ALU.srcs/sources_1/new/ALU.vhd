----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 26.11.2018 21:04:44
-- Design Name:
-- Module Name: ALU - Behavioral
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

entity ALU is
	Port(	A, B : in STD_LOGIC_VECTOR(7 downto 0);
			OPCODE : in STD_LOGIC_VECTOR(3 downto 0);

			Result : out STD_LOGIC_VECTOR(7 downto 0);
			Negative_Flag : out STD_LOGIC;
			Equal_Flag : out STD_LOGIC
		);
end ALU;

architecture Behavioral of ALU is

begin

	op_decoding: process(OPCODE, A, B)

	variable Temp_Result: signed(8 downto 0) := (others => '0');
	variable Temp_A: signed(8 downto 0) := (others => '0');
	variable Temp_B: signed(8 downto 0) := (others => '0');

	begin

		Temp_A := resize(signed(A), 9);
		Temp_B := resize(signed(B), 9);

		case OPCODE is
			when "0000" =>
			Temp_Result := Temp_A + Temp_B;

			when "0001" =>
			Temp_Result := Temp_A - Temp_B;

			when "0010" =>
			Temp_Result := Temp_B - Temp_A;

			when "0011" =>									--Zelf invullen
			Temp_Result := Temp_A - 1;

			when "0100" =>
			Temp_Result := Temp_A;

			when "0101" =>
			Temp_Result := Temp_B;

			when "0110" =>
			Temp_Result := -Temp_A;

			when "0111" =>
			Temp_Result := -Temp_B;

			when "1000" =>
			Temp_Result := Temp_A(7 downto 0) & '0';

			when "1001" =>
			Temp_Result := "00" & Temp_A(7 downto 1);

			when "1010" =>
			Temp_Result(7 downto 0) := Temp_A(7 downto 0)rol 1;
			temp_result(8) := Temp_Result(0);

			when "1011" =>
			Temp_Result(7 downto 0) := Temp_A(7 downto 0)ror 1;
			temp_result(8) := '0';

			when "1100" =>									--Zelf invullen
			Temp_Result := Temp_A + 1;

			when "1101" =>									--Zelf invullen
			Temp_Result := Temp_A AND Temp_B;

			when "1110" =>
			Temp_Result := (others => '0');

			when "1111" =>
			Temp_Result := (others => '1');

			when others =>
			Temp_Result := (others => '0');

		end case;

		if A = B then
			Equal_Flag <= '1';

		else
			Equal_Flag <= '0';
		end if;

		Negative_Flag <= temp_result(8);
		Result <= STD_LOGIC_VECTOR(Temp_Result(7 downto 0));

	end process;



end Behavioral;
