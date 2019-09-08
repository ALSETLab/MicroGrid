within MicroGrid.Examples.VSC_Inverter.Export;
model Controller

  Control.PhaseLockedLoop.DSOGI_PLL dSOGI_PLL1 annotation(Placement(visible = true, transformation(origin={3.1255,
            -28.749},                                                                                                        extent={{
            -23.1255,-21.251},{23.1255,21.251}},                                                                                                                              rotation = 0)));
  Control.Interfaces.abc2dq abc2dq1 annotation(Placement(visible = true, transformation(origin={80,
            -3.352},                                                                                            extent={{15,15},
            {-15,-15}},                                                                                                                          rotation = 90)));
  Control.Feedback.StateFeedback stateFeedback(
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
    add1(k1=-1)) annotation (Placement(visible=true, transformation(
        origin={138.343,-30},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Control.Interfaces.Control2Real control2Real
    annotation (Placement(transformation(extent={{270,20},{290,40}})));
  Control.Interfaces.Control2Real control2Real1
    annotation (Placement(transformation(extent={{270,40},{290,60}})));
  Control.Interfaces.Control2Real control2Real2
    annotation (Placement(transformation(extent={{270,0},{290,20}})));
  Modelica.Blocks.Interfaces.RealInput imeas3 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-50,120})));
  Modelica.Blocks.Interfaces.RealInput imeas1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={150,120})));
  Modelica.Blocks.Interfaces.RealInput imeas2 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={50,120})));
  Modelica.Blocks.Interfaces.RealOutput m1
    annotation (Placement(transformation(extent={{360,40},{380,60}})));
  Modelica.Blocks.Interfaces.RealOutput m2
    annotation (Placement(transformation(extent={{360,-60},{380,-40}})));
  Modelica.Blocks.Interfaces.RealOutput m3
    annotation (Placement(transformation(extent={{360,-160},{380,-140}})));
  Modelica.Blocks.Interfaces.RealInput vdc annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,70})));
  Modelica.Blocks.Interfaces.RealInput vmeas1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,-10})));
  Modelica.Blocks.Interfaces.RealInput vmeas2 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,-80})));
  Modelica.Blocks.Interfaces.RealInput vmeas3 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,-160})));
  Sensors.Interfaces.Real2Sensor real2Sensor
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
  Sensors.Interfaces.Real2Sensor real2Sensor1
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Sensors.Interfaces.Real2Sensor real2Sensor2
    annotation (Placement(transformation(extent={{-90,-50},{-70,-30}})));
  Sensors.Interfaces.Real2Sensor real2Sensor3
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  Sensors.Interfaces.Real2Sensor real2Sensor4 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={90,50})));
  Sensors.Interfaces.Real2Sensor real2Sensor5 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,50})));
  Sensors.Interfaces.Real2Sensor real2Sensor6 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,50})));
