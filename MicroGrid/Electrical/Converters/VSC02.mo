within MicroGrid.Electrical.Converters;
model VSC02
  "AC/DC Averaged Voltage Sourced Converter with sinusoidal PWM switching pattern."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  Interfaces.PositivePin vdc_p annotation(Placement(visible = true, transformation(origin = {96.047, 85.548}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92.547, 81.66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NegativePin vdc_n annotation(Placement(visible = true, transformation(origin = {96.047, -85.159}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92.936, -83.215}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PositivePin p1 annotation(Placement(visible = true, transformation(origin = {-96.047, 85.548}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92.547, 83.215}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PositivePin p2 annotation(Placement(visible = true, transformation(origin = {-96.047, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-95.658, 1.555}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PositivePin p3 annotation(Placement(visible = true, transformation(origin = {-95.658, -83.889}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96.047, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.SignalBus switching2 annotation(Placement(visible = true, transformation(origin = {0.026, -157.806}, extent = {{-12.194, -12.194}, {12.194, 12.194}}, rotation = 0), iconTransformation(origin = {0, -96.825}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.SignalBus switching1 annotation(Placement(visible = true, transformation(origin = {-49.974, -157.754}, extent = {{-12.246, -12.246}, {12.246, 12.246}}, rotation = 0), iconTransformation(origin = {-50, -96.436}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.SignalBus switching3 annotation(Placement(visible = true, transformation(origin = {50.026, -157.806}, extent = {{-12.194, -12.194}, {12.194, 12.194}}, rotation = 0), iconTransformation(origin = {52.107, -97.991}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.Control2Real control2Real annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-140})));
  Control.Interfaces.Control2Real control2Real1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-140})));
  Control.Interfaces.Control2Real control2Real2 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-140})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,-50})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,-10})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{-60,-30},{-80,-50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
    annotation (Placement(transformation(extent={{-60,10},{-80,-10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
    annotation (Placement(transformation(extent={{-60,50},{-80,30}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,30})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={60,0})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={80,0})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-90})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-90})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-90})));
  Modelica.Blocks.Math.Gain gain(k=0.5)
    annotation (Placement(transformation(extent={{80,-130},{70,-120}})));
  Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-35,65})));
  Modelica.Blocks.Math.Product product4 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-15,55})));
  Modelica.Blocks.Math.Product product5 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={5,45})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={45,45})));
  Interfaces.NegativePin n
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Blocks.Math.Gain gain1(k=0.5)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={45,25})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-35,85})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-15,75})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={5,65})));
equation
  connect(switching1, control2Real.InputSignal) annotation (Line(
      points={{-49.974,-157.754},{-50,-157.754},{-50,-149.1},{-49.9,-149.1}},
      color={0,128,0},
      thickness=0.5));
  connect(switching2, control2Real1.InputSignal) annotation (Line(
      points={{0.026,-157.806},{0,-157.806},{0,-149.1},{0.1,-149.1}},
      color={0,128,0},
      thickness=0.5));
  connect(switching3, control2Real2.InputSignal) annotation (Line(
      points={{50.026,-157.806},{50,-157.806},{50,-149.1},{50.1,-149.1}},
      color={0,128,0},
      thickness=0.5));
  connect(vdc_p, signalCurrent.p) annotation (Line(points={{96.047,85.548},{96.047,
          90},{60,90},{60,10}}, color={0,0,255}));
  connect(signalCurrent.n, vdc_n) annotation (Line(points={{60,-10},{60,-85.159},
          {96.047,-85.159}}, color={0,0,255}));
  connect(voltageSensor.p, signalCurrent.p) annotation (Line(points={{80,10},{
          80,90},{60,90},{60,10}},
                                color={0,0,255}));
  connect(control2Real.OutputReal, product.u1) annotation (Line(points={{-50,-130},
          {-50,-110},{-36,-110},{-36,-102}}, color={0,0,127}));
  connect(control2Real1.OutputReal, product1.u1) annotation (Line(points={{0,-130},
          {0,-110},{-6,-110},{-6,-102}}, color={0,0,127}));
  connect(control2Real2.OutputReal, product2.u2) annotation (Line(points={{50,-130},
          {50,-110},{36,-110},{36,-102}}, color={0,0,127}));
  connect(product.y, signalVoltage2.v)
    annotation (Line(points={{-30,-79},{-30,30},{-43,30}},   color={0,0,127}));
  connect(product1.y, signalVoltage1.v)
    annotation (Line(points={{0,-79},{0,-10},{-43,-10}}, color={0,0,127}));
  connect(product2.y, signalVoltage.v)
    annotation (Line(points={{30,-79},{30,-50},{-43,-50}},
                                                         color={0,0,127}));
  connect(gain.y, product2.u1) annotation (Line(points={{69.5,-125},{69.5,-120},
          {24,-120},{24,-102}}, color={0,0,127}));
  connect(gain.y, product1.u2) annotation (Line(points={{69.5,-125},{69.5,-120},
          {6,-120},{6,-102}}, color={0,0,127}));
  connect(gain.y, product.u2) annotation (Line(points={{69.5,-125},{69.5,-120},
          {-24,-120},{-24,-102}},color={0,0,127}));
  connect(currentSensor.p, signalVoltage.p)
    annotation (Line(points={{-60,-40},{-50,-40}}, color={0,0,255}));
  connect(currentSensor1.n, p2)
    annotation (Line(points={{-80,0},{-96.047,0}}, color={0,0,255}));
  connect(currentSensor1.p, signalVoltage1.p)
    annotation (Line(points={{-60,0},{-50,0}}, color={0,0,255}));
  connect(currentSensor2.p, signalVoltage2.p)
    annotation (Line(points={{-60,40},{-50,40}}, color={0,0,255}));
  connect(voltageSensor.v, gain.u) annotation (Line(points={{90,-1.77636e-15},{
          90,-125},{81,-125}}, color={0,0,127}));
  connect(vdc_n, voltageSensor.n) annotation (Line(points={{96.047,-85.159},{80,
          -85.159},{80,-10}}, color={0,0,255}));
  connect(n, vdc_n) annotation (Line(points={{0,100},{70,100},{70,-85.159},{
          96.047,-85.159}}, color={0,0,255}));
  connect(gain1.u, add3_1.y)
    annotation (Line(points={{45,31},{45,39.5},{45,39.5}}, color={0,0,127}));
  connect(product4.y, add1.u2)
    annotation (Line(points={{-15,60.5},{-15,69},{-12,69}}, color={0,0,127}));
  connect(product5.y, add2.u2)
    annotation (Line(points={{5,50.5},{8,50.5},{8,59}}, color={0,0,127}));
  connect(product3.y, add.u2) annotation (Line(points={{-35,70.5},{-32,70.5},{
          -32,79}}, color={0,0,127}));
  connect(add2.y, add3_1.u3)
    annotation (Line(points={{5,70.5},{41,70.5},{41,51}}, color={0,0,127}));
  connect(add1.y, add3_1.u2) annotation (Line(points={{-15,80.5},{-15,80},{45,
          80},{45,51}}, color={0,0,127}));
  connect(add.y, add3_1.u1)
    annotation (Line(points={{-35,90.5},{49,90.5},{49,51}}, color={0,0,127}));
  connect(signalCurrent.i, gain1.y)
    annotation (Line(points={{53,0},{45,0},{45,19.5}}, color={0,0,127}));
  connect(currentSensor2.n, p1) annotation (Line(points={{-80,40},{-96.047,40},
          {-96.047,85.548}}, color={0,0,255}));
  connect(currentSensor.n, p3) annotation (Line(points={{-80,-40},{-95.658,-40},
          {-95.658,-83.889}}, color={0,0,255}));
  connect(signalVoltage2.n, n)
    annotation (Line(points={{-50,20},{0,20},{0,100}}, color={0,0,255}));
  connect(signalVoltage1.n, n) annotation (Line(points={{-50,-20},{-20,-20},{
          -20,20},{0,20},{0,100}}, color={0,0,255}));
  connect(signalVoltage.n, n) annotation (Line(points={{-50,-60},{-20,-60},{-20,
          20},{0,20},{0,100}}, color={0,0,255}));
  connect(currentSensor2.i, product3.u1)
    annotation (Line(points={{-70,50},{-38,50},{-38,59}}, color={0,0,127}));
  connect(currentSensor2.i, add.u1)
    annotation (Line(points={{-70,50},{-38,50},{-38,79}}, color={0,0,127}));
  connect(currentSensor1.i, product4.u1)
    annotation (Line(points={{-70,10},{-18,10},{-18,49}}, color={0,0,127}));
  connect(currentSensor1.i, add1.u1)
    annotation (Line(points={{-70,10},{-18,10},{-18,69}}, color={0,0,127}));
  connect(currentSensor.i, product5.u1)
    annotation (Line(points={{-70,-30},{2,-30},{2,39}}, color={0,0,127}));
  connect(currentSensor.i, add2.u1)
    annotation (Line(points={{-70,-30},{2,-30},{2,59}}, color={0,0,127}));
  connect(control2Real.OutputReal, product3.u2) annotation (Line(points={{-50,
          -130},{-32,-130},{-32,59}}, color={0,0,127}));
  connect(control2Real1.OutputReal, product4.u2)
    annotation (Line(points={{0,-130},{-12,-130},{-12,49}}, color={0,0,127}));
  connect(control2Real2.OutputReal, product5.u2)
    annotation (Line(points={{50,-130},{8,-130},{8,39}}, color={0,0,127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {-35.374, 44.753}, extent = {{-32.354, -27.891}, {32.354, 27.891}}, textString = "AC"), Text(visible = true, origin = {46.093, -32.57}, extent = {{-37.781, -32.57}, {37.781, 32.57}}, textString = "DC")}), Diagram(coordinateSystem(extent = {{-100, -160}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end VSC02;
