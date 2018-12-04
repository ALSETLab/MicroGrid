within MicroGrid.Control.PhaseLockedLoop;

model SOGI
  import Modelica.Constants.pi;
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Real FilterGain = 1.41 "Filter gain";
  parameter Real FrequencyHz = 60 "System nominal frequency";
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = FilterGain) annotation(Placement(visible = true, transformation(origin = {-34.893, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(visible = true, transformation(origin = {-4.607, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 2 * pi * FrequencyHz) annotation(Placement(visible = true, transformation(origin = {24.02, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(Placement(visible = true, transformation(origin = {56.598, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2 annotation(Placement(visible = true, transformation(origin = {56.153, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 2 * pi * FrequencyHz) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_in annotation(Placement(visible = true, transformation(origin = {-110, -0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-96.559, -2.066}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {165, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qv annotation(Placement(visible = true, transformation(origin = {165, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(feedback.y, gain1.u) annotation(Line(visible = true, origin = {-53.947, -0}, points = {{-7.053, -0}, {7.053, 0}}, color = {1, 37, 163}));
  connect(gain1.y, feedback2.u1) annotation(Line(visible = true, origin = {-18.25, -0}, points = {{-5.643, -0}, {5.643, 0}}, color = {1, 37, 163}));
  connect(feedback2.y, gain2.u) annotation(Line(visible = true, origin = {8.206, -0}, points = {{-3.814, -0}, {3.814, 0}}, color = {1, 37, 163}));
  connect(gain3.u, integrator2.y) annotation(Line(visible = true, origin = {38.577, -40}, points = {{-6.577, 0}, {6.577, 0}}, color = {1, 37, 163}));
  connect(gain3.y, feedback2.u2) annotation(Line(visible = true, origin = {-0.072, -29.333}, points = {{9.072, -10.667}, {-4.536, -10.667}, {-4.536, 21.333}}, color = {1, 37, 163}));
  connect(integrator1.y, integrator2.u) annotation(Line(visible = true, origin = {73.938, -20}, points = {{-6.34, 20}, {6.062, 20}, {6.062, -20}, {-5.784, -20}}, color = {1, 37, 163}));
  connect(v_in, feedback.u1) annotation(Line(visible = true, origin = {-94, -0}, points = {{-16, 0}, {16, -0}}, color = {1, 37, 163}));
  connect(gain3.y, qv) annotation(Line(visible = true, origin = {67.528, -46.667}, points = {{-58.528, 6.667}, {-71.945, 6.667}, {-71.945, -13.333}, {52.472, -13.333}, {52.472, 6.667}, {97.472, 6.667}}, color = {1, 37, 163}));
  connect(v, integrator1.y) annotation(Line(visible = true, origin = {118.149, 20}, points = {{46.851, 20}, {1.851, 20}, {1.851, -20}, {-50.551, -20}}, color = {1, 37, 163}));
  connect(integrator1.y, feedback.u2) annotation(Line(visible = true, origin = {17.52, 13.6}, points = {{50.078, -13.6}, {62.48, -13.6}, {62.48, 16.4}, {-87.52, 16.4}, {-87.52, -5.6}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.527, -0}, extent = {{-55.473, -34.767}, {55.473, 34.767}}, textString = "SOGI - PBF")}), Diagram(coordinateSystem(extent = {{-100, -95.952}, {160, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end SOGI;
