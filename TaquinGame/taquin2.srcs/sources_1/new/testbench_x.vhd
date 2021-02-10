----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2019 10:18:05
-- Design Name: 
-- Module Name: testbench - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench_x is
--  Port ( );
end testbench_x;

architecture Behavioral of testbench_x is

component impuls2
    Port ( CLOCK : in std_logic;
           reset : in std_logic;
           bouton_1 : in STD_LOGIC;
           bouton_1s : out std_logic
          );
END component;

SIGNAL clk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL bouton_1 : STD_LOGIC;
SIGNAL bouton_1s : STD_LOGIC;

--SIGNAL data_in2 : STD_LOGIC_vector(0 downto 0);

signal x_2 : integer ;
signal y : integer ;

signal ADDR_W : unsigned (15 DOWNTO 0);

begin

    Process
        begin
            clk <='1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
        end Process;
     Process
        begin
            reset <= '1';
            wait for 17 ns;
            reset <= '0';
            wait;
         end Process;
      Process
        begin
           bouton_1 <= '0';
            wait for 20 ns ;
           bouton_1 <= '1';
           wait for 20 ns;
           bouton_1 <= '0';
            wait for 20 ns ;
           bouton_1 <= '1';
           wait for 20 ns;
           bouton_1 <= '0';
            wait for 20 ns ;
           bouton_1 <= '1';
            wait for 3ms ;
           bouton_1 <= '0';
            wait for 20 ns ;
           bouton_1 <= '1';
           wait for 20 ns;
           bouton_1 <= '0';
            wait for 20 ns ;
           bouton_1 <= '1';
           wait for 20 ns;
           bouton_1 <= '0';
           wait;                                                                  
           end Process;

inst1: impuls2 port map (CLOCK=>clk,
                        reset => reset ,
                        bouton_1 => bouton_1,
                        bouton_1s => bouton_1s 

                                   );           
           
end Behavioral;
