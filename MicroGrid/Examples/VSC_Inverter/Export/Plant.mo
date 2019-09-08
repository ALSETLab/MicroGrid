within MicroGrid.Examples.VSC_Inverter.Export;
model Plant

  Electrical.Sources.threePhaseAC threePhaseAC
    annotation (Placement(transformation(extent={{-110,-50},{-150,-10}})));
  Electrical.Branches.Filters.ThreePhaseRL Grid(Rb=0.01, Lb=0.001)
    annotation (Placement(transformation(extent={{-90,-50},{-50,-10}})));
  Electrical.Branches.Filters.ThreePhaseRL Transformer(Rb=0.0654, Lb=0.001)
    annotation (Placement(transformation(extent={{0,-50},{40,-10}})));
  Electrical.BasicComponents.ground ground annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-180,-30})));
  Sensors.threePhaseCurrentSensor CurrentSensor
    annotation (Placement(transformation(extent={{150,-50},{110,-10}})));
  Electrical.Branches.Breakers.threePhaseBreaker Breaker
    annotation (Placement(transformation(extent={{50,-50},{90,-10}})));
  Electrical.Converters.VSC01 inverter
    annotation (Placement(transformation(extent={{170,-50},{210,-10}})));
  Electrical.BasicComponents.capacitor capacitor(v(fixed=true, start=400), C=0.002)
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={240,-30})));
  Electrical.Sources.currentDC LoadSource annotation(Placement(visible = true, transformation(origin={325,-30},   extent = {{-15, -15}, {15, 15}}, rotation = -90)));
  Sensors.VoltageSensor DC_Voltage annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={280,-30})));
equation

  connect(threePhaseAC.p1, Grid.p1)
    annotation (Line(points={{-110.8,-18},{-89.2,-18}},
                                                      color={0,0,255}));
  connect(Grid.n1, Transformer.p1)
    annotation (Line(points={{-50.8,-18},{0.8,-18}},        color={0,0,255}));
  connect(Breaker.p1, Transformer.n1) annotation (Line(points={{50.8,-18},{39.2,
          -18}},                color={0,0,255}));
  connect(CurrentSensor.n1, Breaker.n1)
    annotation (Line(points={{110.8,-18},{89.2,-18}},
                                                    color={0,0,255}));
  connect(inverter.p1, CurrentSensor.p1) annotation (Line(points={{171.491,
          -13.357},{171.491,-18},{149.2,-18}},
                                    color={0,0,255}));
  connect(inverter.vdc_p, capacitor.p) annotation (Line(points={{208.509,
          -13.668},{240,-13.668},{240,-14}},
                                  color={0,0,255}));
  connect(DC_Voltage.p, capacitor.p)
    annotation (Line(points={{280,-20},{280,-14},{240,-14}},
                                                          color={0,0,255}));
  connect(LoadSource.p, DC_Voltage.p)
    annotation (Line(points={{325,-15},{280,-15},{280,-20}},
                                                          color={0,0,255}));
  connect(Grid.p2, threePhaseAC.p2)
    annotation (Line(points={{-89.2,-30},{-110.8,-30}}, color={0,0,255}));
  connect(Transformer.p2, Grid.n2)
    annotation (Line(points={{0.8,-30},{-50.8,-30}}, color={0,0,255}));
  connect(Transformer.p3, Grid.n3) annotation (Line(points={{0.8,-42},{-50.8,
          -42},{-50.8,-42}}, color={0,0,255}));
  connect(Grid.p3, threePhaseAC.p3) annotation (Line(points={{-89.2,-42},{-100,
          -42},{-100,-42},{-110.8,-42}}, color={0,0,255}));
  connect(Breaker.p2, Transformer.n2)
    annotation (Line(points={{50.8,-30},{39.2,-30}}, color={0,0,255}));
  connect(Breaker.p3, Transformer.n3) annotation (Line(points={{50.8,-42},{39.2,
          -42},{39.2,-42}}, color={0,0,255}));
  connect(CurrentSensor.n2, Breaker.n2)
    annotation (Line(points={{110.8,-30},{89.2,-30}}, color={0,0,255}));
  connect(CurrentSensor.n3, Breaker.n3) annotation (Line(points={{110.8,-42},{
          89.2,-42},{89.2,-42}}, color={0,0,255}));
  connect(inverter.p2, CurrentSensor.p2) annotation (Line(points={{170.868,
          -29.689},{149.2,-29.689},{149.2,-30}}, color={0,0,255}));
  connect(inverter.p3, CurrentSensor.p3) annotation (Line(points={{170.791,-46},
          {149.2,-46},{149.2,-42}}, color={0,0,255}));
  connect(inverter.vdc_n, capacitor.n) annotation (Line(points={{208.587,
          -46.643},{208.587,-46},{240,-46}}, color={0,0,255}));
  connect(DC_Voltage.n, capacitor.n)
    annotation (Line(points={{280,-40},{280,-46},{240,-46}}, color={0,0,255}));
  connect(LoadSource.n, DC_Voltage.n)
    annotation (Line(points={{325,-45},{280,-45},{280,-40}}, color={0,0,255}));
annotation(Diagram(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end Plant;
