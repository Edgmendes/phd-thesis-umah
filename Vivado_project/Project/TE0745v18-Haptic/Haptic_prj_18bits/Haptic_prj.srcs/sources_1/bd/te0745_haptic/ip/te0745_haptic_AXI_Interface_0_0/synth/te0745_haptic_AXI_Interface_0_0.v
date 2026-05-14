// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: esrg.ibs:esrg:AXI_Interface:1.0
// IP Revision: 20

(* X_CORE_INFO = "AXI_Interface_v1_0,Vivado 2018.2" *)
(* CHECK_LICENSE_TYPE = "te0745_haptic_AXI_Interface_0_0,AXI_Interface_v1_0,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module te0745_haptic_AXI_Interface_0_0 (
  slv_reg0,
  slv_reg1,
  slv_reg2,
  slv_reg3,
  slv_reg4,
  slv_reg5,
  slv_reg6,
  slv_reg7,
  slv_reg8,
  slv_reg9,
  slv_reg10,
  slv_reg11,
  slv_reg12,
  slv_reg13,
  slv_reg14,
  slv_reg15,
  slv_reg16,
  slv_reg17,
  slv_reg18,
  slv_reg19,
  slv_reg20,
  slv_reg21,
  slv_reg22,
  slv_reg23,
  slv_reg24,
  slv_reg25,
  slv_reg26,
  slv_reg27,
  slv_reg28,
  slv_reg29,
  slv_reg30,
  slv_reg31,
  in_slv_reg_wren,
  in_slv_reg0,
  in_slv_reg1,
  in_slv_reg2,
  in_slv_reg3,
  in_slv_reg4,
  in_slv_reg5,
  in_slv_reg6,
  in_slv_reg7,
  in_slv_reg8,
  in_slv_reg9,
  in_slv_reg10,
  in_slv_reg11,
  in_slv_reg12,
  in_slv_reg13,
  in_slv_reg14,
  in_slv_reg15,
  in_slv_reg16,
  in_slv_reg17,
  in_slv_reg18,
  in_slv_reg19,
  in_slv_reg20,
  in_slv_reg21,
  in_slv_reg22,
  in_slv_reg23,
  in_slv_reg24,
  in_slv_reg25,
  in_slv_reg26,
  in_slv_reg27,
  in_slv_reg28,
  in_slv_reg29,
  in_slv_reg30,
  in_slv_reg31,
  s00_axi_awaddr,
  s00_axi_awprot,
  s00_axi_awvalid,
  s00_axi_awready,
  s00_axi_wdata,
  s00_axi_wstrb,
  s00_axi_wvalid,
  s00_axi_wready,
  s00_axi_bresp,
  s00_axi_bvalid,
  s00_axi_bready,
  s00_axi_araddr,
  s00_axi_arprot,
  s00_axi_arvalid,
  s00_axi_arready,
  s00_axi_rdata,
  s00_axi_rresp,
  s00_axi_rvalid,
  s00_axi_rready,
  s00_axi_aclk,
  s00_axi_aresetn
);

