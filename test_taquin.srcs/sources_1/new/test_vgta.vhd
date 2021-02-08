----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2019 10:08:04
-- Design Name: 
-- Module Name: test_vgta - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_vgta is ---------- generer une image moitié blanche moitié noire pour tester
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; 
           ADDR : out STD_LOGIC_VECTOR (15 downto 0);
           data_in : out STD_LOGIC_vector (11 downto 0);
           data_write : out STD_LOGIC);
end test_vgta;

architecture Behavioral of test_vgta is
SIGNAL ADDR_2 : unsigned ( 15 downto 0);

begin
Process (clk)
begin
if ( reset = '1') then
    ADDR_2 <= to_unsigned(0,16);
else
    if (rising_edge(clk)) then
        if ( ADDR_2 <= to_unsigned(64000,16)) then
            if ( ADDR_2 <= to_unsigned(32000,16)) then
                 ADDR_2 <= ADDR_2 + to_unsigned(1,16);
                 data_in <= "111111111111";
             else
                 ADDR_2 <= ADDR_2 + to_unsigned(1,16);
                 data_in <= "000000000000";
            end if;

        else
            ADDR_2 <= to_unsigned(0,16);
        end if;
    end if;
end if;    
    data_write <= '1';
end Process;
ADDR <= std_logic_vector(ADDR_2);
end Behavioral;
