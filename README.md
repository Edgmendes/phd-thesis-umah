# phd-thesis-umah
Suplementary Material Eduardo Mendes PhD Thesis

The Haptic Tool is composed by three "parts". The Haptic_Sensations_Generator, the Haptic_Stimuli_Generator and the Stimuli_Simulator.
The Haptic_Sensations_Generator and the Haptic_Stimuli_Generator (are implemented in Matlab) and both regard the Haptic Signal Generator. 
The difference between them is that the Haptic_Sensations_Generator has a user abstraction layer (Dynamic_Specification). This 
allows is for easing the creation of Haptic Sensations. The Haptic_Stimuli_Generator does not has such abstraction. The user needs to specify
the parameters of the haptic stimulus.
The Haptic Tool outputs the Stimuli.bin and params.txt files. These serve as input for the Stimuli_Simulator, which is responsible
to create a visualization of the stimuli. The Stimuli_Simulator was coded in Python.

Notes:

 - Matlab version R2024b;

 - As for the Python, Anaconda package manager was used for the creation of the virtual enviroment.
The virtual enviroment can be found in Stimuli_Simulator/anaconda_virtual_env;

 - The Algo_script in /Algorithm requires a path to be renamed to avoid compiling errors.





/Haptic_Tool
  /Haptic_Sensations_Generator
    /Dynamic_Specification
    /Algorithm
  /Haptic_Stimuli_Generator
	/Algorithm
  /Stimuli_Simulator
  
  


/data
  /user-study1
  /user-study2
/code
  /stm_generator_tool
    /abstract_layer
    /stimuli_generator
    /acoustic_simulator
  /vivado
    /fpga
    /C-code
/extra
  /figures
  /videos
/docs
  questionnaires.pdf
  
README.md
