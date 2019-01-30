# MicroGrid
Small library made as final project for the course Modeling and Simulation of Cyber-Physical Systems. It contains models for batteries, photovoltaics modules, converters and control systems.

## How to simulate it?
- Download the library MicroGrid.
- Go to folder `MicroGrid` and load the model `package.mo`. This act will load all the models into the Working tab in the Modelica-compliant software used.
- The main package, MicroGrid, consists of six subpackages, named: (1) Examples, (2) Electrical, (3) Storage, (4) PhotoVoltaics, (5) Control and (6) Sensors. The microgrid example is within (1) Examples, named `MicroGrid_Example.mo`. Other examples are available in `Electrical/Examples` and in `Control/Examples`.
- The model `Examples/MicroGrid_Example.mo` can be simulated in different manners, depending on the Modelica-compliant software being used. For OpenModelica and Dymola, the user should move to Simulation tab and by clicking the Simulate button. For SystemModeler, the Simulate button is located in the Modeling tab.

## Acknowledgement
This work was supported in part by the Engineering Research Center Program of the National Science Foundation and the Department of Energy under NSF Award Number EEC-1041877 and the CURENT Industry Partnership Program.
