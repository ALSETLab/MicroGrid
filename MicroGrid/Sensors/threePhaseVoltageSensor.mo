within MicroGrid.Sensors;
model threePhaseVoltageSensor "Sensor to measure the each phase voltage (phase to ground) in a three-phase system"
 extends Modelica.Electrical.PowerConverters.Icons.Control;
  Electrical.Interfaces.PositivePin p1 annotation (Placement(transformation(extent={{-106,50},{-86,70}})));
  Electrical.Interfaces.PositivePin p2 annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  Electrical.Interfaces.PositivePin p3 annotation (Placement(transformation(extent={{-106,-70},{-86,-50}})));
  VoltageSensor VoltageSensor1 annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  VoltageSensor VoltageSensor2 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  VoltageSensor VoltageSensor3 annotation (Placement(transformation(extent={{50,-70},{70,-50}})));
  Electrical.BasicComponents.ground ground annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,0})));
  Interfaces.SignalBus vmeasured1 annotation (Placement(transformation(extent={{-70,-108},{-50,-88}})));
  Interfaces.SignalBus vmeasured2 annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));
  Interfaces.SignalBus vmeasured3 annotation (Placement(transformation(extent={{50,-108},{70,-88}})));
equation

  connect(VoltageSensor2.n, ground.p) annotation (Line(points={{10,0},{46,0},{46,
          4.44089e-16},{80,4.44089e-16}}, color={0,0,255}));
  connect(VoltageSensor1.n, ground.p) annotation (Line(points={{-50,60},{80,60},
          {80,4.44089e-16}}, color={0,0,255}));
  connect(VoltageSensor3.n, ground.p) annotation (Line(points={{70,-60},{80,-60},
          {80,6.66134e-16}}, color={0,0,255}));
  connect(VoltageSensor1.p, p1)
    annotation (Line(points={{-70,60},{-96,60}}, color={0,0,255}));
  connect(VoltageSensor2.p, p2)
    annotation (Line(points={{-10,0},{-96,0}}, color={0,0,255}));
  connect(VoltageSensor3.p, p3)
    annotation (Line(points={{50,-60},{-96,-60}}, color={0,0,255}));
  connect(vmeasured1, VoltageSensor1.voltSignal) annotation (Line(
      points={{-60,-98},{-60,50.65}},
      color={255,0,0},
      thickness=0.5));
  connect(vmeasured2, VoltageSensor2.voltSignal) annotation (Line(
      points={{0,-98},{0,-9.35}},
      color={255,0,0},
      thickness=0.5));
  connect(vmeasured3, VoltageSensor3.voltSignal) annotation (Line(
      points={{60,-98},{60,-69.35}},
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
end threePhaseVoltageSensor;
