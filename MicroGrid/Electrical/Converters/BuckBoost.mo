within MicroGrid.Electrical.Converters;
model BuckBoost "DC/DC Buck-Boost Converter"
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  parameter Modelica.SIunits.Inductance L_boost "Boost input indctance";
  parameter Modelica.SIunits.Voltage Vdrop "Diode forward voltage drop";
  parameter Modelica.SIunits.Resistance r_diode "Diode forward resistance";
  parameter Modelica.SIunits.Conductance g_diode "Diode reverse conductance";
  parameter Modelica.SIunits.Resistance r_switch "Switch forward resistance";
  parameter Modelica.SIunits.Conductance g_switch "Switch reverse conductance";
  parameter Modelica.SIunits.Frequency f_s "Desired fixed switching frequency";
  Interfaces.PositivePin Input_p annotation(Placement(transformation(extent = {{-106, 70}, {-86, 90}})));
  Interfaces.NegativePin Input_n annotation(Placement(transformation(extent = {{-106, -90}, {-86, -70}})));
  Interfaces.PositivePin Output_p annotation(Placement(transformation(extent = {{86, 70}, {106, 90}})));
  Interfaces.NegativePin Output_n annotation(Placement(transformation(extent = {{86, -90}, {106, -70}})));
  BasicComponents.inductor InputInductor(L = L_boost, i(fixed = true)) annotation(Placement(transformation(extent = {{-36, 16}, {-16, 36}}, origin = {-34, 29}, rotation = 0), visible = true));
  BasicComponents.diode diode(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(transformation(extent = {{16, 16}, {36, 36}}, origin = {17, 29}, rotation = 0), visible = true));
  BasicComponents.switch switch(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, -2})));
  Control.Interfaces.SignalBus DutyRatio annotation(Placement(transformation(extent = {{-14, -112}, {14, -82}})));
  Control.Modulation.SawtoothPWM sawtoothPWM(f = f_s) annotation(Placement(transformation(extent = {{20, -82}, {40, -62}})));
  BasicComponents.diode diode1(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(visible = true, transformation(origin = {-22.165, -2.333}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.switch switch1(r_on = r_switch, g_off = g_switch) annotation(Placement(visible = true, transformation(origin = {43.111, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1 annotation(Placement(visible = true, transformation(origin = {43.302, 15.026}, extent = {{-8.305, -8.305}, {8.305, 8.305}}, rotation = -270)));
equation
  connect(InputInductor.p, Input_p) annotation(Line(points = {{-48, 26}, {-60, 26}, {-60, 51}, {-76, 51}}, color = {0, 0, 255}, visible = true, origin = {-20, 29}));
  connect(diode.n, Output_p) annotation(Line(points = {{32.555, 26}, {60, 26}, {60, 51}, {77.555, 51}}, color = {0, 0, 255}, visible = true, origin = {18.445, 29}));
  connect(InputInductor.n, diode.p) annotation(Line(points = {{-52, -0}, {35, 0}}, color = {0, 0, 255}, visible = true, origin = {-0, 55}));
  connect(diode.p, switch.p) annotation(Line(points = {{18, 26}, {-17, 26}, {-17, -23}}, color = {0, 0, 255}, visible = true, origin = {17, 29}));
  connect(switch.n, Output_n) annotation(Line(points = {{-22, -10}, {-22, -22}, {-22, -22}, {-22, -32}, {48, -32}, {48, -80}, {74, -80}}, color = {0, 0, 255}, visible = true, origin = {22, -0}));
  connect(Output_n, Output_n) annotation(Line(points = {{96, -80}, {96, -80}}, color = {0, 0, 255}));
  connect(DutyRatio, DutyRatio) annotation(Line(points = {{1.77636e-15, -97}, {1.77636e-15, -97}}, color = {0, 128, 0}, thickness = 0.5));
  connect(DutyRatio, sawtoothPWM.InputDutyRatio) annotation(Line(points = {{1.77636e-15, -97}, {1.77636e-15, -72.1}, {20.6, -72.1}}, color = {0, 128, 0}, thickness = 0.5));
  connect(switch.control, sawtoothPWM.fire) annotation(Line(points = {{7, -2}, {36, -2}, {36, -61}}, color = {255, 0, 255}));
  connect(Output_p, Output_p) annotation(Line(points = {{96, 80}, {96, 80}}, color = {0, 0, 255}));
  connect(Input_n, switch.n) annotation(Line(visible = true, origin = {-47.2, -46.91}, points = {{-48.8, -33.09}, {-22.8, -33.09}, {-22.8, 14.635}, {47.2, 14.635}, {47.2, 36.91}}, color = {0, 0, 255}));
  connect(diode1.n, switch.p) annotation(Line(visible = true, origin = {-11.082, 7.417}, points={{-11.083,
          -1.75},{-11.083,1.583},{11.082,1.583},{11.082,-1.417}},                                                                                                          color = {0, 0, 255}));
  connect(diode1.p, switch.n) annotation(Line(visible = true, origin = {-11.082, -11.75}, points={{-11.083,
          1.417},{-11.083,-1.583},{11.082,-1.583},{11.082,1.75}},                                                                                                           color = {0, 0, 255}));
  connect(switch1.p, diode.p) annotation(Line(visible = true, origin = {35.074, 50}, points = {{0.037, -10}, {0.037, 5}, {-0.074, 5}}, color = {0, 0, 255}));
  connect(switch1.n, diode.n) annotation(Line(visible = true, origin = {51.074, 50}, points = {{0.037, -10}, {0.037, 5}, {-0.074, 5}}, color = {0, 0, 255}));
  connect(not1.u, sawtoothPWM.fire) annotation(Line(visible = true, origin = {39.651, -13.693}, points = {{3.651, 18.753}, {3.651, 13.693}, {-3.651, 13.693}, {-3.651, -47.307}}, color = {190, 52, 178}));
  connect(not1.y, switch1.control) annotation(Line(visible = true, origin = {43.207, 28.79}, points={{0.095,
          -4.6285},{0.095,0.21},{-0.096,0.21},{-0.096,4.21}},                                                                                                           color = {190, 52, 178}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {46.093, -32.57}, extent = {{-37.781, -32.57}, {37.781, 32.57}}, textString = "DC"), Text(visible = true, origin = {-32.219, 47.43}, extent = {{-37.781, -32.57}, {37.781, 32.57}}, textString = "DC")}));
end BuckBoost;
