# -*- coding: utf-8 -*-
"""
Created on Wed May  7 19:26:52 2025

@author: Eduardo_Mendes
"""
import numpy as np

def distances_to_XY_plane(x_plane, y_plane, z_plane, x_src, y_src, z_src):
    
    xx, yy = np.meshgrid(x_plane,y_plane)
    N = len(x_src);
    r = np.zeros( (N*N, len(x_plane), len(y_plane)))
    
    index = 0;
    for row in y_src:
        for col in x_src:
            #print(col,row)
            r[index] = np.sqrt( (xx - col)**2 + (yy - row)**2 + (z_plane - z_src)**2 )
            index = index + 1;
        
    r = r.astype(np.float32);
    
    return r;


def distances_to_YZ_plane(x_plane, y_plane, z_plane, x_src, y_src, z_src):
    
    yy, zz = np.meshgrid(y_plane, z_plane)
    N = len(x_src);
    r = np.zeros( (N*N, len(y_plane), len(z_plane)))
    
    index = 0;
    for row in y_src:
        for col in x_src:
            #print(col,row)
            r[index] = np.sqrt( (x_plane - col)**2 + (yy - row)**2 + (zz - z_src)**2 )
            index = index + 1;
    
    r = r.astype(np.float32);
        
    return r;


def distances_to_XZ_plane(x_plane, y_plane, z_plane, x_src, y_src, z_src):
    
    xx, zz = np.meshgrid(x_plane, z_plane)
    N = len(x_src);
    r = np.zeros( (N*N, len(x_plane), len(z_plane)))
    
    index = 0;
    for row in y_src:
        for col in x_src:
            #print(col,row)
            r[index] = np.sqrt( (xx - col)**2 + (y_plane - row)**2 + (zz - z_src)**2 )
            index = index + 1;
        
    r = r.astype(np.float32);
        
    return r;