`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2023 16:18:59
// Design Name: 
// Module Name: ph_off
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


module ph_off();
reg CLK;
reg [31:0] speed_shifted;

reg s_axis_divisor_tvalid;
reg [23 : 0] s_axis_divisor_tdata;
reg s_axis_dividend_tvalid;
wire m_axis_dout_tvalid;
wire [55 : 0] m_axis_dout_tdata;

wire [23:0] lamda_integer;
wire [23:0] lamda_remainder;

wire [55:0] phase_off_integer;
wire [23:0] phase_off_remainder;
wire [31:0] phase_off_integer_trunqued;

reg [23:0] sonar_freq;


reg phoff_s_axis_divisor_tvalid;
reg [23 : 0] phoff_s_axis_divisor_tdata;
reg phoff_s_axis_dividend_tvalid;
reg [55 : 0] distance;
wire phoff_m_axis_dout_tvalid;
wire [79 : 0] phoff_m_axis_dout_tdata;

assign lamda_integer = m_axis_dout_tdata[55:24];		//assign from 32bit to a 24 bit variable
assign lamda_remainder = m_axis_dout_tdata[23:0];


assign phase_off_integer = phoff_m_axis_dout_tdata[79:24];		
assign phase_off_remainder = phoff_m_axis_dout_tdata[23:0];
assign phase_off_integer_trunqued = phoff_m_axis_dout_tdata[55:24];

initial begin
    CLK <= 0;
    speed_shifted <= (2**23 * 344); //speed of sound enconded
	distance <= {24'd485,32'b0};
	
	s_axis_dividend_tvalid <= 0;
	s_axis_divisor_tvalid <= 0;
	phoff_s_axis_dividend_tvalid <= 0;
	phoff_s_axis_divisor_tvalid <= 0;
	
    #500
    s_axis_dividend_tvalid <= 1;
    
    #500
    sonar_freq <= 200000;
    #50
    s_axis_divisor_tdata <= sonar_freq;
    s_axis_divisor_tvalid <= 1;
	
	#500
	phoff_s_axis_dividend_tvalid <= 1;
	phoff_s_axis_divisor_tvalid <= 1;

end

always @(CLK) begin
    CLK <= #10 ~CLK;
end

div_lambda_uut lambda_uut (
  .aclk(CLK),                                      // input wire aclk
  .s_axis_divisor_tvalid(s_axis_divisor_tvalid),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(s_axis_divisor_tdata),      // input wire [23 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(s_axis_dividend_tvalid),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(speed_shifted),              // input wire [31 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(m_axis_dout_tvalid),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(m_axis_dout_tdata)            // output wire [55 : 0] m_axis_dout_tdata
);


div_phoff_uut phoff_uut (
  .aclk(CLK),                                      // input wire aclk
  .s_axis_divisor_tvalid(phoff_s_axis_divisor_tvalid),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(lamda_integer),                          // input wire [23 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(phoff_s_axis_dividend_tvalid),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(distance),    // input wire [55 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(phoff_m_axis_dout_tvalid),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(phoff_m_axis_dout_tdata)            // output wire [79 : 0] m_axis_dout_tdata
);

endmodule
