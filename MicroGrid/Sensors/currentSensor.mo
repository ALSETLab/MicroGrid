within MicroGrid.Sensors;
model currentSensor "Sensor to measure the current flowing between two pins"
  extends Modelica.Icons.RotationalSensor;
  MicroGrid.Electrical.Interfaces.PositivePin p "positive pin" annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  MicroGrid.Electrical.Interfaces.NegativePin n "negative pin" annotation (Placement(
        transformation(extent={{90,-10},{110,10}})));
  MicroGrid.Sensors.Interfaces.SignalBus i(unit="A")
    "Current in the branch from p to n as output signal"
     annotation (Placement(transformation(
        origin={0,-95},
        extent={{10,-10},{-10,10}},
        rotation=0)));
equation
  p.v = n.v;
  p.i = i;
  n.i = -i;
  annotation(
  Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-29,-11},{30,-70}},
          lineColor={0,0,0},
          textString="A"),
        Line(points={{-70,0},{-90,0}}, color={0,0,255}),
        Text(
          extent={{-150,80},{150,120}},
          textString="%name",
          lineColor={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Line(points={{0,-90},{0,-70}}, color={0,0,127})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-153,79},{147,119}},
          textString="%name",
          lineColor={0,0,255}),
        Line(points={{-70,0},{-96,0}}),
        Line(points={{70,0},{96,0}}),
        Line(points={{0,-90},{0,-70}}, color={0,0,255})}));
end currentSensor;