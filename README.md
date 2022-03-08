# Hybrid-Production
This code is used in the CIRP CMS 2022 publication "Hybrid Production: Enabled By Controlling The Output Sequence Of A Matrix Production Using Answer Set Programming".
In order to reproduce the results the files have to be executed in the correct way.
For the first application with the input data of the FLW research lab, the input files beginning with "input_CPPS" are used. For the second application with the input data from Thomopoulos, the input files beginning with "input_thomopoulos" are used.
To execute the code, clingo (https://potassco.org/clingo/) has to be installed. Then the following commands can be executed in the terminal:

Input FLW research lab:  
  1. cmd: clingo input_cpps.lp cpps_task.lp
  2. The output has to be saved in a new file (output.lp)
  3. cmd: clingo output.lp input_cpps_pick.lp cpps_pick_robot.lp

Input Thomopoulos:  
  1. cmd: clingo input_thomopouolos.lp cpps_task.lp
  2. The output has to be saved in a new file (output.lp)
  3. cmd: clingo output.lp input_thomopouolos_pick.lp cpps_pick_robot.lp
