// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Nov  8 14:40:14 2023
// Host        : DESKTOP-QDGQBDK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top te0745_haptic_Haptic_0_0 -prefix
//               te0745_haptic_Haptic_0_0_ te0745_haptic_Haptic_1_0_stub.v
// Design      : te0745_haptic_Haptic_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Haptic,Vivado 2018.2" *)
module te0745_haptic_Haptic_0_0(clk, rst, set_outputs, sonar_pos, sonar_dest, 
  wave_out, resync, set_duty_cycle, duty_cycle, set_frequency, set_velocity, sonar_freq, 
  sound_velocity)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,set_outputs,sonar_pos[13391:0],sonar_dest[13391:0],wave_out[247:0],resync,set_duty_cycle,duty_cycle[31:0],set_frequency,set_velocity,sonar_freq[23:0],sound_velocity[8:0]" */;
  input clk;
  input rst;
  input set_outputs;
  input [13391:0]sonar_pos;
  input [13391:0]sonar_dest;
  output [247:0]wave_out;
  output resync;
  input set_duty_cycle;
  input [31:0]duty_cycle;
  input set_frequency;
  input set_velocity;
  input [23:0]sonar_freq;
  input [8:0]sound_velocity;
endmodule
