within MicroGrid.Electrical.Converters;
model VSC01
  "AC/DC Voltage Sourced Converter with sinusoidal PWM switching pattern."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  parameter Modelica.SIunits.Voltage Vdrop = 0 "Diode forward voltage drop";
  parameter Modelica.SIunits.Resistance r_diode = 1E-5 "Diode forward resistance";
  parameter Modelica.SIunits.Conductance g_diode = 1E-5 "Diode reverse conductance";
  parameter Modelica.SIunits.Resistance r_switch = 1E-5 "Switch forward resistance";
  parameter Modelica.SIunits.Conductance g_switch = 1E-5 "Switch reverse conductance";
  parameter Modelica.SIunits.Frequency f_s = 20e3 "Desired fixed switching frequency";
  BasicComponents.switch switch(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-50, 46.118}), visible = true));
  BasicComponents.diode diode1(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {-32.89, 46.118}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.switch switch1(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-50, -45.107}), visible = true));
  BasicComponents.diode diode2(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {-32.89, -45.107}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.switch switch2(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, 46.118}), visible = true));
  BasicComponents.diode diode3(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {17.11, 46.118}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.switch switch3(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, -45.107}), visible = true));
  BasicComponents.diode diode4(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {17.11, -45.107}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.switch switch4(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {49.997, 46.118}), visible = true));
  BasicComponents.diode diode5(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {67.107, 46.118}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.switch switch5(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -270, origin = {50, -45.107}), visible = true));
  BasicComponents.diode diode6(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {67.11, -45.107}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Interfaces.PositivePin vdc_p annotation(Placement(visible = true, transformation(origin = {96.047, 85.548}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92.547, 81.66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NegativePin vdc_n annotation(Placement(visible = true, transformation(origin = {96.047, -85.159}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92.936, -83.215}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PositivePin p1 annotation(Placement(visible = true, transformation(origin = {-96.047, 85.548}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92.547, 83.215}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PositivePin p2 annotation(Placement(visible = true, transformation(origin = {-96.047, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-95.658, 1.555}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PositivePin p3 annotation(Placement(visible = true, transformation(origin = {-95.658, -83.889}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96.047, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.SignalBus switching2 annotation(Placement(visible = true, transformation(origin = {0.026, -157.806}, extent = {{-12.194, -12.194}, {12.194, 12.194}}, rotation = 0), iconTransformation(origin = {0, -96.825}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.SignalBus switching1 annotation(Placement(visible = true, transformation(origin = {-49.974, -157.754}, extent = {{-12.246, -12.246}, {12.246, 12.246}}, rotation = 0), iconTransformation(origin = {-50, -96.436}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Interfaces.SignalBus switching3 annotation(Placement(visible = true, transformation(origin = {50.026, -157.806}, extent = {{-12.194, -12.194}, {12.194, 12.194}}, rotation = 0), iconTransformation(origin = {52.107, -97.991}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Modulation.TriangPWM_3Ph triangPWM_3Ph1(f = f_s) annotation(Placement(visible = true, transformation(origin = {0, -114.562}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(switch.p, diode1.n) annotation(Line(visible = true, origin = {-41.445, 57.059}, points = {{-8.555, -2.941}, {-8.555, 2.941}, {8.555, 2.941}, {8.555, -2.941}}, color = {0, 0, 255}));
  connect(switch.n, diode1.p) annotation(Line(visible = true, origin = {-41.445, 34.671}, points={{-8.555,
          3.447},{-8.555,-3.446},{8.555,-3.446},{8.555,3.447}},                                                                                                          color = {0, 0, 255}));
  connect(switch1.p, diode2.n) annotation(Line(visible = true, origin = {-41.445, -34.166}, points = {{-8.555, -2.941}, {-8.555, 2.941}, {8.555, 2.941}, {8.555, -2.941}}, color = {0, 0, 255}));
  connect(switch1.n, diode2.p) annotation(Line(visible = true, origin = {-41.445, -56.554}, points={{-8.555,
          3.447},{-8.555,-3.446},{8.555,-3.446},{8.555,3.447}},                                                                                                            color = {0, 0, 255}));
  connect(switch2.p, diode3.n) annotation(Line(visible = true, origin = {8.555, 57.059}, points = {{-8.555, -2.941}, {-8.555, 2.941}, {8.555, 2.941}, {8.555, -2.941}}, color = {0, 0, 255}));
  connect(switch2.n, diode3.p) annotation(Line(visible = true, origin = {8.555, 34.671}, points={{-8.555,
          3.447},{-8.555,-3.446},{8.555,-3.446},{8.555,3.447}},                                                                                                         color = {0, 0, 255}));
  connect(switch3.p, diode4.n) annotation(Line(visible = true, origin = {8.555, -34.166}, points = {{-8.555, -2.941}, {-8.555, 2.941}, {8.555, 2.941}, {8.555, -2.941}}, color = {0, 0, 255}));
  connect(switch3.n, diode4.p) annotation(Line(visible = true, origin = {8.555, -56.554}, points={{-8.555,
          3.447},{-8.555,-3.446},{8.555,-3.446},{8.555,3.447}},                                                                                                          color = {0, 0, 255}));
  connect(switch4.p, diode5.n) annotation(Line(visible = true, origin = {58.552, 57.059}, points = {{-8.555, -2.941}, {-8.555, 2.941}, {8.555, 2.941}, {8.555, -2.941}}, color = {0, 0, 255}));
  connect(switch4.n, diode5.p) annotation(Line(visible = true, origin = {58.552, 34.671}, points={{-8.555,
          3.447},{-8.555,-3.446},{8.555,-3.446},{8.555,3.447}},                                                                                                          color = {0, 0, 255}));
  connect(switch5.p, diode6.n) annotation(Line(visible = true, origin = {58.555, -34.166}, points = {{-8.555, -2.941}, {-8.555, 2.941}, {8.555, 2.941}, {8.555, -2.941}}, color = {0, 0, 255}));
  connect(switch5.n, diode6.p) annotation(Line(visible = true, origin = {58.555, -56.554}, points={{-8.555,
          3.447},{-8.555,-3.446},{8.555,-3.446},{8.555,3.447}},                                                                                                           color = {0, 0, 255}));
  connect(switch.p, vdc_p) annotation(Line(visible = true, origin = {-1.799, 75.071}, points={{-48.201,
          -20.953},{-48.201,10.477},{97.846,10.477}},                                                                                                     color = {0, 0, 255}));
  connect(switch2.p, vdc_p) annotation(Line(visible = true, origin = {31.534, 75.071}, points={{-31.534,
          -20.953},{-31.534,10.477},{64.513,10.477}},                                                                                                      color = {0, 0, 255}));
  connect(switch4.p, vdc_p) annotation(Line(visible = true, origin = {64.383, 75.071}, points={{-14.386,
          -20.953},{-14.386,10.477},{31.664,10.477}},                                                                                                      color = {0, 0, 255}));
  connect(switch5.n, vdc_n) annotation(Line(visible = true, origin = {64.867, -74.475}, points = {{-14.867, 21.368}, {-14.867, -10.684}, {31.18, -10.684}}, color = {0, 0, 255}));
  connect(switch3.n, vdc_n) annotation(Line(visible = true, origin = {32.016, -74.475}, points = {{-32.016, 21.368}, {-32.016, -10.684}, {64.031, -10.684}}, color = {0, 0, 255}));
  connect(switch1.n, vdc_n) annotation(Line(visible = true, origin = {-1.318, -74.475}, points = {{-48.682, 21.368}, {-48.682, -10.684}, {97.365, -10.684}}, color = {0, 0, 255}));
  connect(switch.n, switch1.p) annotation(Line(visible = true, origin = {-50, 0.505}, points={{0,
          37.613},{0,-37.612}},                                                                                             color = {0, 0, 255}));
  connect(switch3.p, switch2.n) annotation(Line(visible = true, origin = {0, 0.505}, points={{0,
          -37.612},{0,37.613}},                                                                                             color = {0, 0, 255}));
  connect(switch5.p, switch4.n) annotation(Line(visible = true, origin = {48.552, 0.505}, points={{1.448,
          -37.612},{1.445,37.613}},                                                                                                     color = {0, 0, 255}));
  connect(p1, switch.n) annotation(Line(visible = true, origin = {-73.024, 37.916}, points={{-23.023,
          47.632},{-23.023,-23.917},{23.024,-23.917},{23.024,0.202}},                                                                                                     color = {0, 0, 255}));
  connect(p2, switch2.n) annotation(Line(visible = true, origin = {-32.016, 12.706}, points = {{-64.031, -12.706}, {32.016, -12.706}, {32.016, 25.412}}, color = {0, 0, 255}));
  connect(p3, switch5.p) annotation(Line(visible = true, origin = {-22.829, -36.859}, points={{-72.829,
          -47.03},{-72.829,23.638},{72.829,23.638},{72.829,-0.248}},                                                                                                        color = {0, 0, 255}));
  connect(triangPWM_3Ph1.mB_index, switching2) annotation(Line(visible = true, origin = {-0.088, -144.133}, points={{-0.1142,
          10.6295},{-0.1142,1.521},{0.114,1.521},{0.114,-13.673}},                                                                                                                         color = {0, 128, 0}));
  connect(triangPWM_3Ph1.mC_index, switching3) annotation(Line(visible = true, origin = {27.342, -149.791}, points = {{-11.342, 16.029}, {-11.342, -8.015}, {22.684, -8.015}}, color = {0, 128, 0}));
  connect(triangPWM_3Ph1.mA_index, switching1) annotation(Line(visible = true, origin = {-27.134, -149.69}, points={{11.4197,
          16.128},{11.4197,-8.064},{-22.84,-8.064}},                                                                                                                       color = {0, 128, 0}));
  connect(triangPWM_3Ph1.fireA, switch.control) annotation(Line(visible = true, origin = {-46.233, -36.065}, points={{29.1504,
          -56.497},{29.1504,-53.935},{-23.767,-53.935},{-23.767,82.183},{
          -10.767,82.183}},                                                                                                                                                                                           color = {190, 52, 178}));
  connect(triangPWM_3Ph1.fireA_compl, switch1.control) annotation(Line(visible = true, origin = {-42.303, -68.555}, points = {{30.303, -24.007}, {30.303, -11.445}, {-22.954, -11.445}, {-22.954, 23.448}, {-14.697, 23.448}}, color = {190, 52, 178}));
  connect(triangPWM_3Ph1.fireC, switch4.control) annotation(Line(visible = true, origin = {25.399, -32.065}, points = {{-13.399, -60.497}, {-13.399, -47.935}, {4.601, -47.935}, {4.601, 78.183}, {17.598, 78.183}}, color = {190, 52, 178}));
  connect(triangPWM_3Ph1.fireB, switch2.control) annotation(Line(visible = true, origin = {-10.407, -28.065}, points={{7.8894,
          -64.497},{7.8894,-41.935},{-9.593,-41.935},{-9.593,74.183},{3.407,
          74.183}},                                                                                                                                                                                                color = {190, 52, 178}));
  connect(triangPWM_3Ph1.fireB_compl, switch3.control) annotation(Line(visible = true, origin = {-6.215, -60.555}, points = {{8.819, -32.007}, {8.819, 0.555}, {-8.426, 0.555}, {-8.426, 15.448}, {-0.785, 15.448}}, color = {190, 52, 178}));
  connect(triangPWM_3Ph1.fireC_compl, switch5.control) annotation(Line(visible = true, origin = {29.268, -72.38}, points = {{-12.319, -20.182}, {-12.319, -17.182}, {5.452, -17.182}, {5.452, 27.273}, {13.732, 27.273}}, color = {190, 52, 178}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {-35.374, 44.753}, extent = {{-32.354, -27.891}, {32.354, 27.891}}, textString = "AC"), Text(visible = true, origin = {46.093, -32.57}, extent = {{-37.781, -32.57}, {37.781, 32.57}}, textString = "DC")}), Diagram(coordinateSystem(extent = {{-100, -160}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end VSC01;
