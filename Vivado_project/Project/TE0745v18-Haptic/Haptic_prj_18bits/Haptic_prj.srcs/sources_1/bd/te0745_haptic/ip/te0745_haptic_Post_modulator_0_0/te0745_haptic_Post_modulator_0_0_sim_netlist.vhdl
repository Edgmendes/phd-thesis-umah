-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Thu Nov  9 14:40:57 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top te0745_haptic_Post_modulator_0_0 -prefix
--               te0745_haptic_Post_modulator_0_0_ te0745_haptic_Post_modulator_0_0_sim_netlist.vhdl
-- Design      : te0745_haptic_Post_modulator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity te0745_haptic_Post_modulator_0_0_Post_modulator is
  port (
    signal_out : out STD_LOGIC_VECTOR ( 247 downto 0 );
    reset : in STD_LOGIC;
    resync : in STD_LOGIC;
    clk : in STD_LOGIC;
    n_cycles_on : in STD_LOGIC_VECTOR ( 31 downto 0 );
    enable : in STD_LOGIC;
    signal_in : in STD_LOGIC_VECTOR ( 247 downto 0 )
  );
end te0745_haptic_Post_modulator_0_0_Post_modulator;

architecture STRUCTURE of te0745_haptic_Post_modulator_0_0_Post_modulator is
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal en_reg : STD_LOGIC;
  signal flag_mask : STD_LOGIC;
  signal \flag_mask0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__0_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__0_n_1\ : STD_LOGIC;
  signal \flag_mask0_carry__0_n_2\ : STD_LOGIC;
  signal \flag_mask0_carry__0_n_3\ : STD_LOGIC;
  signal \flag_mask0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \flag_mask0_carry__1_n_1\ : STD_LOGIC;
  signal \flag_mask0_carry__1_n_2\ : STD_LOGIC;
  signal \flag_mask0_carry__1_n_3\ : STD_LOGIC;
  signal flag_mask0_carry_i_1_n_0 : STD_LOGIC;
  signal flag_mask0_carry_i_2_n_0 : STD_LOGIC;
  signal flag_mask0_carry_i_3_n_0 : STD_LOGIC;
  signal flag_mask0_carry_i_4_n_0 : STD_LOGIC;
  signal flag_mask0_carry_n_0 : STD_LOGIC;
  signal flag_mask0_carry_n_1 : STD_LOGIC;
  signal flag_mask0_carry_n_2 : STD_LOGIC;
  signal flag_mask0_carry_n_3 : STD_LOGIC;
  signal flag_mask_i_1_n_0 : STD_LOGIC;
  signal n_cycles_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal resync_reg : STD_LOGIC;
  signal s_in : STD_LOGIC_VECTOR ( 247 downto 0 );
  signal \s_out[247]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_flag_mask0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_flag_mask0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_flag_mask0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_flag_mask0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
\counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => reset,
      I1 => resync_reg,
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2_n_0\,
      CO(2) => \counter_reg[0]_i_2_n_1\,
      CO(1) => \counter_reg[0]_i_2_n_2\,
      CO(0) => \counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2_n_4\,
      O(2) => \counter_reg[0]_i_2_n_5\,
      O(1) => \counter_reg[0]_i_2_n_6\,
      O(0) => \counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[28]_i_1_n_1\,
      CO(1) => \counter_reg[28]_i_1_n_2\,
      CO(0) => \counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[28]_i_1_n_4\,
      O(2) => \counter_reg[28]_i_1_n_5\,
      O(1) => \counter_reg[28]_i_1_n_6\,
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => counter_reg(31 downto 28)
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_6\,
      Q => counter_reg(29),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_5\,
      Q => counter_reg(30),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[28]_i_1_n_4\,
      Q => counter_reg(31),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1_n_0\
    );
en_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => enable,
      Q => en_reg,
      R => reset
    );
flag_mask0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => flag_mask0_carry_n_0,
      CO(2) => flag_mask0_carry_n_1,
      CO(1) => flag_mask0_carry_n_2,
      CO(0) => flag_mask0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_flag_mask0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => flag_mask0_carry_i_1_n_0,
      S(2) => flag_mask0_carry_i_2_n_0,
      S(1) => flag_mask0_carry_i_3_n_0,
      S(0) => flag_mask0_carry_i_4_n_0
    );
\flag_mask0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => flag_mask0_carry_n_0,
      CO(3) => \flag_mask0_carry__0_n_0\,
      CO(2) => \flag_mask0_carry__0_n_1\,
      CO(1) => \flag_mask0_carry__0_n_2\,
      CO(0) => \flag_mask0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_flag_mask0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \flag_mask0_carry__0_i_1_n_0\,
      S(2) => \flag_mask0_carry__0_i_2_n_0\,
      S(1) => \flag_mask0_carry__0_i_3_n_0\,
      S(0) => \flag_mask0_carry__0_i_4_n_0\
    );
\flag_mask0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(21),
      I1 => n_cycles_reg(21),
      I2 => n_cycles_reg(23),
      I3 => counter_reg(23),
      I4 => n_cycles_reg(22),
      I5 => counter_reg(22),
      O => \flag_mask0_carry__0_i_1_n_0\
    );
\flag_mask0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(18),
      I1 => n_cycles_reg(18),
      I2 => n_cycles_reg(20),
      I3 => counter_reg(20),
      I4 => n_cycles_reg(19),
      I5 => counter_reg(19),
      O => \flag_mask0_carry__0_i_2_n_0\
    );
\flag_mask0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(15),
      I1 => n_cycles_reg(15),
      I2 => n_cycles_reg(17),
      I3 => counter_reg(17),
      I4 => n_cycles_reg(16),
      I5 => counter_reg(16),
      O => \flag_mask0_carry__0_i_3_n_0\
    );
