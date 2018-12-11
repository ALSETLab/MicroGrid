within MicroGrid.Electrical.Examples;

model PV_Example
  extends Modelica.Icons.Example;
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E panelData annotation(Placement(visible = true, transformation(origin = {130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // replaceable record panelData = MicroGrid.PhotoVoltaics.Records.LG300N1C_G4 constrainedby MicroGrid.PhotoVoltaics.Records.ModuleData annotation(choicesAllMatching, Placement(visible = true, transformation(origin = {80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PhotoVoltaics.PV_module PV1(moduleData = panelData, Ns = 3, Np = 3) annotation(Placement(visible = true, transformation(origin = {0.312, -90.466}, extent = {{15, -15}, {-15, 15}}, rotation = 360)));
  Converters.SwitchedBoost Boost(Vdrop = 0, r_diode = 1E-5, g_diode = 1E-5, r_switch = 1E-5, g_switch = 1E-5, f_s = 100000, L_boost = 0.005) annotation(Placement(visible = true, transformation(origin = {0, 45}, extent = {{15, -15}, {-15, 15}}, rotation = 270)));
  Sensors.voltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {2.028, -57.418}, extent = {{12.214, 12.214}, {-12.214, -12.214}}, rotation = 0)));
  Sensors.currentSensor currentSensor1 annotation(Placement(visible = true, transformation(origin = {14.869, -32.841}, extent = {{12.841, 12.841}, {-12.841, -12.841}}, rotation = -90)));
  Control.RefGenerators.mppt mppt1(vref.start = 75, Ts = 0.001, deltaVpvRefPanel = 0.05, vref.fixed = true) annotation(Placement(visible = true, transformation(origin = {60.847, -38.803}, extent = {{12.829, -12.829}, {-12.829, 12.829}}, rotation = 180)));
  Control.Feedback.BoostControl boostControl1(TimeCons = 0.005, Gain = 0.005) annotation(Placement(visible = true, transformation(origin = {85, 17.808}, extent = {{15, 15}, {-15, -15}}, rotation = 270)));
  Sources.voltageDC V_dc(V = 400) annotation(Placement(visible = true, transformation(origin = {0, 84.848}, extent = {{15.152, -15.152}, {-15.152, 15.152}}, rotation = 0)));
  BasicComponents.resistor resistor1(R = 0.02) annotation(Placement(visible = true, transformation(origin = {22.93, 17.192}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  BasicComponents.capacitor capacitor1(C = 0.00004, v.start = 0, v.fixed = true) annotation(Placement(visible = true, transformation(origin = {-0.789, 3.769}, extent = {{10.789, -10.789}, {-10.789, 10.789}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Temperature(k = 303) annotation(Placement(visible = true, transformation(origin = {-30, -112.41}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BasicComponents.ground ground1 annotation(Placement(visible = true, transformation(origin = {-43.519, 83.762}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Trapezoid trapezoid1(offset = 700, falling = 0.1, rising = 0.1, amplitude = 100, width = 0.3, startTime = 0.1) annotation(Placement(visible = true, transformation(origin = {38.371, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(currentSensor1.p, voltageSensor1.p) annotation(Line(visible = true, origin = {14.66, -53.506}, points = {{0.209, 7.824}, {0.209, -3.912}, {-0.418, -3.912}}, color = {0, 0, 255}));
  connect(currentSensor1.currSignal, mppt1.i) annotation(Line(visible = true, origin = {41.376, -32.773}, points = {{-14.501, 0.061}, {3.626, 0.061}, {3.626, -0.061}, {7.249, -0.061}}, color = {255, 0, 0}));
  connect(voltageSensor1.voltSignal, mppt1.u) annotation(Line(visible = true, origin = {28.556, -43.814}, points = {{-26.528, -2.184}, {-26.528, 1.61}, {16.446, 1.61}, {16.446, -0.517}, {20.163, -0.517}}, color = {255, 0, 0}));
  connect(mppt1.y, boostControl1.V_ref) annotation(Line(visible = true, origin = {85.493, -24.56}, points = {{-12.518, -14.244}, {6.259, -14.244}, {6.259, 28.488}}, color = {0, 128, 0}));
  connect(boostControl1.DutyRatio, Boost.DutyRatio) annotation(Line(visible = true, origin = {39.354, 59.013}, points = {{45.996, -26.973}, {46.048, 0.531}, {46.048, 0.987}, {46.048, 10.563}, {-65.507, 10.563}, {-65.507, -14.013}, {-53.904, -14.013}}, color = {0, 128, 0}));
  connect(V_dc.p, Boost.Output_p) annotation(Line(visible = true, origin = {14.485, 71.154}, points = {{-2.364, 13.694}, {3.667, 13.694}, {3.667, -7.817}, {-2.485, -7.817}, {-2.485, -11.754}}, color = {0, 0, 255}));
  connect(V_dc.n, Boost.Output_n) annotation(Line(visible = true, origin = {-14.485, 71.154}, points = {{2.364, 13.694}, {-3.667, 13.694}, {-3.667, -7.817}, {2.485, -7.817}, {2.485, -11.754}}, color = {0, 0, 255}));
  connect(Boost.Input_p, resistor1.n) annotation(Line(visible = true, origin = {17.465, 28.044}, points = {{-5.465, 2.556}, {-5.465, 0.148}, {5.465, 0.148}, {5.465, -2.852}}, color = {0, 0, 255}));
  connect(resistor1.p, currentSensor1.n) annotation(Line(visible = true, origin = {18.899, -11.202}, points = {{4.03, 20.394}, {4.03, -5.798}, {-4.03, -5.798}, {-4.03, -8.798}}, color = {0, 0, 255}));
  connect(voltageSensor1.voltSignal, boostControl1.V_measured) annotation(Line(visible = true, origin = {40.514, -13.092}, points = {{-38.486, -32.906}, {-38.486, 7.944}, {38.486, 7.944}, {38.486, 17.017}}, color = {255, 0, 0}));
  connect(capacitor1.p, resistor1.p) annotation(Line(visible = true, origin = {17.901, 5.577}, points = {{-10.058, -1.808}, {5.029, -1.808}, {5.029, 3.615}}, color = {0, 0, 255}));
  connect(Temperature.y, PV1.T) annotation(Line(visible = true, origin = {-11.125, -109.095}, points = {{-7.875, -3.315}, {3.937, -3.315}, {3.937, 6.629}}, color = {1, 37, 163}));
  connect(Boost.Input_n, capacitor1.n) annotation(Line(visible = true, origin = {-12.515, 18.293}, points = {{0.515, 12.307}, {0.515, 8.37}, {-2.063, 8.37}, {-2.063, -14.524}, {3.095, -14.524}}, color = {0, 0, 255}));
  connect(capacitor1.n, voltageSensor1.n) annotation(Line(visible = true, origin = {-12.191, -26.825}, points = {{2.77, 30.593}, {-2.387, 30.593}, {-2.387, -30.593}, {2.005, -30.593}}, color = {0, 0, 255}));
  connect(ground1.p, V_dc.n) annotation(Line(visible = true, origin = {-20.486, 84.305}, points = {{-13.033, -0.543}, {2.334, -0.543}, {2.334, 0.543}, {8.364, 0.543}}, color = {0, 0, 255}));
  connect(PV1.p, voltageSensor1.p) annotation(Line(visible = true, origin = {14.794, -73.942}, points = {{-2.482, -16.524}, {1.517, -16.524}, {1.517, 16.524}, {-0.552, 16.524}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, PV1.n) annotation(Line(visible = true, origin = {-13.313, -73.942}, points = {{3.127, 16.524}, {-2.375, 16.524}, {-2.375, -16.524}, {1.625, -16.524}}, color = {0, 0, 255}));
  connect(trapezoid1.y, PV1.Irr) annotation(Line(visible = true, origin = {14.332, -107.489}, points = {{13.04, -2.511}, {-6.52, -2.511}, {-6.52, 5.023}}, color = {1, 37, 163}));
  annotation(experiment(StopTime = 0.4), Diagram(coordinateSystem(extent = {{-160, -134.3}, {160, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end PV_Example;
