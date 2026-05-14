`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Minho
// Engineer: 
// 
// Create Date: 05/30/2017 11:09:20 AM
// Design Name: 
// Module Name: Haptic
// Project Name: Haptic
// Target Devices: ZC706
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


module Haptic#(
    parameter integer DATA_WIDTH = 18,     //Number of bits for data
    parameter integer PHASE_WIDTH = 32,     //Number of bits for Phase
    parameter integer FREQ_WIDTH = 24,     //
    parameter integer NSONARS = 248,          //Number of Sonars of Haptic
    parameter integer FCLK = 50000000,
    parameter debug = 0
)(
        input clk,  // FPGA clock
        input rst,  // System reset        
        input set_outputs,                  //New Position value control flag
        input set_duty_cycle,               //New value duty cycle control flag
        input set_frequency,                //New value ultrasound frequency control flag
		input set_velocity,
        input [PHASE_WIDTH-1:0]poff_idx_dbg,   //Sonar index Debug signal  
        input [DATA_WIDTH*3*NSONARS-1:0] sonar_pos,   //Sonars Source positions
        input [DATA_WIDTH*3*NSONARS-1:0] sonar_dest,  //Focal Point position
        input [PHASE_WIDTH-1:0] duty_cycle, //Duty Cycle of the square wave      
        input [FREQ_WIDTH-1:0] sonar_freq,  //Frequency of the Ultrasound output wave (Hz)
		input [PHASE_WIDTH/4:0] sound_velocity,
        output reg [PHASE_WIDTH-1:0]poff_dbg,  //Phase value Debug signal      
        output [NSONARS-1:0] wave_out,      //Square ware outputs 
        output resync
        //output phcalc_flag  //Debug flag (sinalizes the end of the phase calculations)
);

// function called clogb2 that returns an integer which has the                      
// value of the ceiling of the log base 2.                                           
function integer clogb2 (input integer bit_depth);                                   
  begin                                                                              
    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
      bit_depth = bit_depth >> 1;                                                    
  end                                                                                
endfunction 

   
localparam integer PH_CALC_WIDTH = 64;
// Number of bits in order to achieve higher precision in phase calculations
localparam integer OPTIMIZED_WIDTH = 23;
localparam integer OPTIMIZED_SHIFT = PHASE_WIDTH - OPTIMIZED_WIDTH;

localparam [PHASE_WIDTH/4:0] SOUND_SPEED_20C = 344;						//Speed of sound m/s at 21ºC
localparam integer SONAR_FREQ_PARAM = 40000;							//Frequency ultrasound
localparam [PH_CALC_WIDTH-1:0] HALF_DC_POFF = 2**PHASE_WIDTH*50/100;  	//Duty cycle = 50%
localparam [PH_CALC_WIDTH-1:0] PINC_AUX = 2**PHASE_WIDTH*2**10/FCLK;	//A multiplicação por 2^10 (=1024) é para aumentar a resolução do calculo (=precisão na gereação da frequência)
localparam [PH_CALC_WIDTH-1:0] PINC_PARAM = SONAR_FREQ_PARAM*2**PHASE_WIDTH/FCLK;

//Latency in clock cycles, associated with phase offset calculation
localparam integer CALCS_LATENCY = 58+13+4*2+6+2-1;   

//Bit Widths
localparam integer NSONARS_BITS = (NSONARS == 1) ? 1 : clogb2(NSONARS-1);

//Data Variables
reg [OPTIMIZED_WIDTH*3*NSONARS-1:0] sonar_pos_reg;
reg [OPTIMIZED_WIDTH*3*NSONARS-1:0] sonar_dest_reg;
reg [OPTIMIZED_WIDTH*3-1:0] ultrason_pos, ultrason_dest; 
wire [OPTIMIZED_WIDTH-1:0] ultrason_diff_x, ultrason_diff_y, ultrason_diff_z;
wire [OPTIMIZED_WIDTH*2-1:0] ultrason_square_diff_x, ultrason_square_diff_y, ultrason_square_diff_z, ultrason_square_diff_z_dly;
wire [OPTIMIZED_WIDTH*2:0] ultrason_add_square_diff_xy;
wire [OPTIMIZED_WIDTH*2+1:0] ultrason_add_square_diff_xyz;
wire [PHASE_WIDTH-1:0] phase_offset;
reg [PHASE_WIDTH*NSONARS-1:0] POFF;

//Control Variables
reg [NSONARS_BITS-1:0] nsonars_cnt, nsonars_wave_cnt, nsonars_dbg_wave_cnt;
wire nsonars_done, nsonars_wave_done, nsonars_dbg_wave_done;
reg nsonars_wave_done_dly;

assign nsonars_done = (nsonars_cnt == (NSONARS-1)) ? 1'b1 : 1'b0;
assign nsonars_wave_done = (nsonars_wave_cnt == (NSONARS-1)) ? 1'b1 : 1'b0;
assign nsonars_dbg_wave_done = (nsonars_dbg_wave_cnt == (NSONARS-1)) ? 1'b1 : 1'b0;


//reg phase_calc_reg;
//always@(posedge clk)begin
//    if(rst)
//        phase_calc_reg <= 0;
//    else
//        if(nsonars_wave_done_dly)
//            phase_calc_reg <= ~phase_calc_reg;
//end

//assign phcalc_flag = (rst) ? 0 : phase_calc_reg;


//----------------------Capture Input Transition----------------------------------------//
reg [1:0] set = 2'b0;
wire set_outputs_posedge;

always@(posedge clk) begin
    set <= {set[0], set_outputs};
end

assign set_outputs_posedge = set[0] & !set[1];

//Ultrasound duty_cycle new value
reg [1:0] shift_reg2 = 2'b0;
wire set_dc_posedge;

always@(posedge clk) begin
    shift_reg2 <= {shift_reg2[0], set_duty_cycle};
end

assign set_dc_posedge = shift_reg2[0] & !shift_reg2[1];

//Ultrasound frequency new value
reg [1:0] sr_freq = 2'b0;
wire set_frequency_posedge;

always@(posedge clk) begin
    sr_freq <= {sr_freq[0], set_frequency};
end

assign set_frequency_posedge = sr_freq[0] & !sr_freq[1];

//Sound Velocity new value
reg [1:0] sr_vel = 2'b0;
wire set_velocity_posedge;

always@(posedge clk) begin
    sr_vel <= {sr_vel[0], set_velocity};
end

assign set_velocity_posedge = sr_vel[0] & !sr_vel[1];

//----------------------Capture Input Parameters----------------------------------------//

//Duty Cycle Aquisition logic
reg [PHASE_WIDTH-1:0] dc_aux;

always@(posedge clk)begin
    if(rst) begin
        dc_aux <= HALF_DC_POFF;
    end
    else begin
		dc_aux <= (set_dc_posedge) ? duty_cycle : dc_aux;
    end
end

//Frequency Aquisition logic
reg [FREQ_WIDTH-1:0] sonar_freq_aux;

always@(posedge clk)begin
    if(rst) begin
        sonar_freq_aux <= SONAR_FREQ_PARAM;
    end
    else begin
		sonar_freq_aux <= (set_frequency_posedge) ? sonar_freq : sonar_freq_aux;
    end
end

//Velocity Aquisition logic
reg [PHASE_WIDTH/4:0] sound_velocity_aux;

always@(posedge clk)begin
    if(rst) begin
        sound_velocity_aux <= SOUND_SPEED_20C;
    end
    else begin
		sound_velocity_aux <= (set_velocity_posedge) ? sound_velocity : sound_velocity_aux;
    end
end
//----------------------PHASE CALC AUX parameter calculation (2^23*Velocity)----------------------------------------//

//localparam integer PH_CALC_AUX = SOUND_SPEED_20C*2**23;
wire [PHASE_WIDTH-1:0] PH_CALC_AUX;

mult_gen_ph_calc_aux ph_calc_aux (
  .CLK(clk),  // input wire CLK
  .A(2**23),      // input wire [22 : 0] A
  .B(sound_velocity_aux),      // input wire [8 : 0] B
  .P(PH_CALC_AUX)      // output wire [31 : 0] P
);

//----------------------PHASE CALC auxiliary parameter calculation (PH_CALC_AUX/Frequency)----------------------------------------//

wire [FREQ_WIDTH-1 : 0] s_axis_divisor_tdata_param;
wire s_axis_dividend_tvalid_param;
wire s_axis_divisor_tvalid_param;
wire [PHASE_WIDTH-1 : 0] s_axis_dividend_tdata_param;
wire m_axis_dout_tvalid_param;
wire [47 : 0] m_axis_dout_tdata_param;
wire [23 : 0] m_axis_dout_tdata_integer;

assign s_axis_dividend_tvalid_param = 1'b1;
assign s_axis_dividend_tdata_param = PH_CALC_AUX;
assign s_axis_divisor_tvalid_param = 1'b1;
assign s_axis_divisor_tdata_param = sonar_freq_aux;
assign m_axis_dout_tdata_integer = m_axis_dout_tdata_param[47:24];

div_gen_phase_calc parameter_phase_calc (
  .aclk(clk),                                     
  .s_axis_divisor_tvalid(s_axis_divisor_tvalid_param),  
  .s_axis_divisor_tdata(s_axis_divisor_tdata_param),     
  .s_axis_dividend_tvalid(s_axis_dividend_tvalid_param),
  .s_axis_dividend_tdata(s_axis_dividend_tdata_param),
  .m_axis_dout_tvalid(m_axis_dout_tvalid_param),       
  .m_axis_dout_tdata(m_axis_dout_tdata_param)           
);

//----------------------PHASE INC calculation (to be sent to the Square Wave Gen)----------------------------------------//
wire [PHASE_WIDTH-1:0] pinc_wire;
reg [PHASE_WIDTH-1:0] PINC;

mult_gen_pinc phase_inc_mod (
  .CLK(clk),  		
  .A(PINC_AUX),      	
  .B(sonar_freq_aux),     
  .P(pinc_wire)      			
);

//----------------------Latency of the Calculations----------------------------------------//
reg [CALCS_LATENCY-1:0] calc_latency = {CALCS_LATENCY{1'b0}};
reg wait_calc, feed_inputs;
wire finish_calcs;

always@(posedge clk) begin
    calc_latency <= {calc_latency[CALCS_LATENCY-2:0], wait_calc};
end

assign finish_calcs = calc_latency[CALCS_LATENCY-1];

//----------------------System Control----------------------------------------//
//State Machine States
//This SM is responsible for controlling the system calculus
localparam [1:0] SONARS_INIT = 2'b00,        // Wait for the trigger    
                SONARS_WAIT  = 2'b01,        // Wait for phase calculus                              
                SONARS_GEN  = 2'b10;         // Generate waveforms

// State variables                                                             
reg [1:0] sonars_current_state;
reg [1:0] sonars_next_state;

//Control Variables
reg  gen_waves; 

// Control state machine implementation                             
always @(posedge clk) begin                                                                     
  if (rst) begin                                                                 
        sonars_current_state <= SONARS_INIT;
  end
  else begin
        sonars_current_state <= sonars_next_state;
  end
end

//Next State Combinational Control Logic
always@(*) begin 
wait_calc = 0;
feed_inputs = 0;
gen_waves = 0;

    case (sonars_current_state)                                                 
      SONARS_INIT: begin                                                        
        sonars_next_state  = set_outputs_posedge ? SONARS_WAIT : SONARS_INIT;                              
      end
      
      SONARS_WAIT: begin  
         wait_calc = 1;  
         feed_inputs = 1;                                                 
        sonars_next_state  = finish_calcs ?  SONARS_GEN : SONARS_WAIT;                              
      end
                                                                          
      SONARS_GEN:   begin 
         gen_waves = 1;      
         feed_inputs = 1;                  
        sonars_next_state  = nsonars_wave_done ? SONARS_INIT : SONARS_GEN;
      end
      default: begin
        sonars_next_state  = SONARS_INIT;
      end
    endcase       
end

//Inputs Selector
always@(*) begin
    ultrason_pos = (sonar_pos_reg[OPTIMIZED_WIDTH*3*(nsonars_cnt+1)-1 -: OPTIMIZED_WIDTH*3]);
    ultrason_dest = (sonar_dest_reg[OPTIMIZED_WIDTH*3*(nsonars_cnt+1)-1 -: OPTIMIZED_WIDTH*3]);
end

wire [OPTIMIZED_WIDTH*3*NSONARS-1:0] sonar_pos_wire;
wire [OPTIMIZED_WIDTH*3*NSONARS-1:0] sonar_dst_wire;
generate
genvar n_sonars;

	for(n_sonars = 0; n_sonars < NSONARS; n_sonars=n_sonars+1) begin: gen_multipliers
		
		multiplier mult_src_x(
			.A(sonar_pos[(DATA_WIDTH*3*n_sonars)+DATA_WIDTH*3 - 1 -: DATA_WIDTH]),
			.P(sonar_pos_wire[(OPTIMIZED_WIDTH*3*n_sonars)+OPTIMIZED_WIDTH*3 - 1 -: OPTIMIZED_WIDTH])
		);
		multiplier mult_src_y(
			.A(sonar_pos[(DATA_WIDTH*3*n_sonars)+DATA_WIDTH*2 - 1 -: DATA_WIDTH]),
			.P(sonar_pos_wire[(OPTIMIZED_WIDTH*3*n_sonars)+OPTIMIZED_WIDTH*2 - 1 -: OPTIMIZED_WIDTH])
		);
		multiplier mult_src_z(
			.A(sonar_pos[(DATA_WIDTH*3*n_sonars)+DATA_WIDTH - 1 -: DATA_WIDTH]),
			.P(sonar_pos_wire[(OPTIMIZED_WIDTH*3*n_sonars)+OPTIMIZED_WIDTH - 1 -: OPTIMIZED_WIDTH])
		);
		
        multiplier mult_dst_x(
            .A(sonar_dest[(DATA_WIDTH*3*n_sonars)+DATA_WIDTH*3 - 1 -: DATA_WIDTH]),
            .P(sonar_dst_wire[(OPTIMIZED_WIDTH*3*n_sonars)+OPTIMIZED_WIDTH*3 - 1 -: OPTIMIZED_WIDTH])
        );
        multiplier mult_dst_y(
            .A(sonar_dest[(DATA_WIDTH*3*n_sonars)+DATA_WIDTH*2 - 1 -: DATA_WIDTH]),
            .P(sonar_dst_wire[(OPTIMIZED_WIDTH*3*n_sonars)+OPTIMIZED_WIDTH*2 - 1 -: OPTIMIZED_WIDTH])
        );
        multiplier mult_dst_z(
            .A(sonar_dest[(DATA_WIDTH*3*n_sonars)+DATA_WIDTH - 1 -: DATA_WIDTH]),
            .P(sonar_dst_wire[(OPTIMIZED_WIDTH*3*n_sonars)+OPTIMIZED_WIDTH - 1 -: OPTIMIZED_WIDTH])
        );
		
	end
	
endgenerate

//Inputs Control
always@(posedge clk) begin
    if(rst) begin
        sonar_pos_reg <= 0;
        sonar_dest_reg <= 0;
        nsonars_cnt <= 0;
    end
    else begin
        //Hold Values
        if(set_outputs_posedge) begin
            sonar_pos_reg <= sonar_pos_wire;
            sonar_dest_reg <= sonar_dst_wire;
        end
        
        //Start Selecting Inputs after trigger
        if(nsonars_done || !feed_inputs)
            nsonars_cnt <= 0;
        else
            nsonars_cnt <= nsonars_cnt + 1;
    end
end

//-----------------------------------Subtractors Distance Coordinates (Xcur-Xdest,Ycur-Ydest,Zcur-Zdest)------------------------------------------//
//- 2 Clock Cycles Latency -//
c_sub_coord sub_coordinates_x (
  .A(ultrason_pos[(OPTIMIZED_WIDTH*3)-1 -: OPTIMIZED_WIDTH]),      // input wire [31 : 0] A
  .B(ultrason_dest[(OPTIMIZED_WIDTH*3)-1 -: OPTIMIZED_WIDTH]),      // input wire [31 : 0] B
  .CLK(clk),  // input wire CLK
  .S(ultrason_diff_x)      // output wire [31 : 0] S
);

c_sub_coord sub_coordinates_y (
  .A(ultrason_pos[(OPTIMIZED_WIDTH*2)-1 -: OPTIMIZED_WIDTH]),      // input wire [31 : 0] A
  .B(ultrason_dest[(OPTIMIZED_WIDTH*2)-1 -: OPTIMIZED_WIDTH]),      // input wire [31 : 0] B
  .CLK(clk),  // input wire CLK
  .S(ultrason_diff_y)      // output wire [31 : 0] S
);

c_sub_coord sub_coordinates_z (
  .A(ultrason_pos[OPTIMIZED_WIDTH-1 -: OPTIMIZED_WIDTH]),      // input wire [31 : 0] A
  .B(ultrason_dest[OPTIMIZED_WIDTH-1 -: OPTIMIZED_WIDTH]),      // input wire [31 : 0] B
  .CLK(clk),  // input wire CLK
  .S(ultrason_diff_z)      // output wire [31 : 0] S
);


//-----------------------------------Multipliers Square Coordinates (X,Y,Z)------------------------------------------//
//- 6 Clock Cycles Latency -//
mult_gen_coord square_coordinates_x (
  .CLK(clk),  // input wire CLK
  .A(ultrason_diff_x),      // input wire [31 : 0] A
  .B(ultrason_diff_x),      // input wire [31 : 0] B
  .P(ultrason_square_diff_x)      // output wire [47 : 0] P
);

mult_gen_coord square_coordinates_y (
  .CLK(clk),  // input wire CLK
  .A(ultrason_diff_y),      // input wire [31 : 0] A
  .B(ultrason_diff_y),      // input wire [31 : 0] B
  .P(ultrason_square_diff_y)      // output wire [47 : 0] P
);

mult_gen_coord square_coordinates_z (
  .CLK(clk),  // input wire CLK
  .A(ultrason_diff_z),      // input wire [31 : 0] A
  .B(ultrason_diff_z),      // input wire [31 : 0] B
  .P(ultrason_square_diff_z)      // output wire [47 : 0] P
);


//-----------------------------------Adder Square Coordinates (X^2 + Y^2 + Z^2)------------------------------------------//
//- 4 Clock Cycles Latency -//
c_add_mod_coord_xy add_mod_coord_xy (
  .A(ultrason_square_diff_x),      // input wire [47 : 0] A
  .B(ultrason_square_diff_y),      // input wire [47 : 0] B
  .CLK(clk),  // input wire CLK
  .S(ultrason_add_square_diff_xy)      // output wire [47 : 0] S
);

//Generate a delay Z^2, to synchronize the calculations
localparam clock_cycles = 4;    //Adder (X^2 + Y^2) Delay

reg [clock_cycles-1:0] shift_reg_square_diff_z [OPTIMIZED_WIDTH*2-1:0];

genvar i;
generate
   for (i=0; i < (OPTIMIZED_WIDTH*2); i=i+1) begin: square_z_delay
      always @(posedge clk)
         if (rst) begin
            shift_reg_square_diff_z[i] <= 0;
         end
         else begin
            shift_reg_square_diff_z[i] <= {shift_reg_square_diff_z[i][clock_cycles-2:0], ultrason_square_diff_z[i]};
        end

      assign ultrason_square_diff_z_dly[i] = shift_reg_square_diff_z[i][clock_cycles-1];
   end
endgenerate

c_add_mod_coord_xyz add_mod_coord_xyz (
  .A(ultrason_add_square_diff_xy),      // input wire [47 : 0] A
  .B(ultrason_square_diff_z_dly),      // input wire [47 : 0] B
  .CLK(clk),  // input wire CLK
  .S(ultrason_add_square_diff_xyz)      // output wire [47 : 0] S
);

//-----------------------------------Square Root Coordinates sqrt(X^2 + Y^2 + Z^2)------------------------------------------//
//- 26 Clock Cycles Latency -//
wire s_axis_sqrt_tvalid;
wire m_axis_sqrt_tvalid;
wire [OPTIMIZED_WIDTH:0] m_axis_sqrt_tdata;
wire [OPTIMIZED_WIDTH+PHASE_WIDTH:0] m_axis_sqrt_tdata_shifted;

assign s_axis_sqrt_tvalid = 1'b1;

cordic_square_root square_root_coordinates (
  .aclk(clk),                                        // input wire aclk
  .s_axis_cartesian_tvalid(s_axis_sqrt_tvalid),  // input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata(ultrason_add_square_diff_xyz),    // input wire [47 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid(m_axis_sqrt_tvalid),            // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(m_axis_sqrt_tdata)              // output wire [31 : 0] m_axis_dout_tdata
);

//----------------------------------- Wave POFF Calc  O= -2pi*freq*dist/v ------------------------------------------//
//- 58 Clock Cycles Latency -//
wire s_axis_dividend_tvalid;
wire s_axis_divisor_tvalid;
wire m_axis_dout_tvalid;
wire [79:0] m_axis_dout_tdata;

assign s_axis_dividend_tvalid = 1'b1;
assign s_axis_divisor_tvalid = 1'b1;

assign m_axis_sqrt_tdata_shifted = {m_axis_sqrt_tdata,32'b0};

div_gen_wave_length phase_calc (
  .aclk(clk),                                      // input wire aclk
  .s_axis_divisor_tvalid(s_axis_divisor_tvalid),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(m_axis_dout_tdata_integer),      // input wire [23 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(s_axis_dividend_tvalid),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(m_axis_sqrt_tdata_shifted),    // input wire [55 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(m_axis_dout_tvalid),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(m_axis_dout_tdata)            // output wire [79 : 0] m_axis_dout_tdata
);

assign phase_offset = m_axis_dout_tdata[OPTIMIZED_WIDTH+PHASE_WIDTH:OPTIMIZED_WIDTH+1];

//-----------------------------------Sonars Wave Generator------------------------------------------//
//Inputs Control
always@(posedge clk) begin
    if(rst) begin
        nsonars_wave_cnt <= 0;
        nsonars_wave_done_dly <= 0;
    end
    else begin
        nsonars_wave_done_dly <= nsonars_wave_done;            

        if(gen_waves) begin
            if(nsonars_wave_done)
                nsonars_wave_cnt <= 0;
            else
                nsonars_wave_cnt <= nsonars_wave_cnt + 1;
        end
    end
end

//-----------------------------------Atuators os the Sonars (Gen)------------------------------------------//

always@(posedge clk) begin
    if(rst) begin
        PINC <= PINC_PARAM;
    end
    else begin
        if(nsonars_wave_done_dly)
            PINC <= pinc_wire;
    end
end

generate
genvar rw;
    for(rw = 0; rw < NSONARS; rw=rw+1) begin : gen_ref_wave
    
        always@(posedge clk) begin
            if(rst) begin
                POFF[PHASE_WIDTH*(rw+1)-1 -: PHASE_WIDTH] <= 0;
            end
            else begin
                if(gen_waves && (nsonars_wave_cnt == rw) )
                    POFF[PHASE_WIDTH*(rw+1)-1 -: PHASE_WIDTH] <= phase_offset;
            end
        end
    
        rc_square_wave_gen#(
            .NBITS(PHASE_WIDTH)
        ) gen_wave_ref(
            .clk(clk),
            .rst(rst),            
            .resync(nsonars_wave_done_dly),        
            .phase_offset(POFF[PHASE_WIDTH*(rw+1)-1 -: PHASE_WIDTH]),
            .wave_out(wave_out[rw]),
            .duty_cycle(dc_aux),
            .phase_inc(PINC)
        );
    end
endgenerate

assign resync = nsonars_wave_done_dly;

//Debug
if (debug == 1) begin
    always@(poff_idx_dbg) begin
            //Debug POFF
            poff_dbg <= POFF[PHASE_WIDTH*(poff_idx_dbg+1)-1 -: PHASE_WIDTH];  
    end
end
    
endmodule
