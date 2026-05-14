-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Fri Jun 30 16:30:49 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top te0745_haptic_SC_1_1 -prefix
--               te0745_haptic_SC_1_1_ te0745_haptic_SC_1_1_stub.vhdl
-- Design      : te0745_haptic_SC_1_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity te0745_haptic_SC_1_1 is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    enable : in STD_LOGIC;
    set_src_pos : in STD_LOGIC;
    set_outputs : out STD_LOGIC;
    sonar_dst : out STD_LOGIC_VECTOR ( 13391 downto 0 );
    sonar_src : out STD_LOGIC_VECTOR ( 13391 downto 0 );
    dst_x : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dst_y : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dst_z : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end te0745_haptic_SC_1_1;

architecture stub of te0745_haptic_SC_1_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,s_axi_awaddr[11:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[11:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,enable,set_src_pos,set_outputs,sonar_dst[13391:0],sonar_src[13391:0],dst_x[17:0],dst_y[17:0],dst_z[17:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "SC,Vivado 2018.2";
begin
end;
