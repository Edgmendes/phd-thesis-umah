function [spatial_temporal_signal, t, x_real] = Generate_STM_signal(stimulus_period, stimulus_samplerate, stimulus_length, ...
                                                        stimulus_shape, stimulus_modulation, modulation_frequency, ...
                                                        f_carrier, fp_pos, speed_sound, ...
                                                        dt, ds_virtual, N_source, ...
                                                        array_virt_length, array_real_length, ...
                                                        smooth_duration, A_max)
    %% Temporal Component
    
    % Arrendondamentos para evitar cortes/sobrepodição nas fases
    t_sp = stimulus_period / stimulus_samplerate;
    %t_sp = round(t_sp,3);
    %stimulus_period = t_sp * stimulus_samplerate;
    %

    % Create the time variable
    t = Create_Time_Signal(stimulus_period, dt);

    % Creates the temporal reference signal
    [temporal_ref] = Create_Temporal_Ref(t, stimulus_modulation, modulation_frequency, A_max);

    % Creates the somthing window signal
    [window_signal] = window_phases(t, smooth_duration, t_sp, dt);
    
    % Creates the shifted windows matrix
    [window_signal_mat] = Get_Temporal_Shifts(window_signal, stimulus_samplerate, t_sp, stimulus_period, t);
    
    % Generation of the Temporal Component
    [temporal_component] = Get_Temporal_Signal(temporal_ref, window_signal_mat, stimulus_samplerate, t);
    
    %% Spatial Component

    % Creation of the spatial reference
    [spatial_ref, x_virtual, x_real] = Create_Spatial_Ref(f_carrier, fp_pos, speed_sound,...
                                                            N_source, ds_virtual,...
                                                            array_virt_length, array_real_length);

    % Manage impulse matrix creation according to shape and other parameters
    imp_struct_virtual = Create_Impulse_Matrix(stimulus_shape, stimulus_length, ds_virtual, x_virtual, stimulus_samplerate);

    % Generation of the Spatial Component
    spatial_component_virtual = Get_Spatial_Shifts(imp_struct_virtual, stimulus_samplerate, spatial_ref, x_virtual, x_real);

    % Compute 'the real' phases
    spatial_component = Compute_Real_Shifts(spatial_component_virtual, x_real, x_virtual, stimulus_samplerate);
    

    %% Spatial-Temporal Component

    % Generation of the s-t signal
    spatial_temporal_signal = Get_Spatial_Temporal_Signal(spatial_component, temporal_component);
   

    %% Plot         Angle no xx - yy plane
    
    SP = 1.5; % The half quantity is to "get out of" the overlapping zone
    SP_index = round( (length(t) * (t_sp*(SP-1)))+1);

    figure;
    image(x_real,x_real,angle(spatial_temporal_signal(:,:,SP_index)),'CDataMapping','scaled');
    colorbar;
    title('Spatial Temporal Signal (Matrix Phases)');
    xlabel('Space (m)');
    ylabel('Space (m)');

    figure;
    image(x_real,t,squeeze(angle(spatial_temporal_signal(:,1,:)))','CDataMapping','scaled');
    colorbar;
    title('Spatial Temporal Signal (Phases)');
    xlabel('Space (m)');
    ylabel('Time (s)');

    figure;
    image(x_real,t,squeeze(abs(spatial_temporal_signal(:,1,:)))','CDataMapping','scaled');
    colorbar;
    title('Spatial Temporal Signal (Abs)');
    xlabel('Space (m)');
    ylabel('Time (s)');

    %%
    %select one transducer signal
    signal = squeeze(spatial_temporal_signal(1,1,:));

    % figure;
    % plot(t,angle(signal)');
    % title('Spatial Temporal Signal (Angle)');
    % ylabel('Amplitude');
    % xlabel('Time (s)');
    % 
    % figure;
    % plot(t,abs(signal)');
    % title('Spatial Temporal Signal (Abs)');
    % ylabel('Amplitude');
    % xlabel('Time (s)');
end