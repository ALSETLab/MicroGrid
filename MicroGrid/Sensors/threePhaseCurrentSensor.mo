within MicroGrid.Sensors;
model threePhaseCurrentSensor "Sensor to measure the each phase current in a three-phase system"
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  Electrical.Interfaces.PositivePin p1 annotation (Placement(transformation(extent={{-106,50},{-86,70}})));
  Electrical.Interfaces.PositivePin p2 annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  Electrical.Interfaces.PositivePin p3 annotation (Placement(transformation(extent={{-106,-70},{-86,-50}})));
  Electrical.Interfaces.NegativePin n1 annotation (Placement(transformation(extent={{86,50},{106,70}})));
  Electrical.Interfaces.NegativePin n2 annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Electrical.Interfaces.NegativePin n3 annotation (Placement(transformation(extent={{86,-70},{106,-50}})));
  CurrentSensor CurrentSensor1 annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  CurrentSensor CurrentSensor2 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  CurrentSensor CurrentSensor3 annotation (Placement(transformation(extent={{50,-70},{70,-50}})));
  Interfaces.SignalBus imeasured1 annotation (Placement(transformation(extent={{-70,-108},{-50,-88}})));
  Interfaces.SignalBus imeasured2 annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));
  Interfaces.SignalBus imeasured3 annotation (Placement(transformation(extent={{50,-108},{70,-88}})));
equation

  connect(CurrentSensor1.p, p1) annotation (Line(points={{-70,60},{-96,60}}, color={0,0,255}));
  connect(CurrentSensor1.n, n1) annotation (Line(points={{-50,60},{96,60},{96,60}}, color={0,0,255}));
  connect(CurrentSensor2.p, p2) annotation (Line(points={{-10,0},{-96,0}}, color={0,0,255}));
  connect(CurrentSensor2.n, n2) annotation (Line(points={{10,0},{96,0}}, color={0,0,255}));
  connect(CurrentSensor3.p, p3) annotation (Line(points={{50,-60},{-96,-60},{-96,-60}}, color={0,0,255}));
  connect(CurrentSensor3.n, n3) annotation (Line(points={{70,-60},{96,-60}}, color={0,0,255}));
  connect(CurrentSensor1.currSignal, imeasured1) annotation (Line(
      points={{-59.9,50.65},{-59.9,-98},{-60,-98}},
      color={255,0,0},
      thickness=0.5));
  connect(CurrentSensor2.currSignal, imeasured2) annotation (Line(
      points={{0.1,-9.35},{0.1,-98},{0,-98},{0,-98}},
      color={255,0,0},
      thickness=0.5));
  connect(CurrentSensor3.currSignal, imeasured3) annotation (Line(
      points={{60.1,-69.35},{60.1,-98},{60,-98},{60,-98}},
      color={255,0,0},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Ellipse(origin={0.0,-30.0},
          fillColor={255,255,255},
          extent={{-90.0,-90.0},{90.0,90.0}},
          startAngle=20.0,
          endAngle=160.0),
        Ellipse(origin={0.0,-30.0},
          fillColor={128,128,128},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-20.0,-20.0},{20.0,20.0}}),
        Line(origin={0.0,-30.0},
          points={{0.0,60.0},{0.0,90.0}}),
        Ellipse(origin={-0.0,-30.0},
          fillColor={64,64,64},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-10.0,-10.0},{10.0,10.0}}),
        Polygon(
          origin={-0.0,-30.0},
          rotation=-35.0,
          fillColor={64,64,64},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-7.0,0.0},{-3.0,85.0},{0.0,90.0},{3.0,85.0},{7.0,0.0}}),
        Text(
          extent={{-72,105},{68,80}},
          textString="%name",
          lineColor={0,0,255})}));
end threePhaseCurrentSensor;
