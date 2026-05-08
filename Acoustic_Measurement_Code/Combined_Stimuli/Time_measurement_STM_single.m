% Measures and plots the acoustic feild. Interacts with the haptic prototype to avoid overheating
% Parameters - Stages-> Resolution Step, Measure Range,
%		       ADC->    Sample Rate, Sample Duration
%              FP scan area-> Center, Offset area

close all;
clear variables;
clc;

%ADC main params
SampleRate = 500e3; % tem de ser igual ao clock do adc - addClockConnection()
Duration = 6; %seconds

%Stages main params
Stepmm = 2.5;    %mm

%high resolution area
center = 160; %mm
offset_center = 10; %mm

%Parameters to avoid system overheating
MinutesON = 7;
MinutesOFF = 1;

%Sample file
filename = "Fmod50HzSR50_Fs500kHz_T6s_center160mm_offc10mm_step2dt5mm.bin";

% UART Comunication
COM_port = "COM6";

% connect to the board
device = serialport(COM_port,115200);

%Set the Dut cycle 0
writeline(device,"3");
writeline(device,"0");
writeline(device,"3");
writeline(device,"0");

%Configure Clock
Device = 'Dev2';
adcClk = daq('ni');
ch1 = addoutput(adcClk, Device, 'ctr0', 'PulseGeneration');
clkTerminal = strcat(Device,'/',ch1.Terminal);
ch1.Frequency = SampleRate;

% Configue ADC
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
secondsBreak = MinutesOFF*60;  %time that the system will be off
secondsBreakInterval = MinutesON*60; %time that the system will be On
Stage_vel = 0.15; %seconds/mm
Stage_Move_delay = Stage_vel * Stepmm;
Total_simuation_time = 3600*10;
device.UserData = secondsBreak; %workaround to send the OFF time to the handler

hX.MoveHome(0,1==0);
hY.MoveHome(0,1==0);

pause(10);

%verifica se a stage se encontra em andamento
% return 1 if moving, return 0 if stationary
XBits = hX.GetStatusBits_Bits(0);
YBits = hY.GetStatusBits_Bits(0);
while( (bitget(abs(XBits),5)||bitget(abs(XBits),6)) || ...
       (bitget(abs(YBits),5)|| bitget(abs(YBits),6)) )
    XBits = hX.GetStatusBits_Bits(0);
    YBits = hY.GetStatusBits_Bits(0);
end

% s<
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
writeline(device,"0.085");
writeline(device,"0.085");
writeline(device,"0.20");

%Set the Dynamic stimuli
writeline(device,"n");
writeline(device,"50");		% Number Sample Points
writeline(device,"50");		% F_drawing

%Set the Dut cycle
writeline(device,"3");
writeline(device,"5");

%start Sytem ON/OFF timer
timer_haptic = timer_haptic_init(secondsBreakInterval+secondsBreak,Total_simuation_time,device);
start(timer_haptic);

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

stop(adcClk);

%Set the Dut cycle
writeline(device,"3");
writeline(device,"0");

hX.MoveHome(0,1==0);
hY.MoveHome(0,1==0);

fclose(fid);

if(isvalid(timer_haptic))
   stop(timer_haptic);
   delete(timer_haptic);
end
% 
% delete(device);

disp('Finito');

% abs_Finput = plot_acoustic_field(offset_center*2,Stepmm,SampleRate,Duration,filename);
% 
% figure;
% %Plot surface
% X = 0:Stepmm*1e-3:((offset_center*2)*1e-3);
% Y = 0:Stepmm*1e-3:((offset_center*2)*1e-3);
% 
% pcolor(X,Y,abs_Finput);
% shading interp;
% axis([0 ((offset_center*2)*1e-3),0 ((offset_center*2)*1e-3)]);
% 
% xlabel('X(m)');
% ylabel('Y(m)');
% colormap(jet);
% c=colorbar;
% % caxis([95 135]);
% ylabel(c,'Pascals')
% axis square
