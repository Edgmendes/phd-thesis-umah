clc;
clear all;

%%
path = "Unmodulated_Results/DC";
N_measurements = 5;
N_DCs = 50;

g = 9.8;% m/s

weights = zeros(N_DCs,1);

for i = 1:N_DCs
    filename = path + int2str(i) + ".txt";

    T = readtable(filename);

    weight = mean(T.weigths);

    weights(i) = weight;
end

y_balance = weights * g;
dc = ((1:N_DCs)*2)';

%%
%Force from simulation
%force_sim = [0.0000 0.0000 0.0001 0.0002 0.0003 0.0004 0.0005 0.0007 0.0009 0.0011 0.0014 0.0016 0.0019 0.0022 0.0025 0.0029 0.0032 0.0036 0.0040 0.0045 0.0049 0.0054 0.0059 0.0064 0.0070 0.0076 0.0082 0.0088 0.0094 0.0101 0.0107 0.0114 0.0122 0.0129 0.0137 0.0145 0.0153 0.0162 0.0170 0.0179 0.0188 0.0197 0.0207 0.0216 0.0226 0.0237 0.0247 0.0258 0.0268 0.0280]*1e3;
force_sim2 = [0.0000 0.0001 0.0002 0.0004 0.0006 0.0008 0.0011 0.0014 0.0018 0.0022 0.0027 0.0032 0.0038 0.0044 0.0050 0.0057 0.0065 0.0072 0.0081 0.0089 0.0099 0.0108 0.0118 0.0129 0.0140 0.0151 0.0163 0.0175 0.0188 0.0201 0.0215 0.0229 0.0244 0.0259 0.0274 0.0290 0.0306 0.0323 0.0340 0.0358 0.0376 0.0395 0.0414 0.0433 0.0453 0.0473 0.0494 0.0515 0.0537 0.0559]*1e3;
y2 = force_sim2;

%%

force_estimated = [1.00000e-05 7.00000e-05 0.000360000 0.000860000 0.00157000 0.00249000 0.00362000 0.00497000 0.00653000 0.00830000 0.0102800 0.0233900 0.0418000 0.0655200]*1e3;
dc_values = [1 2 4 6 8 10 12 14 16 18 20 30 40 50]*2;
%force_estimated = [1.00000e-05 7.00000e-05 0.000360000 0.000860000 0.00157000 0.00249000 0.00362000 0.00497000] * 1e3;
%dc_values = [1 2 4 6 8 10 12 14]*2;

y3 = force_estimated;
x3 = dc_values;

%%
plot(dc,y_balance,"o",dc,y2,x3,y3,"o");
title('Radiation Force of the Unmodulated Focal Point');
xlabel('Intensity Setting (%)')
ylabel('Radiation Force (mN)')
grid on;

legend1 = "Balance; Distance - 195 mm; Target diameter 20 mm";
legend2 = "Simulation; Distance - 200 mm; FP's size (FWHM) 13 mm";
legend3 = "Microphone (linear regression estimation); Distance - 200 mm; FP's size (FWHM) 15 mm";

legend(legend1,legend2,legend3);





