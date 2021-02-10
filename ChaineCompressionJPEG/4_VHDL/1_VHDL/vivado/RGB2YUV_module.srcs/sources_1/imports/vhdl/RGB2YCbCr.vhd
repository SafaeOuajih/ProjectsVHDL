----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:
-- Design Name:
-- Module Name:
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY RGB2YCbCr is
  PORT (
    clk     : in  STD_LOGIC;
    i_data  : in  STD_LOGIC_VECTOR (23 downto 0);
    o_data  : out STD_LOGIC_VECTOR (23 downto 0);
    i_valid : in  STD_LOGIC;
    o_valid : out STD_LOGIC
  );
END RGB2YCbCr;

ARCHITECTURE Behavioral OF RGB2YCbCr IS
signal b : integer;
signal v : integer ;
signal r : integer ;
signal y : integer;
signal cb : integer;
signal cr : integer;
signal i_valid_z1 : std_logic;
signal i_valid_z2 : std_logic;
signal tmp : std_logic_vector(23 downto 0);
signal y2 : integer ;
signal cb2 : integer ;
signal cr2 : integer;


signal fact10 : integer :=9;
signal fact20 : integer  :=18;
signal fact30 : integer :=3;
signal fact11 : integer :=-5;
signal fact21 : integer :=-10;
signal fact31 : integer :=16;
signal fact12 : integer :=16;
signal fact22 : integer :=-13;
signal fact32 : integer  :=-2;

BEGIN



process(clk)
begin
if(rising_edge(clk))then     
     b <= to_integer(unsigned(i_data(23 downto 16)));
     v <= to_integer(unsigned(i_data(15 downto  8)));
     r <= to_integer(unsigned(i_data( 7 downto  0)));  
     
     i_valid_z1 <= i_valid;
   
     y  <= (( fact10 * r )+( fact20 * v )+( fact30 * b ))/32 ;
     cb <= ((( fact11 * r )+( fact21 * v )+( fact31 * b ))/32 ) +(128) ;
     cr <= ((( fact12 * r )+( fact22 * v )+( fact32 * b ))/32 ) +(128) ;
          i_valid_z2 <= i_valid_z1;
        
        
     if( y > 255) then
        y <= 255;
     else if( y <0) then 
        y<=0;              
     end if;
     end if;

     if( cb > 255) then
        cb <= 255;
     else if( cb <0) then 
        cb<=0;              
     end if;
     end if;
     
     if( cr > 255) then
        cr <= 255;
     else if( cr <0) then 
        cr<=0;              
     end if;
     end if;             

     tmp(7 downto 0)<=std_logic_vector(to_unsigned( y,8));
     tmp(15 downto 8)<=std_logic_vector(to_unsigned( cb,8));
     tmp(23 downto 16)<=std_logic_vector(to_unsigned( cr,8));
     
      o_valid<=i_valid_z2;
      o_data <= tmp;
end if;
end process;
END Behavioral;