\flag_mask0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(12),
      I1 => n_cycles_reg(12),
      I2 => n_cycles_reg(14),
      I3 => counter_reg(14),
      I4 => n_cycles_reg(13),
      I5 => counter_reg(13),
      O => \flag_mask0_carry__0_i_4_n_0\
    );
\flag_mask0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \flag_mask0_carry__0_n_0\,
      CO(3) => \NLW_flag_mask0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \flag_mask0_carry__1_n_1\,
      CO(1) => \flag_mask0_carry__1_n_2\,
      CO(0) => \flag_mask0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_flag_mask0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \flag_mask0_carry__1_i_1_n_0\,
      S(1) => \flag_mask0_carry__1_i_2_n_0\,
      S(0) => \flag_mask0_carry__1_i_3_n_0\
    );
\flag_mask0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => counter_reg(30),
      I1 => n_cycles_reg(30),
      I2 => counter_reg(31),
      I3 => n_cycles_reg(31),
      O => \flag_mask0_carry__1_i_1_n_0\
    );
\flag_mask0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(27),
      I1 => n_cycles_reg(27),
      I2 => n_cycles_reg(29),
      I3 => counter_reg(29),
      I4 => n_cycles_reg(28),
      I5 => counter_reg(28),
      O => \flag_mask0_carry__1_i_2_n_0\
    );
\flag_mask0_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(24),
      I1 => n_cycles_reg(24),
      I2 => n_cycles_reg(26),
      I3 => counter_reg(26),
      I4 => n_cycles_reg(25),
      I5 => counter_reg(25),
      O => \flag_mask0_carry__1_i_3_n_0\
    );
flag_mask0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(9),
      I1 => n_cycles_reg(9),
      I2 => n_cycles_reg(11),
      I3 => counter_reg(11),
      I4 => n_cycles_reg(10),
      I5 => counter_reg(10),
      O => flag_mask0_carry_i_1_n_0
    );
flag_mask0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(6),
      I1 => n_cycles_reg(6),
      I2 => n_cycles_reg(8),
      I3 => counter_reg(8),
      I4 => n_cycles_reg(7),
      I5 => counter_reg(7),
      O => flag_mask0_carry_i_2_n_0
    );
flag_mask0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(3),
      I1 => n_cycles_reg(3),
      I2 => n_cycles_reg(5),
      I3 => counter_reg(5),
      I4 => n_cycles_reg(4),
      I5 => counter_reg(4),
      O => flag_mask0_carry_i_3_n_0
    );
flag_mask0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => counter_reg(0),
      I1 => n_cycles_reg(0),
      I2 => n_cycles_reg(2),
      I3 => counter_reg(2),
      I4 => n_cycles_reg(1),
      I5 => counter_reg(1),
      O => flag_mask0_carry_i_4_n_0
    );
flag_mask_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => resync_reg,
      I1 => \flag_mask0_carry__1_n_1\,
      I2 => flag_mask,
      O => flag_mask_i_1_n_0
    );
flag_mask_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => flag_mask_i_1_n_0,
      Q => flag_mask,
      R => reset
    );
\n_cycles_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(0),
      Q => n_cycles_reg(0),
      R => reset
    );
\n_cycles_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(10),
      Q => n_cycles_reg(10),
      R => reset
    );
\n_cycles_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(11),
      Q => n_cycles_reg(11),
      R => reset
    );
\n_cycles_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(12),
      Q => n_cycles_reg(12),
      R => reset
    );
\n_cycles_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(13),
      Q => n_cycles_reg(13),
      R => reset
    );
\n_cycles_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(14),
      Q => n_cycles_reg(14),
      R => reset
    );
\n_cycles_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(15),
      Q => n_cycles_reg(15),
      R => reset
    );
\n_cycles_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(16),
      Q => n_cycles_reg(16),
      R => reset
    );
\n_cycles_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(17),
      Q => n_cycles_reg(17),
      R => reset
    );
\n_cycles_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(18),
      Q => n_cycles_reg(18),
      R => reset
    );
\n_cycles_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(19),
      Q => n_cycles_reg(19),
      R => reset
    );
\n_cycles_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(1),
      Q => n_cycles_reg(1),
      R => reset
    );
\n_cycles_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(20),
      Q => n_cycles_reg(20),
      R => reset
    );
\n_cycles_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(21),
      Q => n_cycles_reg(21),
      R => reset
    );
\n_cycles_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(22),
      Q => n_cycles_reg(22),
      R => reset
    );
\n_cycles_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(23),
      Q => n_cycles_reg(23),
      R => reset
    );
\n_cycles_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(24),
      Q => n_cycles_reg(24),
      R => reset
    );
\n_cycles_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(25),
      Q => n_cycles_reg(25),
      R => reset
    );
\n_cycles_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(26),
      Q => n_cycles_reg(26),
      R => reset
    );
\n_cycles_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(27),
      Q => n_cycles_reg(27),
      R => reset
    );
\n_cycles_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(28),
      Q => n_cycles_reg(28),
      R => reset
    );
\n_cycles_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(29),
      Q => n_cycles_reg(29),
      R => reset
    );
\n_cycles_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(2),
      Q => n_cycles_reg(2),
      R => reset
    );
\n_cycles_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(30),
      Q => n_cycles_reg(30),
      R => reset
    );
\n_cycles_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(31),
      Q => n_cycles_reg(31),
      R => reset
    );
\n_cycles_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(3),
      Q => n_cycles_reg(3),
      R => reset
    );
\n_cycles_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(4),
      Q => n_cycles_reg(4),
      R => reset
    );
\n_cycles_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(5),
      Q => n_cycles_reg(5),
      R => reset
    );
\n_cycles_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(6),
      Q => n_cycles_reg(6),
      R => reset
    );
