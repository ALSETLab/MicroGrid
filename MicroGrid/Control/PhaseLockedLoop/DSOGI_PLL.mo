within MicroGrid.Control.PhaseLockedLoop;
model DSOGI_PLL "Synchronous reference frame PLL with SOGI filter in alfa and beta axis"
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  import Modelica.Constants.pi;
  parameter Real SysFreq = 60 "System nominal frequency, in hertz";
  parameter Real VLine = 220 "System nominal RMS line voltage";
  parameter Real sogiGain = 1.41 "SOGI pass band filter gain";
  parameter Real Freq_PI = 100 "Cut-off frequency for CL synchronous reference frame PI block";
  parameter Real Xi_PI = 0.707 "Desired damping coefficient for CL synchronous reference frame";
  Sensors.Interfaces.SignalBus vA annotation(Placement(visible = true, transformation(origin = {-95, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.848, 63.808}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.Interfaces.SignalBus vB annotation(Placement(visible = true, transformation(origin = {-95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.298, -3.332}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.Interfaces.SignalBus vC annotation(Placement(visible = true, transformation(origin = {-95, -65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.87, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.clarke ClarkeTransform annotation(Placement(visible = true, transformation(origin = {-65.816, -0}, extent = {{-15.816, -15.816}, {15.816, 15.816}}, rotation = 0)));
  Interfaces.Control2Real control2Real1 annotation(Placement(visible = true, transformation(origin = {-34.693, 5.458}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Control2Real control2Real2 annotation(Placement(visible = true, transformation(origin = {-34.693, -5.522}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-20, 24.296}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Modelica.Blocks.Math.Gain gain2(k = 0.5) annotation(Placement(visible = true, transformation(origin = {-20, -24.02}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Utilities.SOGI sogi_2(FilterGain = sogiGain, FrequencyHz = SysFreq) annotation(Placement(visible = true, transformation(origin = {0, -46.107}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.SOGI sogi_1(FilterGain = sogiGain, FrequencyHz = SysFreq) annotation(Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Real2Control real2Control1 annotation(Placement(visible = true, transformation(origin = {76.2, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Real2Control real2Control2 annotation(Placement(visible = true, transformation(origin = {75.832, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.park park1 annotation(Placement(visible = true, transformation(origin = {113.343, 0}, extent = {{-16.657, -16.657}, {16.657, 16.657}}, rotation = 0)));
  Interfaces.Real2Control real2Control3 annotation(Placement(visible = true, transformation(origin = {150, -68.343}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Control2Real control2Real4 annotation(Placement(visible = true, transformation(origin = {148.067, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI PI(k = 4 * pi * Freq_PI * Xi_PI * sqrt(3) / (VLine * sqrt(2)), T = 2 * Xi_PI / (2 * pi * Freq_PI), initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin = {174.763, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin = {205, -35.859}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 2 * pi * SysFreq) annotation(Placement(visible = true, transformation(origin = {150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.IntegratorWithReset integrator1 annotation(Placement(visible = true, transformation(origin = {235, -35.859}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.SignalBus vD annotation(Placement(visible = true, transformation(origin = {275, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.422, 63.339}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.SignalBus vQ annotation(Placement(visible = true, transformation(origin = {275, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.946, -5.023}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.SignalBus Delta annotation(Placement(visible = true, transformation(origin = {275, -65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.765, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vA, ClarkeTransform.v_A) annotation(Line(visible = true, origin = {-90.149, 28.491}, points={{-4.851,
          36.509},{-4.851,-18.2546},{9.70162,-18.2546}},                                                                                                         color = {255, 0, 0}));
  connect(vB, ClarkeTransform.v_B) annotation(Line(visible = true, origin = {-90.174, -0}, points={{-4.826,
          0},{-4.826,0},{9.65133,0}},                                                                                                         color = {255, 0, 0}));
  connect(vC, ClarkeTransform.v_C) annotation(Line(visible = true, origin = {-90.149, -29.047}, points={{-4.851,
          -35.953},{-4.851,17.9758},{9.70162,17.9758}},                                                                                                          color = {255, 0, 0}));
  connect(ClarkeTransform.v_alfa, control2Real1.InputSignal) annotation(Line(visible = true, origin = {-46.56, 5.368}, points={{-4.4992,
          0.0107053},{0.866,0.0107053},{0.866,-0.01},{2.767,-0.01}},                                                                                                                             color = {0, 128, 0}));
  connect(ClarkeTransform.v_beta, control2Real2.InputSignal) annotation(Line(visible = true, origin = {-46.541, -5.438}, points={{-4.4437,
          0.183134},{0.848,0.183134},{0.848,-0.184},{2.748,-0.184}},                                                                                                                                   color = {0, 128, 0}));
  connect(control2Real1.OutputReal, gain1.u) annotation(Line(visible = true, origin = {-21.564, 7.737}, points={{-3.129,
          -2.279},{1.564,-2.279},{1.564,4.559}},                                                                                                                      color = {1, 37, 163}));
  connect(control2Real2.OutputReal, gain2.u) annotation(Line(visible = true, origin = {-21.564, -7.688}, points = {{-3.129, 2.166}, {1.564, 2.166}, {1.564, -4.332}}, color = {1, 37, 163}));
  connect(sogi_1.v_in, gain1.y) annotation(Line(visible = true, origin = {-16.552, 44.961}, points={{6.8961,
          4.8324},{-3.448,4.8324},{-3.448,-9.665}},                                                                                                       color = {1, 37, 163}));
  connect(sogi_2.v_in, gain2.y) annotation(Line(visible = true, origin = {-16.552, -42.549}, points={{6.8961,
          -3.7646},{-3.448,-3.7646},{-3.448,7.529}},                                                                                                        color = {1, 37, 163}));
  connect(sogi_1.v, add1.u1) annotation(Line(visible = true, origin = {24.5, 40}, points = {{-14.5, 15}, {5.5, 15}, {5.5, -14}, {13.5, -14}}, color = {1, 37, 163}));
  connect(sogi_2.qv, add1.u2) annotation(Line(visible = true, origin = {32, -20}, points = {{-22, -31.107}, {-2, -31.107}, {-2, 34}, {6, 34}}, color = {1, 37, 163}));
  connect(sogi_1.qv, add2.u1) annotation(Line(visible = true, origin = {22, 15.5}, points = {{-12, 29.5}, {-2, 29.5}, {-2, -29.5}, {16, -29.5}}, color = {1, 37, 163}));
  connect(sogi_2.v, add2.u2) annotation(Line(visible = true, origin = {22, -33.553}, points={{-12,
          -7.554},{-2,-7.554},{-2,7.553},{16,7.553}},                                                                                                  color = {1, 37, 163}));
  connect(add2.y, real2Control1.InputReal) annotation(Line(visible = true, origin = {64.1, -20}, points = {{-3.1, -0}, {3.1, 0}}, color = {1, 37, 163}));
  connect(add1.y, real2Control2.InputReal) annotation(Line(visible = true, origin = {63.916, 20}, points = {{-2.916, 0}, {2.916, 0}}, color = {1, 37, 163}));
  connect(real2Control2.OutputSignal, park1.v_alfa) annotation(Line(visible = true, origin = {90.825, 13.381}, points={{-5.493,
          6.719},{-0.825,6.719},{-0.825,-6.7182},{7.14326,-6.7182}},                                                                                                                           color = {0, 128, 0}));
  connect(park1.v_beta, real2Control1.OutputSignal) annotation(Line(visible = true, origin = {90.901, -13.497}, points={{7.00163,
          6.40312},{-0.901,6.40312},{-0.901,-6.403},{-5.201,-6.403}},                                                                                                                           color = {0, 128, 0}));
  connect(control2Real4.OutputReal, PI.u) annotation(Line(visible = true, origin = {160.415, -30}, points = {{-2.348, 0}, {2.348, 0}}, color = {1, 37, 163}));
  connect(park1.v_q, control2Real4.InputSignal) annotation(Line(visible = true, origin = {133.644, -20.414}, points={{
          -5.05885,13.7512},{1.11,13.7512},{1.11,-9.686},{5.323,-9.686}},                                                                                                                  color = {0, 128, 0}));
  connect(add3.y, integrator1.u) annotation(Line(visible = true, origin = {219.5, -35.859}, points = {{-3.5, 0}, {3.5, 0}}, color = {1, 37, 163}));
  connect(PI.y, add3.u1) annotation(Line(visible = true, origin = {189.691, -29.929}, points={{-3.928,
          -0.071},{0.309,-0.071},{0.309,0.07},{3.309,0.07}},                                                                                                        color = {1, 37, 163}));
  connect(add3.u2, const.y) annotation(Line(visible = true, origin = {182.37, -45.929}, points={{10.63,
          4.07},{5.37,4.07},{5.37,-4.071},{-21.37,-4.071}},                                                                                                         color = {1, 37, 163}));
  connect(integrator1.y, real2Control3.InputReal) annotation(Line(visible = true, origin = {226.25, -55.69}, points={{19.75,
          19.831},{23.75,19.831},{23.75,-12.653},{-67.25,-12.653}},                                                                                                                            color = {1, 37, 163}));
  connect(real2Control3.OutputSignal, park1.Delta) annotation(Line(visible = true, origin = {122.396, -50.761}, points={{18.104,
          -17.482},{-9.053,-17.482},{-9.053,34.9633}},                                                                                                                             color = {0, 128, 0}));
  connect(park1.v_q, vQ) annotation(Line(visible = true, origin = {229.396, -3.331}, points={{
          -100.811,-3.3318},{27.604,-3.3318},{27.604,3.331},{45.604,3.331}},                                                                                            color = {0, 128, 0}));
  connect(park1.v_d, vD) annotation(Line(visible = true, origin = {229.587, 20.831}, points={{
          -100.864,-14.1682},{27.726,-14.1682},{27.726,44.169},{45.413,44.169}},                                                                                            color = {0, 128, 0}));
  connect(real2Control3.OutputSignal, Delta) annotation(Line(visible = true, origin = {192.9, -76.297}, points = {{-52.4, 8.054}, {-55.9, 8.054}, {-55.9, -13.703}, {82.1, -13.703}, {82.1, 11.297}}, color = {0, 128, 0}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {2.129, -3.347}, extent = {{-74.033, -36.653}, {74.033, 36.653}}, textString = "DSOGI-PLL")}), Diagram(coordinateSystem(extent = {{-100, -100}, {280, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end DSOGI_PLL;
