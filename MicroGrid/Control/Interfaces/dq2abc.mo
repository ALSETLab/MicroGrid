within MicroGrid.Control.Interfaces;

model dq2abc "Transformation block from abc-frame to dq-frame."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  import Modelica.Constants.pi;
  SignalBus v_A annotation(Placement(visible = true, transformation(origin = {93.445, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.723, 63.514}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_B annotation(Placement(visible = true, transformation(origin = {95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.719, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_C annotation(Placement(visible = true, transformation(origin = {95, -70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.719, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus Delta annotation(Placement(visible = true, transformation(origin = {0, -95}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-0, -94.841}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_d annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-94.404, 37.992}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_q annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.221, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  v_A.sensorSignal = v_d.sensorSignal * Modelica.Math.cos(Delta.sensorSignal) + v_q.sensorSignal * Modelica.Math.sin(Delta.sensorSignal);
  v_B.sensorSignal = v_d.sensorSignal * Modelica.Math.cos(Delta.sensorSignal - 2 * pi / 3) + v_q.sensorSignal * Modelica.Math.sin(Delta.sensorSignal - 2 * pi / 3);
  v_C.sensorSignal = v_d.sensorSignal * Modelica.Math.cos(Delta.sensorSignal - 4 * pi / 3) + v_q.sensorSignal * Modelica.Math.sin(Delta.sensorSignal - 4 * pi / 3);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {38.932, -33.184}, extent = {{-41.068, -26.816}, {41.068, 26.816}}, textString = "abc"), Text(visible = true, origin = {-32.082, 40}, extent = {{-39.651, -25.891}, {39.651, 25.891}}, textString = "dq")}));
end dq2abc;
