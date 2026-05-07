function [imp_mat_struct] = Impulse_Mat_Triangle(perimeter, ds, x_virtual, N_SP)
%
% side_len  : triangle side length (physical units)
% ds        : spatial resolution
% x_virtual : spatial axis (Nx1)
% N_SP      : number of impulse points


side_len = perimeter / 3;

N = length(x_virtual);
center = round(N/2);

% Initialize output
imp_mat_struct = cell(N_SP,1);
imp_mat = sparse(N,N);
for i = 1:N_SP
    imp_mat_struct{i} = imp_mat;
end

%% Triangle geometry (equilateral)
h = sqrt(3)/2 * side_len;

% Triangle vertices (centered)
V1 = [-side_len/2, -h/3];
V2 = [ side_len/2, -h/3];
V3 = [ 0,          2*h/3];

V = [V1; V2; V3; V1];   % closed loop

%% Sample points along triangle perimeter
%perimeter = 3 * side_len;
step = perimeter / N_SP;

pts = zeros(N_SP,2);
d_acc = 0;
idx = 1;

for k = 1:3
    p0 = V(k,:);
    p1 = V(k+1,:);
    edge_len = norm(p1 - p0);
    t = 0;

    while t < edge_len && idx <= N_SP
        pts(idx,:) = p0 + (t/edge_len)*(p1 - p0);
        t = t + step;
        idx = idx + 1;
    end
end

%% Map to grid and create impulse matrices
for i = 1:N_SP
    ix = center + round(pts(i,1)/ds);
    iy = center - round(pts(i,2)/ds);  % y-axis flip for matrix indexing

    if ix >= 1 && ix <= N && iy >= 1 && iy <= N
        imp_mat_struct{i}(iy, ix) = 1;
    end
end

end
