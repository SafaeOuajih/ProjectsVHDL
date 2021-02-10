-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity my_module_do_action is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    e_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    e_empty_n : IN STD_LOGIC;
    e_read : OUT STD_LOGIC;
    s_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    s_full_n : IN STD_LOGIC;
    s_write : OUT STD_LOGIC );
end;


architecture behav of my_module_do_action is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (18 downto 0) := "0000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (18 downto 0) := "0000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (18 downto 0) := "0000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (18 downto 0) := "0000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (18 downto 0) := "0000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (18 downto 0) := "0000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (18 downto 0) := "0001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (18 downto 0) := "0010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (18 downto 0) := "0100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (18 downto 0) := "1000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_12 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010010";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_FFFFFFF9 : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111001";
    constant ap_const_lv32_3E8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001111101000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal e_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000010";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal s_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state19 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state19 : signal is "none";
    signal tmp_5_reg_99 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_77_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_reg_104 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp9_fu_83_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp9_reg_109 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_fu_92_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_71_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_71_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_92_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_92_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_92_ap_start : STD_LOGIC;
    signal grp_fu_92_ap_done : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (18 downto 0);

    component my_module_sdiv_12bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        start : IN STD_LOGIC;
        done : OUT STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    my_module_sdiv_12bkb_U1 : component my_module_sdiv_12bkb
    generic map (
        ID => 1,
        NUM_STAGE => 16,
        din0_WIDTH => 12,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        start => grp_fu_92_ap_start,
        done => grp_fu_92_ap_done,
        din0 => grp_fu_92_p0,
        din1 => grp_fu_92_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_92_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state2;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                tmp9_reg_109 <= tmp9_fu_83_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((e_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                tmp_5_reg_99 <= e_dout;
                    tmp_reg_104(31 downto 1) <= tmp_fu_77_p2(31 downto 1);
            end if;
        end if;
    end process;
    tmp_reg_104(0) <= '1';

    ap_NS_fsm_assign_proc : process (e_empty_n, s_full_n, ap_CS_fsm, ap_CS_fsm_state2, ap_CS_fsm_state19)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state2 => 
                if (((e_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                if (((s_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state19))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state19;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state19 <= ap_CS_fsm(18);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    e_blk_n_assign_proc : process(e_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            e_blk_n <= e_empty_n;
        else 
            e_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    e_read_assign_proc : process(e_empty_n, ap_CS_fsm_state2)
    begin
        if (((e_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            e_read <= ap_const_logic_1;
        else 
            e_read <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_92_ap_start_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_92_ap_start <= ap_const_logic_1;
        else 
            grp_fu_92_ap_start <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_92_p0 <= ap_const_lv32_3E8(12 - 1 downto 0);
    grp_fu_92_p1 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(tmp9_reg_109));

    s_blk_n_assign_proc : process(s_full_n, ap_CS_fsm_state19)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state19)) then 
            s_blk_n <= s_full_n;
        else 
            s_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_din <= grp_fu_92_p2;

    s_write_assign_proc : process(s_full_n, ap_CS_fsm_state19)
    begin
        if (((s_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state19))) then 
            s_write <= ap_const_logic_1;
        else 
            s_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp9_fu_83_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(tmp_5_reg_99) * signed(tmp_reg_104))), 32));
    tmp_4_fu_71_p0 <= e_dout;
    tmp_4_fu_71_p2 <= std_logic_vector(shift_left(unsigned(tmp_4_fu_71_p0),to_integer(unsigned('0' & ap_const_lv32_1(31-1 downto 0)))));
    tmp_fu_77_p2 <= std_logic_vector(signed(ap_const_lv32_FFFFFFF9) + signed(tmp_4_fu_71_p2));
end behav;