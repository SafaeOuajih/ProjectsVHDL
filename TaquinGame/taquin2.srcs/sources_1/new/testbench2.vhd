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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

component rom_t
PORT (
      CLOCK            : IN  STD_LOGIC;
      bouton_1         : IN STD_LOGIC;
bouton_2       : IN STD_LOGIC;
bouton_3       : IN STD_LOGIC;
bouton_4       : IN STD_LOGIC;
bouton_5       : IN STD_LOGIC;

      reset            : IN STD_LOGIC;
      data_vga         : IN STD_LOGIC_VECTOR ( 11 downto 0);
      data_write     : out STD_LOGIC;
      ADDR           : out STD_LOGIC_VECTOR ( 15 downto 0);
      data_in        : inout STD_LOGIC_vector (0 downto 0);
      data_in2        : out STD_LOGIC_vector (0 downto 0);

      x : inout integer;
      signal_led :out  std_logic ;
            y : inout integer

      );
END component;

SIGNAL clk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL bouton_1 : STD_LOGIC;
SIGNAL bouton_2 : STD_LOGIC;
SIGNAL bouton_3 : STD_LOGIC;
SIGNAL bouton_4 : STD_LOGIC;
SIGNAL bouton_5 : STD_LOGIC;

SIGNAL data_vga : STD_LOGIC_vector( 11 downto 0);
SIGNAL data_write : STD_LOGIC;
SIGNAL ADDR : STD_LOGIC_VECTOR ( 15 downto 0);
SIGNAL data_in : STD_LOGIC_vector(0 downto 0);
SIGNAL data_in2 : STD_LOGIC_vector(0 downto 0);
signal signal_led : std_logic ;
signal x : integer ;
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
            data_vga <= "000000000000";
            wait for 17 ns;
            reset <= '0';
            wait;
         end Process;
      Process
        begin
           bouton_1 <= '0';
           bouton_2 <= '0';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
            wait for 200 us ;
           bouton_1 <= '1';
           bouton_2 <= '0';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait for 2000us ;
           bouton_1 <= '0';
           bouton_2 <= '0';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait for 1700us ;
           bouton_1 <= '0';
           bouton_2 <= '1';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait for 1500us ;
           bouton_1 <= '0';
           bouton_2 <= '0';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait for 1500us ;
           bouton_1 <= '0';
           bouton_2 <= '1';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait for 1500us ;
           bouton_1 <= '0';
           bouton_2 <= '0';
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait for 1500us ;
           bouton_1 <= '0';
           bouton_2 <= '0'; 
           bouton_3 <= '0';
           bouton_4 <= '0';
           bouton_5 <= '0';
           wait;                      
           end Process;

inst1: rom_t port map (CLOCK=>clk,
                         reset=> reset,
                         bouton_1 => bouton_1 ,
                         bouton_2 => bouton_2 ,
                         bouton_3 => bouton_3 ,
                         bouton_4 => bouton_4 ,
                         bouton_5 => bouton_5 ,
                         data_vga => data_vga , 
                         data_write => data_write ,
                         ADDR => ADDR , 
                         data_in => data_in ,
                         data_in2 => data_in2 , 
 
                         x => x ,
                         signal_led => signal_led ,
                         y => y 
                         
                                   );           
           
end Behavioral;
