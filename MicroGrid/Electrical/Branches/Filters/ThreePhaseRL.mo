within MicroGrid.Electrical.Branches.Filters;
model ThreePhaseRL
  parameter Modelica.SIunits.Resistance Rb = 0.1 "Each phase resistance";
  parameter Modelica.SIunits.Inductance Lb = 0.1 "Each phase inductance";
  BranchRL RL1(R=Rb,L=Lb)  annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  BranchRL RL2(R=Rb,L=Lb)  annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BranchRL RL3(R=Rb,L=Lb)  annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-106, 50}, {-86, 70}})));
  Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}})));
  Interfaces.PositivePin p3 annotation(Placement(transformation(extent = {{-106, -70}, {-86, -50}})));
  Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{86,50},{106,70}})));
  Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Interfaces.NegativePin n3 annotation (Placement(transformation(extent={{86,-70},{106,-50}})));
equation
  connect(p1,p1)  annotation(Line(points = {{-96, 60}, {-96, 60}}, color = {0, 0, 255}));
  connect(RL_1.n, n1)
    annotation (Line(points={{8,60},{96,60}}, color={0,0,255}));
  connect(RL_1.p, p1)
    annotation (Line(points={{-8,60},{-96,60}}, color={0,0,255}));
  connect(RL2.p, p2)
    annotation (Line(points={{-8,0},{-96,0}}, color={0,0,255}));
  connect(RL3.p, p3)
    annotation (Line(points={{-8,-60},{-96,-60}}, color={0,0,255}));
  connect(n2, n2) annotation (Line(points={{96,0},{96,0}}, color={0,0,255}));
  connect(n2, RL2.n) annotation (Line(points={{96,0},{8,0}}, color={0,0,255}));
  connect(n3, RL3.n)
    annotation (Line(points={{96,-60},{8,-60}}, color={0,0,255}));
  annotation (Icon(graphics={
        Text(
          extent={{-152,123},{148,83}},
          textString="%name",
          lineColor={0,0,255}),
        Line(points={{-88,60},{-44,60},{-40,80},{-30,40}},color={0,0,255}),
        Line(points={{-30,40},{-20,80},{-10,40},{-4,60},{6,60}}, color={0,0,255}),
 Line(points={{6,60},{6,66},{10,76},{16,76},{18,72},{20,66},{20,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{16,72},{12,68},{10,60},{12,42},{18,42},{20,54},{20,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{30,72},{24,68},{22,60},{24,42},{30,42},{32,54},{32,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{42,72},{36,68},{34,60},{36,42},{42,42},{44,54},{44,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{44,74},{48,76},{50,66},{50,64},{50,62},{50,62},{50,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{32,74},{36,76},{42,76},{44,70},{44,68},{44,64},{44,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{20,72},{24,76},{30,76},{32,70},{32,68},{32,64},{32,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
        Line(
          points={{50,60},{96,60},{86,60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{-86,0},{-44,0},{-40,20},{-30,-20}}, color={0,0,255}),
        Line(points={{-30,-20},{-20,20},{-10,-20},{-4,0},{6,0}}, color={0,0,255}),
 Line(points={{6,0},{6,6},{10,16},{16,16},{18,12},{20,6},{20,0}},color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{16,12},{12,8},{10,0},{12,-18},{18,-18},{20,-6},{20,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{30,12},{24,8},{22,0},{24,-18},{30,-18},{32,-6},{32,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{42,12},{36,8},{34,0},{36,-18},{42,-18},{44,-6},{44,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{44,14},{48,16},{50,6},{50,4},{50,2},{50,2},{50,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{32,14},{36,16},{42,16},{44,10},{44,8},{44,4},{44,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{20,12},{24,16},{30,16},{32,10},{32,8},{32,4},{32,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
        Line(
          points={{50,0},{96,0},{88,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{-86,-60},{-44,-60},{-40,-40},{-30,-80}},
                                                          color={0,0,255}),
        Line(points={{-30,-80},{-20,-40},{-10,-80},{-4,-60},{6,-60}},
                                                                 color={0,0,255}),
 Line(points={{6,-60},{6,-54},{10,-44},{16,-44},{18,-48},{20,-54},{20,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{16,-48},{12,-52},{10,-60},{12,-78},{18,-78},{20,-66},{20,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{30,-48},{24,-52},{22,-60},{24,-78},{30,-78},{32,-66},{32,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{42,-48},{36,-52},{34,-60},{36,-78},{42,-78},{44,-66},{44,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{44,-46},{48,-44},{50,-54},{50,-56},{50,-58},{50,-58},{50,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{32,-46},{36,-44},{42,-44},{44,-50},{44,-52},{44,-56},{44,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{20,-48},{24,-44},{30,-44},{32,-50},{32,-52},{32,-56},{32,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
        Line(
          points={{50,-60},{96,-60},{86,-60}},
          color={0,0,255},
          smooth=Smooth.Bezier)}));
end ThreePhaseRL;
