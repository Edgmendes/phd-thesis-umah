
close all;

sr = [10 30 50];

boxplot(speed_thresholds_low,sr,'Notch','marker');
grid on;
xlabel('N_{SP}','FontSize',12)
ylabel('v_{FP} (m/s)','FontSize',12)
title('Focal Point Speed thresholds of D-V boundary per Number of Pattern Points','FontSize',14)

%add the mean
hold on
plot(mean(speed_thresholds_low), 'x')
hold off

figure;
boxplot(speed_thresholds_high,sr,'Notch','marker');
grid on;
xlabel('N_{SP}','FontSize',12)
ylabel('v_{FP} (m/s)','FontSize',12)
title('Focal Point Speed thresholds of V-U boundary per Number of Pattern Points','FontSize',14)

%add the mean
hold on
plot(mean(speed_thresholds_high), 'x')
hold off

std_low = std(speed_thresholds_low);
disp("Mean Low");
disp(mean(speed_thresholds_low));
disp("Standard deviation Low");
disp(std_low);

std_high = std(speed_thresholds_high);
disp("Mean High");
disp(mean(speed_thresholds_high));
disp("Standard deviation High");
disp(std_high);



