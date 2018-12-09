within MicroGrid.Control.Examples;

model PWM_3Ph_Example
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine1(freqHz = 60, amplitude = 0.8) annotation(Placement(visible = true, transformation(origin = {-40, -76.843}, extent = {{-13.053, -13.053}, {13.053, 13.053}}, rotation = -270)));
  Interfaces.Real2Control real2Control1 annotation(Placement(visible = true, transformation(origin = {-40, -33.79}, extent = {{-12.887, -12.887}, {12.887, 12.887}}, rotation = -270)));
  Modelica.Blocks.Sources.Sine sine2(freqHz = 60, amplitude = 0.8, phase = -2.0943951023932) annotation(Placement(visible = true, transformation(origin = {0, -76.895}, extent = {{-13.053, -13.053}, {13.053, 13.053}}, rotation = -270)));
  Interfaces.Real2Control real2Control2 annotation(Placement(visible = true, transformation(origin = {0, -33.842}, extent = {{-12.887, -12.887}, {12.887, 12.887}}, rotation = -270)));
  Modelica.Blocks.Sources.Sine sine3(freqHz = 60, amplitude = 0.8, phase = -4.18879020478639) annotation(Placement(visible = true, transformation(origin = {40, -76.947}, extent = {{-13.053, -13.053}, {13.053, 13.053}}, rotation = -270)));
  Interfaces.Real2Control real2Control3 annotation(Placement(visible = true, transformation(origin = {40, -33.894}, extent = {{-12.887, -12.887}, {12.887, 12.887}}, rotation = -270)));
  Electrical.Converters.SwitchedVSC switchedVSC1(g_switch = 1e-5, f_s = 1e3) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Electrical.Sources.voltageDC voltageDC1(V = 400) annotation(Placement(visible = true, transformation(origin = {55, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Electrical.BasicComponents.ground ground1 annotation(Placement(visible = true, transformation(origin = {-93.702, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.BasicComponents.resistor resistor1 annotation(Placement(visible = true, transformation(origin = {-50, 35.975}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Electrical.BasicComponents.resistor resistor2 annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Electrical.BasicComponents.resistor resistor3 annotation(Placement(visible = true, transformation(origin = {-50, 3.307}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(sine1.y, real2Control1.InputReal) annotation(Line(visible = true, origin = {-40, -53.936}, points = {{0, -8.548}, {0, 8.548}}, color = {1, 37, 163}));
  connect(sine2.y, real2Control2.InputReal) annotation(Line(visible = true, origin = {0, -53.988}, points = {{0, -8.548}, {0, 8.548}}, color = {1, 37, 163}));
  connect(sine3.y, real2Control3.InputReal) annotation(Line(visible = true, origin = {40, -54.041}, points = {{0, -8.548}, {0, 8.548}}, color = {1, 37, 163}));
  connect(real2Control1.OutputSignal, switchedVSC1.switching1) annotation(Line(visible = true, origin = {-25.064, -10.209}, points = {{-15.064, -11.339}, {-15.064, 0.209}, {15.064, 0.209}, {15.064, 10.921}}, color = {0, 128, 0}));
  connect(real2Control2.OutputSignal, switchedVSC1.switching2) annotation(Line(visible = true, origin = {-0.064, -6.966}, points = {{-0.064, -14.633}, {-0.064, 3.516}, {0.064, 3.516}, {0.064, 7.601}}, color = {0, 128, 0}));
  connect(real2Control3.OutputSignal, switchedVSC1.switching3) annotation(Line(visible = true, origin = {25.146, -10.312}, points = {{14.725, -11.339}, {14.725, 0.312}, {-14.725, 0.312}, {-14.725, 10.714}}, color = {0, 128, 0}));
  connect(switchedVSC1.vdc_n, voltageDC1.n) annotation(Line(visible = true, origin = {35.097, 0.943}, points = {{-16.51, 2.414}, {-11.647, 2.414}, {-11.647, -3.943}, {19.903, -3.943}, {19.903, 3.057}}, color = {0, 0, 255}));
  connect(switchedVSC1.vdc_p, voltageDC1.p) annotation(Line(visible = true, origin = {35.082, 38.933}, points = {{-16.572, -2.601}, {-11.632, -2.601}, {-11.632, 4.067}, {19.918, 4.067}, {19.918, -2.933}}, color = {0, 0, 255}));
  connect(resistor1.p, switchedVSC1.p1) annotation(Line(visible = true, origin = {-26.852, 36.309}, points = {{-15.148, -0.334}, {3.402, -0.334}, {3.402, 0.334}, {8.343, 0.334}}, color = {0, 0, 255}));
  connect(resistor2.p, switchedVSC1.p2) annotation(Line(visible = true, origin = {-27.008, 20.156}, points = {{-14.992, -0.156}, {3.558, -0.156}, {3.558, 0.156}, {7.876, 0.156}}, color = {0, 0, 255}));
  connect(resistor3.p, switchedVSC1.p3) annotation(Line(visible = true, origin = {-27.027, 3.653}, points = {{-14.973, -0.347}, {3.577, -0.347}, {3.577, 0.347}, {7.818, 0.347}}, color = {0, 0, 255}));
  connect(resistor1.n, ground1.p) annotation(Line(visible = true, origin = {-75.777, 27.987}, points = {{17.777, 7.987}, {-4.926, 7.987}, {-4.926, -7.987}, {-7.926, -7.987}}, color = {0, 0, 255}));
  connect(resistor2.n, ground1.p) annotation(Line(visible = true, origin = {-70.851, 20}, points = {{12.851, 0}, {-12.851, 0}}, color = {0, 0, 255}));
  connect(resistor3.n, ground1.p) annotation(Line(visible = true, origin = {-75.777, 11.653}, points = {{17.777, -8.347}, {-4.926, -8.347}, {-4.926, 8.347}, {-7.926, 8.347}}, color = {0, 0, 255}));
  annotation(experiment(StopTime = 0.1));
end PWM_3Ph_Example;
