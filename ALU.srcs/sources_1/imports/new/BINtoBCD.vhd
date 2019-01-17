----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 12.11.2018 22:57:29
-- Design Name:
-- Module Name: BintoBCD - Behavioral
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
use IEEE.numeric_std.all;

entity BintoBCD is
    Port (  BIN_in : IN STD_LOGIC_VECTOR (7 downto 0);

			      BCD_Ones : OUT STD_LOGIC_VECTOR (3 downto 0);
            BCD_Tens : OUT STD_LOGIC_VECTOR (3 downto 0);
            BCD_Hundreds : OUT  STD_LOGIC_VECTOR (3 downto 0)
		     );
end BintoBCD;

architecture Behavioral of BintoBCD is
begin
	BCD_Conversion : process (BIN_IN)
        variable BCD : Unsigned (11 downto 0) := (others => '0');
        Variable Bin_Temp : STD_LOGIC_VECTOR(7 downto 0);

	begin

    Bin_Temp := BIN_in;
    BCD := (others => '0');

    for i in 0 to 7 loop
      if BCD (3 downto 0) > 4 then
        BCD(3 downto 0):= BCD(3 downto 0) + 3;
      end if;

      if BCD (7 downto 4) > 4 then
        BCD(7 downto 4) := BCD(7 downto 4) + 3;
      end if;

      if BCD (11 downto 8) > 4 then
        BCD(11 downto 8) := BCD(11 downto 8) + 3;
      end if;

      BCD := BCD(10 downto 0) &  Bin_Temp(7);
      Bin_Temp := Bin_Temp(6 downto 0) & '0';

    end loop;

    BCD_Ones <= STD_LOGIC_VECTOR(BCD(3 downto 0));
    BCD_Tens <= STD_LOGIC_VECTOR(BCD(7 downto 4));
    BCD_Hundreds <= STD_LOGIC_VECTOR(BCD(11 downto 8));

	end process BCD_Conversion;
end Behavioral;