\n_cycles_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(7),
      Q => n_cycles_reg(7),
      R => reset
    );
\n_cycles_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(8),
      Q => n_cycles_reg(8),
      R => reset
    );
\n_cycles_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => n_cycles_on(9),
      Q => n_cycles_reg(9),
      R => reset
    );
resync_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => resync,
      Q => resync_reg,
      R => reset
    );
\s_in_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(0),
      Q => s_in(0),
      R => reset
    );
\s_in_reg[100]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(100),
      Q => s_in(100),
      R => reset
    );
\s_in_reg[101]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(101),
      Q => s_in(101),
      R => reset
    );
\s_in_reg[102]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(102),
      Q => s_in(102),
      R => reset
    );
\s_in_reg[103]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(103),
      Q => s_in(103),
      R => reset
    );
\s_in_reg[104]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(104),
      Q => s_in(104),
      R => reset
    );
\s_in_reg[105]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(105),
      Q => s_in(105),
      R => reset
    );
\s_in_reg[106]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(106),
      Q => s_in(106),
      R => reset
    );
\s_in_reg[107]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(107),
      Q => s_in(107),
      R => reset
    );
\s_in_reg[108]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(108),
      Q => s_in(108),
      R => reset
    );
\s_in_reg[109]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(109),
      Q => s_in(109),
      R => reset
    );
\s_in_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(10),
      Q => s_in(10),
      R => reset
    );
\s_in_reg[110]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(110),
      Q => s_in(110),
      R => reset
    );
\s_in_reg[111]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(111),
      Q => s_in(111),
      R => reset
    );
\s_in_reg[112]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(112),
      Q => s_in(112),
      R => reset
    );
\s_in_reg[113]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(113),
      Q => s_in(113),
      R => reset
    );
\s_in_reg[114]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(114),
      Q => s_in(114),
      R => reset
    );
\s_in_reg[115]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(115),
      Q => s_in(115),
      R => reset
    );
\s_in_reg[116]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(116),
      Q => s_in(116),
      R => reset
    );
\s_in_reg[117]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(117),
      Q => s_in(117),
      R => reset
    );
\s_in_reg[118]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(118),
      Q => s_in(118),
      R => reset
    );
\s_in_reg[119]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(119),
      Q => s_in(119),
      R => reset
    );
\s_in_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(11),
      Q => s_in(11),
      R => reset
    );
\s_in_reg[120]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(120),
      Q => s_in(120),
      R => reset
    );
\s_in_reg[121]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(121),
      Q => s_in(121),
      R => reset
    );
\s_in_reg[122]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(122),
      Q => s_in(122),
      R => reset
    );
\s_in_reg[123]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(123),
      Q => s_in(123),
      R => reset
    );
\s_in_reg[124]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(124),
      Q => s_in(124),
      R => reset
    );
\s_in_reg[125]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(125),
      Q => s_in(125),
      R => reset
    );
\s_in_reg[126]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(126),
      Q => s_in(126),
      R => reset
    );
\s_in_reg[127]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(127),
      Q => s_in(127),
      R => reset
    );
\s_in_reg[128]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(128),
      Q => s_in(128),
      R => reset
    );
\s_in_reg[129]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(129),
      Q => s_in(129),
      R => reset
    );
\s_in_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(12),
      Q => s_in(12),
      R => reset
    );
\s_in_reg[130]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(130),
      Q => s_in(130),
      R => reset
    );
\s_in_reg[131]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(131),
      Q => s_in(131),
      R => reset
    );
\s_in_reg[132]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(132),
      Q => s_in(132),
      R => reset
    );
\s_in_reg[133]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(133),
      Q => s_in(133),
      R => reset
    );
\s_in_reg[134]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(134),
      Q => s_in(134),
      R => reset
    );
\s_in_reg[135]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(135),
      Q => s_in(135),
      R => reset
    );
\s_in_reg[136]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(136),
      Q => s_in(136),
      R => reset
    );
\s_in_reg[137]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(137),
      Q => s_in(137),
      R => reset
    );
\s_in_reg[138]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(138),
      Q => s_in(138),
      R => reset
    );
\s_in_reg[139]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(139),
      Q => s_in(139),
      R => reset
    );
\s_in_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(13),
      Q => s_in(13),
      R => reset
    );
\s_in_reg[140]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(140),
      Q => s_in(140),
      R => reset
    );
\s_in_reg[141]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(141),
      Q => s_in(141),
      R => reset
    );
\s_in_reg[142]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(142),
      Q => s_in(142),
      R => reset
    );
\s_in_reg[143]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(143),
      Q => s_in(143),
      R => reset
    );
\s_in_reg[144]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(144),
      Q => s_in(144),
      R => reset
    );
\s_in_reg[145]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(145),
      Q => s_in(145),
      R => reset
    );
\s_in_reg[146]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(146),
      Q => s_in(146),
      R => reset
    );
\s_in_reg[147]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(147),
      Q => s_in(147),
      R => reset
    );
\s_in_reg[148]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(148),
      Q => s_in(148),
      R => reset
    );
\s_in_reg[149]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(149),
      Q => s_in(149),
      R => reset
    );
\s_in_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(14),
      Q => s_in(14),
      R => reset
    );
\s_in_reg[150]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(150),
      Q => s_in(150),
      R => reset
    );
\s_in_reg[151]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(151),
      Q => s_in(151),
      R => reset
    );
\s_in_reg[152]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(152),
      Q => s_in(152),
      R => reset
    );
\s_in_reg[153]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(153),
      Q => s_in(153),
      R => reset
    );
\s_in_reg[154]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(154),
      Q => s_in(154),
      R => reset
    );
\s_in_reg[155]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(155),
      Q => s_in(155),
      R => reset
    );
