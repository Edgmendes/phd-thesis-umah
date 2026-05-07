function [temporal_ref] = Create_Temporal_Ref(t, stimulus_modulation, F_mod, A_max)
% Creates the temporal reference. 
% It is limited in time, required for the time shifting of the signal later on.

    %Parameters & Variables
    A = 0.5; % sinusoidal amplitude
    A_off = A + 0.01; % sinusoidal DC component (i want the sinus positive)
    
    % Creation of the Temporal reference for all t
    if(strcmp(stimulus_modulation, 'sinusoidal'))
        temporal_ref = Sinusoidal_wave(t, F_mod);

    elseif(strcmp(stimulus_modulation, 'triangular'))
        temporal_ref = Triangular_wave(t, F_mod);

    elseif(strcmp(stimulus_modulation, 'sawtooth'))
        temporal_ref = Sawtooth_wave(t, F_mod);

    elseif(strcmp(stimulus_modulation, 'exponential'))
    
    elseif(strcmp(stimulus_modulation, 'square'))
        temporal_ref = Square_wave(t, F_mod);

    elseif(strcmp(stimulus_modulation, 'chirp'))
        temporal_ref = Chirp_wave(t, 125, t(length(t)), 250);
    
    end
    
    temporal_ref = A * temporal_ref + A_off;

    temporal_ref = A_max * temporal_ref;
    
    % figure;
    % plot(t, temporal_ref);

end