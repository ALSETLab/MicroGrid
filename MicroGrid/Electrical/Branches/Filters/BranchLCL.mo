within MicroGrid.Electrical.Branches.Filters;
model BranchLCL "Branch with two RL branches connected in series and a capacitor between them connected to ground."
  Interfaces.PositivePin p annotation(Placement(transformation(extent={{-90,-10},
            {-70,10}})));
  Interfaces.NegativePin n annotation (Placement(transformation(extent={{70,-10},
            {90,10}})));
  parameter Modelica.SIunits.Resistance R1 = 0.1 "Left-side resistance";
  parameter Modelica.SIunits.Inductance L1 = 0.1 "Left-side inductance";
  parameter Modelica.SIunits.Resistance R2 = 0.1 "Right-side resistance";
  parameter Modelica.SIunits.Inductance L2 = 0.1 "Right-side inductance";
  parameter Modelica.SIunits.Capacitance C = 0.001 "Branch capacitance";
  BasicComponents.resistor resistor1(R=R1) annotation (Placement(transformation(extent={{-66,-10},
            {-46,10}})));
  BasicComponents.inductor inductor1(i(fixed=true),
                                     L=L1) annotation (Placement(transformation(extent={{-38,-10},
            {-18,10}})));
  BasicComponents.resistor resistor2(R=R2)  annotation (Placement(transformation(extent={{18,-10},
            {38,10}})));
  BasicComponents.inductor inductor2(i(fixed=true),
                                     L=L2)  annotation (Placement(transformation(extent={{46,-10},
            {66,10}})));
  BasicComponents.capacitor capacitor(v(fixed=true),
                                      C=C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-18})));
  BasicComponents.ground ground
    annotation (Placement(transformation(extent={{-10,-64},{10,-44}})));
equation

  connect(capacitor.n, ground.p) annotation (Line(points={{-1.4988e-15,-26},{0,-26},
          {0,-44}}, color={0,0,255}));

  connect(resistor1.p, p) annotation (Line(
      points={{-64,0},{-80,0}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(resistor1.n, inductor1.p) annotation (Line(
      points={{-48,0},{-42,0},{-36,0}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(resistor2.n, inductor2.p) annotation (Line(
      points={{36,0},{42,0},{48,0}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(inductor2.n, n) annotation (Line(
      points={{64,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(capacitor.p, resistor2.p) annotation (Line(
      points={{0,-10},{0,0},{20,0}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  annotation (Icon(graphics={
        Text(
          extent={{-152,79},{148,39}},
          textString="%name",
          lineColor={0,0,255}),
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
          points={{50,0},{72,0},{70,0}},
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
          points={{-72,0},{-50,0},{-50,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-6,0},{6,0},{6,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{0,28},{0,-28}},   color={0,0,255},
          origin={0,-32},
          rotation=-90),
        Line(points={{0,28},{0,-28}}, color={0,0,255},
          origin={0,-40},
          rotation=-90),
        Line(points={{0,0},{0,-32}},  color={0,0,255}),
        Line(points={{0,-40},{0,-76}},
                                    color={0,0,255})}));
end BranchLCL;
