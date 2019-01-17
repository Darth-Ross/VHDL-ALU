----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 18.11.2018 16:28:07
-- Design Name:
-- Module Name: DisplayDriver - Behavioral
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

entity DisplayDriver is
    Port ( 	AN : out STD_LOGIC_VECTOR(3 downto 0);
			Display_Out	: out STD_LOGIC_VECTOR(6 downto 0);


			Display_IN0 : in STD_LOGIC_VECTOR(6 downto 0);
			Display_IN1 : in STD_LOGIC_VECTOR(6 downto 0);
			Display_IN2 : in STD_LOGIC_VECTOR(6 downto 0);
			Negative_Flag : in STD_LOGIC;

			CLK_IN : in STD_LOGIC);
end DisplayDriver;

architecture Behavioral of DisplayDriver is

signal CLK : STD_LOGIC;
signal counter : integer range 0 to 4000 := 0;
begin

	Multiplexer: process(CLK)

	variable Count : integer range 0 to 3;

	begin
		if rising_edge(CLK) then
			case count is
				when 0 =>
					AN <= "1110";
					Display_out <= Display_IN0;

				when 1 =>
					AN <= "1101";
					display_out <= Display_IN1;

				when 2 =>
					AN <= "1011";
					display_out <= Display_IN2;

				when 3 =>

					if Negative_Flag = '1' then
            AN <= "0111";
						display_out <= "0111111";
					else
            AN <= "1111";
						display_out <= "1111111";
					end if;

				when others =>
					AN <= "1111";
					count := 0;
			end case;


			count := count + 1;
			if count > 3 then
				count := 0;
			end if;

		end if;

	end process;

	Clock_divider: process(CLK_IN)

	begin
		if rising_edge(CLK_IN) then
			if(counter = 4000) then
				counter <= 0;
				CLK <= NOT(CLK);
		    else
			    counter <= counter + 1;
	        end if;
	    end if;
	end process;

end Behavioral;