\s_in_reg[156]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(156),
      Q => s_in(156),
      R => reset
    );
\s_in_reg[157]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(157),
      Q => s_in(157),
      R => reset
    );
\s_in_reg[158]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(158),
      Q => s_in(158),
      R => reset
    );
\s_in_reg[159]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(159),
      Q => s_in(159),
      R => reset
    );
\s_in_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(15),
      Q => s_in(15),
      R => reset
    );
\s_in_reg[160]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(160),
      Q => s_in(160),
      R => reset
    );
\s_in_reg[161]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(161),
      Q => s_in(161),
      R => reset
    );
\s_in_reg[162]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(162),
      Q => s_in(162),
      R => reset
    );
\s_in_reg[163]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(163),
      Q => s_in(163),
      R => reset
    );
\s_in_reg[164]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(164),
      Q => s_in(164),
      R => reset
    );
\s_in_reg[165]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(165),
      Q => s_in(165),
      R => reset
    );
\s_in_reg[166]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(166),
      Q => s_in(166),
      R => reset
    );
\s_in_reg[167]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(167),
      Q => s_in(167),
      R => reset
    );
\s_in_reg[168]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(168),
      Q => s_in(168),
      R => reset
    );
\s_in_reg[169]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(169),
      Q => s_in(169),
      R => reset
    );
\s_in_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(16),
      Q => s_in(16),
      R => reset
    );
\s_in_reg[170]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(170),
      Q => s_in(170),
      R => reset
    );
\s_in_reg[171]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(171),
      Q => s_in(171),
      R => reset
    );
\s_in_reg[172]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(172),
      Q => s_in(172),
      R => reset
    );
\s_in_reg[173]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(173),
      Q => s_in(173),
      R => reset
    );
\s_in_reg[174]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(174),
      Q => s_in(174),
      R => reset
    );
\s_in_reg[175]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(175),
      Q => s_in(175),
      R => reset
    );
\s_in_reg[176]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(176),
      Q => s_in(176),
      R => reset
    );
\s_in_reg[177]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(177),
      Q => s_in(177),
      R => reset
    );
\s_in_reg[178]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(178),
      Q => s_in(178),
      R => reset
    );
\s_in_reg[179]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(179),
      Q => s_in(179),
      R => reset
    );
\s_in_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(17),
      Q => s_in(17),
      R => reset
    );
\s_in_reg[180]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(180),
      Q => s_in(180),
      R => reset
    );
\s_in_reg[181]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(181),
      Q => s_in(181),
      R => reset
    );
\s_in_reg[182]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(182),
      Q => s_in(182),
      R => reset
    );
\s_in_reg[183]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(183),
      Q => s_in(183),
      R => reset
    );
\s_in_reg[184]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(184),
      Q => s_in(184),
      R => reset
    );
\s_in_reg[185]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(185),
      Q => s_in(185),
      R => reset
    );
\s_in_reg[186]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(186),
      Q => s_in(186),
      R => reset
    );
\s_in_reg[187]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(187),
      Q => s_in(187),
      R => reset
    );
\s_in_reg[188]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(188),
      Q => s_in(188),
      R => reset
    );
\s_in_reg[189]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(189),
      Q => s_in(189),
      R => reset
    );
\s_in_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(18),
      Q => s_in(18),
      R => reset
    );
\s_in_reg[190]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(190),
      Q => s_in(190),
      R => reset
    );
\s_in_reg[191]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(191),
      Q => s_in(191),
      R => reset
    );
\s_in_reg[192]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(192),
      Q => s_in(192),
      R => reset
    );
\s_in_reg[193]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(193),
      Q => s_in(193),
      R => reset
    );
\s_in_reg[194]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(194),
      Q => s_in(194),
      R => reset
    );
\s_in_reg[195]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(195),
      Q => s_in(195),
      R => reset
    );
\s_in_reg[196]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(196),
      Q => s_in(196),
      R => reset
    );
\s_in_reg[197]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(197),
      Q => s_in(197),
      R => reset
    );
\s_in_reg[198]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(198),
      Q => s_in(198),
      R => reset
    );
\s_in_reg[199]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(199),
      Q => s_in(199),
      R => reset
    );
\s_in_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(19),
      Q => s_in(19),
      R => reset
    );
\s_in_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(1),
      Q => s_in(1),
      R => reset
    );
\s_in_reg[200]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(200),
      Q => s_in(200),
      R => reset
    );
\s_in_reg[201]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(201),
      Q => s_in(201),
      R => reset
    );
\s_in_reg[202]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(202),
      Q => s_in(202),
      R => reset
    );
\s_in_reg[203]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(203),
      Q => s_in(203),
      R => reset
    );
\s_in_reg[204]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(204),
      Q => s_in(204),
      R => reset
    );
\s_in_reg[205]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(205),
      Q => s_in(205),
      R => reset
    );
\s_in_reg[206]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(206),
      Q => s_in(206),
      R => reset
    );
\s_in_reg[207]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(207),
      Q => s_in(207),
      R => reset
    );
\s_in_reg[208]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(208),
      Q => s_in(208),
      R => reset
    );
\s_in_reg[209]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(209),
      Q => s_in(209),
      R => reset
    );
\s_in_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(20),
      Q => s_in(20),
      R => reset
    );
\s_in_reg[210]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(210),
      Q => s_in(210),
      R => reset
    );
\s_in_reg[211]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(211),
      Q => s_in(211),
      R => reset
    );
\s_in_reg[212]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(212),
      Q => s_in(212),
      R => reset
    );
\s_in_reg[213]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(213),
      Q => s_in(213),
      R => reset
    );
\s_in_reg[214]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(214),
      Q => s_in(214),
      R => reset
    );
\s_in_reg[215]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(215),
      Q => s_in(215),
      R => reset
    );
