%clear all;

n = numel(speed_thresholds_low(:,1));
speed_ths_10 = speed_thresholds_low(:,1);
speed_ths_30 = speed_thresholds_low(:,2);
speed_ths_50 = speed_thresholds_low(:,3);

[h_a, p_a, ci_a, stats_a] = ttest(speed_ths_30, speed_ths_10, 'Tail', 'both');

[h_b, p_b, ci_b, stats_b] = ttest(speed_ths_50, speed_ths_10, 'Tail', 'both');

[h_c, p_c, ci_c, stats_c] = ttest(speed_ths_50, speed_ths_30, 'Tail', 'both');

%
% matched t-test done analytically 
%   SR 10 - 30

% t critical 5% single tail (nota, devido á decision state o valor de t será negativo)
t_alpha_singletail = 1.782;

%difference of the means
sd_31 = speed_ths_30-speed_ths_10;
sd_mean_31 = mean(sd_31);
%std of the mean of the differences
sd_std_31 = std(sd_31);

%standard error
std_error_31 = sd_std_31 / sqrt(n);
%margin of error
error_mar_31 = (1*t_alpha_singletail)*std_error_31;

%t value
t_31 = sd_mean_31 / std_error_31;

%interval estimate
int_est_31 = [sd_mean_31-error_mar_31 sd_mean_31+error_mar_31];

%
% matched t-test done analytically 
%   SR 10 - 50

%difference of the means
sd_51 = speed_ths_50-speed_ths_10;
sd_mean_51 = mean(sd_51);
%std of the mean of the differences
sd_std_51 = std(sd_51);

%standard error
std_error_51 = sd_std_51 / sqrt(n);
%margin of error
error_mar_51 = (1*t_alpha_singletail)*std_error_51;

%t value
t_51 = sd_mean_51 / std_error_51;

%interval estimate
int_est_51 = [sd_mean_51-error_mar_51 sd_mean_51+error_mar_51];

%
% matched t-test done analytically 
%   SR 30 - 50

% t critical 5% two tail - the hypothesis in this case is that the 
%   mean diff of the speeds
t_alpha_twotail = 2.179 / 2;

%difference of the means
sd_53 = speed_ths_50-speed_ths_30;
sd_mean_53 = mean(sd_53);
%std of the mean of the differences
sd_std_53 = std(sd_53);

%standard error
std_error_53 = sd_std_53 / sqrt(n);
%margin of error
error_mar_53 = (1*t_alpha_twotail)*std_error_53;

%t value
t_53 = sd_mean_53 / std_error_53;

%interval estimate
int_est_53 = [sd_mean_53-error_mar_53 sd_mean_53+error_mar_53];
