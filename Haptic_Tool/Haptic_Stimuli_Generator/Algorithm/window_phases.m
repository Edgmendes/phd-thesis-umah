function [w2] = window_phases(t, smooth_duration,t_sp, dt)
%UNTITLED2 

% Ascending and descending part of the window

%da função. Quando n_tau é igual a 1, a função exponencial alcança ~66% do
%seu valor. Usamos n=3 para se ter uma aproximação mais próxima do 90%.
n_tau = 3;

%isto parece contra intuitivo, contudo faço isto por causa do parâmetro
%interno que é o n_tau

smooth_duration = smooth_duration/n_tau;

if(smooth_duration == 0)
   a = [];
   b = [];      % descending

   t_steady = 0:dt:t_sp-dt;
   
else
    tau = 1/smooth_duration;
    time_tau = (n_tau*(1/tau));

    t_tau = 0:dt:time_tau-dt;
    
    a = 1 - exp(-tau*t_tau);  % ascending
    b = exp(-tau*t_tau);      % descending

    t_steady = 0:dt:t_sp-time_tau;

end


% disp('tau'); disp(tau);
% disp('n_tau'); disp(n_tau);
% disp('duration tau:'); disp(time_tau);



c = ones(1, length(t_steady));

% compute window

w = [a c b];

% compute window for the whole Tmod cycle

w2 = [w sparse(zeros(1, length(t) - length(w)))]; 

w2 = circshift(w2, round(length(t)/2 - length(w)/2) );

%% Plot
% figure;
% plot(t, w2);
% grid on;

end