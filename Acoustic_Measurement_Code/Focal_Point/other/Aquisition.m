close all;
clear variables;
clc;

dc = 10;
dc_val = int2str(dc);

SampleRate = 500e3;
Duration = 1;

%Stages main params
Stepmm = 1;    %mm

%high resolution area
center = 115; %mm
offset_center = 20; %mm

%Sample file
filename = "Space_DC"+dc_val+"_Fs500kHz_step1mm_T1s.bin";

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
SN_X = 45866895;
SN_Y = 45866898;
set(hX,'HWSerialNum', SN_X);
set(hY,'HWSerialNum', SN_Y);
% Indentify the device
hX.Identify;
hY.Identify;

pause(5); % waiting for the GUI to load up;

%
hX.SetJogMode(0,2,2);
hX.SetJogStepSize(0,Stepmm);
hY.SetJogMode(0,2,2);
hY.SetJogStepSize(0,Stepmm);

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

stop(adcClk);

%Set the Dut cycle
writeline(device,"3");
writeline(device,"0");

hX.MoveHome(0,1==0);
hY.MoveHome(0,1==0);

fclose(fid);

% delete(device);

disp('Finito');