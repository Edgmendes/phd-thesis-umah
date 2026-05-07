function imp_mat_struct = Impulse_Mat_Rhombus(L, alpha, ds, x_virtual, N_SP, angle_rot)
% Rhombus perimeter impulse matrices (one impulse per matrix)
%
% L         : side length (physical units)
% alpha     : interior angle (radians)
% ds        : spatial step
% x_virtual : spatial axis (Nx1)
% N_SP      : number of impulse points along perimeter
% angle_rot : optional global rotation (radians)

if nargin < 6
    angle_rot = 0;
end

N = length(x_virtual);
center = round(N/2);

% Initialize output
imp_mat_struct = cell(N_SP,1);
Z = sparse(N,N);
for i = 1:N_SP
    imp_mat_struct{i} = Z;
end

%% --- Define rhombus vertices (centered at origin) ---

% First define in local coordinates
v1 = [0, 0];
v2 = [L, 0];
v3 = [L + L*cos(alpha), L*sin(alpha)];
v4 = [L*cos(alpha), L*sin(alpha)];

V = [v1; v2; v3; v4; v1];

% Center it
centroid = mean(V(1:4,:),1);
V = V - centroid;

%% --- Sample perimeter uniformly ---
perimeter = 4*L;
step = perimeter / N_SP;

pts = zeros(N_SP,2);
idx = 1;

for k = 1:4
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

%% --- Optional global rotation ---
R = [cos(angle_rot) -sin(angle_rot);
     sin(angle_rot)  cos(angle_rot)];

pts = (R * pts')';

%% --- Map to grid ---
for i = 1:N_SP
    ix = center + round(pts(i,1)/ds);
    iy = center - round(pts(i,2)/ds);
    
    if ix>=1 && ix<=N && iy>=1 && iy<=N
        imp_mat_struct{i}(iy, ix) = 1;
    end
end

end
