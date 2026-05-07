function imp_mat_struct = Impulse_Mat_Heart(ds, x_virtual, N_SP, heart_width, angle_rad)
% Heart outline with controllable width, centered to grid, and rotated.
%
% heart_width : total width in physical units (e.g., meters)
% angle_rad   : rotation angle in radians (e.g., pi/6)

N = length(x_virtual);
center = round(N/2);

% Initialize output
imp_mat_struct = cell(N_SP,1);
Z = sparse(N,N);
for i = 1:N_SP
    imp_mat_struct{i} = Z;
end




% Base heart (simple cardioid-like)
theta = linspace(0, 2*pi, N_SP);
%r = 1 - sin(theta);

p = 0.35;
r = (1 - sin(theta)).^p;

x = r .* cos(theta);
y = r .* sin(theta);

% Scale by desired width
natural_width = max(x) - min(x);
scale = heart_width / natural_width;

x = scale * x;
y = scale * y;

% Center geometrically
x = x - mean(x);
y = y - mean(y);

% Rotate
ca = cos(angle_rad);
sa = sin(angle_rad);
xr = ca*x - sa*y;
yr = sa*x + ca*y;

% Map to grid
for k = 1:N_SP-1
    ix = center + round(xr(k)/ds);
    iy = center - round(yr(k)/ds);

    if ix>=1 && ix<=N && iy>=1 && iy<=N
        imp_mat_struct{k}(iy, ix) = 1;
    end
end

end
