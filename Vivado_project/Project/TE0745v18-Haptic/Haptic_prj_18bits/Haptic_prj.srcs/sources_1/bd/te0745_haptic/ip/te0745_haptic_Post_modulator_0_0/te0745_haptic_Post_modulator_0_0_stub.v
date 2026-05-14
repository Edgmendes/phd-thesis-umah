// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu Nov  9 14:40:57 2023
// Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top te0745_haptic_Post_modulator_0_0 -prefix
//               te0745_haptic_Post_modulator_0_0_ te0745_haptic_Post_modulator_0_0_stub.v
// Design      : te0745_haptic_Post_modulator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Post_modulator,Vivado 2018.2" *)
module te0745_haptic_Post_modulator_0_0(clk, reset, enable, signal_in, resync, n_cycles_on, 
  signal_out)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,enable,signal_in[247:0],resync,n_cycles_on[31:0],signal_out[247:0]" */;
  input clk;
  input reset;
  input enable;
  input [247:0]signal_in;
  input resync;
  input [31:0]n_cycles_on;
  output [247:0]signal_out;
endmodule
