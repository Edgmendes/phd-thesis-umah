function [spatial_temporal_signal_abs_uint, spatial_temporal_signal_ang_uint] = Rescale_cast_data(spatial_temporal_signal, n_bits)
   
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
    a = spatial_temporal_signal_ang;
    
    %a fase vem definida entre -pi e pi e eu coloco a fase entre 0 e 2pi
    a(a<0) = a(a<0)+2*pi;

    a = (a.*scaling_factor)./(2*pi);
    
    %cast
    spatial_temporal_signal_ang_uint = cast(a, data_format);

end