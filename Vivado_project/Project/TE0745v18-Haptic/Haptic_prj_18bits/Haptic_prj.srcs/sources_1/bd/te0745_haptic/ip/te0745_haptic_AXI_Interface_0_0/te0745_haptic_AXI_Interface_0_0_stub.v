// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Jun 19 17:17:15 2023
// Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top te0745_haptic_AXI_Interface_0_0 -prefix
//               te0745_haptic_AXI_Interface_0_0_ te0745_haptic_AXI_Interface_0_0_stub.v
// Design      : te0745_haptic_AXI_Interface_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "AXI_Interface_v1_0,Vivado 2018.2" *)
module te0745_haptic_AXI_Interface_0_0(slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, 
  slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9, slv_reg10, slv_reg11, slv_reg12, slv_reg13, 
  slv_reg14, slv_reg15, slv_reg16, slv_reg17, slv_reg18, slv_reg19, slv_reg20, slv_reg21, 
  slv_reg22, slv_reg23, slv_reg24, slv_reg25, slv_reg26, slv_reg27, slv_reg28, slv_reg29, 
  slv_reg30, slv_reg31, in_slv_reg_wren, in_slv_reg0, in_slv_reg1, in_slv_reg2, in_slv_reg3, 
  in_slv_reg4, in_slv_reg5, in_slv_reg6, in_slv_reg7, in_slv_reg8, in_slv_reg9, in_slv_reg10, 
  in_slv_reg11, in_slv_reg12, in_slv_reg13, in_slv_reg14, in_slv_reg15, in_slv_reg16, 
  in_slv_reg17, in_slv_reg18, in_slv_reg19, in_slv_reg20, in_slv_reg21, in_slv_reg22, 
  in_slv_reg23, in_slv_reg24, in_slv_reg25, in_slv_reg26, in_slv_reg27, in_slv_reg28, 
  in_slv_reg29, in_slv_reg30, in_slv_reg31, s00_axi_awaddr, s00_axi_awprot, s00_axi_awvalid, 
  s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, s00_axi_wready, 
  s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, s00_axi_arprot, 
  s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, s00_axi_rresp, s00_axi_rvalid, 
  s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="slv_reg0[31:0],slv_reg1[31:0],slv_reg2[31:0],slv_reg3[31:0],slv_reg4[31:0],slv_reg5[31:0],slv_reg6[31:0],slv_reg7[31:0],slv_reg8[31:0],slv_reg9[31:0],slv_reg10[31:0],slv_reg11[31:0],slv_reg12[31:0],slv_reg13[31:0],slv_reg14[31:0],slv_reg15[31:0],slv_reg16[31:0],slv_reg17[31:0],slv_reg18[31:0],slv_reg19[31:0],slv_reg20[31:0],slv_reg21[31:0],slv_reg22[31:0],slv_reg23[31:0],slv_reg24[31:0],slv_reg25[31:0],slv_reg26[31:0],slv_reg27[31:0],slv_reg28[31:0],slv_reg29[31:0],slv_reg30[31:0],slv_reg31[31:0],in_slv_reg_wren[31:0],in_slv_reg0[31:0],in_slv_reg1[31:0],in_slv_reg2[31:0],in_slv_reg3[31:0],in_slv_reg4[31:0],in_slv_reg5[31:0],in_slv_reg6[31:0],in_slv_reg7[31:0],in_slv_reg8[31:0],in_slv_reg9[31:0],in_slv_reg10[31:0],in_slv_reg11[31:0],in_slv_reg12[31:0],in_slv_reg13[31:0],in_slv_reg14[31:0],in_slv_reg15[31:0],in_slv_reg16[31:0],in_slv_reg17[31:0],in_slv_reg18[31:0],in_slv_reg19[31:0],in_slv_reg20[31:0],in_slv_reg21[31:0],in_slv_reg22[31:0],in_slv_reg23[31:0],in_slv_reg24[31:0],in_slv_reg25[31:0],in_slv_reg26[31:0],in_slv_reg27[31:0],in_slv_reg28[31:0],in_slv_reg29[31:0],in_slv_reg30[31:0],in_slv_reg31[31:0],s00_axi_awaddr[10:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[10:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  output [31:0]slv_reg0;
  output [31:0]slv_reg1;
  output [31:0]slv_reg2;
  output [31:0]slv_reg3;
  output [31:0]slv_reg4;
  output [31:0]slv_reg5;
  output [31:0]slv_reg6;
  output [31:0]slv_reg7;
  output [31:0]slv_reg8;
  output [31:0]slv_reg9;
  output [31:0]slv_reg10;
  output [31:0]slv_reg11;
  output [31:0]slv_reg12;
  output [31:0]slv_reg13;
  output [31:0]slv_reg14;
  output [31:0]slv_reg15;
  output [31:0]slv_reg16;
  output [31:0]slv_reg17;
  output [31:0]slv_reg18;
  output [31:0]slv_reg19;
  output [31:0]slv_reg20;
  output [31:0]slv_reg21;
  output [31:0]slv_reg22;
  output [31:0]slv_reg23;
  output [31:0]slv_reg24;
  output [31:0]slv_reg25;
  output [31:0]slv_reg26;
  output [31:0]slv_reg27;
  output [31:0]slv_reg28;
  output [31:0]slv_reg29;
  output [31:0]slv_reg30;
  output [31:0]slv_reg31;
  input [31:0]in_slv_reg_wren;
  input [31:0]in_slv_reg0;
  input [31:0]in_slv_reg1;
  input [31:0]in_slv_reg2;
  input [31:0]in_slv_reg3;
  input [31:0]in_slv_reg4;
  input [31:0]in_slv_reg5;
  input [31:0]in_slv_reg6;
  input [31:0]in_slv_reg7;
  input [31:0]in_slv_reg8;
  input [31:0]in_slv_reg9;
  input [31:0]in_slv_reg10;
  input [31:0]in_slv_reg11;
  input [31:0]in_slv_reg12;
  input [31:0]in_slv_reg13;
  input [31:0]in_slv_reg14;
  input [31:0]in_slv_reg15;
  input [31:0]in_slv_reg16;
  input [31:0]in_slv_reg17;
  input [31:0]in_slv_reg18;
  input [31:0]in_slv_reg19;
  input [31:0]in_slv_reg20;
  input [31:0]in_slv_reg21;
  input [31:0]in_slv_reg22;
  input [31:0]in_slv_reg23;
  input [31:0]in_slv_reg24;
  input [31:0]in_slv_reg25;
  input [31:0]in_slv_reg26;
  input [31:0]in_slv_reg27;
  input [31:0]in_slv_reg28;
  input [31:0]in_slv_reg29;
  input [31:0]in_slv_reg30;
  input [31:0]in_slv_reg31;
  input [10:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [10:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axi_aclk;
  input s00_axi_aresetn;
endmodule
