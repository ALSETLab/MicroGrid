within MicroGrid.Examples.VSC_Inverter;
model System
 extends Modelica.Icons.Example;

  Electrical.Sources.threePhaseAC threePhaseAC
    annotation (Placement(transformation(extent={{-110,10},{-150,50}})));
  Electrical.Branches.Filters.ThreePhaseRL Grid(Rb=0.01, Lb=0.001)
    annotation (Placement(transformation(extent={{-90,10},{-50,50}})));
  Electrical.Branches.Filters.ThreePhaseRL Transformer(Rb=0.0654, Lb=0.001)
    annotation (Placement(transformation(extent={{0,10},{40,50}})));
  Electrical.BasicComponents.ground ground annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-180,30})));
  Sensors.threePhaseVoltageSensor VoltageSensor annotation (Placement(
        transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-30,-50})));
  Sensors.threePhaseCurrentSensor CurrentSensor
    annotation (Placement(transformation(extent={{150,10},{110,50}})));
  Electrical.Branches.Breakers.threePhaseBreaker Breaker
    annotation (Placement(transformation(extent={{50,10},{90,50}})));
  Electrical.Converters.VSC01 inverter
    annotation (Placement(transformation(extent={{170,10},{210,50}})));
  Control.PhaseLockedLoop.DSOGI_PLL dSOGI_PLL1 annotation(Placement(visible = true, transformation(origin={53.1255,
            -48.749},                                                                                                        extent={{
            -23.1255,-21.251},{23.1255,21.251}},                                                                                                                              rotation = 0)));
  Control.Interfaces.abc2dq abc2dq1 annotation(Placement(visible = true, transformation(origin={130,
            -23.352},                                                                                           extent={{15,15},
            {-15,-15}},                                                                                                                          rotation = 90)));
  Control.Feedback.StateFeedback stateFeedback1(
    Kd_id=0.07892,
    Kq_id=-0.003071,
    Kd_iq=0.00202,
    Kq_iq=0.056939,
    Kd_vdc=-0.113977,
    Kq_vdc=-0.001361,
    Kd_int_iq=0.328665,
    Kq_int_iq=-10.7532,
    Kd_int_vdc=16.8255,
    Kq_int_vdc=0.152513,
    add2(k2=-1),
    add1(k1=-1))                                                                                                                                                                                        annotation(Placement(visible = true, transformation(origin={188.343,
            -50},                                                                                                                                                                                                        extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Electrical.BasicComponents.capacitor capacitor(v(fixed=true, start=400), C=
        0.002) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={240,30})));
  Electrical.Sources.currentDC LoadSource annotation(Placement(visible = true, transformation(origin={325,30},    extent = {{-15, -15}, {15, 15}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp LoadSignal(
    height=150,
    duration=0.1,
    offset=0.0,
    startTime=0.2) annotation (Placement(visible=true, transformation(
        origin={245,-100},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  Sensors.VoltageSensor DC_Voltage annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={280,30})));
  Modelica.Blocks.Sources.Step step(height=-75, startTime=0.1)
    annotation (Placement(transformation(extent={{230,-60},{260,-30}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{310,-80},{340,-50}})));
equation

  connect(threePhaseAC.p1, Grid.p1)
    annotation (Line(points={{-110.8,42},{-89.2,42}}, color={0,0,255}));
  connect(threePhaseAC.p2, Grid.p2)
    annotation (Line(points={{-110.8,30},{-89.2,30}}, color={0,0,255}));
  connect(threePhaseAC.p3, Grid.p3)
    annotation (Line(points={{-110.8,18},{-89.2,18}}, color={0,0,255}));
  connect(Grid.n1, Transformer.p1)
    annotation (Line(points={{-50.8,42},{0.8,42},{0.8,42}}, color={0,0,255}));
  connect(Grid.n2, Transformer.p2)
    annotation (Line(points={{-50.8,30},{0.8,30}}, color={0,0,255}));
  connect(Grid.n3, Transformer.p3)
    annotation (Line(points={{-50.8,18},{0.8,18},{0.8,18}}, color={0,0,255}));
  connect(threePhaseAC.gnd, ground.p)
    annotation (Line(points={{-149.2,30},{-160,30}}, color={0,0,255}));
  connect(Breaker.p1, Transformer.n1) annotation (Line(points={{50.8,42},{45.4,
          42},{45.4,42},{39.2,42}}, color={0,0,255}));
  connect(Breaker.p2, Transformer.n2)
    annotation (Line(points={{50.8,30},{39.2,30}}, color={0,0,255}));
  connect(Breaker.p3, Transformer.n3)
    annotation (Line(points={{50.8,18},{50.8,18},{39.2,18}}, color={0,0,255}));
  connect(CurrentSensor.n1, Breaker.n1)
    annotation (Line(points={{110.8,42},{89.2,42}}, color={0,0,255}));
  connect(CurrentSensor.n2, Breaker.n2)
    annotation (Line(points={{110.8,30},{89.2,30}}, color={0,0,255}));
  connect(CurrentSensor.n3, Breaker.n3)
    annotation (Line(points={{110.8,18},{89.2,18}}, color={0,0,255}));
  connect(VoltageSensor.p1, Grid.n1) annotation (Line(points={{-42,-30.8},{-40,
          -30.8},{-40,42},{-50.8,42}}, color={0,0,255}));
  connect(VoltageSensor.p2, Grid.n2) annotation (Line(points={{-30,-30.8},{-30,
          30},{-50.8,30}}, color={0,0,255}));
  connect(VoltageSensor.p3, Grid.n3) annotation (Line(points={{-18,-30.8},{-18,
          18},{-50.8,18}}, color={0,0,255}));
  connect(inverter.p1, CurrentSensor.p1) annotation (Line(points={{171.491,
          46.643},{171.491,42},{149.2,42}}, color={0,0,255}));
  connect(inverter.p2, CurrentSensor.p2) annotation (Line(points={{170.868,
          30.311},{149.2,30.311},{149.2,30}}, color={0,0,255}));
  connect(inverter.p3, CurrentSensor.p3) annotation (Line(points={{170.791,14},
          {170,14},{170,18},{149.2,18}}, color={0,0,255}));
  connect(dSOGI_PLL1.vA, VoltageSensor.vmeasured1) annotation (Line(
      points={{31.4227,-35.1892},{-10.4,-35.1892},{-10.4,-38}},
      color={255,0,0},
      thickness=0.5));
  connect(dSOGI_PLL1.vB, VoltageSensor.vmeasured2) annotation (Line(
      points={{31.5499,-49.4571},{-10.4,-49.4571},{-10.4,-50}},
      color={255,0,0},
      thickness=0.5));
  connect(dSOGI_PLL1.vC, VoltageSensor.vmeasured3) annotation (Line(
      points={{31.4176,-63.6247},{-10.4,-63.6247},{-10.4,-62}},
      color={255,0,0},
      thickness=0.5));
  connect(dSOGI_PLL1.Delta, stateFeedback1.Delta) annotation (Line(
      points={{74.8091,-63.6247},{74.8091,-65.0346},{169.378,-65.0346}},
      color={0,128,0},
      thickness=0.5));
  connect(CurrentSensor.imeasured3, abc2dq1.v_C) annotation (Line(
      points={{118,10.4},{119.5,10.4},{119.5,-9.4755}},
      color={255,0,0},
      thickness=0.5));
  connect(CurrentSensor.imeasured2, abc2dq1.v_B) annotation (Line(
      points={{130,10.4},{130,0},{130,-9.4755},{129.542,-9.4755}},
      color={255,0,0},
      thickness=0.5));
  connect(abc2dq1.v_A, CurrentSensor.imeasured1) annotation (Line(
      points={{139.708,-9.4755},{139.708,-10},{142,-10},{142,10.4}},
      color={255,0,0},
      thickness=0.5));
  connect(stateFeedback1.i_d, abc2dq1.v_d) annotation (Line(
      points={{169.343,-45},{136,-45},{136,-37.2017}},
      color={0,128,0},
      thickness=0.5));
  connect(stateFeedback1.i_q, abc2dq1.v_q) annotation (Line(
      points={{169.343,-55},{124,-55},{124,-37.0779}},
      color={0,128,0},
      thickness=0.5));
  connect(abc2dq1.Delta, dSOGI_PLL1.Delta) annotation (Line(
      points={{115.774,-23.352},{100,-23.352},{100,-63.6247},{74.8091,-63.6247}},
      color={0,128,0},
      thickness=0.5));

  connect(stateFeedback1.switching3, inverter.switching3) annotation (Line(
      points={{197.343,-31},{197.343,-20},{200.421,-20},{200.421,10.4018}},
      color={0,128,0},
      thickness=0.5));
  connect(stateFeedback1.switching2, inverter.switching2) annotation (Line(
      points={{188.03,-31},{188.03,10.635},{190,10.635}},
      color={0,128,0},
      thickness=0.5));
  connect(stateFeedback1.switching1, inverter.switching1) annotation (Line(
      points={{178.343,-31},{178.343,10.7128},{180,10.7128}},
      color={0,128,0},
      thickness=0.5));
  connect(inverter.vdc_p, capacitor.p) annotation (Line(points={{208.509,46.332},
          {240,46.332},{240,46}}, color={0,0,255}));
  connect(inverter.vdc_n, capacitor.n) annotation (Line(points={{208.587,13.357},
          {240,13.357},{240,14}}, color={0,0,255}));
  connect(DC_Voltage.p, capacitor.p)
    annotation (Line(points={{280,40},{280,46},{240,46}}, color={0,0,255}));
  connect(DC_Voltage.n, capacitor.n)
    annotation (Line(points={{280,20},{280,14},{240,14}}, color={0,0,255}));
  connect(LoadSource.p, DC_Voltage.p)
    annotation (Line(points={{325,45},{280,45},{280,40}}, color={0,0,255}));
  connect(LoadSource.n, capacitor.n) annotation (Line(points={{325,15},{280,15},
          {280,14},{240,14}}, color={0,0,255}));
  connect(DC_Voltage.voltSignal, stateFeedback1.v_dc) annotation (Line(
      points={{270.65,30},{260,30},{260,0},{160,0},{160,-35},{169.343,-35}},
      color={255,0,0},
      thickness=0.5));
  connect(LoadSignal.y, add.u2) annotation (Line(points={{261.5,-100},{270,-100},
          {270,-74},{307,-74}}, color={0,0,127}));
  connect(add.u1, step.y) annotation (Line(points={{307,-56},{270,-56},{270,-45},
          {261.5,-45}}, color={0,0,127}));
  connect(LoadSource.i, add.y) annotation (Line(points={{335.5,30},{350,30},{
          350,-65},{341.5,-65}}, color={0,0,127}));
annotation(Diagram(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
      experiment(
      StopTime=0.4,
      __Dymola_NumberOfIntervals=10000,
      __Dymola_fixedstepsize=1e-06,
      __Dymola_Algorithm="Dassl"));
end System;
