function [spatial_shifts_real] = Compute_Real_Shifts(spatial_shifts, x_real, x_virtual, N_SP)
% Encontra os indices (posiçoes dos transdutores) do vector de transdutores virtual correspondentes ao vector real.

c = zeros(1,length(x_real));

for i = 1 : length(x_real)
    abs_vect = abs(x_virtual - x_real(i));
    x_min = min(abs_vect);
    c(i) = find (abs_vect == x_min);
end

spatial_shifts_real = cell(N_SP,1);

for i = 1 : N_SP
    spatial_shifts_real{i} = spatial_shifts{i}(c,c);
end

% Plot 
% figure;
% image(x_real,x_real,spatial_shifts_real{1},'CDataMapping','scaled');
% colorbar;
% title('Phases');
% xlabel('Space Real (m)');
% ylabel('Space Real (m)');

end