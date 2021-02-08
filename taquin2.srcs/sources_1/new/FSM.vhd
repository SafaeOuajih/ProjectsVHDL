----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2019 11:23:16
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
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
end FSM;

architecture Behavioral of FSM is

type etats is (init, game_off, game_on , game_over ); 
SIGNAL etat_f: etats;
SIGNAL  etat_c: etats;

begin
    reg: Process(clk)
        begin
            if ( clk'event and clk='1') then
                if (reset ='1') then
                      etat_c <= game_off;
                 else
                       etat_c <= etat_f ;
                 end if;
             end if;
        end Process;
    f: Process ( bouton_1s, bouton_2s, bouton_3s, etat_c)
        begin
            case etat_c is
            when game_off => if ( reset = '0' and bouton_1s = '1') then  -- le joueur ne joue pas
                                etat_f <= init;
                             else  
                                etat_f <= game_off;
                             end if;            
            when init => if (bouton_1s ='0' and ( bouton_2s ='1' or bouton_3s ='1')) then -- affichage de l'image initiale
                        etat_f <= game_on;
                        else  
                        etat_f <= init;
                        end if;
            when game_on => if ( reset = '1' ) then -- le joueur est en train de jouer
                                 etat_f <= game_off;
                            elsif (bouton_1s = '1') then 
                                 etat_f <= init;  
                            elsif (signal_led = '1') then 
                                 etat_f <= game_over;                                    
                            else 
                                 etat_f <= game_on;
                            end if;

            when game_over => if ( reset = '1' ) then --- le joueur a gagné
                                etat_f <= game_off;
                             elsif (  bouton_2s ='1' or bouton_3s ='1' ) then 
                                etat_f <= game_on; 
                             elsif (  bouton_1s ='1' ) then 
                                etat_f <= init;                                
                             else 
                                etat_f <= game_over;
                             end if;                             
             end case;
        end Process;
    g : Process (etat_c, bouton_1s, bouton_2s, bouton_3s)
        begin
            case etat_c is
                when init =>    led1 <= '0';
                                led2 <= '1';
                                led3 <= '0';
                                led4 <= '0';
                when game_on => led1 <= '0';
                                led2 <= '0';
                                led3 <= '1';
                                led4 <= '0';
                when game_off =>led1 <= '1';
                                led2 <= '0';
                                led3 <= '0';
                                led4 <= '0';
                when game_over =>led1 <= '0';
                                led2 <= '0';
                                led3 <= '0';
                                led4 <= '1';                                

            end case;
        end Process;
                                                                                 
end Behavioral;