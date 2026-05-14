-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Jun 20 18:13:04 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL/TE0745v18-Haptic-master/Haptic_IP-Core_12bits/Haptic_IP-Core.srcs/sources_1/ip/div_phoff_uut/div_phoff_uut_stub.vhdl
-- Design      : div_phoff_uut
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity div_phoff_uut is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_divisor_tvalid : in STD_LOGIC;
    s_axis_divisor_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_dividend_tvalid : in STD_LOGIC;
    s_axis_dividend_tdata : in STD_LOGIC_VECTOR ( 55 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 79 downto 0 )
  );

end div_phoff_uut;

architecture stub of div_phoff_uut is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_divisor_tvalid,s_axis_divisor_tdata[23:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[55:0],m_axis_dout_tvalid,m_axis_dout_tdata[79:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "div_gen_v5_1_13,Vivado 2018.2";
begin
end;
