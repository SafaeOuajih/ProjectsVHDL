----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2019 10:47:45
-- Design Name: 
-- Module Name: detect impulsion - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-----------------------------------------------Ou méthode XOR ?
entity detec_impulsion is
    Port ( CLOCK : in std_logic;
           reset : in std_logic;
           bouton_1 : in STD_LOGIC;
           bouton_2 : in STD_LOGIC;
           bouton_3 : in STD_LOGIC;
           bouton_1s : out std_logic;
           bouton_2s : out std_logic;
           bouton_3s : out std_logic
          );
end detec_impulsion;

architecture Behavioral of detec_impulsion is
SIGNAL bouton_test2: std_logic;
SIGNAL bouton_test1 : std_logic;
SIGNAL bouton_test3 : std_logic;

signal cpt1 : unsigned ( 22 downto 0);
signal cpt2 : unsigned ( 22 downto 0);
signal cpt3 : unsigned ( 22 downto 0);

begin
process(CLOCK)
begin
IF (CLOCK'event AND CLOCK = '1') THEN
if ( reset = '1' ) then -- initialisation des compteurs
     bouton_1s <= '0';
     bouton_2s <= '0'; 
     bouton_3s <= '0';   
     cpt1 <= to_unsigned(0,23);
     cpt2 <= to_unsigned(0,23);
     cpt3 <= to_unsigned(0,23);  
else     
    cpt1 <= cpt1 + to_unsigned(1,23);  -- incrémentation du compteur 
    bouton_test1 <= bouton_1;     
    if ( (bouton_1 = '1' and  bouton_test1 = '0') or ( bouton_1 = '0' and  bouton_test1 = '1') ) then -- changement d'etat des boutons 
        cpt1 <= to_unsigned(0,23);   
    end if;   
    if( bouton_1 = '1' and cpt1 >= to_unsigned(3000000,23)) then      -- 30 ms comme temps de rebonds , clk à 10 ns donc c 3000000 période de clk   
        bouton_1s <= '1';
    elsif (( bouton_1 = '0' and cpt1 >= to_unsigned(3000000,23))) then
        bouton_1s <= '0';
    end if; 

    cpt2 <= cpt2 + to_unsigned(1,23);   -- on fait la meme chose pour les boutons 2 et 3
    bouton_test2 <= bouton_2;     
    if ( (bouton_2 = '1' and  bouton_test2 = '0') or ( bouton_2 = '0' and  bouton_test2 = '1') ) then 
        cpt2 <= to_unsigned(0,23);   
    end if;   
    if( bouton_2 = '1' and cpt2 >= to_unsigned(3000000,23)) then          
        bouton_2s <= '1';
    elsif (( bouton_2 = '0' and cpt2 >= to_unsigned(3000000,23))) then
        bouton_2s <= '0';
    end if;          
    
    cpt3 <= cpt3 + to_unsigned(1,23);  
    bouton_test3 <= bouton_3;     
    if ( (bouton_3 = '1' and  bouton_test3 = '0') or ( bouton_3 = '0' and  bouton_test3 = '1') ) then 
        cpt3 <= to_unsigned(0,23);   
    end if;   
    if( bouton_3 = '1' and cpt3 >= to_unsigned(3000000,23)) then          
        bouton_3s <= '1';
    elsif (( bouton_3 = '0' and cpt3 >= to_unsigned(3000000,23))) then
        bouton_3s <= '0';
    end if;                    
                         
                                          
end if;               
end if ;     
end process ;
end Behavioral;