function [wave] = Sawtooth_wave(t, F_mod)

    wave = sawtooth(2*pi*F_mod*t);

end