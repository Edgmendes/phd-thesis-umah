`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2017 04:11:32 PM
// Design Name: 
// Module Name: rc_square_wave_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rc_square_wave_gen#(
    parameter integer NBITS = 32           //Number of bits 
)(
    input clk,          // FPGA clock
    input rst,          // System reset   
    input resync,       // Signal for syncronization 
    input [NBITS-1:0]phase_offset,  //Value of inicial phase 
    output wave_out,     // Square wave outputa
    input set_duty_cycle,   //New value duty cycle control flag
    input [NBITS-1:0] duty_cycle,
    input [NBITS-1:0] phase_inc
);

// function called clogb2 that returns an integer which has the                      
// value of the ceiling of the log base 2.                                           
function integer clogb2 (input integer bit_depth);                                   
  begin                                                                              
    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
      bit_depth = bit_depth >> 1;                                                    
  end                                                                                
endfunction 

//Data variables 
// [NBITS-1:0] duty_cycle_reg;
reg [NBITS-1:0]phase_accumulator;
wire [NBITS-1:0] next_phase;
reg [NBITS-1:0] phase_accumulator_new;
wire [NBITS-1:0] next_phase_new;
reg [NBITS/2-1:0] n_stop_cycles_cnt, n_stop_cycles;
wire next_cycle, n_stop_cycles_done; 
wire [NBITS-1:0] PINC;

assign PINC = phase_inc;
assign wave_out = (phase_accumulator < duty_cycle) ? 1'b1 : 1'b0;


//Phase Accumulator Control Logic
always@(posedge clk) begin
    if(rst || resync) begin
        phase_accumulator <= phase_offset;
        //duty_cycle_reg <= duty_cycle;
    end
    else begin
        phase_accumulator <= next_phase;
        //duty_cycle_reg <= duty_cycle;
    end
end


c_addsub_phase phase (
  .A(phase_accumulator),      // input wire [31 : 0] A
  .B(PINC[NBITS-1:0]),      // input wire [31 : 0] B
  .S(next_phase)      // output wire [31 : 0] S
);

endmodule
