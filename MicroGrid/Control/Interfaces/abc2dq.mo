within MicroGrid.Control.Interfaces;

model abc2dq "Transformation block from abc-frame to dq-frame."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  import Modelica.Constants.pi;
  MicroGrid.Sensors.Interfaces.SignalBus v_A annotation(Placement(visible = true, transformation(origin = {-95, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.51, 64.722}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MicroGrid.Sensors.Interfaces.SignalBus v_B annotation(Placement(visible = true, transformation(origin = {-95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.51, -3.051}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MicroGrid.Sensors.Interfaces.SignalBus v_C annotation(Placement(visible = true, transformation(origin = {-95, -70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.51, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus Delta annotation(Placement(visible = true, transformation(origin = {0, -95}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-0, -94.841}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_d annotation(Placement(visible = true, transformation(origin = {95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.331, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_q annotation(Placement(visible = true, transformation(origin = {95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {91.506, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  v_d.sensorSignal = 2 / 3 * (v_A.sensorSignal * Modelica.Math.cos(Delta.sensorSignal) + v_B.sensorSignal * Modelica.Math.cos(Delta.sensorSignal - 2 * pi / 3) + v_C.sensorSignal * Modelica.Math.cos(Delta.sensorSignal - 4 * pi / 3));
  v_q.sensorSignal = 2 / 3 * (v_A.sensorSignal * Modelica.Math.sin(Delta.sensorSignal) + v_B.sensorSignal * Modelica.Math.sin(Delta.sensorSignal - 2 * pi / 3) + v_C.sensorSignal * Modelica.Math.sin(Delta.sensorSignal - 4 * pi / 3));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-34.494, 40}, extent = {{-37.051, -24.194}, {37.051, 24.194}}, textString = "abc"), Text(visible = true, origin = {30, -35.709}, extent = {{-37.2, -24.291}, {37.2, 24.291}}, textString = "dq")}));
end abc2dq;
