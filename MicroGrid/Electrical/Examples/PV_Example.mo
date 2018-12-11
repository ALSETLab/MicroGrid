within MicroGrid.Electrical.Examples;

model PV_Example
  extends Modelica.Icons.Example;
  PhotoVoltaics.PV_module PV(redeclare replaceable record moduleData = PhotoVoltaics.Records.LG360N2W_B3) annotation(Placement(visible = true, transformation(origin = {-2.34, -65}, extent = {{15, -15}, {-15, 15}}, rotation = 360)));
  Converters.SwitchedBoost Boost annotation(Placement(visible = true, transformation(origin = {-0.831, 25.829}, extent = {{15, -15}, {-15, 15}}, rotation = 270)));
  Sensors.voltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {-0.831, -31.952}, extent = {{12.214, 12.214}, {-12.214, -12.214}}, rotation = 0)));
  Sensors.currentSensor currentSensor1 annotation(Placement(visible = true, transformation(origin = {12.01, -7.375}, extent = {{12.841, 12.841}, {-12.841, -12.841}}, rotation = -90)));
  Control.RefGenerators.mppt mppt1 annotation(Placement(visible = true, transformation(origin = {56.339, -14.781}, extent = {{12.829, -12.829}, {-12.829, 12.829}}, rotation = 180)));
  Control.Feedback.BoostControl boostControl1 annotation(Placement(visible = true, transformation(origin = {85, 17.808}, extent = {{15, 15}, {-15, -15}}, rotation = 270)));
  Sources.voltageDC V_dc(V = 400) annotation(Placement(visible = true, transformation(origin = {0, 84.848}, extent = {{15.152, -15.152}, {-15.152, 15.152}}, rotation = 0)));
equation
  connect(Boost.Input_p, currentSensor1.n) annotation(Line(visible = true, origin = {11.589, 7.456}, points = {{-0.42, 3.973}, {-0.42, -0.991}, {0.42, -0.991}, {0.421, -1.99}}, color = {0, 0, 255}));
  connect(currentSensor1.p, voltageSensor1.p) annotation(Line(visible = true, origin = {11.801, -28.04}, points = {{0.209, 7.824}, {0.209, -3.912}, {-0.418, -3.912}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, Boost.Input_n) annotation(Line(visible = true, origin = {-14.16, -7.499}, points = {{1.115, -24.453}, {-1.886, -24.453}, {-1.886, 14.99}, {1.329, 14.99}, {1.329, 18.928}}, color = {0, 0, 255}));
  connect(currentSensor1.currSignal, mppt1.i) annotation(Line(visible = true, origin = {37.279, -8.029}, points = {{-13.264, 0.782}, {3.214, 0.782}, {3.214, -0.782}, {6.838, -0.782}}, color = {255, 0, 0}));
  connect(voltageSensor1.voltSignal, mppt1.u) annotation(Line(visible = true, origin = {24.707, -18.925}, points = {{-25.539, -1.607}, {-25.539, 2.187}, {15.787, 2.187}, {15.787, -1.384}, {19.504, -1.384}}, color = {255, 0, 0}));
  connect(voltageSensor1.voltSignal, boostControl1.V_measured) annotation(Line(visible = true, origin = {38.668, -24.539}, points = {{-39.5, 4.007}, {-39.5, -17.413}, {39.5, -17.413}, {40.332, 28.465}}, color = {255, 0, 0}));
  connect(mppt1.y, boostControl1.V_ref) annotation(Line(visible = true, origin = {83.991, -8.545}, points = {{-15.523, -6.236}, {7.761, -6.236}, {7.761, 12.473}}, color = {0, 128, 0}));
  connect(voltageSensor1.p, PV.n) annotation(Line(visible = true, origin = {2.481, -52.173}, points = {{8.902, 20.221}, {11.902, 20.221}, {11.902, -13.807}, {-16.353, -13.807}, {-16.821, -12.827}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, PV.n) annotation(Line(visible = true, origin = {-15.386, -48.476}, points = {{2.341, 16.524}, {-2.864, 16.524}, {-2.864, -16.524}, {1.047, -16.524}}, color = {0, 0, 255}));
  connect(V_dc.n, Boost.Output_n) annotation(Line(visible = true, origin = {-14.818, 59.652}, points = {{2.696, 25.196}, {-3.334, 25.196}, {-3.334, -15.485}, {1.986, -15.485}, {1.986, -19.423}}, color = {0, 0, 255}));
  connect(V_dc.p, Boost.Output_p) annotation(Line(visible = true, origin = {14.153, 59.652}, points = {{-2.031, 25.196}, {3.999, 25.196}, {3.999, -15.485}, {-2.984, -15.485}, {-2.984, -19.423}}, color = {0, 0, 255}));
  connect(boostControl1.DutyRatio, Boost.DutyRatio) annotation(Line(visible = true, origin = {39.302, 35.295}, points = {{46.048, -3.256}, {46.048, 0.531}, {46.8, 0.531}, {46.8, 10.563}, {-65.507, 10.563}, {-65.507, -9.466}, {-54.683, -9.466}}, color = {0, 128, 0}));
  annotation(Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end PV_Example;
