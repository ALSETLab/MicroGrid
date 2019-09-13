within MicroGrid.Examples.VSC_Inverter.Export;
model Plant

  Electrical.Sources.threePhaseAC threePhaseAC
    annotation (Placement(transformation(extent={{-110,-30},{-150,10}})));
  Electrical.Branches.Filters.ThreePhaseRL Grid(Rb=0.01, Lb=0.001)
    annotation (Placement(transformation(extent={{-90,-30},{-50,10}})));
  Electrical.Branches.Filters.ThreePhaseRL Transformer(Rb=0.0654, Lb=0.001)
    annotation (Placement(transformation(extent={{0,-30},{40,10}})));
  Electrical.BasicComponents.ground ground annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-180,-10})));
  Sensors.threePhaseCurrentSensor CurrentSensor
    annotation (Placement(transformation(extent={{150,-30},{110,10}})));
  Electrical.Branches.Breakers.threePhaseBreaker Breaker
    annotation (Placement(transformation(extent={{50,-30},{90,10}})));
  Electrical.Converters.VSC01 inverter
    annotation (Placement(transformation(extent={{170,-30},{210,10}})));
  Electrical.BasicComponents.capacitor capacitor(v(fixed=true, start=400), C=0.002)
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={240,-10})));
  Electrical.Sources.currentDC LoadSource annotation(Placement(visible = true, transformation(origin={325,-10},   extent={{-15,15},
            {15,-15}},                                                                                                                             rotation = -90)));
  Sensors.VoltageSensor DC_Voltage annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={280,-10})));
  Sensors.threePhaseVoltageSensor VoltageSensor annotation (Placement(
        transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-20,-60})));
  Sensors.Interfaces.Sensor2Real sensor2Real
    annotation (Placement(transformation(extent={{280,-60},{300,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vdc
    annotation (Placement(transformation(extent={{360,60},{380,80}})));
  Modelica.Blocks.Interfaces.RealOutput imeas3 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={370,-200})));
  Modelica.Blocks.Interfaces.RealOutput imeas2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={370,-100})));
  Modelica.Blocks.Interfaces.RealOutput imeas1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={370,-20})));
  Sensors.Interfaces.Sensor2Real sensor2Real1
    annotation (Placement(transformation(extent={{320,-90},{340,-70}})));
  Sensors.Interfaces.Sensor2Real sensor2Real2
    annotation (Placement(transformation(extent={{320,-110},{340,-90}})));
  Sensors.Interfaces.Sensor2Real sensor2Real3
    annotation (Placement(transformation(extent={{320,-130},{340,-110}})));
  Modelica.Blocks.Interfaces.RealOutput vmeas1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={200,-270})));
  Modelica.Blocks.Interfaces.RealOutput vmeas2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,-270})));
  Modelica.Blocks.Interfaces.RealOutput vmeas3 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-270})));
  Sensors.Interfaces.Sensor2Real sensor2Real4 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,-90})));
  Sensors.Interfaces.Sensor2Real sensor2Real5 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-90})));
  Sensors.Interfaces.Sensor2Real sensor2Real6 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,-90})));
  Modelica.Blocks.Interfaces.RealInput m1
    annotation (Placement(transformation(extent={{-220,30},{-180,70}})));
  Modelica.Blocks.Interfaces.RealInput m2
    annotation (Placement(transformation(extent={{-220,-70},{-180,-30}})));
  Modelica.Blocks.Interfaces.RealInput m3
    annotation (Placement(transformation(extent={{-220,-170},{-180,-130}})));
  Control.Interfaces.Real2Control real2Control
    annotation (Placement(transformation(extent={{-70,-140},{-50,-120}})));
  Control.Interfaces.Real2Control real2Control1
    annotation (Placement(transformation(extent={{-70,-150},{-50,-130}})));
  Control.Interfaces.Real2Control real2Control2
    annotation (Placement(transformation(extent={{-70,-160},{-50,-140}})));
  Modelica.Blocks.Interfaces.RealInput loadCurve annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={90,120})));
