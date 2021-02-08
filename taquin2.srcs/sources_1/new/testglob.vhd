----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2020 22:33:43
-- Design Name: 
-- Module Name: testglob - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testfsm is
--  Port ( );
end testfsm;

architecture Behavioral of testfsm is
component FSM
    Port ( clk : in STD_LOGIC; ----------------------------------------- passage de game_on à game_over est piloté par un signal de comparaison (après)
           reset : in STD_LOGIC;
           signal_led :  in STD_LOGIC;
           bouton_1s : in STD_LOGIC;
           bouton_2s : in STD_LOGIC;
           bouton_3s : in STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC;
           led4 : out STD_LOGIC
           );

end component;
          signal led1 :  STD_LOGIC;
          signal led2 :  STD_LOGIC;
          signal led3 :  STD_LOGIC;
          signal led4 :  STD_LOGIC;
signal    bouton_1s     :  STD_LOGIC;
signal        bouton_2s     :  STD_LOGIC;
signal        bouton_3s     :  STD_LOGIC;
signal reset :  STD_LOGIC;
signal signal_led :  STD_LOGIC;
signal clk :  STD_LOGIC;

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
           bouton_1s <= '0';
           bouton_2s <= '0';
           bouton_3s <= '0';
           signal_led <= '0';
            wait for 200 us ;
           bouton_1s <= '0';
           bouton_2s <= '0';
           bouton_3s <= '0';
           signal_led <= '0';
           wait for 2000us ;
           bouton_1s <= '1';
           bouton_2s <= '0';
           bouton_3s <= '0';
           signal_led <= '0';
           wait for 1700us ;
           bouton_1s <= '0';
           bouton_2s <= '0';
           bouton_3s <= '0';
           signal_led <= '0';
           wait for 1500us ;
           bouton_1s <= '0';
           bouton_2s <= '0';
           bouton_3s <= '1';
           signal_led <= '0';
           wait for 1700us ;
           bouton_1s <= '0';
           bouton_2s <= '0';
           bouton_3s <= '0';
           signal_led <= '0';
           wait for 1500us ;
           bouton_1s <= '0';
           bouton_2s <= '0';
           bouton_3s <= '0';
           signal_led <= '1';
           wait;                      
           end Process;
inst1 : FSM
    Port map ( clk => clk,----------------------------------------- passage de game_on à game_over est piloté par un signal de comparaison (après)
           reset => reset,
           signal_led => signal_led,
           bouton_1s => bouton_1s,
           bouton_2s => bouton_2s,
           bouton_3s => bouton_3s,
           led1 => led1,
           led2 => led2,
           led3 => led3,
           led4 => led4
           );
end Behavioral;
