within MicroGrid.PhotoVoltaics;

model PV_module
  extends MicroGrid.Electrical.Interfaces.OnePort;
  parameter MicroGrid.PhotoVoltaics.Records.ModuleData moduleData annotation(Placement(visible = true, transformation(origin = {80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Integer Np = 1;
  parameter Integer Ns = 1;
  Modelica.Blocks.Interfaces.RealInput Irr annotation(Placement(visible = true, transformation(origin = {-40, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -270), iconTransformation(origin = {-50, -80}, extent = {{-20, -20}, {20, 20}}, rotation = -270)));
  Modelica.Blocks.Interfaces.RealInput T annotation(Placement(visible = true, transformation(origin = {40, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -270), iconTransformation(origin = {50, -80}, extent = {{-20, -20}, {20, 20}}, rotation = -270)));
  Real Ac = 1.6;
  Real Eg = 1.1;
  Real q = moduleData.Q;
  Real lambdaRef = moduleData.irradianceRef;
  Real Isc = moduleData.IscRef;
  Real Voc = moduleData.VocRef;
  Real Tref = moduleData.TRef;
  Real K = Modelica.Constants.k;
  Real K1 = moduleData.alphaIsc;
  Real K2 = moduleData.alphaVoc;
  Real Rspv = 0.01;
  Integer ns = moduleData.ns;
  Real Ior = 1.0647e-6;
  Real Iph;
  Real Irs = Ior * (T / Tref) ^ 3 * Modelica.Math.exp(q * Eg * (1 / Tref - 1 / T) / K / Ac);
  Real exponent;
  Real Ipv;
  Real Vpv;
equation
  v = Ns * Vpv;
  exponent = q / (K * Ac * T) * (Vpv / ns + Rspv * Ipv / ns);
  //oc * (1 + K2 * (T - Tref))
  Iph = (Isc + K1 * (T - Tref)) * Irr / lambdaRef;
  Ipv = Np * Iph - Np * Irs * (Modelica.Math.exp(exponent) - 1);
  Ipv + i = 0;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-76, 76}, {76, -76}}, fillColor = {85, 85, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {255, 255, 255}), Rectangle(extent = {{-84, 84}, {84, -84}}, lineColor = {0, 0, 0}), Polygon(points = {{-84, 76}, {-76, 84}, {-68, 76}, {-76, 68}, {-84, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-24, 76}, {-24, -76}}, color = {255, 255, 255}), Polygon(points = {{-8, 76}, {0, 84}, {8, 76}, {0, 68}, {-8, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 76}, {76, 84}, {84, 76}, {76, 68}, {68, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 0}, {76, 8}, {84, 0}, {76, -8}, {68, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, -76}, {76, -68}, {84, -76}, {76, -84}, {68, -76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -76}, {-76, -68}, {-68, -76}, {-76, -84}, {-84, -76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-54, 76}, {-54, -76}}, color = {255, 255, 255}), Polygon(points = {{-84, 0}, {-76, 8}, {-68, 0}, {-76, -8}, {-84, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, 0}, {0, 8}, {8, 0}, {0, -8}, {-8, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, -76}, {0, -68}, {8, -76}, {0, -84}, {-8, -76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Line(points = {{0, 76}, {0, -76}}, color = {255, 255, 255}), Line(points = {{24, 76}, {24, -76}}, color = {255, 255, 255}), Line(points = {{54, 76}, {54, -76}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
end PV_module;
