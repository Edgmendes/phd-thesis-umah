// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Jun 20 17:42:26 2023
// Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL/TE0745v18-Haptic-master/Haptic_IP-Core_12bits/Haptic_IP-Core.srcs/sources_1/ip/mult_gen_uut/mult_gen_uut_stub.v
// Design      : mult_gen_uut
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_14,Vivado 2018.2" *)
module mult_gen_uut(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[63:0],B[23:0],P[32:0]" */;
  input CLK;
  input [63:0]A;
  input [23:0]B;
  output [32:0]P;
endmodule
