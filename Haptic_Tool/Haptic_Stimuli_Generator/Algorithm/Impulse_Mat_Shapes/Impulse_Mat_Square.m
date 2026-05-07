function [imp_mat_struct] = Impulse_Mat_Square_2(length_square, ds, x_virtual, N_SP)

%Initialize the imp_cell structure

imp_mat_struct = cell(N_SP,1);
imp_mat = sparse(zeros(length(x_virtual), length(x_virtual)));

for i = 1 : N_SP
    imp_mat_struct{i} = imp_mat; 
end

%%
sp_step = length_square / N_SP;
sp_step_idx = round(sp_step / ds);

half_side_index = round((length_square/8)/ds);

row_start = length(x_virtual)/2 - half_side_index;
col_start = row_start;

row_end = length(x_virtual)/2 + half_side_index;
col_end = row_end;

if mod(N_SP,2)==1
    N_SP = N_SP - 1;
end    

N_SP_side = N_SP / 4;

n = 1;
step = 0;


for i = 1 : 1 : N_SP_side
    imp_mat_struct{n}(row_start, col_start + step) = 1;
    n = n + 1;
    step = step + sp_step_idx;
end

step = 0;

for i = 1 : 1 : N_SP_side
    imp_mat_struct{n}(row_start+step, col_end) = 1;
    n = n + 1;
    step = step + sp_step_idx;
end

step = 0;

for i = 1 : 1 : N_SP_side
    imp_mat_struct{n}(row_end, col_end-step) = 1;
    n = n + 1;
    step = step + sp_step_idx;
end

step = 0;

for i = 1 : 1 : N_SP_side
    imp_mat_struct{n}(row_end-step, col_start) = 1;
    n = n + 1;
    step = step + sp_step_idx;
end

% figure;
% image(x_virtual,x_virtual,imp_mat_struct{1},'CDataMapping','scaled');
% colorbar;
% title('Imp Mat');
% xlabel('Space (N)');
% ylabel('Space (N)');

end