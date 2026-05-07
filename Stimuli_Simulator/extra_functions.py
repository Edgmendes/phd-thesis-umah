# -*- coding: utf-8 -*-
"""
Created on Tue May 20 18:34:47 2025

@author: Eduardo_Mendes
"""
import numpy as np

def fp_yy_coord(p_abs_xy_plane, space, y_plane):
    
    # Search for the y coord position
    idx_max = np.argmax(p_abs_xy_plane)                               # Flat index (1D) do valor máximo
    
    y_idx, x_idx = np.unravel_index(idx_max, p_abs_xy_plane.shape)    # Índices (linha, coluna) correspondentes
    
    y_plane_coord = ((y_idx * space) / len(y_plane)) - space/2; # convert to meters
    
    fp_yy_pos = y_plane_coord;
    
    return fp_yy_pos;