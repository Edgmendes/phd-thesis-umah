`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2018 09:27:04
// Design Name: 
// Module Name: TB_two_haptics
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


module TB_Haptics();

parameter integer DATA_WIDTH = 18;
parameter integer VECTOR_WIDTH = 32;
parameter integer NSONARS = 2;
parameter integer FREQ_WIDTH = 24;
parameter integer NCOORDS = 3;
parameter integer PH_CALC_WIDTH = 64;  //Number of bits for auxiliary calcs
parameter [PH_CALC_WIDTH-1:0] half_dc_poff = 2**VECTOR_WIDTH*50/100;  //Duty cycle = 50%

//parameter [DATA_WIDTH*NCOORDS*NSONARS-1:0] transducers_src = {14'd82,14'd82,14'd0,14'd1557,14'd82,14'd0};
//parameter [DATA_WIDTH*NCOORDS*NSONARS-1:0] fp_dst = {14'd819, 14'd819, 14'd1638,14'd819, 14'd819, 14'd1638};

//parameter [DATA_WIDTH*NCOORDS*NSONARS-1:0] transducers_src = {18'd1310,18'd1310,18'd0,18'd24903,18'd1310,18'd0};
//parameter [DATA_WIDTH*NCOORDS*NSONARS-1:0] fp_dst = {18'd13107, 18'd13107, 18'd26214,18'd13107, 18'd13107, 18'd26214};

parameter [DATA_WIDTH*NCOORDS*NSONARS-1:0] transducers_src = {18'd1310,18'd1310,18'd0,18'd3932,18'd1310,18'd0};
parameter [DATA_WIDTH*NCOORDS*NSONARS-1:0] fp_dst = {18'd13107, 18'd13107, 18'd26214,18'd13107, 18'd13107, 18'd26214};


//inputs
reg clk, rst;
reg set_outputs;
reg set_duty_cycle;
reg set_frequency;
reg set_velocity;
reg [DATA_WIDTH*NCOORDS*NSONARS-1:0] sonar_pos;
reg [DATA_WIDTH*NCOORDS*NSONARS-1:0] sonar_dest;
reg [VECTOR_WIDTH-1:0] poff_idx_dbg;
reg [FREQ_WIDTH-1:0] sonar_freq;
reg [VECTOR_WIDTH/4:0] sound_velocity;
reg [VECTOR_WIDTH-1:0] duty_cycle;

//outputs
wire [NSONARS-1:0] wave_out;
wire [VECTOR_WIDTH-1:0] poff_dbg;

Haptic #(
    .NSONARS(NSONARS),
    .DATA_WIDTH(DATA_WIDTH)
)uut_1(
    .clk(clk),
    .rst(rst),    
    .set_outputs(set_outputs),   
    .poff_idx_dbg(poff_idx_dbg),
    .poff_dbg(poff_dbg),
    .sonar_pos(sonar_pos),
    .sonar_dest(sonar_dest),
    .wave_out(wave_out),
    .set_duty_cycle(set_duty_cycle),
    .duty_cycle(duty_cycle),  //Duty Cycle of the square wave
    .set_frequency(set_frequency),   
    .sonar_freq(sonar_freq),  //Frequency of the Ultrasound output wave (Hz)
    .set_velocity(set_velocity),
    .sound_velocity(sound_velocity)
);

initial begin
    clk = 0;
    rst = 1;
    set_outputs = 0;
    set_frequency = 0;
    set_velocity = 0;
    set_duty_cycle = 0;
    sonar_pos = 0;
    sonar_dest = 0; 
    sonar_freq = 0;
    sound_velocity = 0;
    duty_cycle = 0;
    
    #500
    rst = 0;
    sonar_pos = transducers_src;
    sonar_dest = fp_dst;
       
    #3000
    set_outputs = 1;
	#50
	set_outputs = 0;
	
	#50000
    set_frequency = 1;
    sonar_freq = 40000;
    #50
    set_frequency = 0;
    
    #500
    set_outputs = 1;
    #50
    set_outputs = 0;
    
end

//Clk 50 MHz
always @(clk) 
begin
    clk <= #10 ~clk;
end

endmodule