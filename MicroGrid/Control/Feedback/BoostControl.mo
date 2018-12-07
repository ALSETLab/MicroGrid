within MicroGrid.Control.Feedback;

model BoostControl
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Real Gain = 1;
  parameter Real TimeCons = 1;
  Interfaces.SignalBus V_ref annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.53, -45.016}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.SignalBus DutyRatio annotation(Placement(visible = true, transformation(origin = {95.084, 0}, extent = {{-14.916, -14.916}, {14.916, 14.916}}, rotation = 0), iconTransformation(origin = {94.881, -2.333}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.Control2Real control2Real1 annotation(Placement(visible = true, transformation(origin = {-65, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Sensors.Interfaces.SignalBus V_measured annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.547, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.Interfaces.Sensor2Real sensor2Real1 annotation(Placement(visible = true, transformation(origin = {-65, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-25, -40}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI PI(k = Gain, T = TimeCons) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Interfaces.Real2Control real2Control1 annotation(Placement(visible = true, transformation(origin = {60, -0}, extent = {{-15.041, -15.041}, {15.041, 15.041}}, rotation = 0)));
equation
  connect(sensor2Real1.OutputReal, feedback1.u2) annotation(Line(visible = true, origin = {-33.333, 17.333}, points = {{-16.667, 22.667}, {8.333, 22.667}, {8.333, -45.333}}, color = {1, 37, 163}));
  connect(control2Real1.OutputReal, feedback1.u1) annotation(Line(visible = true, origin = {-43.5, -40}, points = {{-6.5, 0}, {6.5, 0}}, color = {1, 37, 163}));
  connect(V_ref, control2Real1.InputSignal) annotation(Line(visible = true, origin = {-89.55, -40.1}, points = {{-5.45, 0.1}, {-5.45, -0.05}, {10.9, -0.05}}, color = {0, 128, 0}));
  connect(V_measured, sensor2Real1.InputSignal) annotation(Line(visible = true, origin = {-89.55, 39.9}, points = {{-5.45, 0.1}, {-5.45, -0.05}, {10.9, -0.05}}, color = {255, 0, 0}));
  connect(PI.y, real2Control1.InputReal) annotation(Line(visible = true, origin = {41.482, 0}, points = {{-4.982, 0}, {4.982, -0}}, color = {1, 37, 163}));
  connect(real2Control1.OutputSignal, DutyRatio) annotation(Line(visible = true, origin = {81.927, 0.075}, points = {{-7.639, 0.075}, {-2.759, 0.075}, {-2.759, -0.075}, {13.157, -0.075}}, color = {0, 128, 0}));
  connect(feedback1.y, PI.u) annotation(Line(visible = true, origin = {-5.875, -20}, points = {{-5.625, -20}, {-1.125, -20}, {-1.125, 20}, {7.875, 20}}, color = {1, 37, 163}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {4.214, -1.926}, extent = {{-65.786, -38.074}, {65.786, 38.074}}, textString = "BoostControl")}));
end BoostControl;
