close all;

%data processing
%%% Diferença entre SR de 50 pontos com a de 10 pontos orgina uma
%%% distribuição normal.
data_samples = speed_thresholds_high(:,2);
%%%

%data_samples = data_samples - mean(data_samples);
std_data = std(data_samples);
n = length(data_samples);

%normal distribution curve general form
mu = 0;
sigma = 1;

step = ( max(data_samples)-min(data_samples)) / n;
x = min(data_samples):step:max(data_samples)-step;
y = ( 1/(sigma*sqrt(2*pi)) ) * exp( -0.5 * ((x - mu)/sigma).^2);
plot(x,y,'LineWidth',1.5);

%Plot histogram
hold on
h = histogram(data_samples,'Normalization','pdf');

%Box ploting
figure;
boxplot(data_samples);

%Shapiro-Wilk parametric hypothesis test 
[h_null, p, sw] = swtest(data_samples); 

