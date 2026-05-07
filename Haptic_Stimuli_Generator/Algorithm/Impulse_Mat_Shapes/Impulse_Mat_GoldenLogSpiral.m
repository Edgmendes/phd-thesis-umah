function imp_mat_struct = Impulse_Mat_GoldenLogSpiral(ds, x_virtual, N_SP, r0, r1, turns)
% Golden/logarithmic spiral: r = r0 * exp(b*theta)
% ds        : grid spacing
% x_virtual : spatial axis (Nx1)
% N_SP      : number of samples along the spiral curve
% r0, r1    : start/end radii (physical units)
% turns     : number of turns (e.g., 4)

N = length(x_virtual);
center = round(N/2);

if nargin < 4 || isempty(r0), r0 = 2*ds; end
if nargin < 5 || isempty(r1)
    half_span = (N/2) * ds;
    r1 = 0.45 * half_span;
end
if nargin < 6 || isempty(turns), turns = 4; end

imp_mat_struct = cell(N_SP,1);
Z = sparse(N,N);
for i = 1:N_SP
    imp_mat_struct{i} = Z;
end

phi = (1 + sqrt(5)) / 2;
b = log(phi) / (pi/2);       % makes radius scale by phi every 90 degrees

theta0 = 0;
theta1 = 2*pi*turns;

% Choose theta so that r(theta1) ~= r1 (fit to desired end radius)
% r = r0 * exp(b*theta) => theta_end = (ln(r1/r0))/b
theta1 = min(theta1, log(r1/r0)/b);

% draw inside towards outter region
%thetas = linspace(theta0, theta1, N_SP);

% draw outsinde towards inner region
thetas = linspace(theta1, theta0, N_SP);


for k = 1:N_SP
    theta = thetas(k);
    r = r0 * exp(b*theta);

    x = r * cos(theta);
    y = r * sin(theta);

    ix = center + round(x/ds);
    iy = center - round(y/ds);

    if ix>=1 && ix<=N && iy>=1 && iy<=N
        imp_mat_struct{k}(iy, ix) = 1;
    end
end
end

