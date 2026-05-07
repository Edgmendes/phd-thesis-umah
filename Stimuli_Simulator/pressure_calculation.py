# -*- coding: utf-8 -*-
"""
Created on Thu May  8 14:25:45 2025

@author: Eduardo_Mendes
"""

import numpy as np


def pressure_calculation(r, phases_xz, A, o_i, D):
        
    z_aux = ( D * 1/r ) * ( np.cos( phases_xz - o_i ) - 1j * np.sin( phases_xz - o_i ) );

    p = np.sum(A * z_aux, axis = 0 ) / 2; # this is the expression for unbaffled case (it has the division by 2)
    
    return p;