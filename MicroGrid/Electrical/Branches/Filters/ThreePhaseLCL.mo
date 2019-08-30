within MicroGrid.Electrical.Branches.Filters;
model ThreePhaseLCL
  parameter Modelica.SIunits.Resistance R1b = 0.1 "Each phase left-side resistance";
  parameter Modelica.SIunits.Inductance L1b = 0.1 "Each phase left-side inductance";
  parameter Modelica.SIunits.Resistance R2b = 0.1 "Each phase right-side resistance";
  parameter Modelica.SIunits.Inductance L2b = 0.1 "Each phase right-side inductance";
  parameter Modelica.SIunits.Capacitance C = 0.001 "Each phase branch capacitance";
  Interfaces.PositivePin p1 annotation(Placement(transformation(extent = {{-106, 50}, {-86, 70}})));
  Interfaces.PositivePin p2 annotation(Placement(transformation(extent = {{-106, -10}, {-86, 10}})));
  Interfaces.PositivePin p3 annotation(Placement(transformation(extent = {{-106, -70}, {-86, -50}})));
  Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{86,50},{106,70}})));
  Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Interfaces.NegativePin n3 annotation (Placement(transformation(extent={{86,-70},{106,-50}})));
  BranchLCL LCL1(
    R1=R1b,
    L1=L1b,
    R2=R2b,
    L2=L2b,
    C=C) annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  BranchLCL LCL2(
    R1=R1b,
    L1=L1b,
    R2=R2b,
    L2=L2b,
    C=C) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BranchLCL LCL3(
    R1=R1b,
    L1=L1b,
    R2=R2b,
    L2=L2b,
    C=C) annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
equation

  connect(LCL1.p, p1)
    annotation (Line(points={{-8,60},{-96,60}}, color={0,0,255}));
  connect(LCL1.n, n1)
    annotation (Line(points={{8,60},{96,60}}, color={0,0,255}));
  connect(LCL2.p, p2)
    annotation (Line(points={{-8,0},{-96,0}}, color={0,0,255}));
  connect(LCL2.n, n2) annotation (Line(points={{8,0},{96,0}}, color={0,0,255}));
  connect(LCL3.p, p3)
    annotation (Line(points={{-8,-60},{-96,-60}}, color={0,0,255}));
  connect(LCL3.n, n3)
    annotation (Line(points={{8,-60},{96,-60}}, color={0,0,255}));
  annotation (Icon(graphics={
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
          points={{50,60},{84,60},{96,60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
 Line(points={{-50,60},{-50,66},{-46,76},{-40,76},{-38,72},{-36,66},{-36,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-40,72},{-44,68},{-46,60},{-44,42},{-38,42},{-36,54},{-36,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-26,72},{-32,68},{-34,60},{-32,42},{-26,42},{-24,54},{-24,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-14,72},{-20,68},{-22,60},{-20,42},{-14,42},{-12,54},{-12,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-12,74},{-8,76},{-6,66},{-6,64},{-6,62},{-6,62},{-6,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-24,74},{-20,76},{-14,76},{-12,70},{-12,68},{-12,64},{-12,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-36,72},{-32,76},{-26,76},{-24,70},{-24,68},{-24,64},{-24,60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
        Line(
          points={{-94,60},{-50,60},{-50,60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-6,60},{6,60},{6,60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{0,28},{0,-28}},   color={0,0,255},
          origin={0,38},
          rotation=-90),
        Line(points={{0,28},{0,-28}}, color={0,0,255},
          origin={0,34},
          rotation=-90),
        Line(points={{0,60},{0,38}},  color={0,0,255}),
        Line(points={{0,34},{0,22}},color={0,0,255}),
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
          points={{50,0},{74,0},{94,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
 Line(points={{-50,0},{-50,6},{-46,16},{-40,16},{-38,12},{-36,6},{-36,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-40,12},{-44,8},{-46,0},{-44,-18},{-38,-18},{-36,-6},{-36,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-26,12},{-32,8},{-34,0},{-32,-18},{-26,-18},{-24,-6},{-24,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-14,12},{-20,8},{-22,0},{-20,-18},{-14,-18},{-12,-6},{-12,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-12,14},{-8,16},{-6,6},{-6,4},{-6,2},{-6,2},{-6,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-24,14},{-20,16},{-14,16},{-12,10},{-12,8},{-12,4},{-12,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-36,12},{-32,16},{-26,16},{-24,10},{-24,8},{-24,4},{-24,0}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
        Line(
          points={{-92,0},{-50,0},{-50,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-6,0},{6,0},{6,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{0,28},{0,-28}},   color={0,0,255},
          origin={0,-22},
          rotation=-90),
        Line(points={{0,28},{0,-28}}, color={0,0,255},
          origin={0,-26},
          rotation=-90),
        Line(points={{0,0},{0,-22}},  color={0,0,255}),
        Line(points={{0,-26},{0,-38}},
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
          points={{50,-60},{62,-60},{96,-60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
 Line(points={{-50,-60},{-50,-54},{-46,-44},{-40,-44},{-38,-48},{-36,-54},{-36,
              -60}},                                             color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-40,-48},{-44,-52},{-46,-60},{-44,-78},{-38,-78},{-36,-66},{-36,
              -60}},                                             color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-26,-48},{-32,-52},{-34,-60},{-32,-78},{-26,-78},{-24,-66},{-24,
              -60}},                                             color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-14,-48},{-20,-52},{-22,-60},{-20,-78},{-14,-78},{-12,-66},{-12,
              -60}},                                             color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-12,-46},{-8,-44},{-6,-54},{-6,-56},{-6,-58},{-6,-58},{-6,-60}},
                                                                 color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-24,-46},{-20,-44},{-14,-44},{-12,-50},{-12,-52},{-12,-56},{-12,
              -60}},                                             color={0,0,255}, smooth=
              Smooth.Bezier),
 Line(points={{-36,-48},{-32,-44},{-26,-44},{-24,-50},{-24,-52},{-24,-56},{-24,
              -60}},                                             color={0,0,255}, smooth=
              Smooth.Bezier),
        Line(
          points={{-96,-60},{-50,-60},{-50,-60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-6,-60},{6,-60},{6,-60}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{0,28},{0,-28}},   color={0,0,255},
          origin={0,-82},
          rotation=-90),
        Line(points={{0,28},{0,-28}}, color={0,0,255},
          origin={0,-86},
          rotation=-90),
        Line(points={{0,-60},{0,-82}},color={0,0,255}),
        Line(points={{0,-86},{0,-98}},
                                    color={0,0,255})}));
end ThreePhaseLCL;
