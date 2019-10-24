within MicroGrid.Control.Feedback;
model StateFeedback
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Real Vdc_ref = 400 "Reference dc-bus voltage";
  parameter Real Iq_ref = 0 "Reference q-axis current";
  parameter Real Md = 0.9 "Steady state d-axis modulation index";
  parameter Real Mq = 0.0 "Steady state q-axis modulation index";
  parameter Real Kd_id = 0.1 "Gain in state id for d-axis";
  parameter Real Kd_iq = 0.1 "Gain in state iq for d-axis";
  parameter Real Kd_vdc = 0.1 "Gain in state v_cc for d-axis";
  parameter Real Kd_int_iq = 1 "Integrator gain in state iq for d-axis";
  parameter Real Kd_int_vdc = 1 "Integrator gain in state vcc for d-axis";
  parameter Real Kq_id = 0.1 "Gain in state id for q-axis";
  parameter Real Kq_iq = 0.1 "Gain in state iq for q-axis";
  parameter Real Kq_vdc = 0.1 "Gain in state v_cc for q-axis";
  parameter Real Kq_int_iq = 1 "Integrator gain in state iq for q-axis";
  parameter Real Kq_int_vdc = 1 "Integrator gain in state vcc for q-axis";
  Interfaces.SignalBus Delta annotation(Placement(visible = true, transformation(origin = {-94.827, -75.173}, extent = {{-14.827, -14.827}, {14.827, 14.827}}, rotation = 0), iconTransformation(origin = {-94.827, -75.173}, extent = {{-14.827, -14.827}, {14.827, 14.827}}, rotation = 0)));
  Interfaces.SignalBus i_d annotation(Placement(visible = true, transformation(origin = {-95, 25}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-95, 25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.SignalBus i_q annotation(Placement(visible = true, transformation(origin = {-95, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-95, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Sensors.Interfaces.SignalBus v_dc annotation(Placement(visible = true, transformation(origin = {-95, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-95, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.SignalBus switching1 annotation(Placement(visible = true, transformation(origin = {435, 70.583}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-50, 95}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.SignalBus switching2 annotation(Placement(visible = true, transformation(origin = {435, -0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-1.563, 95}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.SignalBus switching3 annotation(Placement(visible = true, transformation(origin = {435, -79.417}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {45, 95}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.Control2Real control2Real1 annotation(Placement(visible = true, transformation(origin = {-55, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.Control2Real control2Real2 annotation(Placement(visible = true, transformation(origin = {-55, 25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Sensors.Interfaces.Sensor2Real sensor2Real1 annotation(Placement(visible = true, transformation(origin = {-55, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Kv_d(k = -Kd_vdc) annotation(Placement(visible = true, transformation(origin = {0, 85.03}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Kv_q(k = -Kq_vdc) annotation(Placement(visible = true, transformation(origin = {0, 63.865}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-30, 107.239}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Kid_d(k = Kd_id) annotation(Placement(visible = true, transformation(origin = {0, 36.135}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Kid_q(k = Kq_id) annotation(Placement(visible = true, transformation(origin = {0, 14.417}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Kiq_d(k = Kd_iq) annotation(Placement(visible = true, transformation(origin = {0, -14.326}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Kiq_q(k = Kq_iq) annotation(Placement(visible = true, transformation(origin = {0, -36.043}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(visible = true, transformation(origin = {-33.313, -53.926}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant I_Ref(k = Iq_ref) annotation(Placement(visible = true, transformation(origin = {-60, -53.865}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant V_Ref(k = Vdc_ref) annotation(Placement(visible = true, transformation(origin = {-60, 107.157}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 SumDAxis annotation(Placement(visible = true, transformation(origin = {95, 25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 SumQAxis annotation(Placement(visible = true, transformation(origin = {95, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IntD_vdc(k = Kd_int_vdc, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {110, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IntQ_vdc(k = Kq_int_vdc, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IntD_iq(k = Kd_int_iq, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator IntQ_iq(k = Kq_int_iq, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant mq(k = Mq) annotation(Placement(visible = true, transformation(origin = {237.426, -67.239}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant md(k = Md) annotation(Placement(visible = true, transformation(origin = {240, 71.657}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 SumQAxis2 annotation(Placement(visible = true, transformation(origin = {235, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 SumDAxis2 annotation(Placement(visible = true, transformation(origin = {235, 25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1, k2 = +1) annotation(Placement(visible = true, transformation(origin = {295, -35}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1) annotation(Placement(visible = true, transformation(origin = {295, 35}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.Real2Control real2Control1 annotation(Placement(visible = true, transformation(origin = {335, 35}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.Real2Control real2Control2 annotation(Placement(visible = true, transformation(origin = {335, -35}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.dq2abc dq2abc1 annotation(Placement(visible = true, transformation(origin = {390, -0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(v_dc, sensor2Real1.InputSignal) annotation(Line(visible = true, origin = {-77.412, 74.925}, points = {{-17.588, 0.075}, {4.412, 0.075}, {4.412, -0.075}, {8.762, -0.075}}, color = {255, 0, 0}));
  connect(i_d, control2Real2.InputSignal) annotation(Line(visible = true, origin = {-77.412, 24.925}, points = {{-17.588, 0.075}, {4.412, 0.075}, {4.412, -0.075}, {8.762, -0.075}}, color = {0, 128, 0}));
  connect(i_q, control2Real1.InputSignal) annotation(Line(visible = true, origin = {-77.412, -25.075}, points = {{-17.588, 0.075}, {4.412, 0.075}, {4.412, -0.075}, {8.762, -0.075}}, color = {0, 128, 0}));
  connect(sensor2Real1.OutputReal, feedback1.u2) annotation(Line(visible = true, origin = {-33.333, 83.08}, points = {{-6.667, -8.08}, {3.333, -8.08}, {3.333, 16.159}}, color = {1, 37, 163}));
  connect(control2Real2.OutputReal, Kid_d.u) annotation(Line(visible = true, origin = {-20.5, 30.567}, points={{-19.5,
          -5.567},{5.5,-5.567},{5.5,5.568},{8.5,5.568}},                                                                                                                      color = {1, 37, 163}));
  connect(control2Real2.OutputReal, Kid_q.u) annotation(Line(visible = true, origin = {-20.5, 19.709}, points={{-19.5,
          5.291},{5.5,5.291},{5.5,-5.292},{8.5,-5.292}},                                                                                                                      color = {1, 37, 163}));
  connect(control2Real1.OutputReal, Kiq_d.u) annotation(Line(visible = true, origin = {-20.5, -19.663}, points = {{-19.5, -5.337}, {5.5, -5.337}, {5.5, 5.337}, {8.5, 5.337}}, color = {1, 37, 163}));
  connect(control2Real1.OutputReal, Kiq_q.u) annotation(Line(visible = true, origin = {-20.5, -30.522}, points={{-19.5,
          5.522},{5.5,5.522},{5.5,-5.521},{8.5,-5.521}},                                                                                                                       color = {1, 37, 163}));
  connect(control2Real1.OutputReal, feedback2.u2) annotation(Line(visible = true, origin = {-35.542, -31.975}, points = {{-4.458, 6.975}, {2.229, 6.975}, {2.229, -13.951}}, color = {1, 37, 163}));
  connect(I_Ref.y, feedback2.u1) annotation(Line(visible = true, origin = {-44.735, -53.895}, points = {{-4.265, 0.03}, {0.422, 0.03}, {0.422, -0.031}, {3.422, -0.031}}, color = {1, 37, 163}));
  connect(V_Ref.y, feedback1.u1) annotation(Line(visible = true, origin = {-43.25, 107.198}, points = {{-5.75, -0.041}, {0.25, -0.041}, {0.25, 0.041}, {5.25, 0.041}}, color = {1, 37, 163}));
  connect(Kv_d.y, SumDAxis.u1) annotation(Line(visible = true, origin = {47, 61.015}, points = {{-36, 24.015}, {3, 24.015}, {3, -24.015}, {30, -24.015}}, color = {1, 37, 163}));
  connect(SumDAxis.u2, Kid_d.y) annotation(Line(visible = true, origin = {42, 30.568}, points={{35,
          -5.568},{-2,-5.568},{-2,5.567},{-31,5.567}},                                                                                                   color = {1, 37, 163}));
  connect(SumDAxis.u3, Kiq_d.y) annotation(Line(visible = true, origin = {42, -0.663}, points = {{35, 13.663}, {-2, 13.663}, {-2, -13.663}, {-31, -13.663}}, color = {1, 37, 163}));
  connect(Kv_q.y, SumQAxis.u1) annotation(Line(visible = true, origin = {52, 25.433}, points={{-41,
          38.432},{8,38.432},{8,-38.433},{25,-38.433}},                                                                                                   color = {1, 37, 163}));
  connect(Kid_q.y, SumQAxis.u2) annotation(Line(visible = true, origin = {37, -5.291}, points={{-26,
          19.708},{-7,19.708},{-7,-19.709},{40,-19.709}},                                                                                                    color = {1, 37, 163}));
  connect(Kiq_q.y, SumQAxis.u3) annotation(Line(visible = true, origin = {59, -36.521}, points={{-48,
          0.478},{15,0.478},{15,-0.479},{18,-0.479}},                                                                                                     color = {1, 37, 163}));
  connect(feedback1.y, IntD_vdc.u) annotation(Line(visible = true, origin = {66.75, 103.62}, points={{-87.75,
          3.619},{28.25,3.619},{28.25,-3.62},{31.25,-3.62}},                                                                                                           color = {1, 37, 163}));
  connect(IntQ_vdc.u, feedback1.y) annotation(Line(visible = true, origin = {59.25, 88.62}, points={{38.75,
          -18.62},{20.75,-18.62},{20.75,18.619},{-80.25,18.619}},                                                                                                         color = {1, 37, 163}));
  connect(feedback2.y, IntD_iq.u) annotation(Line(visible = true, origin = {65.922, -61.963}, points = {{-90.235, 8.037}, {29.078, 8.037}, {29.078, -8.037}, {32.078, -8.037}}, color = {1, 37, 163}));
  connect(IntQ_iq.u, feedback2.y) annotation(Line(visible = true, origin = {53.422, -76.963}, points = {{44.578, -23.037}, {16.578, -23.037}, {16.578, 23.037}, {-77.735, 23.037}}, color = {1, 37, 163}));
  connect(SumDAxis.y, SumDAxis2.u3) annotation(Line(visible = true, origin = {162.125, 19}, points = {{-50.625, 6}, {-2.125, 6}, {-2.125, -6}, {54.875, -6}}, color = {1, 37, 163}));
  connect(SumQAxis.y, SumQAxis2.u1) annotation(Line(visible = true, origin = {162.125, -19}, points = {{-50.625, -6}, {-2.125, -6}, {-2.125, 6}, {54.875, 6}}, color = {1, 37, 163}));
  connect(IntD_vdc.y, SumDAxis2.u1) annotation(Line(visible = true, origin = {209.5, 68.5}, points = {{-88.5, 31.5}, {-9.5, 31.5}, {-9.5, -31.5}, {7.5, -31.5}}, color = {1, 37, 163}));
  connect(IntQ_vdc.y, SumQAxis2.u3) annotation(Line(visible = true, origin = {149.5, 16.5}, points = {{-28.5, 53.5}, {-19.5, 53.5}, {-19.5, -53.5}, {67.5, -53.5}}, color = {1, 37, 163}));
  connect(IntD_iq.y, SumDAxis2.u2) annotation(Line(visible = true, origin = {170.363, -22.5}, points = {{-49.363, -47.5}, {1.363, -47.5}, {1.363, 47.5}, {46.637, 47.5}}, color = {1, 37, 163}));
  connect(IntQ_iq.y, SumQAxis2.u2) annotation(Line(visible = true, origin = {184.5, -62.5}, points = {{-63.5, -37.5}, {15.5, -37.5}, {15.5, 37.5}, {32.5, 37.5}}, color = {1, 37, 163}));
  connect(md.y, add2.u1) annotation(Line(visible = true, origin = {267, 57.828}, points={{-16,
          13.829},{3,13.829},{3,-13.828},{10,-13.828}},                                                                                              color = {1, 37, 163}));
  connect(mq.y, add1.u2) annotation(Line(visible = true, origin = {266.357, -55.62}, points={{-17.931,
          -11.619},{3.643,-11.619},{3.643,11.62},{10.643,11.62}},                                                                                                   color = {1, 37, 163}));
  connect(SumDAxis2.y, add2.u2) annotation(Line(visible = true, origin = {269.125, 25.5}, points = {{-17.625, -0.5}, {4.875, -0.5}, {4.875, 0.5}, {7.875, 0.5}}, color = {1, 37, 163}));
  connect(SumQAxis2.y, add1.u1) annotation(Line(visible = true, origin = {269.125, -25.5}, points = {{-17.625, 0.5}, {4.875, 0.5}, {4.875, -0.5}, {7.875, -0.5}}, color = {1, 37, 163}));
  connect(add2.y, real2Control1.InputReal) annotation(Line(visible = true, origin = {316.5, 35}, points = {{-5, 0}, {5, 0}}, color = {1, 37, 163}));
  connect(add1.y, real2Control2.InputReal) annotation(Line(visible = true, origin = {316.5, -35}, points = {{-5, 0}, {5, 0}}, color = {1, 37, 163}));
  connect(real2Control1.OutputSignal, dq2abc1.v_d) annotation(Line(visible = true, origin = {360.092, 21.374}, points={{-10.842,
          13.776},{-0.092,13.776},{-0.092,-13.7756},{11.0272,-13.7756}},                                                                                                                             color = {0, 128, 0}));
  connect(real2Control2.OutputSignal, dq2abc1.v_q) annotation(Line(visible = true, origin = {360.151, -21.425}, points={{-10.901,
          -13.425},{-0.151,-13.425},{-0.151,13.425},{11.2048,13.425}},                                                                                                                                color = {0, 128, 0}));
  connect(Delta, dq2abc1.Delta) annotation(Line(visible = true, origin = {153.035, -80.025}, points={{
          -247.862,4.852},{-113.035,4.852},{-113.035,-35.38},{236.965,-35.38},{
          236.965,61.0568}},                                                                                                                                                                            color = {0, 128, 0}));
  connect(dq2abc1.v_B, switching2) annotation(Line(visible = true, origin = {421.772, -0}, points={{
          -13.2282,0},{13.228,0}},                                                                                                color = {0, 128, 0}));
  connect(dq2abc1.v_A, switching1) annotation(Line(visible = true, origin = {426.248, 31.996}, points={{
          -17.5034,-19.2932},{8.752,-19.2932},{8.752,38.587}},                                                                                                   color = {0, 128, 0}));
  connect(dq2abc1.v_C, switching3) annotation(Line(visible = true, origin = {426.181, -35.806}, points={{
          -17.6372,21.806},{8.819,21.806},{8.819,-43.611}},                                                                                                      color = {0, 128, 0}));
  connect(feedback1.y, Kv_d.u) annotation(Line(visible = true, origin = {-15.75, 96.135}, points={{-5.25,
          11.104},{0.75,11.104},{0.75,-11.105},{3.75,-11.105}},                                                                                                         color = {1, 37, 163}));
  connect(feedback1.y, Kv_q.u) annotation(Line(visible = true, origin = {-15.75, 85.552}, points = {{-5.25, 21.687}, {0.75, 21.687}, {0.75, -21.687}, {3.75, -21.687}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {2.605, 4.014}, extent = {{-60.427, -34.014}, {60.427, 34.014}}, textString = "StateFeedback")}), Diagram(coordinateSystem(extent = {{-100, -120}, {440, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end StateFeedback;
