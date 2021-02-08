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

entity global_test is
    Port ( clk : in STD_LOGIC;
              VGA_hs       : out std_logic;   -- horizontal vga syncr.
    VGA_vs       : out std_logic;   -- vertical vga syncr.
    VGA_red      : out std_logic_vector(3 downto 0);   -- red output
    VGA_green    : out std_logic_vector(3 downto 0);   -- green output
    VGA_blue     : out std_logic_vector(3 downto 0);
  --   data_out     : out std_logic_vector (11 downto 0); --- bit_per_pixel = 12
       reset : in STD_LOGIC);

end global_test;

architecture Behavioral of global_test is
component test_vgta 
    Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC; 
       ADDR : out STD_LOGIC_VECTOR (15 downto 0);
       data_in : out STD_LOGIC_vector (11 downto 0);
       data_write : out STD_LOGIC);
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

SIGNAL data_write :  STD_LOGIC;
      
begin

inst1: test_vgta port map ( clk => clk,
                            reset => reset,
                            ADDR => ADDR,
                            data_in => data_in,
                            data_write => data_write
                            );
inst2: vga_bitmap_320x200
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
                         
end Behavioral;
