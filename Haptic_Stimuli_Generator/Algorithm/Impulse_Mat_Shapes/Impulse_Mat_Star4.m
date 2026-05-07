function imp_mat_struct = Impulse_Mat_Star4(R_out, R_in, ds, x_virtual, N_SP, angle_rot)

if nargin < 6 || isempty(angle_rot)
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

%% ---- Define vertices ----
angles = angle_rot + (0:7)*(pi/4);
radii  = repmat([R_out, R_in], 1, 4);

xv = radii .* cos(angles);
yv = radii .* sin(angles);

V = [xv(:), yv(:)];
V = [V; V(1,:)];   % close polygon

%% ---- Compute cumulative arc length ----
dV = diff(V);
segLens = sqrt(sum(dV.^2,2));
cumLen = [0; cumsum(segLens)];
perim = cumLen(end);

% Uniform arc-length samples INCLUDING endpoints
s = linspace(0, perim, N_SP);

pts = zeros(N_SP,2);

for i = 1:N_SP
    si = s(i);

    % find segment
    idx = find(cumLen <= si, 1, 'last');
    if idx == length(cumLen)
        idx = idx - 1;
    end

    ds_local = si - cumLen(idx);
    t = ds_local / segLens(idx);

    pts(i,:) = V(idx,:) + t*(V(idx+1,:) - V(idx,:));
end

%% ---- Map to grid ----
for i = 1:N_SP
    ix = center + round(pts(i,1)/ds);
    iy = center - round(pts(i,2)/ds);

    if ix>=1 && ix<=N && iy>=1 && iy<=N
        imp_mat_struct{i}(iy, ix) = 1;
    end
end

end
