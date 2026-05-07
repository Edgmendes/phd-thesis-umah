# -*- coding: utf-8 -*-
"""
Created on Wed Apr 23 17:40:00 2025

@author: Eduardo_Mendes
"""
import numpy as np

def read_stm_sample(filename):
    
    with open(filename, 'r', encoding="utf-8") as f:
        signal = f.read() #le todo o ficheiro
        
        signal = signal.replace('i', 'j');
        
        signal_samples = signal.split('\n') #cria uma matriz em que cada elemento é o uma sample temporal que contem um complexo com a info temporal e espacial
        
        len_rows = len(signal_samples)-1;
        len_cols = len(signal_samples[0].split(','));
    
        signal_matrix = np.zeros((len_rows,len_cols),dtype=complex); #matriz com o tamanho do sinal espaço temporal, a ser preenchida
        
        for i,elem in enumerate(signal_samples):
            
            if(i == len_rows): #ultima string é um \n não é convetivel
                break
            
            signal_str = elem.split(',')
            signal_complex = [complex(i) for i in signal_str]
            
            signal_matrix[i,:] = signal_complex;
            
            #print(phases_matrix[i])
    
    signal_matrix_rs = np.reshape(signal_matrix,(len_rows*len_cols,1,1));
    
    o_i = np.angle(signal_matrix_rs).astype(np.float32);    
    A = np.abs(signal_matrix_rs).astype(np.float32);
    
    return A, o_i;

def read_params(filename):
    
    with open(filename, 'r', encoding="utf-8") as f:
        signal = f.read() #le todo o ficheiro
                
        signal_samples = signal.split(';') #cria uma matriz em que cada elemento é o uma sample temporal que contem um complexo com a info temporal e espacial
        
        #params = np.zeros(len(signal_samples));
        params = [['',''] for i in range(len(signal_samples))] ;
        
        for i,elem in enumerate(signal_samples):
            samples = elem.split('-');
            params[i][0] = samples[0];
            params[i][1] = samples[1];
            
    ##
    ##        
    L           = float(params[2][1])       # emitter array length
    N           = int(params[1][1])  # Nº of emitter
    fp_height   = float(params[3][1]);      # where the fp was generated <-> Observation plante
    t_samples   = int(params[0][1]) #time samples of the signal
    F_carrier   = float(params[4][1]) #time samples of the signal
    c           = int(params[5][1])
    T_draw      = float(params[6][1])
    dt          = float(params[7][1])
    Tau         = float(params[8][1])
    Stimulus    = params[9][1][:-1] #elimina o \n
    Amax_FP     = float(params[10][1])
    nFPs        = int(params[11][1])
    word_bits   = int(params[12][1])
    ##
    ##

       
    return L, N, fp_height, F_carrier, c, t_samples, T_draw, dt, Tau, Stimulus, Amax_FP, nFPs, word_bits






















