% Measures and plots the acoustic feild. Interacts with the haptic prototype to avoid overheating
% Parameters - Stages-> Resolution Step, Measure Range,
%		       ADC->    Sample Rate, Sample Duration
%              FP scan area-> Center, Offset area

close all;
clear variables;
clc;

dc = 12;
dc_val = int2str(dc);

%ADC main params
SampleRate = 500e3; % must be equal to adc's clock - addClockConnection()
Duration = 1; %seconds

%Stages main params
Stepmm = 2.5;    %mm , spatial step

%high resolution area
center = 115; %mm
offset_center = 45; %mm

%Parameters to avoid haptic system to much overheating
MinutesON = 30;
MinutesOFF = 1;

% UART Comunication
COM_port = "COM6";

% connect to the board
device = serialport(COM_port,115200);

fmods = string([1 50 50]);
SRs = string([50 10 50]);

%Configure Clock
Device = 'Dev2';
adcClk = daq('ni');
ch1 = addoutput(adcClk, Device, 'ctr0', 'PulseGeneration');
clkTerminal = strcat(Device,'/',ch1.Terminal);
ch1.Frequency = SampleRate;

% Configure ADC
adc = daq('ni');
adc.Rate = SampleRate;

[channelOne,IndexOne] = addinput(adc,Device,'ai0','Voltage');
addclock(adc,'ScanClock','External',clkTerminal);

%Start externally generated clock
start(adcClk,'Continuous');

% Stages graphics
fpos = [0 0 600 800]; % figure window size;
f = figure(1);
set(f,'Position', fpos,'Menu','None','Name','APT GUI:');
hX = actxcontrol('MGMOTOR.MGMotorCtrl.1',[10 10 580 380], f);
hY = actxcontrol('MGMOTOR.MGMotorCtrl.1',[10 400 580 380], f);
% Start Control
hX.StartCtrl;
hY.StartCtrl;
% Set the Serial Number
SN_X = 45866898;
SN_Y = 45866895;
set(hX,'HWSerialNum', SN_X);
set(hY,'HWSerialNum', SN_Y);
% Indentify the device
hX.Identify;
hY.Identify;

pause(5); % waiting for the GUI to load up;

% ?
hX.SetJogMode(0,2,2);
hX.SetJogStepSize(0,Stepmm);
hY.SetJogMode(0,2,2);
hY.SetJogStepSize(0,Stepmm);

% Initialize timer for turning ON/OFF the haptic prototype
% secondsBreak = MinutesOFF*60;  %time that the system will be off
% secondsBreakInterval = MinutesON*60; %time that the system will be On
% Stage_vel = 0.15; %seconds/mm
% Stage_Move_delay = Stage_vel * Stepmm;
% Total_simuation_time = 3600*10;
% device.UserData = secondsBreak; %workaround to send the OFF time to the handler


%start Sytem ON/OFF timer
% timer_haptic = timer_haptic_init(secondsBreakInterval+secondsBreak,Total_simuation_time,device);
% start(timer_haptic);

