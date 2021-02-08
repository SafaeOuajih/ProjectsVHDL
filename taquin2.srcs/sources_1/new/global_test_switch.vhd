----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2019 10:14:50
-- Design Name: 
-- Module Name: global_test - Behavioral
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

entity global_test_switch is
    Port ( clk : in STD_LOGIC;
           VGA_hs: out std_logic;   -- horizontal vga syncr.
    VGA_vs       : out std_logic;   -- vertical vga syncr.
    VGA_red      : out std_logic_vector(3 downto 0);   -- red output
    VGA_green    : out std_logic_vector(3 downto 0);   -- green output
    VGA_blue     : out std_logic_vector(3 downto 0);
    bouton_1     : IN STD_LOGIC;
        bouton_2     : IN STD_LOGIC;
        bouton_3     : IN STD_LOGIC;
bouton_4     : IN STD_LOGIC;
bouton_5     : IN STD_LOGIC;
led1s : out std_logic;
led2s : out std_logic;
led3s : out std_logic;
led4s : out std_logic;
  --   data_out     : out std_logic_vector (11 downto 0); --- bit_per_pixel = 12
       reset : in STD_LOGIC);

end global_test_switch;

architecture Behavioral of global_test_switch is
component wav_rom 
PORT (
      CLOCK          : IN  STD_LOGIC;
      bouton_1         : IN STD_LOGIC;
      bouton_2         : IN STD_LOGIC;  
      bouton_3         : IN STD_LOGIC;
      bouton_4     : IN STD_LOGIC;
bouton_5     : IN STD_LOGIC;    
      reset   : IN STD_LOGIC;
      data_vga       : IN STD_LOGIC_VECTOR ( 11 downto 0);
      data_write     : out STD_LOGIC;
      ADDR           : out STD_LOGIC_VECTOR ( 15 downto 0);
      signal_led     : out std_logic ;
      data_in        : out STD_LOGIC_vector (0 downto 0)
      );
end component;

component FSM 
    Port ( clk : in STD_LOGIC; 
           reset : in STD_LOGIC;
           signal_led : in STD_LOGIC;
           bouton_1s : in STD_LOGIC;
           bouton_2s : in STD_LOGIC;
           bouton_3s : in STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC;
           led4 : out STD_LOGIC
           );
end component;

component detec_impulsion
Port ( CLOCK : in std_logic;
           reset : in std_logic;
           bouton_1 : in STD_LOGIC;
           bouton_2 : in STD_LOGIC;
           bouton_3 : in STD_LOGIC;
           bouton_1s : out std_logic;
           bouton_2s : out std_logic;
           bouton_3s : out std_logic
          );
end component ; 

component pixel_bit_modif
    Port ( data_in : in STD_LOGIC_VECTOR(0 downto 0);
       data_in_vga : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component vga_bitmap_320x200
generic(bit_per_pixel : integer range 1 to 12:=1;    -- number of bits per pixel
          grayscale     : boolean := false);           -- should data be displayed in grayscale
  port(clk          : in  std_logic;
     reset        : in  std_logic;
     VGA_hs       : out std_logic;   -- horizontal vga syncr.
     VGA_vs       : out std_logic;   -- vertical vga syncr.
     VGA_red      : out std_logic_vector(3 downto 0);   -- red output
     VGA_green    : out std_logic_vector(3 downto 0);   -- green output
     VGA_blue     : out std_logic_vector(3 downto 0);   -- blue output
   
     ADDR         : in  std_logic_vector(15 downto 0);
     data_in      : in  std_logic_vector (bit_per_pixel - 1 downto 0);
     data_write   : in  std_logic;
     data_out     : out std_logic_vector (bit_per_pixel - 1 downto 0));
end component;

SIGNAL ADDR : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL data_in :  STD_LOGIC_VECTOR(11 downto 0);
SIGNAL data_out :  STD_LOGIC_VECTOR(11 downto 0);
SIGNAL bouton_1s :  STD_LOGIC;
SIGNAL bouton_2s :  STD_LOGIC;
SIGNAL bouton_3s :  STD_LOGIC;
signal clignote : std_logic ; 
SIGNAL data_write :  STD_LOGIC;
SIGNAL data_in_pixel :  STD_LOGIC_VECTOR (0 downto 0);

signal signal_led : std_logic ;
begin

inst1: wav_rom port map ( CLOCK => clk,
                            bouton_1 => bouton_1s,
                            bouton_2 => bouton_2s,
                            bouton_3 => bouton_3s,
                            bouton_4 => bouton_4,
                            bouton_5 => bouton_5,
                            reset => reset,
                            ADDR => ADDR,
                            data_vga => data_out,
                            data_write => data_write,
                            signal_led  => signal_led,
                            data_in =>  data_in_pixel
                            );
inst2: pixel_bit_modif port map ( data_in => data_in_pixel ,
                                  data_in_vga => data_in
                                  );
inst4: detec_impulsion     Port map ( CLOCK => clk ,
           reset => reset ,
           bouton_1 => bouton_1, 
           bouton_2 => bouton_2,
           bouton_3 => bouton_3,
           bouton_1s => bouton_1s, 
           bouton_2s => bouton_2s,
           bouton_3s => bouton_3s );
 
inst3: vga_bitmap_320x200
                    generic map (bit_per_pixel => 12) 
                          port map ( clk => clk,
                                     reset => reset,
                                     VGA_hs => VGA_hs,
                                     VGA_vs => VGA_vs,
                                     VGA_red => VGA_red,
                                     VGA_green => VGA_green,
                                     VGA_blue => VGA_blue,
                                     ADDR => ADDR,
                                     data_in => data_in,
                                     data_write => data_write,
                                     data_out => data_out
                                     );

inst6 : FSM
    Port map ( clk => clk,
           reset => reset,
           signal_led => signal_led,
           bouton_1s => bouton_1s,
           bouton_2s => bouton_2s,
           bouton_3s => bouton_3s,
           led1 => led1s,
           led2 => led2s,
           led3 => led3s,
           led4 => led4s
           );                             
end Behavioral;