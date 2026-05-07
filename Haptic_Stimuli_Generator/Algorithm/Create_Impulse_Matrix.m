function [imp_struct_virtual] = Create_Impulse_Matrix(stimulus_shape, L, ds_virtual, x_virtual, N_SP)

    % Creation of the spatial impulse structure 
    if(strcmp(stimulus_shape, 'circle'))
        imp_struct_virtual = Impulse_Mat_Circle(L, ds_virtual, x_virtual, N_SP);

    elseif(strcmp(stimulus_shape, 'square'))
        imp_struct_virtual = Impulse_Mat_Square(L, ds_virtual, x_virtual, N_SP);

    elseif(strcmp(stimulus_shape, 'triangle'))
        imp_struct_virtual = Impulse_Mat_Triangle(L, ds_virtual, x_virtual, N_SP);

    elseif(strcmp(stimulus_shape, 'spiral'))
        imp_struct_virtual = Impulse_Mat_GoldenLogSpiral(ds_virtual, x_virtual, N_SP, 15*ds_virtual, 100*ds_virtual, 2);

    elseif(strcmp(stimulus_shape, 'rhombus'))
        alpha = 60*pi/180;     % 60° interior angle
        imp_struct_virtual = Impulse_Mat_Rhombus(L, alpha, ds_virtual, x_virtual, N_SP, pi/3);

    elseif(strcmp(stimulus_shape, 'ellipse'))
        a = 50e-3;      %  mm semi-axis
        b = 25e-3;      %  mm semi-axis
        imp_struct_virtual = Impulse_Mat_Ellipse(a, b, ds_virtual, x_virtual, N_SP, pi/6);

    elseif(strcmp(stimulus_shape, 'star'))
        R_out = 40e-3;    % 20 mm
        R_in  = 20e-3;    % 20 mm     
        imp_struct_virtual = Impulse_Mat_Star4(R_out, R_in, ds_virtual, x_virtual, N_SP, 0);

    elseif(strcmp(stimulus_shape, 'heart'))
        imp_struct_virtual = Impulse_Mat_Heart(ds_virtual, x_virtual, N_SP, L, pi);

    elseif(strcmp(stimulus_shape, 'line'))
        dir = 1; % horizontal 1, vertical 0
    	imp_struct_virtual = Impulse_Mat_Line(L, dir, ds_virtual, x_virtual, N_SP);
    end

end