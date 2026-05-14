`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2023 18:37:37
// Design Name: 
// Module Name: tb
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


module tb();
     
    reg clk;
    reg reset;
    reg [247:0] signal_in;
    reg resync;
    reg [31:0] n_cycles_on;
    wire [247:0] signal_out;
	reg enable;
     
    Post_modulator modulator(
        .clk(clk),
        .reset(reset),
		.enable(enable),
        .signal_in(signal_in),
        .resync(resync),
        .n_cycles_on(n_cycles_on),
        .signal_out(signal_out)
    );
      
    parameter clk_period = 20;
    
//    100 MHz
    always begin
        #(clk_period/2) clk = ~clk;    
    end
    
    parameter s_in_period = 25000;
    
//    40 kHz
    always begin
        #(s_in_period/2) signal_in = ~signal_in;    
    end
    
    initial begin
		clk = 0;
		reset = 1;
		signal_in = 0;
		resync = 0;
		n_cycles_on = 32'h0;
		enable = 0;

		#1000
		reset = 0;

		#(1000000 * 1)
		enable = 1;

		#1000
		resync = 1;
		#10
		resync = 0;

		#1000
		n_cycles_on <= 32'h000b71b0;

		#1000
		resync = 1;
		#10
		resync = 0;

		#(1000000 * 30)
		resync = 1;
		#10
		resync = 0;

		#(1000000 * 50)
		resync = 1;
		#10
		resync = 0;
		
		#(1000000 * 1)
		enable = 0;
            
    end
    
endmodule
