within MicroGrid.Electrical.Examples;
model Boost_Example
  extends Modelica.Icons.Example;
  MicroGrid.Electrical.Sources.voltageDC voltageDC(V=1.5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-68,10})));
  MicroGrid.Electrical.BasicComponents.ground ground
    annotation (Placement(transformation(extent={{-78,-34},{-58,-14}})));
  MicroGrid.Electrical.BasicComponents.capacitor OutputCapacitor(C=0.00047, v(
        fixed=true)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={14,10})));
  MicroGrid.Electrical.BasicComponents.resistor LoadResistor(R=75) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,10})));
  MicroGrid.Electrical.Converters.SwitchedBoost switchedBoost(
    L_boost=0.0001,
    f_s=50000,
    Vdrop=1E-5,
    r_diode=1E-5,
    g_diode=1E-5,
    r_switch=1E-5,
    g_switch=1E-5)
    annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
  Modelica.Blocks.Sources.Constant DutyRatioValue(k=0.75)
    annotation (Placement(transformation(extent={{54,-46},{34,-26}})));
  MicroGrid.Control.Interfaces.Real2Control real2Control
    annotation (Placement(transformation(extent={{20,-46},{0,-26}})));
  MicroGrid.Sensors.currentSensor currentSensor
    annotation (Placement(transformation(extent={{-56,28},{-36,8}})));
  MicroGrid.Sensors.voltageSensor voltageSensor annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={74,10})));
equation
  connect(voltageDC.n, ground.p)
    annotation (Line(points={{-68,2},{-68,-14}}, color={0,0,255}));
  connect(voltageDC.n, switchedBoost.Input_n)
    annotation (Line(points={{-68,2},{-27.6,2}}, color={0,0,255}));
  connect(switchedBoost.Output_p, OutputCapacitor.p)
    annotation (Line(points={{-8.4,18},{14,18}}, color={0,0,255}));
  connect(switchedBoost.Output_n, OutputCapacitor.n)
    annotation (Line(points={{-8.4,2},{14,2}}, color={0,0,255}));
  connect(OutputCapacitor.p, LoadResistor.p)
    annotation (Line(points={{14,18},{40,18}}, color={0,0,255}));
  connect(OutputCapacitor.n, LoadResistor.n)
    annotation (Line(points={{14,2},{40,2}}, color={0,0,255}));
  connect(real2Control.InputReal, DutyRatioValue.y)
    annotation (Line(points={{19,-36},{33,-36}}, color={0,0,127}));
  connect(real2Control.OutputSignal, switchedBoost.DutyRatio) annotation (Line(
      points={{0.4,-36},{-18,-36},{-18,0.3}},
      color={0,128,0},
      thickness=0.5));
  connect(voltageDC.p, currentSensor.p)
    annotation (Line(points={{-68,18},{-56,18}}, color={0,0,255}));
  connect(currentSensor.n, switchedBoost.Input_p)
    annotation (Line(points={{-36,18},{-27.6,18}}, color={0,0,255}));
  connect(LoadResistor.p, voltageSensor.p)
    annotation (Line(points={{40,18},{40,20},{74,20}}, color={0,0,255}));
  connect(voltageSensor.n, LoadResistor.n)
    annotation (Line(points={{74,0},{40,0},{40,2}}, color={0,0,255}));
  annotation ();
end Boost_Example;
