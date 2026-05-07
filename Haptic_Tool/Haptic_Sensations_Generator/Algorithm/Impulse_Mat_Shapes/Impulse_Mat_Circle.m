function [imp_mat_struct] = Impulse_Mat_Circle(L, ds, x_virtual, N_SP)
%
%Initialize the imp_cell structure

imp_mat_struct = cell(N_SP,1);
imp_mat = sparse(zeros(length(x_virtual), length(x_virtual)));

for i = 1 : N_SP
    imp_mat_struct{i} = imp_mat; 
end

%% Create the shifting impulses
angles_SPs = zeros(N_SP,1);

%Calculate the angle between SPs
phi_SP = (2*pi) / N_SP;

% Calculate the angles of each SP
for i = 1 : N_SP
    angles_SPs(i) = phi_SP * (i-1);
end

% Create a complex phasor to calculate the xx and yy coords
c_ang_SPs = exp(1i*angles_SPs);

radious = L/(2*pi);
x_pos_SP = radious * real(c_ang_SPs);
y_pos_SP = radious * imag(c_ang_SPs);

% Convert the coordinates into index
x_index_SP = round(x_pos_SP / ds);
y_index_SP = round(y_pos_SP / ds);

%% Create the impulse signal on the correct indexes
for i = 1 : N_SP
    imp_mat_struct{i}(end/2 + y_index_SP(i), end/2 + x_index_SP(i)) = 1;
end

% figure;
% image(x_virtual,x_virtual,imp_mat_struct{31},'CDataMapping','scaled');
% colorbar;
% title('Imp Mat');
% xlabel('Space (N)');
% ylabel('Space (N)');

end