for i = 1:numel(fmods)

    %Sample file
	a = append("F", fmods(i), "Hz", "SR", SRs(i), "_");
    c = append('Fs',string(SampleRate),'Hz_');
    d = append('T',string(Duration),'s_');
    e = append('Center',string(center),'mm_');
    f = append('Off',string(offset_center),'mm_');
    g = append('Step',string(Stepmm),'mm');
    h = append('DC',dc_val);
    filename = append(a, c, d, e, f, g, h, '.bin');

	%Set the Dut cycle 0
	writeline(device,"3");
	writeline(device,"0");
	writeline(device,"3");
	writeline(device,"0");

	hX.MoveHome(0,1==0);
	hY.MoveHome(0,1==0);

	pause(120);

	%verifica se a stage se encontra em andamento
	% return 1 if moving, return 0 if stationary
	XBits = hX.GetStatusBits_Bits(0);
	YBits = hY.GetStatusBits_Bits(0);
	while( (bitget(abs(XBits),5)||bitget(abs(XBits),6)) || ...
		   (bitget(abs(YBits),5)|| bitget(abs(YBits),6)) )
		XBits = hX.GetStatusBits_Bits(0);
		YBits = hY.GetStatusBits_Bits(0);
	end

	hX.SetAbsMovePos(0,center-offset_center);
	hX.MoveAbsolute(0,1==0);

	pause(10);

	XBits = hX.GetStatusBits_Bits(0);
	YBits = hY.GetStatusBits_Bits(0);
	while( (bitget(abs(XBits),5)||bitget(abs(XBits),6)) || ...
		   (bitget(abs(YBits),5)|| bitget(abs(YBits),6)) ) 
		XBits = hX.GetStatusBits_Bits(0);
		YBits = hY.GetStatusBits_Bits(0);
	end 

	hY.SetAbsMovePos(0,center-offset_center);
	hY.MoveAbsolute(0,1==0);

	pause(10);

	XBits = hX.GetStatusBits_Bits(0);
	YBits = hY.GetStatusBits_Bits(0);
	while( (bitget(abs(XBits),5)||bitget(abs(XBits),6)) || ...
		   (bitget(abs(YBits),5)|| bitget(abs(YBits),6)) ) 
		XBits = hX.GetStatusBits_Bits(0);
		YBits = hY.GetStatusBits_Bits(0);
	end 

	%Set the FP pos
	writeline(device,"1");
	writeline(device,"0.085"); % xx
	writeline(device,"0.085"); % yy
	writeline(device,"0.20");

	%Communaction with the Haptic System. Configure the Dynamic sensation
	writeline(device,"n");
	writeline(device,SRs(i));		%SR
	writeline(device,fmods(i));		%Fmod

	%Set the Dut cycle
	writeline(device,"3");
	writeline(device,dc_val);

	fid = fopen(filename,"w");
	start = 1;
	run_sim = 1;
	flag_forward = 0;

	if(mod((offset_center*2)/Stepmm,2) == 0)
	   Stop_rangey = center+offset_center;  
	else
	   Stop_rangey = center-offset_center;
	end

	tic
	while(run_sim)
	  
		data = read(adc,seconds(Duration));

		fwrite(fid,data.Dev2_ai0,'double');
		
		if(hX.GetPosition_Position(0) == center+offset_center && hY.GetPosition_Position(0) == Stop_rangey)
			 run_sim = 0;
		else
			
			if(start == 0)     
				if(flag_forward)
					if(hY.GetPosition_Position(0) >= center+offset_center)
						hX.MoveJog(0,1);
						flag_forward = 0;
					else
						hY.MoveJog(0,1);
					end
				else
					if(hY.GetPosition_Position(0) <= center-offset_center)
						hX.MoveJog(0,1);
						flag_forward = 1;
					else
						hY.MoveJog(0,2);
					end
				end
			else 
				if(hY.GetPosition_Position(0) >= center+offset_center)
					start = 0;   
					hX.MoveJog(0,1);
					flag_forward = 0;
				else
					hY.MoveJog(0,1);
				end
			end
			
			XBits = hX.GetStatusBits_Bits(0);
			YBits = hY.GetStatusBits_Bits(0);

			while((bitget(abs(XBits),5)||bitget(abs(XBits),6)) || (bitget(abs(YBits),5)||bitget(abs(YBits),6)))
				XBits = hX.GetStatusBits_Bits(0);
				YBits = hY.GetStatusBits_Bits(0);
			end         
			%pause(1);
		end
	end
	toc

	%Set the Dut cycle
	writeline(device,"3");
	writeline(device,"0");

	hX.MoveHome(0,1==0);
	hY.MoveHome(0,1==0);

	pause(180);

	fclose(fid);

	disp('Finito');
	
end

% if(isvalid(timer_haptic))
%     stop(timer_haptic);
%     delete(timer_haptic);
% end

stop(adcClk);
disp('Fim dos finitos');

% delete(device);