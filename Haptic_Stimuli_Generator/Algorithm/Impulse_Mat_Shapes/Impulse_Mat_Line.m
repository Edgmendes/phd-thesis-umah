function [imp_mat_struct] = Impulse_Mat_Line(length_line, dir, ds, x_virtual, N_SP)
%
%Initialize the imp_cell structure

imp_mat_struct = cell(N_SP,1);
imp_mat = sparse(zeros(length(x_virtual), length(x_virtual)));

for i = 1 : N_SP
    imp_mat_struct{i} = imp_mat; 
end

step = length_line / N_SP;
index_step = round(step / ds);
half_side = round((length_line/2)/ds);

%% Create the impulse signal on the correct indexes
for i = 1 : N_SP
    if dir == 1
        imp_mat_struct{i}(end/2, end/2 - (half_side - index_step/2) + index_step*(i-1)) = 1;
    else
        imp_mat_struct{i}(end/2 - (half_side - index_step/2) + index_step*(i-1), end/2) = 1;
    end
end
% 
% figure;
% image(x_virtual,x_virtual,imp_mat_struct{end/2},'CDataMapping','scaled');
% colorbar;
% title('Imp Mat');
% xlabel('Space (N)');
% ylabel('Space (N)');

end