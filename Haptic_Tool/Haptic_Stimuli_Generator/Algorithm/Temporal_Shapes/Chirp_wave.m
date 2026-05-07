function [wave] = Chirp_wave(t, f0, t1, f1)

    % f0 refers to the instantaneous frequency at intant 0s. Thus, in my
    % case i need to adjust since the temporal signal is defined from
    % -Tdraw/2 to Tdraw/2
    wave = chirp(t,f0,t1,f1,'linear');

end