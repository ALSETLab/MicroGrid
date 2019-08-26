within MicroGrid.Control.Examples;
model PWM_1Ph_Example
  extends Modelica.Icons.Example;
  Modulation.TriangPWM_1Ph triangPWM_1Ph1 annotation(Placement(visible = true, transformation(origin = {30, 13.056}, extent = {{-13.056, -13.056}, {13.056, 13.056}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(freqHz = 60, amplitude = 0.8) annotation(Placement(visible = true, transformation(origin = {-50, 13.053}, extent = {{-13.053, -13.053}, {13.053, 13.053}}, rotation = 0)));
  Interfaces.Real2Control real2Control1 annotation(Placement(visible = true, transformation(origin = {-9.277, 12.887}, extent = {{-12.887, -12.887}, {12.887, 12.887}}, rotation = 0)));
equation
  connect(sine1.y, real2Control1.InputReal) annotation(Line(visible = true, origin = {-26.712, 12.97}, points = {{-8.93, 0.083}, {1.547, 0.083}, {1.547, -0.083}, {5.836, -0.083}}, color = {1, 37, 163}));
  connect(real2Control1.OutputSignal, triangPWM_1Ph1.m_index) annotation(Line(visible = true, origin = {12.137, 12.971}, points = {{-9.172, 0.046}, {1.791, 0.046}, {1.791, -0.046}, {5.59, -0.046}}, color = {0, 128, 0}));
  annotation(experiment(StopTime = 0.1));
end PWM_1Ph_Example;