equation

  connect(threePhaseAC.p1, Grid.p1)
    annotation (Line(points={{-110.8,2},{-89.2,2}},   color={0,0,255}));
  connect(Grid.n1, Transformer.p1)
    annotation (Line(points={{-50.8,2},{0.8,2}},            color={0,0,255}));
  connect(Breaker.p1, Transformer.n1) annotation (Line(points={{50.8,2},{39.2,2}},
                                color={0,0,255}));
  connect(CurrentSensor.n1, Breaker.n1)
    annotation (Line(points={{110.8,2},{89.2,2}},   color={0,0,255}));
  connect(inverter.p1, CurrentSensor.p1) annotation (Line(points={{171.491,
          6.643},{171.491,2},{149.2,2}},
                                    color={0,0,255}));
  connect(inverter.vdc_p, capacitor.p) annotation (Line(points={{208.509,6.332},
          {240,6.332},{240,6}},   color={0,0,255}));
  connect(DC_Voltage.p, capacitor.p)
    annotation (Line(points={{280,0},{280,6},{240,6}},    color={0,0,255}));
  connect(LoadSource.p, DC_Voltage.p)
    annotation (Line(points={{325,5},{280,5},{280,0}},    color={0,0,255}));
  connect(Grid.p2, threePhaseAC.p2)
    annotation (Line(points={{-89.2,-10},{-110.8,-10}}, color={0,0,255}));
  connect(Transformer.p2, Grid.n2)
    annotation (Line(points={{0.8,-10},{-50.8,-10}}, color={0,0,255}));
  connect(Transformer.p3, Grid.n3) annotation (Line(points={{0.8,-22},{-50.8,-22}},
                             color={0,0,255}));
  connect(Grid.p3, threePhaseAC.p3) annotation (Line(points={{-89.2,-22},{-110.8,
          -22}},                         color={0,0,255}));
  connect(Breaker.p2, Transformer.n2)
    annotation (Line(points={{50.8,-10},{39.2,-10}}, color={0,0,255}));
  connect(Breaker.p3, Transformer.n3) annotation (Line(points={{50.8,-22},{39.2,
          -22}},            color={0,0,255}));
  connect(CurrentSensor.n2, Breaker.n2)
    annotation (Line(points={{110.8,-10},{89.2,-10}}, color={0,0,255}));
  connect(CurrentSensor.n3, Breaker.n3) annotation (Line(points={{110.8,-22},{89.2,
          -22}},                 color={0,0,255}));
  connect(inverter.p2, CurrentSensor.p2) annotation (Line(points={{170.868,
          -9.689},{149.2,-9.689},{149.2,-10}},   color={0,0,255}));
  connect(inverter.p3, CurrentSensor.p3) annotation (Line(points={{170.791,-26},
          {149.2,-26},{149.2,-22}}, color={0,0,255}));
  connect(inverter.vdc_n, capacitor.n) annotation (Line(points={{208.587,
          -26.643},{208.587,-26},{240,-26}}, color={0,0,255}));
  connect(DC_Voltage.n, capacitor.n)
    annotation (Line(points={{280,-20},{280,-26},{240,-26}}, color={0,0,255}));
  connect(LoadSource.n, DC_Voltage.n)
    annotation (Line(points={{325,-25},{280,-25},{280,-20}}, color={0,0,255}));
  connect(Grid.n1, VoltageSensor.p1)
    annotation (Line(points={{-50.8,2},{-32,2},{-32,-40.8}}, color={0,0,255}));
  connect(Grid.n2, VoltageSensor.p2) annotation (Line(points={{-50.8,-10},{-20,-10},
          {-20,-40.8}}, color={0,0,255}));
  connect(Grid.n3, VoltageSensor.p3) annotation (Line(points={{-50.8,-22},{-8,-22},
          {-8,-40.8}}, color={0,0,255}));
  connect(sensor2Real.OutputReal, vdc) annotation (Line(points={{300,-50},{340,
          -50},{340,70},{370,70}},
                                color={0,0,127}));
  connect(sensor2Real.InputSignal, DC_Voltage.voltSignal) annotation (Line(
      points={{280.9,-50.1},{260,-50.1},{260,-10},{270.65,-10}},
      color={255,0,0},
      thickness=0.5));
  connect(threePhaseAC.gnd, ground.p)
    annotation (Line(points={{-149.2,-10},{-160,-10}}, color={0,0,255}));
  connect(imeas1, sensor2Real1.OutputReal) annotation (Line(points={{370,-20},{
          350,-20},{350,-80},{340,-80}},
                                   color={0,0,127}));
  connect(imeas2, sensor2Real2.OutputReal)
    annotation (Line(points={{370,-100},{340,-100}}, color={0,0,127}));
  connect(imeas3, sensor2Real3.OutputReal) annotation (Line(points={{370,-200},{
          350,-200},{350,-120},{340,-120}}, color={0,0,127}));
  connect(sensor2Real1.InputSignal, CurrentSensor.imeasured1) annotation (Line(
      points={{320.9,-80.1},{320.9,-80},{142,-80},{142,-29.6}},
      color={255,0,0},
      thickness=0.5));
  connect(sensor2Real2.InputSignal, CurrentSensor.imeasured2) annotation (Line(
      points={{320.9,-100.1},{130,-100.1},{130,-29.6}},
      color={255,0,0},
      thickness=0.5));
  connect(sensor2Real3.InputSignal, CurrentSensor.imeasured3) annotation (Line(
      points={{320.9,-120.1},{320.9,-120},{118,-120},{118,-29.6}},
      color={255,0,0},
      thickness=0.5));
  connect(VoltageSensor.vmeasured1, sensor2Real6.InputSignal) annotation (Line(
      points={{-0.4,-48},{69.9,-48},{69.9,-80.9}},
      color={255,0,0},
      thickness=0.5));
  connect(VoltageSensor.vmeasured2, sensor2Real5.InputSignal) annotation (Line(
      points={{-0.4,-60},{49.9,-60},{49.9,-80.9}},
      color={255,0,0},
      thickness=0.5));
  connect(VoltageSensor.vmeasured3, sensor2Real4.InputSignal) annotation (Line(
      points={{-0.4,-72},{29.9,-72},{29.9,-80.9}},
      color={255,0,0},
      thickness=0.5));
  connect(real2Control.InputReal, m1) annotation (Line(points={{-69,-130},{-130,
          -130},{-130,50},{-200,50}}, color={0,0,127}));
  connect(real2Control1.InputReal, m2) annotation (Line(points={{-69,-140},{-160,
          -140},{-160,-50},{-200,-50}}, color={0,0,127}));
  connect(real2Control2.InputReal, m3)
    annotation (Line(points={{-69,-150},{-200,-150}}, color={0,0,127}));
  connect(real2Control.OutputSignal, inverter.switching1) annotation (Line(
      points={{-50.5,-129.9},{180,-129.9},{180,-29.2872}},
      color={0,128,0},
      thickness=0.5));
  connect(real2Control1.OutputSignal, inverter.switching2) annotation (Line(
      points={{-50.5,-139.9},{190,-139.9},{190,-29.365}},
      color={0,128,0},
      thickness=0.5));
  connect(real2Control2.OutputSignal, inverter.switching3) annotation (Line(
      points={{-50.5,-149.9},{200.421,-149.9},{200.421,-29.5982}},
      color={0,128,0},
      thickness=0.5));
  connect(vmeas1, sensor2Real6.OutputReal) annotation (Line(points={{200,-270},{
          200,-200},{70,-200},{70,-100}}, color={0,0,127}));
  connect(vmeas2, sensor2Real5.OutputReal) annotation (Line(points={{100,-270},{
          100,-230},{50,-230},{50,-100}}, color={0,0,127}));
  connect(vmeas3, sensor2Real4.OutputReal) annotation (Line(points={{0,-270},{0,
          -230},{30,-230},{30,-100}}, color={0,0,127}));
  connect(LoadSource.i, loadCurve) annotation (Line(points={{314.5,-10},{300,
          -10},{300,80},{90,80},{90,120}}, color={0,0,127}));
annotation(Diagram(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),Icon(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end Plant;
