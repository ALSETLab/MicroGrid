within MicroGrid.Sensors;
model voltageSensor "Sensor to measure the voltage difference between two pins"
  extends Modelica.Icons.RotationalSensor;
  MicroGrid.Electrical.Interfaces.PositivePin p "positive pin" annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  MicroGrid.Electrical.Interfaces.NegativePin n "negative pin" annotation (Placement(
        transformation(extent={{90,-10},{110,10}})));
  MicroGrid.Sensors.Interfaces.SignalBus v(unit="V")
    "Voltage between pin p and n (= p.v - n.v) as output signal"
     annotation (Placement(transformation(
        origin={0,-95},
        extent={{10,-10},{-10,10}},
        rotation=0)));
equation
  p.i = 0;
  n.i = 0;
  v = p.v - n.v;
  annotation(
  Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-29,-11},{30,-70}},
          lineColor={0,0,0},
          textString="V"),
        Line(points={{-70,0},{-90,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Line(points={{0,-90},{0,-70}}, color={0,0,127}),
        Text(
          extent={{-150,80},{150,120}},
          textString="%name",
          lineColor={0,0,255})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-70,0},{-96,0}}),
        Line(points={{70,0},{96,0}}),
        Line(points={{0,-90},{0,-70}}, color={0,0,255})})
  );
end voltageSensor;