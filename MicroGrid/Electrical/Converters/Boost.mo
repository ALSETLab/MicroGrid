within MicroGrid.Electrical.Converters;
model Boost "DC/DC Boost Converter"
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
  BasicComponents.inductor InputInductor(L = L_boost, i(fixed = true)) annotation(Placement(transformation(extent = {{-36, 16}, {-16, 36}})));
  BasicComponents.diode diode(v_knee = Vdrop, r_on = r_diode, g_off = g_diode) annotation(Placement(transformation(extent = {{16, 16}, {36, 36}}, origin = {0.736, -0.357}, rotation = 0), visible = true));
  BasicComponents.switch switch(r_on = r_switch, g_off = g_switch) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, -2})));
  Control.Interfaces.SignalBus DutyRatio annotation(Placement(transformation(extent = {{-14, -112}, {14, -82}})));
  Control.Modulation.SawtoothPWM sawtoothPWM(f = f_s) annotation(Placement(transformation(extent = {{20, -82}, {40, -62}})));
equation
  connect(InputInductor.p, Input_p) annotation(Line(points = {{-34, 26}, {-60, 26}, {-60, 80}, {-96, 80}}, color = {0, 0, 255}));
  connect(diode.n, Output_p) annotation(Line(points = {{34.736, 25.643}, {60, 26}, {60, 80}, {96, 80}}, color = {0, 0, 255}, visible = true));
  connect(diode.p, switch.p) annotation(Line(points={{12.491,6.547},{-6.245,
          6.547},{-6.245,-13.096}},                                                                          color = {0, 0, 255}, visible = true, origin = {6.245, 19.096}));
  connect(switch.n, Output_n) annotation(Line(points = {{-1.77636e-15, -10}, {-1.77636e-15, -22}, {0, -22}, {0, -32}, {48, -32}, {48, -80}, {96, -80}}, color = {0, 0, 255}));
  connect(DutyRatio, sawtoothPWM.InputDutyRatio) annotation(Line(points = {{1.77636e-15, -97}, {1.77636e-15, -72.1}, {20.6, -72.1}}, color = {0, 128, 0}, thickness = 0.5));
  connect(switch.control, sawtoothPWM.fire) annotation(Line(points = {{7, -2}, {36, -2}, {36, -61}}, color = {255, 0, 255}));
  connect(Input_n, Output_n) annotation(Line(points = {{-96, -80}, {-52, -80}, {-52, -32}, {48, -32}, {48, -80}, {96, -80}}, color = {0, 0, 255}));
  connect(InputInductor.n, switch.p) annotation(Line(visible = true, origin = {-6, 19.333}, points = {{-12, 6.667}, {6, 6.667}, {6, -13.333}}, color = {0, 0, 255}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {46.093, -32.57}, extent = {{-37.781, -32.57}, {37.781, 32.57}}, textString = "DC"), Text(visible = true, origin = {-30, 42.57}, extent = {{-37.781, -32.57}, {37.781, 32.57}}, textString = "DC")}));
end Boost;
