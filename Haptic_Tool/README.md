# phd-thesis-umah
Suplementary Material Eduardo Mendes PhD Thesis

The Haptic Tool is composed by three "parts". The Haptic_Sensations_Generator, the Haptic_Stimuli_Generator and the Stimuli_Simulator.
The Haptic_Sensations_Generator and the Haptic_Stimuli_Generator are implemented in Matlab and both regard the Haptic Signal Generator. 
The difference between them is that the Haptic_Sensations_Generator has an user abstraction layer (i.e., the Dynamic_Specification). This 
allows the user to create Haptic Sensations without worying with stimuli parameter configuration.
The Haptic_Stimuli_Generator does not has such abstraction "layer". The user needs to specify the parameters of the haptic stimulus.

The Haptic Tool outputs the Stimulus.bin and params.txt files. These files serve as input for the Stimuli_Simulator, which is responsible
to create a visualization of the stimuli. The Stimuli_Simulator was coded in Python.

Notes:
 - Matlab version R2024b;
	- installed Add-Ons: Audio Toolbox; DSP system toolbox; Signal processing toolbox; Statistics and Machine learning toolbox; Symbolic Math toolbox;

 - As for the Python implementation, Anaconda package manager was used for the creation of the virtual enviroment.
	- The virtual enviroment used in our project can be found in Stimuli_Simulator/anaconda_virtual_env;

 - The Algo_script in /Algorithm requires a path to be renamed correctly to avoid compiling errors.


## Project Structure

├── Haptic_Tool/
│   ├── Haptic_Sensations_Generator/
│   │	├── Dynamic_Specification/
│   │	└── Algorithm/
│   ├── Haptic_Stimuli_Generator/
│   │	└── Algorithm/
│   └──  Stimuli_Simulator
  
  


  
README.md