(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg0" *)
output wire [31 : 0] slv_reg0;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg1" *)
output wire [31 : 0] slv_reg1;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg2" *)
output wire [31 : 0] slv_reg2;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg3" *)
output wire [31 : 0] slv_reg3;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg4" *)
output wire [31 : 0] slv_reg4;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg5" *)
output wire [31 : 0] slv_reg5;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg6" *)
output wire [31 : 0] slv_reg6;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg7" *)
output wire [31 : 0] slv_reg7;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg8" *)
output wire [31 : 0] slv_reg8;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg9" *)
output wire [31 : 0] slv_reg9;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg10" *)
output wire [31 : 0] slv_reg10;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg11" *)
output wire [31 : 0] slv_reg11;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg12" *)
output wire [31 : 0] slv_reg12;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg13" *)
output wire [31 : 0] slv_reg13;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg14" *)
output wire [31 : 0] slv_reg14;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg15" *)
output wire [31 : 0] slv_reg15;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg16" *)
output wire [31 : 0] slv_reg16;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg17" *)
output wire [31 : 0] slv_reg17;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg18" *)
output wire [31 : 0] slv_reg18;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg19" *)
output wire [31 : 0] slv_reg19;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg20" *)
output wire [31 : 0] slv_reg20;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg21" *)
output wire [31 : 0] slv_reg21;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg22" *)
output wire [31 : 0] slv_reg22;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg23" *)
output wire [31 : 0] slv_reg23;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg24" *)
output wire [31 : 0] slv_reg24;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg25" *)
output wire [31 : 0] slv_reg25;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg26" *)
output wire [31 : 0] slv_reg26;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg27" *)
output wire [31 : 0] slv_reg27;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg28" *)
output wire [31 : 0] slv_reg28;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg29" *)
output wire [31 : 0] slv_reg29;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg30" *)
output wire [31 : 0] slv_reg30;
(* X_INTERFACE_INFO = "esrg.ibs:esrg:AXI_RegsSet:1.0 AXI_RegsSet slv_reg31" *)
output wire [31 : 0] slv_reg31;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg_wren" *)
input wire [31 : 0] in_slv_reg_wren;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg0" *)
input wire [31 : 0] in_slv_reg0;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg1" *)
input wire [31 : 0] in_slv_reg1;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg2" *)
input wire [31 : 0] in_slv_reg2;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg3" *)
input wire [31 : 0] in_slv_reg3;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg4" *)
input wire [31 : 0] in_slv_reg4;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg5" *)
input wire [31 : 0] in_slv_reg5;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg6" *)
input wire [31 : 0] in_slv_reg6;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg7" *)
input wire [31 : 0] in_slv_reg7;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg8" *)
input wire [31 : 0] in_slv_reg8;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg9" *)
input wire [31 : 0] in_slv_reg9;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg10" *)
input wire [31 : 0] in_slv_reg10;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg11" *)
input wire [31 : 0] in_slv_reg11;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg12" *)
input wire [31 : 0] in_slv_reg12;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg13" *)
input wire [31 : 0] in_slv_reg13;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg14" *)
input wire [31 : 0] in_slv_reg14;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg15" *)
input wire [31 : 0] in_slv_reg15;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg16" *)
input wire [31 : 0] in_slv_reg16;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg17" *)
input wire [31 : 0] in_slv_reg17;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg18" *)
input wire [31 : 0] in_slv_reg18;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg19" *)
input wire [31 : 0] in_slv_reg19;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg20" *)
input wire [31 : 0] in_slv_reg20;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg21" *)
input wire [31 : 0] in_slv_reg21;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg22" *)
input wire [31 : 0] in_slv_reg22;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg23" *)
input wire [31 : 0] in_slv_reg23;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg24" *)
input wire [31 : 0] in_slv_reg24;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg25" *)
input wire [31 : 0] in_slv_reg25;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg26" *)
input wire [31 : 0] in_slv_reg26;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg27" *)
input wire [31 : 0] in_slv_reg27;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg28" *)
input wire [31 : 0] in_slv_reg28;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg29" *)
input wire [31 : 0] in_slv_reg29;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg30" *)
input wire [31 : 0] in_slv_reg30;
(* X_INTERFACE_INFO = "esrg.com:esrg:AXI_InRegs:1.0 AXI_InRegs in_slv_reg31" *)
input wire [31 : 0] in_slv_reg31;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *)
input wire [10 : 0] s00_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *)
input wire [2 : 0] s00_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *)
input wire s00_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *)
output wire s00_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *)
input wire [31 : 0] s00_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *)
input wire [3 : 0] s00_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *)
input wire s00_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *)
output wire s00_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *)
output wire [1 : 0] s00_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *)
output wire s00_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *)
input wire s00_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *)
input wire [10 : 0] s00_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *)
input wire [2 : 0] s00_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *)
input wire s00_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *)
output wire s00_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *)
output wire [31 : 0] s00_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *)
output wire [1 : 0] s00_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *)
output wire s00_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 5e+07, ID_WIDTH 0, ADDR_WIDTH 11, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN te0745_haptic_processing_\
system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *)
input wire s00_axi_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_RESET s00_axi_aresetn, ASSOCIATED_BUSIF S00_AXI, FREQ_HZ 5e+07, PHASE 0.000, CLK_DOMAIN te0745_haptic_processing_system7_0_0_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *)
input wire s00_axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST, xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *)
input wire s00_axi_aresetn;

  AXI_Interface_v1_0 #(
    .C_S00_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_S00_AXI_ADDR_WIDTH(11),  // Width of S_AXI address bus
    .REG0(0),
    .REG1(0),
    .REG2(0),
    .REG3(0),
    .REG4(0),
    .REG5(0),
    .REG6(0),
    .REG7(0),
    .REG8(0),
    .REG9(0),
    .REG10(0),
    .REG11(0),
    .REG12(0),
    .REG13(0),
    .REG14(0),
    .REG15(0),
    .REG16(0),
    .REG17(0),
    .REG18(0),
    .REG19(0),
    .REG20(0),
    .REG21(0),
    .REG22(0),
    .REG23(0),
    .REG24(0),
    .REG25(0),
    .REG26(0),
    .REG27(0),
    .REG28(0),
    .REG29(0),
    .REG30(0),
    .REG31(0),
    .N(32)
  ) inst (
    .slv_reg0(slv_reg0),
    .slv_reg1(slv_reg1),
    .slv_reg2(slv_reg2),
    .slv_reg3(slv_reg3),
    .slv_reg4(slv_reg4),
    .slv_reg5(slv_reg5),
    .slv_reg6(slv_reg6),
    .slv_reg7(slv_reg7),
    .slv_reg8(slv_reg8),
    .slv_reg9(slv_reg9),
    .slv_reg10(slv_reg10),
    .slv_reg11(slv_reg11),
    .slv_reg12(slv_reg12),
    .slv_reg13(slv_reg13),
    .slv_reg14(slv_reg14),
    .slv_reg15(slv_reg15),
    .slv_reg16(slv_reg16),
    .slv_reg17(slv_reg17),
    .slv_reg18(slv_reg18),
    .slv_reg19(slv_reg19),
    .slv_reg20(slv_reg20),
    .slv_reg21(slv_reg21),
    .slv_reg22(slv_reg22),
    .slv_reg23(slv_reg23),
    .slv_reg24(slv_reg24),
    .slv_reg25(slv_reg25),
    .slv_reg26(slv_reg26),
    .slv_reg27(slv_reg27),
    .slv_reg28(slv_reg28),
    .slv_reg29(slv_reg29),
    .slv_reg30(slv_reg30),
    .slv_reg31(slv_reg31),
    .slv_reg32(),
    .slv_reg33(),
    .slv_reg34(),
    .slv_reg35(),
    .slv_reg36(),
    .slv_reg37(),
    .slv_reg38(),
    .slv_reg39(),
    .slv_reg40(),
    .slv_reg41(),
    .slv_reg42(),
    .slv_reg43(),
    .slv_reg44(),
    .slv_reg45(),
    .slv_reg46(),
    .slv_reg47(),
    .slv_reg48(),
    .slv_reg49(),
    .slv_reg50(),
    .slv_reg51(),
    .slv_reg52(),
    .slv_reg53(),
    .slv_reg54(),
    .slv_reg55(),
    .slv_reg56(),
    .slv_reg57(),
    .slv_reg58(),
    .slv_reg59(),
    .slv_reg60(),
    .slv_reg61(),
    .slv_reg62(),
    .slv_reg63(),
    .slv_reg64(),
    .slv_reg65(),
    .slv_reg66(),
    .slv_reg67(),
    .slv_reg68(),
    .slv_reg69(),
    .slv_reg70(),
    .slv_reg71(),
    .slv_reg72(),
    .slv_reg73(),
    .slv_reg74(),
    .slv_reg75(),
    .slv_reg76(),
    .slv_reg77(),
    .slv_reg78(),
    .slv_reg79(),
    .slv_reg80(),
    .slv_reg81(),
    .slv_reg82(),
    .slv_reg83(),
    .slv_reg84(),
    .slv_reg85(),
    .slv_reg86(),
    .slv_reg87(),
    .slv_reg88(),
    .slv_reg89(),
    .slv_reg90(),
    .slv_reg91(),
    .slv_reg92(),
    .slv_reg93(),
    .slv_reg94(),
    .slv_reg95(),
    .slv_reg96(),
    .slv_reg97(),
    .slv_reg98(),
    .slv_reg99(),
    .slv_reg100(),
    .slv_reg101(),
    .slv_reg102(),
    .slv_reg103(),
    .slv_reg104(),
    .slv_reg105(),
    .slv_reg106(),
    .slv_reg107(),
    .slv_reg108(),
    .slv_reg109(),
    .slv_reg110(),
    .slv_reg111(),
    .slv_reg112(),
    .slv_reg113(),
    .slv_reg114(),
    .slv_reg115(),
    .slv_reg116(),
    .slv_reg117(),
    .slv_reg118(),
    .slv_reg119(),
    .slv_reg120(),
    .slv_reg121(),
    .slv_reg122(),
    .slv_reg123(),
    .slv_reg124(),
    .slv_reg125(),
    .slv_reg126(),
    .slv_reg127(),
    .slv_reg128(),
    .slv_reg129(),
    .slv_reg130(),
    .slv_reg131(),
    .slv_reg132(),
    .slv_reg133(),
    .slv_reg134(),
    .slv_reg135(),
    .slv_reg136(),
    .slv_reg137(),
    .slv_reg138(),
    .slv_reg139(),
    .slv_reg140(),
    .slv_reg141(),
    .slv_reg142(),
    .slv_reg143(),
    .slv_reg144(),
    .slv_reg145(),
    .slv_reg146(),
    .slv_reg147(),
    .slv_reg148(),
    .slv_reg149(),
    .slv_reg150(),
    .slv_reg151(),
    .slv_reg152(),
    .slv_reg153(),
    .slv_reg154(),
    .slv_reg155(),
    .slv_reg156(),
    .slv_reg157(),
    .slv_reg158(),
    .slv_reg159(),
    .slv_reg160(),
    .slv_reg161(),
    .slv_reg162(),
    .slv_reg163(),
    .slv_reg164(),
    .slv_reg165(),
    .slv_reg166(),
    .slv_reg167(),
    .slv_reg168(),
    .slv_reg169(),
    .slv_reg170(),
    .slv_reg171(),
    .slv_reg172(),
    .slv_reg173(),
    .slv_reg174(),
    .slv_reg175(),
    .slv_reg176(),
    .slv_reg177(),
    .slv_reg178(),
    .slv_reg179(),
    .slv_reg180(),
    .slv_reg181(),
    .slv_reg182(),
    .slv_reg183(),
    .slv_reg184(),
    .slv_reg185(),
    .slv_reg186(),
    .slv_reg187(),
    .slv_reg188(),
    .slv_reg189(),
    .slv_reg190(),
    .slv_reg191(),
    .slv_reg192(),
    .slv_reg193(),
    .slv_reg194(),
    .slv_reg195(),
    .slv_reg196(),
    .slv_reg197(),
    .slv_reg198(),
    .slv_reg199(),
    .slv_reg200(),
    .slv_reg201(),
    .slv_reg202(),
    .slv_reg203(),
    .slv_reg204(),
    .slv_reg205(),
    .slv_reg206(),
    .slv_reg207(),
    .slv_reg208(),
    .slv_reg209(),
    .slv_reg210(),
    .slv_reg211(),
    .slv_reg212(),
    .slv_reg213(),
    .slv_reg214(),
    .slv_reg215(),
    .slv_reg216(),
    .slv_reg217(),
    .slv_reg218(),
    .slv_reg219(),
    .slv_reg220(),
    .slv_reg221(),
    .slv_reg222(),
    .slv_reg223(),
    .slv_reg224(),
    .slv_reg225(),
    .slv_reg226(),
    .slv_reg227(),
    .slv_reg228(),
    .slv_reg229(),
    .slv_reg230(),
    .slv_reg231(),
    .slv_reg232(),
    .slv_reg233(),
    .slv_reg234(),
    .slv_reg235(),
    .slv_reg236(),
    .slv_reg237(),
    .slv_reg238(),
    .slv_reg239(),
    .slv_reg240(),
    .slv_reg241(),
    .slv_reg242(),
    .slv_reg243(),
    .slv_reg244(),
    .slv_reg245(),
    .slv_reg246(),
    .slv_reg247(),
    .slv_reg248(),
    .slv_reg249(),
    .slv_reg250(),
    .slv_reg251(),
    .slv_reg252(),
    .slv_reg253(),
    .slv_reg254(),
    .slv_reg255(),
    .slv_reg256(),
    .slv_reg257(),
    .slv_reg258(),
    .slv_reg259(),
    .slv_reg260(),
    .slv_reg261(),
    .slv_reg262(),
    .slv_reg263(),
    .slv_reg264(),
    .slv_reg265(),
    .slv_reg266(),
    .slv_reg267(),
    .slv_reg268(),
    .slv_reg269(),
    .slv_reg270(),
    .slv_reg271(),
    .slv_reg272(),
    .slv_reg273(),
    .slv_reg274(),
    .slv_reg275(),
    .slv_reg276(),
    .slv_reg277(),
    .slv_reg278(),
    .slv_reg279(),
    .slv_reg280(),
    .slv_reg281(),
    .slv_reg282(),
    .slv_reg283(),
    .slv_reg284(),
    .slv_reg285(),
    .slv_reg286(),
    .slv_reg287(),
    .slv_reg288(),
    .slv_reg289(),
    .slv_reg290(),
    .slv_reg291(),
    .slv_reg292(),
    .slv_reg293(),
    .slv_reg294(),
    .slv_reg295(),
    .slv_reg296(),
    .slv_reg297(),
    .slv_reg298(),
    .slv_reg299(),
    .slv_reg300(),
    .slv_reg301(),
    .slv_reg302(),
    .slv_reg303(),
    .slv_reg304(),
    .slv_reg305(),
    .slv_reg306(),
    .slv_reg307(),
    .slv_reg308(),
    .slv_reg309(),
    .slv_reg310(),
    .slv_reg311(),
    .slv_reg312(),
    .slv_reg313(),
    .slv_reg314(),
    .slv_reg315(),
    .slv_reg316(),
    .slv_reg317(),
    .slv_reg318(),
    .slv_reg319(),
    .slv_reg320(),
    .slv_reg321(),
    .slv_reg322(),
    .slv_reg323(),
    .slv_reg324(),
    .slv_reg325(),
    .slv_reg326(),
    .slv_reg327(),
    .slv_reg328(),
    .slv_reg329(),
    .slv_reg330(),
    .slv_reg331(),
    .slv_reg332(),
    .slv_reg333(),
    .slv_reg334(),
    .slv_reg335(),
    .slv_reg336(),
    .slv_reg337(),
    .slv_reg338(),
    .slv_reg339(),
    .slv_reg340(),
    .slv_reg341(),
    .slv_reg342(),
    .slv_reg343(),
    .slv_reg344(),
    .slv_reg345(),
    .slv_reg346(),
    .slv_reg347(),
    .slv_reg348(),
    .slv_reg349(),
    .slv_reg350(),
    .slv_reg351(),
    .slv_reg352(),
    .slv_reg353(),
    .slv_reg354(),
    .slv_reg355(),
    .slv_reg356(),
    .slv_reg357(),
    .slv_reg358(),
    .slv_reg359(),
    .slv_reg360(),
    .slv_reg361(),
    .slv_reg362(),
    .slv_reg363(),
    .slv_reg364(),
    .slv_reg365(),
    .slv_reg366(),
    .slv_reg367(),
    .slv_reg368(),
    .slv_reg369(),
    .slv_reg370(),
    .slv_reg371(),
    .slv_reg372(),
    .slv_reg373(),
    .slv_reg374(),
    .slv_reg375(),
    .slv_reg376(),
    .slv_reg377(),
    .slv_reg378(),
    .slv_reg379(),
    .slv_reg380(),
    .slv_reg381(),
    .slv_reg382(),
    .slv_reg383(),
    .slv_reg384(),
    .slv_reg385(),
    .slv_reg386(),
    .slv_reg387(),
    .slv_reg388(),
    .slv_reg389(),
    .slv_reg390(),
    .slv_reg391(),
    .slv_reg392(),
    .slv_reg393(),
    .slv_reg394(),
    .slv_reg395(),
    .slv_reg396(),
    .slv_reg397(),
    .slv_reg398(),
    .slv_reg399(),
    .slv_reg400(),
    .slv_reg401(),
    .slv_reg402(),
    .slv_reg403(),
    .slv_reg404(),
    .slv_reg405(),
    .slv_reg406(),
    .slv_reg407(),
    .slv_reg408(),
    .slv_reg409(),
    .slv_reg410(),
    .slv_reg411(),
    .slv_reg412(),
    .slv_reg413(),
    .slv_reg414(),
    .slv_reg415(),
    .slv_reg416(),
    .slv_reg417(),
    .slv_reg418(),
    .slv_reg419(),
    .slv_reg420(),
    .slv_reg421(),
    .slv_reg422(),
    .slv_reg423(),
    .slv_reg424(),
    .slv_reg425(),
    .slv_reg426(),
    .slv_reg427(),
    .slv_reg428(),
    .slv_reg429(),
    .slv_reg430(),
    .slv_reg431(),
    .slv_reg432(),
    .slv_reg433(),
    .slv_reg434(),
    .slv_reg435(),
    .slv_reg436(),
    .slv_reg437(),
    .slv_reg438(),
    .slv_reg439(),
    .slv_reg440(),
    .slv_reg441(),
    .slv_reg442(),
    .slv_reg443(),
    .slv_reg444(),
    .slv_reg445(),
    .slv_reg446(),
    .slv_reg447(),
    .slv_reg448(),
    .slv_reg449(),
    .slv_reg450(),
    .slv_reg451(),
    .slv_reg452(),
    .slv_reg453(),
    .slv_reg454(),
    .slv_reg455(),
    .slv_reg456(),
    .slv_reg457(),
    .slv_reg458(),
    .slv_reg459(),
    .slv_reg460(),
    .slv_reg461(),
    .slv_reg462(),
    .slv_reg463(),
    .slv_reg464(),
    .slv_reg465(),
    .slv_reg466(),
    .slv_reg467(),
    .slv_reg468(),
    .slv_reg469(),
    .slv_reg470(),
    .slv_reg471(),
    .slv_reg472(),
    .slv_reg473(),
    .slv_reg474(),
    .slv_reg475(),
    .slv_reg476(),
    .slv_reg477(),
    .slv_reg478(),
    .slv_reg479(),
    .slv_reg480(),
    .slv_reg481(),
    .slv_reg482(),
    .slv_reg483(),
    .slv_reg484(),
    .slv_reg485(),
    .slv_reg486(),
    .slv_reg487(),
    .slv_reg488(),
    .slv_reg489(),
    .slv_reg490(),
    .slv_reg491(),
    .slv_reg492(),
    .slv_reg493(),
    .slv_reg494(),
    .slv_reg495(),
    .slv_reg496(),
    .slv_reg497(),
    .slv_reg498(),
    .slv_reg499(),
    .slv_reg500(),
    .slv_reg501(),
    .slv_reg502(),
    .slv_reg503(),
    .slv_reg504(),
    .slv_reg505(),
    .slv_reg506(),
    .slv_reg507(),
    .slv_reg508(),
    .slv_reg509(),
    .slv_reg510(),
    .slv_reg511(),
    .in_slv_reg_wren(in_slv_reg_wren),
    .in_slv_reg0(in_slv_reg0),
    .in_slv_reg1(in_slv_reg1),
    .in_slv_reg2(in_slv_reg2),
    .in_slv_reg3(in_slv_reg3),
    .in_slv_reg4(in_slv_reg4),
    .in_slv_reg5(in_slv_reg5),
    .in_slv_reg6(in_slv_reg6),
    .in_slv_reg7(in_slv_reg7),
    .in_slv_reg8(in_slv_reg8),
    .in_slv_reg9(in_slv_reg9),
    .in_slv_reg10(in_slv_reg10),
    .in_slv_reg11(in_slv_reg11),
    .in_slv_reg12(in_slv_reg12),
    .in_slv_reg13(in_slv_reg13),
    .in_slv_reg14(in_slv_reg14),
    .in_slv_reg15(in_slv_reg15),
    .in_slv_reg16(in_slv_reg16),
    .in_slv_reg17(in_slv_reg17),
    .in_slv_reg18(in_slv_reg18),
    .in_slv_reg19(in_slv_reg19),
    .in_slv_reg20(in_slv_reg20),
    .in_slv_reg21(in_slv_reg21),
    .in_slv_reg22(in_slv_reg22),
    .in_slv_reg23(in_slv_reg23),
    .in_slv_reg24(in_slv_reg24),
    .in_slv_reg25(in_slv_reg25),
    .in_slv_reg26(in_slv_reg26),
    .in_slv_reg27(in_slv_reg27),
    .in_slv_reg28(in_slv_reg28),
    .in_slv_reg29(in_slv_reg29),
    .in_slv_reg30(in_slv_reg30),
    .in_slv_reg31(in_slv_reg31),
    .s00_axi_awaddr(s00_axi_awaddr),
    .s00_axi_awprot(s00_axi_awprot),
    .s00_axi_awvalid(s00_axi_awvalid),
    .s00_axi_awready(s00_axi_awready),
    .s00_axi_wdata(s00_axi_wdata),
    .s00_axi_wstrb(s00_axi_wstrb),
    .s00_axi_wvalid(s00_axi_wvalid),
    .s00_axi_wready(s00_axi_wready),
    .s00_axi_bresp(s00_axi_bresp),
    .s00_axi_bvalid(s00_axi_bvalid),
    .s00_axi_bready(s00_axi_bready),
    .s00_axi_araddr(s00_axi_araddr),
    .s00_axi_arprot(s00_axi_arprot),
    .s00_axi_arvalid(s00_axi_arvalid),
    .s00_axi_arready(s00_axi_arready),
    .s00_axi_rdata(s00_axi_rdata),
    .s00_axi_rresp(s00_axi_rresp),
    .s00_axi_rvalid(s00_axi_rvalid),
    .s00_axi_rready(s00_axi_rready),
    .s00_axi_aclk(s00_axi_aclk),
    .s00_axi_aresetn(s00_axi_aresetn)
  );
endmodule
