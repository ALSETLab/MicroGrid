within MicroGrid.Electrical.Sources;

model threePhaseAC "Three Phase AC Voltage Source"
  parameter Real VLine = 220 "Line voltage, in volts";
  parameter Real FreqHz = 60 "Voltage frequency, in herts";
  Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-106, 50}, {-86, 70}})));
  Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}})));
  Interfaces.PositivePin p3 annotation(Placement(transformation(extent = {{-106, -70}, {-86, -50}})));
  singlePhaseAC Phase1(V = VLine * sqrt(2) / sqrt(3), freq = FreqHz) annotation(Placement(transformation(extent = {{-56, 50}, {-36, 70}})));
  singlePhaseAC Phase2(V = VLine * sqrt(2) / sqrt(3), freq = FreqHz, phase = -2.0943951023932) annotation(Placement(transformation(extent = {{-58, -10}, {-38, 10}})));
  singlePhaseAC Phase3(V = VLine * sqrt(2) / sqrt(3), freq = FreqHz, phase = -4.18879020478639) annotation(Placement(transformation(extent = {{-58, -70}, {-38, -50}})));
  Interfaces.NegativePin gnd annotation(Placement(transformation(extent = {{86, -10}, {106, 10}})));
equation
  connect(p1, p1) annotation(Line(points = {{-96, 60}, {-96, 60}}, color = {0, 0, 255}));
  connect(Phase1.p, p1) annotation(Line(points = {{-55.6, 60}, {-96, 60}}, color = {0, 0, 255}));
  connect(Phase2.p, p2) annotation(Line(points = {{-57.6, 0}, {-96, 0}}, color = {0, 0, 255}));
  connect(Phase3.p, p3) annotation(Line(points = {{-57.6, -60}, {-96, -60}}, color = {0, 0, 255}));
  connect(Phase2.n, gnd) annotation(Line(points = {{-38.4, 0}, {96, 0}}, color = {0, 0, 255}));
  connect(Phase3.n, gnd) annotation(Line(points = {{-38.4, -60}, {0, -60}, {0, 0}, {96, 0}}, color = {0, 0, 255}));
  connect(Phase1.n, gnd) annotation(Line(points = {{-36.4, 60}, {0, 60}, {0, 0}, {96, 0}}, color = {0, 0, 255}));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 0}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 0}), Line(points = {{-50, 0}, {50, 0}}, color = {0, 0, 0}), Text(extent = {{-150, -104}, {150, -64}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-70, 0}, {-60.2, 29.9}, {-53.8, 46.5}, {-48.2, 58.1}, {-43.3, 65.2}, {-38.3, 69.2}, {-33.4, 69.8}, {-28.5, 67}, {-23.6, 61}, {-18.6, 52}, {-13, 38.6}, {-5.98, 18.6}, {8.79, -26.9}, {15.1, -44}, {20.8, -56.2}, {25.7, -64}, {30.6, -68.6}, {35.5, -70}, {40.5, -67.9}, {45.4, -62.5}, {50.3, -54.1}, {55.9, -41.3}, {63, -21.7}, {70, 0}}, color = {0, 0, 255}), Line(points = {{-86, 60}, {-72, 60}}, color = {0, 0, 0}), Line(points = {{-86, -60}, {-72, -60}}, color = {0, 0, 0}), Line(points = {{-40, -3.67391e-15}, {20, 0}}, color = {0, 0, 0}, origin = {-72, -40}, rotation = -90), Line(points = {{-40, -3.67391e-15}, {20, 0}}, color = {0, 0, 0}, origin = {-72, 20}, rotation = -90), Line(points = {{-36, 0}, {-26.2, 29.9}, {-19.8, 46.5}, {-14.2, 58.1}, {-9.3, 65.2}, {-4.3, 69.2}, {0.6, 69.8}, {5.5, 67}, {10.4, 61}, {15.4, 52}, {21, 38.6}, {28.02, 18.6}, {42.79, -26.9}, {49.1, -44}, {54.8, -56.2}, {59.7, -64}, {64.6, -68.6}, {69.5, -70}, {74.5, -67.9}, {79.4, -62.5}, {84.3, -54.1}, {89.9, -41.3}, {97, -21.7}, {104, 0}}, color = {0, 0, 255}), Line(points = {{-104, 0}, {-94.2, 29.9}, {-87.8, 46.5}, {-82.2, 58.1}, {-77.3, 65.2}, {-72.3, 69.2}, {-67.4, 69.8}, {-62.5, 67}, {-57.6, 61}, {-52.6, 52}, {-47, 38.6}, {-39.98, 18.6}, {-25.21, -26.9}, {-18.9, -44}, {-13.2, -56.2}, {-8.3, -64}, {-3.4, -68.6}, {1.5, -70}, {6.5, -67.9}, {11.4, -62.5}, {16.3, -54.1}, {21.9, -41.3}, {29, -21.7}, {36, 0}}, color = {0, 0, 255})}));
end threePhaseAC;
