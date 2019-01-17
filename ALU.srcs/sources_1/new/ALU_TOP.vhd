----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 28.11.2018 13:00:19
-- Design Name:
-- Module Name: ALU_TOP - Behavioral
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

entity ALU_TOP is
	Port(	A_IN, B_IN : in STD_LOGIC_VECTOR(7 downto 0);
				CLK_INPUT, BUTTON0, BUTTON1, BUTTON2, BUTTON3 : in STD_LOGIC;

				Equal_Flag_LED : out STD_LOGIC;
				Negative_Flag_LED : out STD_LOGIC;
				OPCODE_LEDS : out STD_LOGIC_VECTOR(3 downto 0);
				Display_Select : out STD_LOGIC_VECTOR(3 downto 0);
				Display_Output	: out STD_LOGIC_VECTOR(6 downto 0)
		);
end ALU_TOP;

architecture Behavioral of ALU_TOP is

signal ALU_OPCODE : STD_LOGIC_VECTOR(3 downto 0);
signal ALU_Result : STD_LOGIC_VECTOR(7 downto 0);
signal AlU_Negative_Flag, ALU_Equal_Flag : STD_LOGIC;

signal BCD_O, BCD_T, BCD_H : STD_LOGIC_VECTOR(3 downto 0);

signal a0, b0, c0, d0, e0, f0, g0 : STD_LOGIC;
signal a1, b1, c1, d1, e1, f1, g1 : STD_LOGIC;
signal a2, b2, c2, d2, e2, f2, g2 : STD_LOGIC;

begin

	ALU0: 	entity work.ALU(Behavioral)
	port map(	A => A_IN,
						B => B_IN,
						OPCODE => ALU_OPCODE,

						Result => ALU_Result,
						Negative_Flag => ALU_Negative_Flag,
						Equal_Flag => ALU_Equal_Flag
					);

	BinToBCD0: 	entity work.BinToBCD(Behavioral)
	port map(	BIN_in => ALU_Result,

						BCD_Ones => BCD_O,
						BCD_Tens => BCD_T,
						BCD_Hundreds => BCD_H
					);

	BCDto7SEG0 : entity work.BCDto7SEG(Behavioral)
	port map(	CA => a0,
						CB => b0,
						CC => c0,
						CD => d0,
						CE => e0,
						CF => f0,
						CG => g0,

						A => BCD_O(0),
						B => BCD_O(1),
						C => BCD_O(2),
						D => BCD_O(3)
					);

	BCDto7SEG1 : entity work.BCDto7SEG(Behavioral)
	port map(	CA => a1,
						CB => b1,
						CC => c1,
						CD => d1,
						CE => e1,
						CF => f1,
						CG => g1,

						A => BCD_T(0),
						B => BCD_T(1),
						C => BCD_T(2),
						D => BCD_T(3)
					);

		BCDto7SEG2 : entity work.BCDto7SEG(Behavioral)
		port map(	CA => a2,
							CB => b2,
							CC => c2,
							CD => d2,
							CE => e2,
							CF => f2,
							CG => g2,

							A => BCD_H(0),
							B => BCD_H(1),
							C => BCD_H(2),
							D => BCD_H(3)
						);

	Display_D : entity work.DisplayDriver(Behavioral)
		port map(	AN(0) => Display_select(0),
							AN(1) => Display_select(1),
							AN(2) => Display_select(2),
							AN(3) => Display_select(3),

							Display_Out(0) => Display_Output(0),
							Display_Out(1) => Display_Output(1),
							Display_Out(2) => Display_Output(2),
							Display_Out(3) => Display_Output(3),
							Display_Out(4) => Display_Output(4),
							Display_Out(5) => Display_Output(5),
							Display_Out(6) => Display_Output(6),

							Display_IN0(0) => a0,
							Display_IN0(1) => b0,
							Display_IN0(2) => c0,
							Display_IN0(3) => d0,
							Display_IN0(4) => e0,
							Display_IN0(5) => f0,
							Display_IN0(6) => g0,

							Display_IN1(0) => a1,
							Display_IN1(1) => b1,
							Display_IN1(2) => c1,
							Display_IN1(3) => d1,
							Display_IN1(4) => e1,
							Display_IN1(5) => f1,
							Display_IN1(6) => g1,

							Display_IN2(0) => a2,
							Display_IN2(1) => b2,
							Display_IN2(2) => c2,
							Display_IN2(3) => d2,
							Display_IN2(4) => e2,
							Display_IN2(5) => f2,
							Display_IN2(6) => g2,

							Negative_Flag => ALU_Negative_Flag,
							CLK_IN => CLK_INPUT
						);

OPCODE_SEL0 : entity work.OPCODE_SEL(Behavioral)
		port map(	Button_0 => BUTTON0,
							Button_1 => BUTTON1,
							Button_2 => BUTTON2,
							Button_3 => BUTTON3,

							OPCODE => ALU_OPCODE
						);

						Equal_Flag_LED <= ALU_Equal_Flag;
						Negative_Flag_LED <= AlU_Negative_Flag;
						OPCODE_LEDS <= ALU_OPCODE;
end Behavioral;
