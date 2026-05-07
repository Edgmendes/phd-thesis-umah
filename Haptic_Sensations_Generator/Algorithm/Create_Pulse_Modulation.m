function [temporal_signal] = Create_Pulse_Modulation(t_sp, tp, dt, t, A_max)

% Implementa a geração de um pulso com séries de Fourier em formato
% exponencial; configuravel em Periodo, duração de pulso

% Convergence of the series (n# harmonics)
%n = [-50;-49;-48;-47;-46;-45;-44;-43;-42;-41;-40;-39;-38;-37;-36;-35;-34;-33;-32;-31;-30;-29;-28;-27;-26;-25;-24;-23;-22;-21;-20; -19; -18; -17; -16; -15; -14; -13; -12; -11; -10; -9; -8; -7; -6; -5; -4; -3; -2; -1; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20;21;22;23;24;25;26;27;28;29;30];
n = [-100;-99;-98;-97;-96;-95;-94;-93;-92;-91;-90;-89;-88;-87;-86;-85;-84;-83;-82;-81;-80;-79;-78;-77;-76;-75;-74;-73;-72;-71;-70;-69;-68;-67;-66;-65;-64;-63;-62;-61;-60;-59;-58;-57;-56;-55;-54;-53;-52;-51;-50;-49;-48;-47;-46;-45;-44;-43;-42;-41;-40;-39;-38;-37;-36;-35;-34;-33;-32;-31;-30;-29;-28;-27;-26;-25;-24;-23;-22;-21;-20; -19; -18; -17; -16; -15; -14; -13; -12; -11; -10; -9; -8; -7; -6; -5; -4; -3; -2; -1; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20;21;22;23;24;25;26;27;28;29;30];

t_pulse = -(t_sp/2) : dt : (t_sp/2)-dt;

wa = 2*pi / t_sp;

% Fourier coeficients
DC = (2*tp/t_sp);

cn = 2./(n*pi) .* sin(n*pi*(tp/t_sp));

%Fourier Series
Cn = sum(cn .* exp( (1i).*(n*wa*t_pulse)) );

%% Pulse according to Gavrilov
pulse = real(Cn);

%invert and rescale
pulse = pulse + 1;

%normalize
pulse = pulse / max(pulse);

%Fazemos ao ABS para termos sempre o sinal positivo, para não termos
%inversoes de fases por causa do sinal negativo
%pulse = abs(pulse);

% figure;
% plot(t_pulse, pulse)
% grid on;

% Aqui é para extender o pulso com a duração de Tmod e centrar em 0
% NOTA, eu coloco o restante sinal extendido todo a 1, porque este sinal
% vai ser "filtrado" pela janela logo de seguida
temporal_signal = [pulse zeros(1, length(t) - length(pulse))]; 

temporal_signal = sparse(temporal_signal);

temporal_signal = circshift(temporal_signal, -1*round(1/2*(tp*length(pulse))/t_sp) + round(length(t)/2 - length(pulse)/2)  );

temporal_signal = temporal_signal + 0.001;

temporal_signal = A_max * temporal_signal;

% figure;
% plot(t,temporal_signal);
% grid on;
% title('Pulse series');
% xlabel('time (s)');
% ylabel('Amplitude');

end