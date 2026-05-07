function [spatial_component_virtual] = Get_Spatial_Shifts(imp_struct_virtual, N_SP, spatial_ref, x_virtual, x_real)
% Creates a matrix containing the spatial shifts. E.i., the phases of the
% FP for each position, SP, of the trajectory.

spatial_component_virtual = cell(N_SP,1);

for i=1:N_SP
    spatial_component_virtual{i} = sconv2(imp_struct_virtual{i}, spatial_ref, 'same');
end

%Plot 
% figure;
% image(x_virtual,x_virtual,spatial_shifts{1},'CDataMapping','scaled');
% colorbar;
% title('Phases');
% xlabel('Space Virtual (m)');
% ylabel('Space Virtual (m)');

end