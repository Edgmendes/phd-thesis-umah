function [spatial_source, x_virtual, x_real] = Create_Spatial_Ref(F_carrier, fp_pos, speed_sound, N_source, ...
                                                    ds_virtual, trans_vec_virt_length, trans_vec_real_length)
%% Calculate the phases for the FP in the centre of the transducer vector.

% FP position
fp_pos_cell = cell(3,1);
fp_pos_cell{1} = fp_pos(1);   %xx
fp_pos_cell{2} = fp_pos(2);   %yy
fp_pos_cell{3} = fp_pos(3);   %zz

f = F_carrier;
c = speed_sound;
lambda = c / f;
k = (2*pi)/lambda;

%% Transducers Matrix generation (real size and virtual size)
x_virtual = -(trans_vec_virt_length/2) : ds_virtual : (trans_vec_virt_length/2) - ds_virtual;
[X_virtual,Y_virtual] = meshgrid(x_virtual, x_virtual);

x_real = linspace(-trans_vec_real_length/2, trans_vec_real_length/2, N_source);
[X_real,Y_real] = meshgrid(x_real, x_real);

%% Phases calculation for the FP (virtual)

% Sorce position
src_pos_virtual = cell(3,1);
src_pos_virtual{1} = X_virtual;
src_pos_virtual{2} = Y_virtual;
src_pos_virtual{3} = sparse(zeros(length(x_virtual),length(x_virtual)));

% This is equivalent to the Subtration and square and Summ operation. Used
% for the distance calculation
aux_subb = cell(3,1);
aux_sum = zeros(length(x_virtual),length(x_virtual));
for i = 1 : 3
    aux_subb{i} = fp_pos_cell{i} - src_pos_virtual{i};
    aux_sum = aux_sum + aux_subb{i}.^2;
end

% Apartir daqui já n se trabalha com celulas, só matrizes
distance_pf = sqrt(aux_sum);

n_lambda = distance_pf / lambda;
phases = ( n_lambda - fix(n_lambda) ) * 2*pi;

% Tweak to convert the phases to -pi to pi. We need to adjust those greater
% than pi
k_ind = find(phases>pi);
phases(k_ind) = phases(k_ind) - 2*pi;

spatial_source = phases;

% Debug of the phases (with the exponential function)
 % phases2 = angle(exp(1i*k*distance_pf)); 

%% Phases calculation for the FP (real)

% Sorce position
src_pos_real = cell(3,1);
src_pos_real{1} = X_real;
src_pos_real{2} = Y_real;
src_pos_real{3} = sparse(zeros(length(x_real),length(x_real)));

% This is equivalent to the Subtration and square and Summ operation. Used
% for the distance calculation
aux_subb = cell(3,1);
aux_sum = zeros(length(x_real),length(x_real));
for i = 1 : 3
    aux_subb{i} = fp_pos_cell{i} - src_pos_real{i};
    aux_sum = aux_sum + aux_subb{i}.^2;
end

% Apartir daqui já n se trabalha com celulas, só matrizes
distance_pf_real = sqrt(aux_sum);

n_lambda = distance_pf_real / lambda;
phases_real = ( n_lambda - fix(n_lambda) ) * 2*pi;

% Tweak to convert the phases to -pi to pi. We need to adjust those greater
% than pi
k_ind = find(phases_real>pi);
phases_real(k_ind) = phases_real(k_ind) - 2*pi;

spatial_source_real = phases_real;

% figure;
% image(x_real,x_real,phases_real,'CDataMapping','scaled');
% colorbar;
% title('Spatial Signal (Phases)');
% xlabel('Space (m)');
% ylabel('Space (m)');


%% Save the signal

% spatial_source_real = single(spatial_source_real);
% writematrix(spatial_source_real);

%% PLOT
% figure;
% image(x_virtual,x_virtual,phases,'CDataMapping','scaled');
% colorbar;
% title('Spatial Signal (Phases)');
% xlabel('Space (m)');
% ylabel('Space (m)');
 
% figure;
% image(x_virtual,x_virtual,phases2,'CDataMapping','scaled');
% colorbar;
% title('Spatial Signal (Phases)');
% xlabel('Space (m)');
% ylabel('Space (m)');

end