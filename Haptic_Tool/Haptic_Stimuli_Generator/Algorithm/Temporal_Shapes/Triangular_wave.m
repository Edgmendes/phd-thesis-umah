function [wave] = Triangular_wave(t, F_mod)
    
    wave = sawtooth(2*pi*F_mod*t, 0.5);
    
end