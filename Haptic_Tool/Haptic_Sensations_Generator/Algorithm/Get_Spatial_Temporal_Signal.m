function [spatial_temporal_signal] = Get_Spatial_Temporal_Signal(spatial_component, temporal_component_input)
%Esta funcão calcula o sinal espaço temporal.
% A utilização da função full() é para reverter o efeito da funcção
% sparse()

spatial_temporal_signal = 0;

for i = 1 : length(spatial_component)

    % Reshape of the temporal component
    temporal_component = reshape(full(temporal_component_input(i,:)),[1 1 size(temporal_component_input,2)]);
    
    % Creation of the complex s-t signal, associated with a SP
    signal_SP = temporal_component .* exp(1i*full(spatial_component{i}));

    % Summation of the SP's signals
    spatial_temporal_signal = signal_SP + spatial_temporal_signal;

end

end