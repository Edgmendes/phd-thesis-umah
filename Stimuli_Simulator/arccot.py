# -*- coding: utf-8 -*-
"""
Created on Tue Apr 22 13:44:56 2025

@author: Eduardo_Mendes
"""

import numpy as np

def arccot(x):
    if x > 0:
        return np.arctan(1/x)
    elif x == 0:
        return np.pi/2
    

#used for sequences    
def arccot2(seq):
    seq2 = []
    
    for elem in seq:    
        if elem > 0:
            seq2.append(np.arctan(1/elem))
        elif elem == 0:
            seq2.append(np.pi/2)
            
    return seq2