\s_in_reg[216]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(216),
      Q => s_in(216),
      R => reset
    );
\s_in_reg[217]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(217),
      Q => s_in(217),
      R => reset
    );
\s_in_reg[218]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(218),
      Q => s_in(218),
      R => reset
    );
\s_in_reg[219]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(219),
      Q => s_in(219),
      R => reset
    );
\s_in_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(21),
      Q => s_in(21),
      R => reset
    );
\s_in_reg[220]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(220),
      Q => s_in(220),
      R => reset
    );
\s_in_reg[221]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(221),
      Q => s_in(221),
      R => reset
    );
\s_in_reg[222]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(222),
      Q => s_in(222),
      R => reset
    );
\s_in_reg[223]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(223),
      Q => s_in(223),
      R => reset
    );
\s_in_reg[224]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(224),
      Q => s_in(224),
      R => reset
    );
\s_in_reg[225]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(225),
      Q => s_in(225),
      R => reset
    );
\s_in_reg[226]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(226),
      Q => s_in(226),
      R => reset
    );
\s_in_reg[227]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(227),
      Q => s_in(227),
      R => reset
    );
\s_in_reg[228]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(228),
      Q => s_in(228),
      R => reset
    );
\s_in_reg[229]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(229),
      Q => s_in(229),
      R => reset
    );
\s_in_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(22),
      Q => s_in(22),
      R => reset
    );
\s_in_reg[230]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(230),
      Q => s_in(230),
      R => reset
    );
\s_in_reg[231]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(231),
      Q => s_in(231),
      R => reset
    );
\s_in_reg[232]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(232),
      Q => s_in(232),
      R => reset
    );
\s_in_reg[233]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(233),
      Q => s_in(233),
      R => reset
    );
\s_in_reg[234]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(234),
      Q => s_in(234),
      R => reset
    );
\s_in_reg[235]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(235),
      Q => s_in(235),
      R => reset
    );
\s_in_reg[236]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(236),
      Q => s_in(236),
      R => reset
    );
\s_in_reg[237]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(237),
      Q => s_in(237),
      R => reset
    );
\s_in_reg[238]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(238),
      Q => s_in(238),
      R => reset
    );
\s_in_reg[239]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(239),
      Q => s_in(239),
      R => reset
    );
\s_in_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(23),
      Q => s_in(23),
      R => reset
    );
\s_in_reg[240]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(240),
      Q => s_in(240),
      R => reset
    );
\s_in_reg[241]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(241),
      Q => s_in(241),
      R => reset
    );
\s_in_reg[242]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(242),
      Q => s_in(242),
      R => reset
    );
\s_in_reg[243]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(243),
      Q => s_in(243),
      R => reset
    );
\s_in_reg[244]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(244),
      Q => s_in(244),
      R => reset
    );
\s_in_reg[245]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(245),
      Q => s_in(245),
      R => reset
    );
\s_in_reg[246]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(246),
      Q => s_in(246),
      R => reset
    );
\s_in_reg[247]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(247),
      Q => s_in(247),
      R => reset
    );
\s_in_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(24),
      Q => s_in(24),
      R => reset
    );
\s_in_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(25),
      Q => s_in(25),
      R => reset
    );
\s_in_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(26),
      Q => s_in(26),
      R => reset
    );
\s_in_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(27),
      Q => s_in(27),
      R => reset
    );
\s_in_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(28),
      Q => s_in(28),
      R => reset
    );
\s_in_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(29),
      Q => s_in(29),
      R => reset
    );
\s_in_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(2),
      Q => s_in(2),
      R => reset
    );
\s_in_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(30),
      Q => s_in(30),
      R => reset
    );
\s_in_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(31),
      Q => s_in(31),
      R => reset
    );
\s_in_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(32),
      Q => s_in(32),
      R => reset
    );
\s_in_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(33),
      Q => s_in(33),
      R => reset
    );
\s_in_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(34),
      Q => s_in(34),
      R => reset
    );
\s_in_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(35),
      Q => s_in(35),
      R => reset
    );
\s_in_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(36),
      Q => s_in(36),
      R => reset
    );
\s_in_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(37),
      Q => s_in(37),
      R => reset
    );
\s_in_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(38),
      Q => s_in(38),
      R => reset
    );
\s_in_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(39),
      Q => s_in(39),
      R => reset
    );
\s_in_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(3),
      Q => s_in(3),
      R => reset
    );
\s_in_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(40),
      Q => s_in(40),
      R => reset
    );
\s_in_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(41),
      Q => s_in(41),
      R => reset
    );
\s_in_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(42),
      Q => s_in(42),
      R => reset
    );
\s_in_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(43),
      Q => s_in(43),
      R => reset
    );
\s_in_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(44),
      Q => s_in(44),
      R => reset
    );
\s_in_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(45),
      Q => s_in(45),
      R => reset
    );
\s_in_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(46),
      Q => s_in(46),
      R => reset
    );
\s_in_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(47),
      Q => s_in(47),
      R => reset
    );
\s_in_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(48),
      Q => s_in(48),
      R => reset
    );
\s_in_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(49),
      Q => s_in(49),
      R => reset
    );
\s_in_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(4),
      Q => s_in(4),
      R => reset
    );
\s_in_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(50),
      Q => s_in(50),
      R => reset
    );
\s_in_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(51),
      Q => s_in(51),
      R => reset
    );
\s_in_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(52),
      Q => s_in(52),
      R => reset
    );
\s_in_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(53),
      Q => s_in(53),
      R => reset
    );
\s_in_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(54),
      Q => s_in(54),
      R => reset
    );
\s_in_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(55),
      Q => s_in(55),
      R => reset
    );
\s_in_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(56),
      Q => s_in(56),
      R => reset
    );
\s_in_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(57),
      Q => s_in(57),
      R => reset
    );
