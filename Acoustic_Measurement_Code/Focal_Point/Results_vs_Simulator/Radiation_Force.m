function [force] = Radiation_Force(p_rms, fwhm, step)

limits = ceil(fwhm / step);

%% Radiation Force at 20ºC
alpha = 2;
air_density = 1.2041;
speed_sound = 343.21;

% 15ºC
% air_density = 1.2250;
% speed_sound = 340.27;

data = squeeze(p_rms);
[maxVal, linearIndex] = max(data,[],'all');
[row, col] = ind2sub(size(data), linearIndex);

% Check for eneven values, 
for i=1:length(limits)
    if(mod(limits,2))
        limits = limits + 1;
    end
end

force = 0;

for i=col-limits/2:col+limits/2
   for j=row-limits/2:row+limits/2
        force = ( ( data(i,j)^2 / (air_density * speed_sound^2) ) * (step)^2 ) + force; 
   end 
end

force = force * alpha;

f1 = sprintf('Force: %d', force);

disp(f1);

end