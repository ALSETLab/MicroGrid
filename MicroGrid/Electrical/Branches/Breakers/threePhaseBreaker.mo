within MicroGrid.Electrical.Branches.Breakers;
model threePhaseBreaker "Ideal three-phase breaker."
  parameter Modelica.SIunits.Time ClosingTime = 0.01 "Start time";
  Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=ClosingTime, startValue=false)  annotation(Placement(visible = true, transformation(origin={-44,88},    extent = {{-7.638, -7.638}, {7.638, 7.638}}, rotation = 0)));
  Electrical.Interfaces.PositivePin p1 annotation (Placement(transformation(extent={{-106,50},{-86,70}})));
  Electrical.Interfaces.PositivePin p2 annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  Electrical.Interfaces.PositivePin p3 annotation (Placement(transformation(extent={{-106,-70},{-86,-50}})));
  Electrical.Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{86,50},{106,70}})));
  Electrical.Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Electrical.Interfaces.NegativePin n3 annotation (Placement(transformation(extent={{86,-70},{106,-50}})));
  BasicComponents.switch            switch1(g_off=1E-7)   annotation(Placement(visible = true, transformation(origin={-0.442,
            60},                                                                                                                      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BasicComponents.switch            switch2(g_off=1E-7)   annotation(Placement(visible = true, transformation(origin={0.167,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BasicComponents.switch            switch3(g_off=1E-7)   annotation(Placement(visible = true, transformation(origin={-0.001,
            -60},                                                                                                                     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  connect(p1, switch1.p)
    annotation (Line(points={{-96,60},{-8.442,60}}, color={0,0,255}));
  connect(switch1.n, n1)
    annotation (Line(points={{7.558,60},{96,60}}, color={0,0,255}));
  connect(p2, switch2.p)
    annotation (Line(points={{-96,0},{-7.833,0}}, color={0,0,255}));
  connect(switch2.n, n2)
    annotation (Line(points={{8.167,0},{96,0},{96,0}}, color={0,0,255}));
  connect(p3, switch3.p)
    annotation (Line(points={{-96,-60},{-8.001,-60}}, color={0,0,255}));
  connect(switch3.n, n3)
    annotation (Line(points={{7.999,-60},{96,-60}}, color={0,0,255}));
  connect(booleanStep1.y, switch1.control) annotation (Line(points={{-35.5982,
          88},{-0.442,88},{-0.442,67}}, color={255,0,255}));
  connect(switch2.control, switch1.control) annotation (Line(points={{0.167,7},
          {-16,7},{-16,88},{-0.442,88},{-0.442,67}}, color={255,0,255}));
  connect(switch3.control, switch1.control) annotation (Line(points={{-0.001,
          -53},{-28,-53},{-28,88},{-0.442,88},{-0.442,67}}, color={255,0,255}));
  annotation (Icon(graphics={                                                                                                                                                                                                        Ellipse(extent={{
              -44,64},{-36,56}},                                                                                                                                                                                                        lineColor = {0, 0, 255}), Line(points={{
              -90,60},{-44,60}},                                                                                                                                                                                                        color = {0, 0, 255}), Line(points={{
              -37,62},{40,80}},                                                                                                                                                                                                        color = {0, 0, 255}), Line(points={{
              40,60},{90,60}},                                                                                                                                                                                                        color = {0, 0, 255}), Text(extent={{
              -152,126},{148,86}},                                                                                                                                                                                                        textString = "%name", lineColor = {0, 0, 255}),
                                                                                                                                                                                                        Ellipse(extent={{
              -44,4},{-36,-4}},                                                                                                                                                                                                        lineColor = {0, 0, 255}), Line(points={{
              -90,0},{-44,0}},                                                                                                                                                                                                        color = {0, 0, 255}), Line(points={{
              -37,2},{40,20}},                                                                                                                                                                                                        color = {0, 0, 255}), Line(points={{
              40,0},{90,0}},                                                                                                                                                                                                        color = {0, 0, 255}),
                                                                                                                                                                                                        Ellipse(extent={{
              -44,-56},{-36,-64}},                                                                                                                                                                                                        lineColor = {0, 0, 255}), Line(points={{
              -90,-60},{-44,-60}},                                                                                                                                                                                                        color = {0, 0, 255}), Line(points={{
              -37,-58},{40,-40}},                                                                                                                                                                                                        color = {0, 0, 255}), Line(points={{
              40,-60},{90,-60}},                                                                                                                                                                                                        color = {0, 0, 255})}));
end threePhaseBreaker;