\s_in_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(58),
      Q => s_in(58),
      R => reset
    );
\s_in_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(59),
      Q => s_in(59),
      R => reset
    );
\s_in_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(5),
      Q => s_in(5),
      R => reset
    );
\s_in_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(60),
      Q => s_in(60),
      R => reset
    );
\s_in_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(61),
      Q => s_in(61),
      R => reset
    );
\s_in_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(62),
      Q => s_in(62),
      R => reset
    );
\s_in_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(63),
      Q => s_in(63),
      R => reset
    );
\s_in_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(64),
      Q => s_in(64),
      R => reset
    );
\s_in_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(65),
      Q => s_in(65),
      R => reset
    );
\s_in_reg[66]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(66),
      Q => s_in(66),
      R => reset
    );
\s_in_reg[67]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(67),
      Q => s_in(67),
      R => reset
    );
\s_in_reg[68]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(68),
      Q => s_in(68),
      R => reset
    );
\s_in_reg[69]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(69),
      Q => s_in(69),
      R => reset
    );
\s_in_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(6),
      Q => s_in(6),
      R => reset
    );
\s_in_reg[70]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(70),
      Q => s_in(70),
      R => reset
    );
\s_in_reg[71]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(71),
      Q => s_in(71),
      R => reset
    );
\s_in_reg[72]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(72),
      Q => s_in(72),
      R => reset
    );
\s_in_reg[73]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(73),
      Q => s_in(73),
      R => reset
    );
\s_in_reg[74]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(74),
      Q => s_in(74),
      R => reset
    );
\s_in_reg[75]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(75),
      Q => s_in(75),
      R => reset
    );
\s_in_reg[76]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(76),
      Q => s_in(76),
      R => reset
    );
\s_in_reg[77]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(77),
      Q => s_in(77),
      R => reset
    );
\s_in_reg[78]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(78),
      Q => s_in(78),
      R => reset
    );
\s_in_reg[79]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(79),
      Q => s_in(79),
      R => reset
    );
\s_in_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(7),
      Q => s_in(7),
      R => reset
    );
\s_in_reg[80]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(80),
      Q => s_in(80),
      R => reset
    );
\s_in_reg[81]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(81),
      Q => s_in(81),
      R => reset
    );
\s_in_reg[82]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(82),
      Q => s_in(82),
      R => reset
    );
\s_in_reg[83]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(83),
      Q => s_in(83),
      R => reset
    );
\s_in_reg[84]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(84),
      Q => s_in(84),
      R => reset
    );
\s_in_reg[85]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(85),
      Q => s_in(85),
      R => reset
    );
\s_in_reg[86]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(86),
      Q => s_in(86),
      R => reset
    );
\s_in_reg[87]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(87),
      Q => s_in(87),
      R => reset
    );
\s_in_reg[88]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(88),
      Q => s_in(88),
      R => reset
    );
\s_in_reg[89]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(89),
      Q => s_in(89),
      R => reset
    );
\s_in_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(8),
      Q => s_in(8),
      R => reset
    );
\s_in_reg[90]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(90),
      Q => s_in(90),
      R => reset
    );
\s_in_reg[91]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(91),
      Q => s_in(91),
      R => reset
    );
\s_in_reg[92]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(92),
      Q => s_in(92),
      R => reset
    );
\s_in_reg[93]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(93),
      Q => s_in(93),
      R => reset
    );
\s_in_reg[94]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(94),
      Q => s_in(94),
      R => reset
    );
\s_in_reg[95]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(95),
      Q => s_in(95),
      R => reset
    );
\s_in_reg[96]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(96),
      Q => s_in(96),
      R => reset
    );
\s_in_reg[97]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(97),
      Q => s_in(97),
      R => reset
    );
\s_in_reg[98]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(98),
      Q => s_in(98),
      R => reset
    );
\s_in_reg[99]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(99),
      Q => s_in(99),
      R => reset
    );
\s_in_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => signal_in(9),
      Q => s_in(9),
      R => reset
    );
\s_out[247]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => reset,
      I1 => flag_mask,
      I2 => en_reg,
      O => \s_out[247]_i_1_n_0\
    );
