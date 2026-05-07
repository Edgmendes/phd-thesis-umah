function [spatial_temporal_signal] = Generate_STM_signal(T_draw, F_mod, N_SP, L, ...
                                                        f_carrier, fp_pos, speed_sound, ...
                                                        dt, ds_virtual, N_source, ...
                                                        array_virt_length, array_real_length, ...
                                                        smooth_duration, stimulus_type, tp, stimulus_shape, A_max)
    %% Temporal Component
    t_sp = T_draw / N_SP;
    %t_sp = round(t_sp,3);
    %T_draw = t_sp * N_SP;
    %

    % Create the time variable
    t = Create_Time_Signal(T_draw, dt);

    % OPTIMIZATION CASE - Creates the temporal signal for the SP 
    if( strcmp(stimulus_type, 'pressure_rough_opt1') || strcmp(stimulus_type, 'pressure_rough_opt2'))

        if( strcmp(stimulus_type, 'pressure_rough_opt1'))       
            % Optimization 1
            [pulse_signal] = Create_Gavrilov_Pulse(t_sp, tp, dt, t, A_max);
        else 
            % Optimization 2
            [pulse_signal] = Create_Pulse_Modulation(t_sp, tp, dt, t, A_max);
        end

        % Creates the somthing window signal
        [window_signal] = window_phases(t, smooth_duration, t_sp, dt);

        % Creates the smothing version of the pulse signal
        window_pulse_signal = pulse_signal .* window_signal;

        % Generation of the Temporal Component
        [temporal_component] = Get_Temporal_Shifts(window_pulse_signal, N_SP, t_sp, T_draw, t);

    % NORMAL CASE - Creates the temporal signal for the whole duration
    else       
        % Creates the temporal reference signal
        [temporal_ref] = Create_Temporal_Ref(t, F_mod, A_max);

        % Creates the somthing window signal
        [window_signal] = window_phases(t, smooth_duration, t_sp, dt);
        
        % Creates the shifted windows matrix
        [window_signal_mat] = Get_Temporal_Shifts(window_signal, N_SP, t_sp, T_draw, t);
        
        % Generation of the Temporal Component
        [temporal_component] = Get_Temporal_Signal(temporal_ref, window_signal_mat, N_SP, t);
    end
    
    %% Spatial Component

    % Creation of the spatial reference
    [spatial_ref, x_virtual, x_real] = Create_Spatial_Ref(f_carrier, fp_pos, speed_sound,...
                                                            N_source, ds_virtual,...
                                                            array_virt_length, array_real_length);
    
    % Creation of the spatial impulse structure 
    if(strcmp(stimulus_shape, 'circle'))
        imp_struct_virtual = Impulse_Mat_Circle(L, ds_virtual, x_virtual, N_SP);

    elseif(strcmp(stimulus_shape, 'square'))
        imp_struct_virtual = Impulse_Mat_Square(L, ds_virtual, x_virtual, N_SP);

    elseif(strcmp(stimulus_shape, 'triangle'))
        imp_struct_virtual = Impulse_Mat_Triangle(L, ds_virtual, x_virtual, N_SP);

    elseif(strcmp(stimulus_shape, 'line'))
        dir = 1; % horizontal 1, vertical 0
    	imp_struct_virtual = Impulse_Mat_Line(L, dir, ds_virtual, x_virtual, N_SP);
    end

    % Generation of the Spatial Component
    spatial_component_virtual = Get_Spatial_Shifts(imp_struct_virtual, N_SP, spatial_ref, x_virtual, x_real);

    % Compute 'the real' phases
    spatial_component = Compute_Real_Shifts(spatial_component_virtual, x_real, x_virtual, N_SP);
    

    %% Spatial-Temporal Component

    % Generation of the s-t signal
    spatial_temporal_signal = Get_Spatial_Temporal_Signal(spatial_component, temporal_component);
   

    %% Plot         Angle no xx - yy plane
    
    SP = 1.5; % The half quantity is to "get out of" the overlapping zone
    SP_index = round( (length(t) * (t_sp*(SP-1)))+1);

    % figure;
    % image(x_real,x_real,angle(spatial_temporal_signal(:,:,SP_index)),'CDataMapping','scaled');
    % colorbar;
    % title('Spatial Temporal Signal (Phases)');
    % xlabel('Space (m)');
    % ylabel('Time (s)');
    % 
    % figure;
    % image(x_real,t,squeeze(angle(spatial_temporal_signal(:,1,:)))','CDataMapping','scaled');
    % colorbar;
    % title('Spatial Temporal Signal (Phases)');
    % xlabel('Space (m)');
    % ylabel('Time (s)');
    % 
    % figure;
    % image(x_real,t,squeeze(abs(spatial_temporal_signal(:,1,:)))','CDataMapping','scaled');
    % colorbar;
    % title('Spatial Temporal Signal (Abs)');
    % xlabel('Space (m)');
    % ylabel('Time (s)');

    %%
    %select one transducer signal
    signal = squeeze(spatial_temporal_signal(1,1,:));

    figure;
    plot(t,angle(signal)');
    title('Spatial Temporal Signal (Angle)');
    ylabel('Amplitude');
    xlabel('Time (s)');

    figure;
    plot(t,abs(signal)');
    title('Spatial Temporal Signal (Abs)');
    ylabel('Amplitude');
    xlabel('Time (s)');

end