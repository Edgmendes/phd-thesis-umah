close all;
clear all;

x = [0.314 0.659  1 1.35 1.69 2.04];

y = [1 10 30 70 90 99];

%[a,b] = createFit(x,y);




plot(x, y, '.', 'LineStyle', 'none', ...
    'MarkerSize', 13, ...
    'MarkerFaceColor', 'k',...
    'MarkerEdgeColor', 'k')

% Label axes
xlabel( 'FP speed [m/s]', 'Interpreter', 'none','FontSize',11);
ylabel( 'Vibratory answers [%]', 'Interpreter', 'none','FontSize',11);
title('Dynamic-Vibratory answers for a Participant','FontSize',11);
grid on
hold on;
yline(50,'--');
legend('off');

ylim([-1 101]);