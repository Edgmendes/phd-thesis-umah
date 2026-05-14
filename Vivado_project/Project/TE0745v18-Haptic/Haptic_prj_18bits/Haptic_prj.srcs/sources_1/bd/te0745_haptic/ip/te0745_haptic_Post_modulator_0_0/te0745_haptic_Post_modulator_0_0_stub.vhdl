-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Thu Nov  9 14:40:57 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top te0745_haptic_Post_modulator_0_0 -prefix
--               te0745_haptic_Post_modulator_0_0_ te0745_haptic_Post_modulator_0_0_stub.vhdl
-- Design      : te0745_haptic_Post_modulator_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity te0745_haptic_Post_modulator_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable : in STD_LOGIC;
    signal_in : in STD_LOGIC_VECTOR ( 247 downto 0 );
    resync : in STD_LOGIC;
    n_cycles_on : in STD_LOGIC_VECTOR ( 31 downto 0 );
    signal_out : out STD_LOGIC_VECTOR ( 247 downto 0 )
  );

end te0745_haptic_Post_modulator_0_0;

architecture stub of te0745_haptic_Post_modulator_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,enable,signal_in[247:0],resync,n_cycles_on[31:0],signal_out[247:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Post_modulator,Vivado 2018.2";
begin
end;
