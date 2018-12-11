within MicroGrid.Control.Feedback;

model BoostControl
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Real Gain = 1;
  parameter Real TimeCons = 1;
  Interfaces.SignalBus V_ref annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.53, -45.016}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.SignalBus DutyRatio annotation(Placement(visible = true, transformation(origin = {155.084, 0}, extent = {{-14.916, -14.916}, {14.916, 14.916}}, rotation = 0), iconTransformation(origin = {94.881, -2.333}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Control2Real control2Real1 annotation(Placement(visible = true, transformation(origin = {-65, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Sensors.Interfaces.SignalBus V_measured annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.547, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.Interfaces.Sensor2Real sensor2Real1 annotation(Placement(visible = true, transformation(origin = {-65, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-7.197, -0}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI PI(k = Gain, T = TimeCons, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {33.07, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.Real2Control real2Control1 annotation(Placement(visible = true, transformation(origin = {122.779, -0}, extent = {{-15.041, -15.041}, {15.041, 15.041}}, rotation = -360)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation(Placement(visible = true, transformation(origin = {82.826, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(V_ref, control2Real1.InputSignal) annotation(Line(visible = true, origin = {-89.55, -40.1}, points = {{-5.45, 0.1}, {-5.45, -0.05}, {10.9, -0.05}}, color = {0, 128, 0}));
  connect(V_measured, sensor2Real1.InputSignal) annotation(Line(visible = true, origin = {-89.55, 39.9}, points = {{-5.45, 0.1}, {-5.45, -0.05}, {10.9, -0.05}}, color = {255, 0, 0}));
  connect(real2Control1.OutputSignal, DutyRatio) annotation(Line(visible = true, origin = {142.622, 0.075}, points = {{-5.554, 0.075}, {-3.454, 0.075}, {-3.454, -0.075}, {12.462, -0.075}}, color = {0, 128, 0}));
  connect(sensor2Real1.OutputReal, feedback1.u2) annotation(Line(visible = true, origin = {-21.465, 30.667}, points = {{-28.535, 9.333}, {14.268, 9.333}, {14.268, -18.667}}, color = {1, 37, 163}));
  connect(control2Real1.OutputReal, feedback1.u1) annotation(Line(visible = true, origin = {-34.714, -20}, points = {{-15.286, -20}, {-0.115, -20}, {-0.115, 20}, {15.517, 20}}, color = {1, 37, 163}));
  connect(feedback1.y, PI.u) annotation(Line(visible = true, origin = {10.686, -0}, points = {{-4.384, -0}, {4.384, 0}}, color = {1, 37, 163}));
  connect(PI.y, gain1.u) annotation(Line(visible = true, origin = {60.198, -0}, points = {{-10.628, 0}, {10.628, -0}}, color = {1, 37, 163}));
  connect(gain1.y, real2Control1.InputReal) annotation(Line(visible = true, origin = {101.534, -0}, points = {{-7.708, 0}, {7.708, -0}}, color = {1, 37, 163}));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {160, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {4.214, -1.926}, extent = {{-65.786, -38.074}, {65.786, 38.074}}, textString = "BoostControl")}));
end BoostControl;
