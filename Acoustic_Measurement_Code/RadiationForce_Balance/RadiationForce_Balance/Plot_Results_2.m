clc;
clear all;

%%
path = "Results_new_support/UM/";
N_measurements = 5;
N_DCs = 50;

g = 9.8;% m/s

weights = zeros(N_DCs,1);

for i = 1:N_DCs
    filename = path + "DC" + int2str(i) + ".txt";

    T = readtable(filename);

    %weight = mean(T.weigths);
    weight = T.weigths;

    weights(i) = weight(1);
end

y_new_UM = weights * g;

path = "Results_old_support/UM/";

for i = 1:N_DCs
    filename = path + "DC" + int2str(i) + ".txt";

    T = readtable(filename);

    weight = mean(T.weigths);

    weights(i) = weight;
end

y_old_UM = weights * g;

x = (1:N_DCs)*2;

%%
plot(x,y_new_UM,"o",x,y_old_UM,"o");
title('Radiation Force of the Focal Point');
xlabel('Intensity Setting (%)')
ylabel('Radiation Force (mN)')
grid on;

legend1 = "New Setup - Balance; UM; Distance - 200 mm; Target diameter 15 mm";
legend2 = "Old Setup - Balance; UM; Distance - 200 mm; Target diameter 20 mm";

legend(legend1,legend2);