\s_out_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(0),
      Q => signal_out(0),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[100]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(100),
      Q => signal_out(100),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[101]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(101),
      Q => signal_out(101),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[102]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(102),
      Q => signal_out(102),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[103]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(103),
      Q => signal_out(103),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[104]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(104),
      Q => signal_out(104),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[105]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(105),
      Q => signal_out(105),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[106]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(106),
      Q => signal_out(106),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[107]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(107),
      Q => signal_out(107),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[108]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(108),
      Q => signal_out(108),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[109]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(109),
      Q => signal_out(109),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(10),
      Q => signal_out(10),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[110]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(110),
      Q => signal_out(110),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[111]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(111),
      Q => signal_out(111),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[112]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(112),
      Q => signal_out(112),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[113]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(113),
      Q => signal_out(113),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[114]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(114),
      Q => signal_out(114),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[115]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(115),
      Q => signal_out(115),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[116]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(116),
      Q => signal_out(116),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[117]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(117),
      Q => signal_out(117),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[118]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(118),
      Q => signal_out(118),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[119]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(119),
      Q => signal_out(119),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(11),
      Q => signal_out(11),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[120]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(120),
      Q => signal_out(120),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[121]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(121),
      Q => signal_out(121),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[122]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(122),
      Q => signal_out(122),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[123]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(123),
      Q => signal_out(123),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[124]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(124),
      Q => signal_out(124),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[125]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(125),
      Q => signal_out(125),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[126]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(126),
      Q => signal_out(126),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[127]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(127),
      Q => signal_out(127),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[128]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(128),
      Q => signal_out(128),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[129]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(129),
      Q => signal_out(129),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(12),
      Q => signal_out(12),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[130]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(130),
      Q => signal_out(130),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[131]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(131),
      Q => signal_out(131),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[132]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(132),
      Q => signal_out(132),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[133]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(133),
      Q => signal_out(133),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[134]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(134),
      Q => signal_out(134),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[135]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(135),
      Q => signal_out(135),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[136]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(136),
      Q => signal_out(136),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[137]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(137),
      Q => signal_out(137),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[138]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(138),
      Q => signal_out(138),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[139]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(139),
      Q => signal_out(139),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(13),
      Q => signal_out(13),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[140]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(140),
      Q => signal_out(140),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[141]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(141),
      Q => signal_out(141),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[142]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(142),
      Q => signal_out(142),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[143]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(143),
      Q => signal_out(143),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[144]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(144),
      Q => signal_out(144),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[145]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(145),
      Q => signal_out(145),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[146]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(146),
      Q => signal_out(146),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[147]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(147),
      Q => signal_out(147),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[148]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(148),
      Q => signal_out(148),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[149]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(149),
      Q => signal_out(149),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(14),
      Q => signal_out(14),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[150]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(150),
      Q => signal_out(150),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[151]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(151),
      Q => signal_out(151),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[152]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(152),
      Q => signal_out(152),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[153]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(153),
      Q => signal_out(153),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[154]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(154),
      Q => signal_out(154),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[155]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(155),
      Q => signal_out(155),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[156]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(156),
      Q => signal_out(156),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[157]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(157),
      Q => signal_out(157),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[158]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(158),
      Q => signal_out(158),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[159]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(159),
      Q => signal_out(159),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(15),
      Q => signal_out(15),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[160]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(160),
      Q => signal_out(160),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[161]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(161),
      Q => signal_out(161),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[162]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(162),
      Q => signal_out(162),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[163]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(163),
      Q => signal_out(163),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[164]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(164),
      Q => signal_out(164),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[165]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(165),
      Q => signal_out(165),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[166]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(166),
      Q => signal_out(166),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[167]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(167),
      Q => signal_out(167),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[168]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(168),
      Q => signal_out(168),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[169]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(169),
      Q => signal_out(169),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(16),
      Q => signal_out(16),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[170]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(170),
      Q => signal_out(170),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[171]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(171),
      Q => signal_out(171),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[172]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(172),
      Q => signal_out(172),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[173]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(173),
      Q => signal_out(173),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[174]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(174),
      Q => signal_out(174),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[175]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(175),
      Q => signal_out(175),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[176]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(176),
      Q => signal_out(176),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[177]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(177),
      Q => signal_out(177),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[178]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(178),
      Q => signal_out(178),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[179]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(179),
      Q => signal_out(179),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(17),
      Q => signal_out(17),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[180]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(180),
      Q => signal_out(180),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[181]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(181),
      Q => signal_out(181),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[182]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(182),
      Q => signal_out(182),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[183]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(183),
      Q => signal_out(183),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[184]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(184),
      Q => signal_out(184),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[185]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(185),
      Q => signal_out(185),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[186]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(186),
      Q => signal_out(186),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[187]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(187),
      Q => signal_out(187),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[188]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(188),
      Q => signal_out(188),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[189]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(189),
      Q => signal_out(189),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(18),
      Q => signal_out(18),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[190]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(190),
      Q => signal_out(190),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[191]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(191),
      Q => signal_out(191),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[192]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(192),
      Q => signal_out(192),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[193]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(193),
      Q => signal_out(193),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[194]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(194),
      Q => signal_out(194),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[195]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(195),
      Q => signal_out(195),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[196]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(196),
      Q => signal_out(196),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[197]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(197),
      Q => signal_out(197),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[198]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(198),
      Q => signal_out(198),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[199]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(199),
      Q => signal_out(199),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(19),
      Q => signal_out(19),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(1),
      Q => signal_out(1),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[200]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(200),
      Q => signal_out(200),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[201]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(201),
      Q => signal_out(201),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[202]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(202),
      Q => signal_out(202),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[203]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(203),
      Q => signal_out(203),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[204]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(204),
      Q => signal_out(204),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[205]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(205),
      Q => signal_out(205),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[206]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(206),
      Q => signal_out(206),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[207]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(207),
      Q => signal_out(207),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[208]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(208),
      Q => signal_out(208),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[209]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(209),
      Q => signal_out(209),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(20),
      Q => signal_out(20),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[210]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(210),
      Q => signal_out(210),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[211]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(211),
      Q => signal_out(211),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[212]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(212),
      Q => signal_out(212),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[213]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(213),
      Q => signal_out(213),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[214]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(214),
      Q => signal_out(214),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[215]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(215),
      Q => signal_out(215),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[216]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(216),
      Q => signal_out(216),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[217]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(217),
      Q => signal_out(217),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[218]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(218),
      Q => signal_out(218),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[219]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(219),
      Q => signal_out(219),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(21),
      Q => signal_out(21),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[220]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(220),
      Q => signal_out(220),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[221]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(221),
      Q => signal_out(221),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[222]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(222),
      Q => signal_out(222),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[223]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(223),
      Q => signal_out(223),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[224]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(224),
      Q => signal_out(224),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[225]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(225),
      Q => signal_out(225),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[226]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(226),
      Q => signal_out(226),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[227]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(227),
      Q => signal_out(227),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[228]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(228),
      Q => signal_out(228),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[229]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(229),
      Q => signal_out(229),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(22),
      Q => signal_out(22),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[230]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(230),
      Q => signal_out(230),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[231]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(231),
      Q => signal_out(231),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[232]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(232),
      Q => signal_out(232),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[233]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(233),
      Q => signal_out(233),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[234]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(234),
      Q => signal_out(234),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[235]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(235),
      Q => signal_out(235),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[236]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(236),
      Q => signal_out(236),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[237]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(237),
      Q => signal_out(237),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[238]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(238),
      Q => signal_out(238),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[239]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(239),
      Q => signal_out(239),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(23),
      Q => signal_out(23),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[240]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(240),
      Q => signal_out(240),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[241]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(241),
      Q => signal_out(241),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[242]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(242),
      Q => signal_out(242),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[243]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(243),
      Q => signal_out(243),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[244]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(244),
      Q => signal_out(244),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[245]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(245),
      Q => signal_out(245),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[246]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(246),
      Q => signal_out(246),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[247]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(247),
      Q => signal_out(247),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(24),
      Q => signal_out(24),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(25),
      Q => signal_out(25),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(26),
      Q => signal_out(26),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(27),
      Q => signal_out(27),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(28),
      Q => signal_out(28),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(29),
      Q => signal_out(29),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(2),
      Q => signal_out(2),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(30),
      Q => signal_out(30),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(31),
      Q => signal_out(31),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(32),
      Q => signal_out(32),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(33),
      Q => signal_out(33),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(34),
      Q => signal_out(34),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(35),
      Q => signal_out(35),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(36),
      Q => signal_out(36),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(37),
      Q => signal_out(37),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(38),
      Q => signal_out(38),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(39),
      Q => signal_out(39),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(3),
      Q => signal_out(3),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(40),
      Q => signal_out(40),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(41),
      Q => signal_out(41),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(42),
      Q => signal_out(42),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(43),
      Q => signal_out(43),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(44),
      Q => signal_out(44),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(45),
      Q => signal_out(45),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(46),
      Q => signal_out(46),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(47),
      Q => signal_out(47),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(48),
      Q => signal_out(48),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(49),
      Q => signal_out(49),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(4),
      Q => signal_out(4),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(50),
      Q => signal_out(50),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(51),
      Q => signal_out(51),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(52),
      Q => signal_out(52),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(53),
      Q => signal_out(53),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(54),
      Q => signal_out(54),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(55),
      Q => signal_out(55),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(56),
      Q => signal_out(56),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(57),
      Q => signal_out(57),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(58),
      Q => signal_out(58),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(59),
      Q => signal_out(59),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(5),
      Q => signal_out(5),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(60),
      Q => signal_out(60),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(61),
      Q => signal_out(61),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(62),
      Q => signal_out(62),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(63),
      Q => signal_out(63),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(64),
      Q => signal_out(64),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(65),
      Q => signal_out(65),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[66]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(66),
      Q => signal_out(66),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[67]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(67),
      Q => signal_out(67),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[68]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(68),
      Q => signal_out(68),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[69]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(69),
      Q => signal_out(69),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(6),
      Q => signal_out(6),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[70]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(70),
      Q => signal_out(70),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[71]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(71),
      Q => signal_out(71),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[72]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(72),
      Q => signal_out(72),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[73]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(73),
      Q => signal_out(73),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[74]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(74),
      Q => signal_out(74),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[75]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(75),
      Q => signal_out(75),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[76]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(76),
      Q => signal_out(76),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[77]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(77),
      Q => signal_out(77),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[78]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(78),
      Q => signal_out(78),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[79]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(79),
      Q => signal_out(79),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(7),
      Q => signal_out(7),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[80]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(80),
      Q => signal_out(80),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[81]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(81),
      Q => signal_out(81),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[82]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(82),
      Q => signal_out(82),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[83]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(83),
      Q => signal_out(83),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[84]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(84),
      Q => signal_out(84),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[85]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(85),
      Q => signal_out(85),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[86]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(86),
      Q => signal_out(86),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[87]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(87),
      Q => signal_out(87),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[88]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(88),
      Q => signal_out(88),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[89]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(89),
      Q => signal_out(89),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(8),
      Q => signal_out(8),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[90]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(90),
      Q => signal_out(90),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[91]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(91),
      Q => signal_out(91),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[92]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(92),
      Q => signal_out(92),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[93]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(93),
      Q => signal_out(93),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[94]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(94),
      Q => signal_out(94),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[95]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(95),
      Q => signal_out(95),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[96]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(96),
      Q => signal_out(96),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[97]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(97),
      Q => signal_out(97),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[98]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(98),
      Q => signal_out(98),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[99]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(99),
      Q => signal_out(99),
      R => \s_out[247]_i_1_n_0\
    );
