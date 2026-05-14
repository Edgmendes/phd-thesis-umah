-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Jun 20 17:42:26 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL/TE0745v18-Haptic-master/Haptic_IP-Core_12bits/Haptic_IP-Core.srcs/sources_1/ip/mult_gen_uut/mult_gen_uut_stub.vhdl
-- Design      : mult_gen_uut
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_gen_uut is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 63 downto 0 );
    B : in STD_LOGIC_VECTOR ( 23 downto 0 );
    P : out STD_LOGIC_VECTOR ( 32 downto 0 )
  );

end mult_gen_uut;

architecture stub of mult_gen_uut is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[63:0],B[23:0],P[32:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mult_gen_v12_0_14,Vivado 2018.2";
begin
end;
