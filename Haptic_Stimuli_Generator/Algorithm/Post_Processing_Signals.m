function [out_signal] = Post_Processing_Signals(in_signals, nFPs)
    out_signal = 0;
    
    % get the temporal size for each signal
    t_samples = zeros(nFPs,1);
    for i = 1:nFPs
        t_samples(i) = size(in_signals{i},3); 
    end

    % iterate over the shorter stimuli (thus nFPs-1)
    for idx = 1 : nFPs-1
        t_greater = max(t_samples);
        [t_shorter, idx_min] = min(t_samples);

        repeat_samples = t_greater - t_shorter;
        
        for i = 1 : repeat_samples
            %extend the shorter signals
            in_signals{idx_min}(:,:,end+1) = in_signals{idx_min}(:,:,i);
            
            t_samples(idx_min) = t_samples(idx_min) + 1;
        end

    end

    % Summ the multiple FP signals composing the stimulus
    for j = 1 : nFPs
        out_signal = out_signal + in_signals{j};

    end
    
end