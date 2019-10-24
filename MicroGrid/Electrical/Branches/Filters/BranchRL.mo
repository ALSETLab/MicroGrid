within MicroGrid.Electrical.Branches.Filters;
model BranchRL "Branch with resistor and reactor connected in series."
  Interfaces.PositivePin p annotation(Placement(transformation(extent={{-90,-10},
            {-70,10}})));
  Interfaces.NegativePin n annotation (Placement(transformation(extent={{70,-10},
            {90,10}})));
  parameter Modelica.SIunits.Resistance R = 0.1 "Branch resistance";
  parameter Modelica.SIunits.Inductance L = 0.1 "Branch inductance";
  BasicComponents.resistor resistor(R = R) annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  BasicComponents.inductor inductor(i(fixed=true),
                                    L = L) annotation (Placement(transformation(extent={{10,-10},{30,10}})));
equation

  connect(p, resistor.p)
    annotation (Line(points={{-80,0},{-28,0}}, color={0,0,255}));
  connect(resistor.n, inductor.p)
    annotation (Line(points={{-12,0},{12,0}}, color={0,0,255}));
  connect(n, inductor.n)
    annotation (Line(points={{80,0},{28,0}}, color={0,0,255}));
  annotation (Icon(graphics={
        Line(points={{-78,0},{-44,0},{-40,20},{-30,-20}}, color={0,0,255}),
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
          points={{50,0},{72,0},{70,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Text(
          extent={{-152,79},{148,39}},
          textString="%name",
          lineColor={0,0,255})}));
end BranchRL;
