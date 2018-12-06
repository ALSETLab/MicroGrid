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
end Battery;
