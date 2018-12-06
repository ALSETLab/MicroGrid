within MicroGrid.Control.Modulation;

model TriangPWM_3Ph
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Modelica.SIunits.Frequency f = 1000 "Switching frequency";
  parameter Modelica.SIunits.Time startTime = 0 "Start time";
  Modelica.Blocks.Interfaces.BooleanOutput fire "Firing PWM signal" annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-60, 110}), visible = true, iconTransformation(origin = {-60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 1, uMin = 0) annotation(Placement(transformation(extent = {{-38, -10}, {-18, 10}})));
  Modelica.Blocks.Logical.Less greaterEqual annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, origin = {44, -8})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(final startTime = startTime, final samplePeriod = 1 / f) annotation(Placement(transformation(extent = {{-8, -10}, {12, 10}})));
  Modelica.Blocks.Sources.Trapezoid triangular(amplitude = 2, offset = -1, period = 1 / f, width = 0, rising = 0.5 / f, falling = 0.5 / f) annotation(Placement(transformation(origin = {-28, -50}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.SignalBus m_index annotation(Placement(transformation(extent = {{-124, -22}, {-64, 20}}, origin = {0, 0}, rotation = 0), visible = true, iconTransformation(origin = {0, 0}, extent = {{-124, -22}, {-64, 20}}, rotation = 0)));
  Interfaces.Control2Real control2Real annotation(Placement(transformation(extent = {{-68, -10}, {-48, 10}})));
  Modelica.Blocks.Logical.Not not1 annotation(Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Modelica.Blocks.Interfaces.BooleanOutput fire_compl "Firing PWM signal" annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {60, 110}), visible = true, iconTransformation(origin = {68, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(limiter.y, zeroOrderHold.u) annotation(Line(points = {{-17, 0}, {-10, 0}}, color = {0, 0, 127}));
  connect(zeroOrderHold.y, greaterEqual.u2) annotation(Line(points = {{13, 0}, {32, 0}}, color = {0, 0, 127}));
  connect(triangular.y, greaterEqual.u1) annotation(Line(points = {{-17, -50}, {22, -50}, {22, -8}, {32, -8}}, color = {0, 0, 127}));
  connect(m_index, control2Real.InputSignal) annotation(Line(points = {{-94, -1}, {-82, -1}, {-82, 0}, {-67.1, -0.1}}, color = {0, 128, 0}, thickness = 0.5, visible = true));
  connect(limiter.u, control2Real.OutputReal) annotation(Line(points = {{-40, 0}, {-48, 0}}, color = {0, 0, 127}));
  connect(not1.y, fire_compl) annotation(Line(visible = true, origin = {60, 85.5}, points = {{0, -24.5}, {0, 24.5}}, color = {190, 52, 178}));
  connect(greaterEqual.y, not1.u) annotation(Line(visible = true, origin = {58.333, 7.333}, points = {{-3.333, -15.333}, {1.667, -15.333}, {1.667, 30.667}}, color = {190, 52, 178}));
  connect(fire, greaterEqual.y) annotation(Line(visible = true, origin = {11, 30.8}, points = {{-71, 79.2}, {-71, -0.8}, {49, -0.8}, {49, -38.8}, {44, -38.8}}, color = {190, 52, 178}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {12.391, 41.668}, extent = {{-67.609, -35}, {67.609, 35}}, textString = "Single-Phase"), Text(visible = true, origin = {10, 5}, extent = {{-64.708, -15}, {64.708, 15}}, textString = "sinusoidal"), Text(visible = true, origin = {5.352, -30}, extent = {{-44.648, -13.784}, {44.648, 13.784}}, textString = "PWM")}));
end TriangPWM_3Ph;
