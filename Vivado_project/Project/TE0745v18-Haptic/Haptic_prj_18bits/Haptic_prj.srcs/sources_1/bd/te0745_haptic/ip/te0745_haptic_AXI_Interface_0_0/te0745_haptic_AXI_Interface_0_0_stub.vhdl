-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Jun 19 17:17:15 2023
-- Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top te0745_haptic_AXI_Interface_0_0 -prefix
--               te0745_haptic_AXI_Interface_0_0_ te0745_haptic_AXI_Interface_0_0_stub.vhdl
-- Design      : te0745_haptic_AXI_Interface_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity te0745_haptic_AXI_Interface_0_0 is
  Port ( 
    slv_reg0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg4 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg5 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg6 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg7 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg8 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg9 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg11 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg12 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg13 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg14 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg15 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg16 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg17 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg18 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg19 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg21 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg22 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg23 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg24 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg25 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg26 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg27 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg28 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg29 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg30 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    slv_reg31 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg_wren : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg8 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg11 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg12 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg13 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg14 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg15 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg16 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg17 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg18 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg19 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg21 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg22 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg23 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg24 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg25 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg26 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg27 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg28 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg29 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg30 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_slv_reg31 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end te0745_haptic_AXI_Interface_0_0;

architecture stub of te0745_haptic_AXI_Interface_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "slv_reg0[31:0],slv_reg1[31:0],slv_reg2[31:0],slv_reg3[31:0],slv_reg4[31:0],slv_reg5[31:0],slv_reg6[31:0],slv_reg7[31:0],slv_reg8[31:0],slv_reg9[31:0],slv_reg10[31:0],slv_reg11[31:0],slv_reg12[31:0],slv_reg13[31:0],slv_reg14[31:0],slv_reg15[31:0],slv_reg16[31:0],slv_reg17[31:0],slv_reg18[31:0],slv_reg19[31:0],slv_reg20[31:0],slv_reg21[31:0],slv_reg22[31:0],slv_reg23[31:0],slv_reg24[31:0],slv_reg25[31:0],slv_reg26[31:0],slv_reg27[31:0],slv_reg28[31:0],slv_reg29[31:0],slv_reg30[31:0],slv_reg31[31:0],in_slv_reg_wren[31:0],in_slv_reg0[31:0],in_slv_reg1[31:0],in_slv_reg2[31:0],in_slv_reg3[31:0],in_slv_reg4[31:0],in_slv_reg5[31:0],in_slv_reg6[31:0],in_slv_reg7[31:0],in_slv_reg8[31:0],in_slv_reg9[31:0],in_slv_reg10[31:0],in_slv_reg11[31:0],in_slv_reg12[31:0],in_slv_reg13[31:0],in_slv_reg14[31:0],in_slv_reg15[31:0],in_slv_reg16[31:0],in_slv_reg17[31:0],in_slv_reg18[31:0],in_slv_reg19[31:0],in_slv_reg20[31:0],in_slv_reg21[31:0],in_slv_reg22[31:0],in_slv_reg23[31:0],in_slv_reg24[31:0],in_slv_reg25[31:0],in_slv_reg26[31:0],in_slv_reg27[31:0],in_slv_reg28[31:0],in_slv_reg29[31:0],in_slv_reg30[31:0],in_slv_reg31[31:0],s00_axi_awaddr[10:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[10:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "AXI_Interface_v1_0,Vivado 2018.2";
begin
end;