equation
  connect(dSOGI_PLL1.Delta, stateFeedback.Delta) annotation (Line(
      points={{24.8091,-43.6247},{24.8091,-45.0346},{119.378,-45.0346}},
      color={0,128,0},
      thickness=0.5));
  connect(stateFeedback.i_d, abc2dq1.v_d) annotation (Line(
      points={{119.343,-25},{86,-25},{86,-17.2017}},
      color={0,128,0},
      thickness=0.5));
  connect(stateFeedback.i_q, abc2dq1.v_q) annotation (Line(
      points={{119.343,-35},{74,-35},{74,-17.0779}},
      color={0,128,0},
      thickness=0.5));
  connect(abc2dq1.Delta,dSOGI_PLL1. Delta) annotation (Line(
      points={{65.7738,-3.352},{50,-3.352},{50,-43.6247},{24.8091,-43.6247}},
      color={0,128,0},
      thickness=0.5));
  connect(m1, control2Real1.OutputReal)
    annotation (Line(points={{370,50},{290,50}}, color={0,0,127}));
  connect(m2, control2Real.OutputReal) annotation (Line(points={{370,-50},{340,
          -50},{340,30},{290,30}}, color={0,0,127}));
  connect(m3, control2Real2.OutputReal) annotation (Line(points={{370,-150},{
          320,-150},{320,10},{290,10}}, color={0,0,127}));
  connect(control2Real2.InputSignal, stateFeedback.switching3) annotation (Line(
      points={{270.9,9.9},{147.343,9.9},{147.343,-11}},
      color={0,128,0},
      thickness=0.5));
  connect(control2Real.InputSignal, stateFeedback.switching2) annotation (Line(
      points={{270.9,29.9},{138.03,29.9},{138.03,-11}},
      color={0,128,0},
      thickness=0.5));
  connect(control2Real1.InputSignal, stateFeedback.switching1) annotation (Line(
      points={{270.9,49.9},{128.343,49.9},{128.343,-11}},
      color={0,128,0},
      thickness=0.5));
  connect(dSOGI_PLL1.vB, real2Sensor1.OutputSignal) annotation (Line(
      points={{-18.4501,-29.4571},{-30,-29.4571},{-30,-29.9},{-70.5,-29.9}},
      color={255,0,0},
      thickness=0.5));
  connect(dSOGI_PLL1.vA, real2Sensor.OutputSignal) annotation (Line(
      points={{-18.5773,-15.1892},{-60,-15.1892},{-60,-19.9},{-70.5,-19.9}},
      color={255,0,0},
      thickness=0.5));
  connect(dSOGI_PLL1.vC, real2Sensor2.OutputSignal) annotation (Line(
      points={{-18.5824,-43.6247},{-50,-43.6247},{-50,-39.9},{-70.5,-39.9}},
      color={255,0,0},
      thickness=0.5));
  connect(vmeas1, real2Sensor.InputReal) annotation (Line(points={{-200,-10},{
          -120,-10},{-120,-20},{-89,-20}}, color={0,0,127}));
  connect(vmeas2, real2Sensor1.InputReal) annotation (Line(points={{-200,-80},{
          -140,-80},{-140,-30},{-89,-30}}, color={0,0,127}));
  connect(vmeas3, real2Sensor2.InputReal) annotation (Line(points={{-200,-160},
          {-120,-160},{-120,-40},{-89,-40}}, color={0,0,127}));
  connect(stateFeedback.v_dc, real2Sensor3.OutputSignal) annotation (Line(
      points={{119.343,-15},{0,-15},{0,10.1},{-70.5,10.1}},
      color={255,0,0},
      thickness=0.5));
  connect(vdc, real2Sensor3.InputReal) annotation (Line(points={{-200,70},{-120,
          70},{-120,10},{-89,10}}, color={0,0,127}));
  connect(abc2dq1.v_A, real2Sensor4.OutputSignal) annotation (Line(
      points={{89.7083,10.5245},{89.7083,10},{90.1,10},{90.1,40.5}},
      color={255,0,0},
      thickness=0.5));
  connect(abc2dq1.v_B, real2Sensor5.OutputSignal) annotation (Line(
      points={{79.5423,10.5245},{79.5423,40.5},{80.1,40.5}},
      color={255,0,0},
      thickness=0.5));
  connect(abc2dq1.v_C, real2Sensor6.OutputSignal) annotation (Line(
      points={{69.5,10.5245},{69.5,40.5},{70.1,40.5}},
      color={255,0,0},
      thickness=0.5));
  connect(real2Sensor4.InputReal, imeas1) annotation (Line(points={{90,59},{90,
          70},{150,70},{150,120}}, color={0,0,127}));
  connect(real2Sensor5.InputReal, imeas2) annotation (Line(points={{80,59},{80,
          80},{50,80},{50,120}}, color={0,0,127}));
  connect(real2Sensor6.InputReal, imeas3) annotation (Line(points={{70,59},{70,
          70},{-50,70},{-50,120}}, color={0,0,127}));
annotation(Diagram(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),Icon(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end Controller;
