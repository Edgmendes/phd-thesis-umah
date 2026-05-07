function [wave] = Square_wave(t,F_mod)

    wave = square(2*pi*F_mod*t);

end