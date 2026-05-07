function [spatial_temporal_signal_abs_uint, spatial_temporal_signal_ang_uint] = Rescale_cast_data(spatial_temporal_signal, n_bits, t, x_real)
   
    scaling_factor = 2^(n_bits)-1;

    if(n_bits == 16)
        data_format = 'uint16';
    elseif(n_bits == 8)
        data_format = 'uint8';
    end

    % modulo e fase
    spatial_temporal_signal_abs = abs(spatial_temporal_signal);
    spatial_temporal_signal_ang = angle(spatial_temporal_signal);

    %% Magnitude (scaling e cast)
    spatial_temporal_signal_abs = spatial_temporal_signal_abs * scaling_factor;
    spatial_temporal_signal_abs_uint = cast(spatial_temporal_signal_abs, data_format);

    %% Phase (scaling e cast)
    a1 = spatial_temporal_signal_ang + pi;
    a2 = (a1.*scaling_factor)./(2*pi);
    
    %cast
    spatial_temporal_signal_ang_uint = cast(a2, data_format);


    %% Plot
    % figure;
    % image(x_real,t,squeeze(spatial_temporal_signal_ang_uint(:,1,:))','CDataMapping','scaled');
    % colorbar;
    % title('UINT Spatial Temporal Signal (Phases)');
    % xlabel('Space (m)');
    % ylabel('Time (s)');
    % 
    % figure;
    % image(x_real,t,squeeze(spatial_temporal_signal_abs_uint(:,1,:))','CDataMapping','scaled');
    % colorbar;
    % title('UINT Spatial Temporal Signal (Abs)');
    % xlabel('Space (m)');
    % ylabel('Time (s)');

end