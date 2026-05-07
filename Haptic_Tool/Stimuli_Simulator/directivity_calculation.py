# -*- coding: utf-8 -*-
"""
Created on Thu May 15 18:31:15 2025

@author: Eduardo_Mendes
"""

import numpy as np

def directivity_xy(x_plane, y_plane, z_pos, x_src, y_src):
    
    xx, yy = np.meshgrid(x_plane,y_plane)
    N = len(x_src);
    D = np.zeros( (N*N, len(x_plane), len(y_plane)))
    
    index = 0;
    for row in y_src:
        for col in x_src:
            #print(col,row)
            D[index] = np.arctan( np.sqrt( (xx - col)**2 + (yy - row)**2) / z_pos)
            index = index + 1;
            
    #D = np.cos(D);        
    D = (np.cos(D))**2;   
        
    return D;


def directivity_xz(x_plane, z_plane, y_pos, x_src, y_src):
    
    xx, zz = np.meshgrid(x_plane,z_plane)
    N = len(x_src);
    alpha = np.zeros( (N*N, len(x_plane), len(z_plane)))
    
    index = 0;
    for row in y_src:
        for col in x_src:
            #print(col,row)
            alpha[index] = np.arctan( zz / abs(row))
            index = index + 1;
            
    #D = np.cos(D);
    beta = np.pi/2 - alpha;        
    D = (np.cos(beta))**2;   
        
    return D;