\s_out_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_in(9),
      Q => signal_out(9),
      R => \s_out[247]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity te0745_haptic_Post_modulator_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;
    signal_in : in STD_LOGIC_VECTOR ( 247 downto 0 );
    resync : in STD_LOGIC;
    n_cycles_on : in STD_LOGIC_VECTOR ( 31 downto 0 );
    signal_out : out STD_LOGIC_VECTOR ( 247 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of te0745_haptic_Post_modulator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of te0745_haptic_Post_modulator_0_0 : entity is "te0745_haptic_Post_modulator_0_0,Post_modulator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of te0745_haptic_Post_modulator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of te0745_haptic_Post_modulator_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of te0745_haptic_Post_modulator_0_0 : entity is "Post_modulator,Vivado 2018.2";
end te0745_haptic_Post_modulator_0_0;

architecture STRUCTURE of te0745_haptic_Post_modulator_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 5e+07, PHASE 0.000, CLK_DOMAIN te0745_haptic_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_HIGH";
begin
inst: entity work.te0745_haptic_Post_modulator_0_0_Post_modulator
     port map (
      clk => clk,
      enable => enable,
      n_cycles_on(31 downto 0) => n_cycles_on(31 downto 0),
      reset => reset,
      resync => resync,
      signal_in(247 downto 0) => signal_in(247 downto 0),
      signal_out(247 downto 0) => signal_out(247 downto 0)
    );
end STRUCTURE;
