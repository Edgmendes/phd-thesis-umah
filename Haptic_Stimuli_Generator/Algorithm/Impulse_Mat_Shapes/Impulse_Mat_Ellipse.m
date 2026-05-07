function imp_mat_struct = Impulse_Mat_Ellipse(a, b, ds, x_virtual, N_SP, angle_rad)
% Ellipse perimeter impulse matrices (one impulse per cell).
% a, b      : semi-axes (physical units). a = x semi-axis, b = y semi-axis
% ds        : grid spacing (physical units)
% x_virtual : spatial axis (Nx1) -> matrices are N x N
% N_SP      : number of points along ellipse
% angle_rad : optional rotation angle (radians). default = 0

if nargin < 6 || isempty(angle_rad)
    angle_rad = 0;
end

N = length(x_virtual);
center = round(N/2);

% Init output
imp_mat_struct = cell(N_SP,1);
Z = sparse(N,N);
for i = 1:N_SP
    imp_mat_struct{i} = Z;
end

% Sample ellipse
t = linspace(0, 2*pi, N_SP);

x = a * cos(t);
y = b * sin(t);

% Rotate ellipse by angle_rad (optional)
ca = cos(angle_rad); sa = sin(angle_rad);
xr = ca*x - sa*y;
yr = sa*x + ca*y;

% Map to grid and place impulses
for k = 1:N_SP-1
    ix = center + round(xr(k)/ds);
    iy = center - round(yr(k)/ds);  % flip y for matrix indexing

    if ix >= 1 && ix <= N && iy >= 1 && iy <= N
        imp_mat_struct{k}(iy, ix) = 1;
    end
end

end
