----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 12:25:50
-- Design Name: 
-- Module Name: pixel_bit_modif - Behavioral
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

entity pixel_bit_modif is
    Port ( data_in : in STD_LOGIC_VECTOR (0 downto 0);
           data_in_vga : out STD_LOGIC_VECTOR (11 downto 0));
end pixel_bit_modif;

architecture Behavioral of pixel_bit_modif is

begin
Process (data_in)
begin
    if (data_in = "0") then 
        data_in_vga <= "000000000000";
    else
        data_in_vga <= "111111111111";
    end if;
end Process;
end Behavioral;
