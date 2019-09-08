within MicroGrid.Storage;
model Battery
  extends MicroGrid.Electrical.Interfaces.OnePort;
  parameter Real E0 = 12.6463;
  parameter Real Q = 0.65;
  parameter Real A = 0.65;
  parameter Real B = 2884.61;
  parameter Real K = 0.33;
  parameter Real R = 0.25;
  parameter Real SoCO = 90;
  Real Qt;
  Real SoC;
  Real E;
initial equation
  Qt = (1 - SoCO / 100) * Q;
equation
  der(Qt) = -i / 3600;
  E = E0 - K * Q / (Q - Qt) + A * exp(-B * Qt);
  u = E + R * i;
  SoC = (1 - Qt / Q) * 100;
  y = SoC;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.1), graphics={  Line(visible = true, origin = {14, 0}, points = {{-90, 0}, {-50, 0}}), Line(visible = true, origin = {-14, 0}, points = {{50, 0}, {90, 0}}), Line(visible = true, origin = {14, 0}, points = {{-50, 40}, {-50, -40}}), Line(visible = true, points = {{-20, 20}, {-20, -20}}), Line(visible = true, points = {{-20, 0}, {20, 0}}), Line(visible = true, points = {{20, 40}, {20, -40}}), Line(visible = true, origin = {-14, 0}, points = {{50, 20}, {50, -20}}), Text(visible = true, textColor = {28, 108, 200}, extent = {{-80, -80}, {80, -40}}, textString = "%name")}));
end Battery;
