`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2023 14:04:57
// Design Name: 
// Module Name: Mult
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


module Mult();
reg CLK;
reg [63:0] PINC_AUX;
reg [23:0] sonar_freq;
wire [31:0] pinc_wire;

mult_gen_uut mult_uut (
  .CLK(CLK),  // input wire CLK
  .A(PINC_AUX),      // input wire [63 : 0] A
  .B(sonar_freq),      // input wire [23 : 0] B
  .P(pinc_wire)       // output wire [42 : 10] P
);

initial begin
    CLK <= 0;
    PINC_AUX <= 0;
    sonar_freq <= 0;
    
    #500
    PINC_AUX <= (2**32*2**10/50000000);
    sonar_freq <= 40000;    
end

always @(CLK) begin
    CLK <= #5 ~CLK;
end

endmodule
