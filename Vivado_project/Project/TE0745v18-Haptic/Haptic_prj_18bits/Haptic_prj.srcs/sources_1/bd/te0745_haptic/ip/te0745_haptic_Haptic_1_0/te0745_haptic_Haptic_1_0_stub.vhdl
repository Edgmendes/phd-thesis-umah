-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Nov  8 14:40:14 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top te0745_haptic_Haptic_1_0 -prefix
--               te0745_haptic_Haptic_1_0_ te0745_haptic_Haptic_1_0_stub.vhdl
-- Design      : te0745_haptic_Haptic_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity te0745_haptic_Haptic_1_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    set_outputs : in STD_LOGIC;
    sonar_pos : in STD_LOGIC_VECTOR ( 13391 downto 0 );
    sonar_dest : in STD_LOGIC_VECTOR ( 13391 downto 0 );
    wave_out : out STD_LOGIC_VECTOR ( 247 downto 0 );
    resync : out STD_LOGIC;
    set_duty_cycle : in STD_LOGIC;
    duty_cycle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    set_frequency : in STD_LOGIC;
    set_velocity : in STD_LOGIC;
    sonar_freq : in STD_LOGIC_VECTOR ( 23 downto 0 );
    sound_velocity : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );

end te0745_haptic_Haptic_1_0;

architecture stub of te0745_haptic_Haptic_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,set_outputs,sonar_pos[13391:0],sonar_dest[13391:0],wave_out[247:0],resync,set_duty_cycle,duty_cycle[31:0],set_frequency,set_velocity,sonar_freq[23:0],sound_velocity[8:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Haptic,Vivado 2018.2";
begin
end;
