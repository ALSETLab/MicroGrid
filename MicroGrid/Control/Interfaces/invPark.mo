within MicroGrid.Control.Interfaces;
model invPark "Inverse Park transformation block."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  import Modelica.Constants.pi;
  SignalBus Delta annotation(Placement(visible = true, transformation(origin = {0, -95}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-0, -94.841}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_d annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.165, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_q annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.559, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_alfa annotation(Placement(visible = true, transformation(origin = {95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {91.9, 42.588}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_beta annotation(Placement(visible = true, transformation(origin = {95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {91.726, -37.412}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  v_alfa.sensorSignal = v_d.sensorSignal * Modelica.Math.cos(Delta.sensorSignal) - v_q.sensorSignal * Modelica.Math.sin(Delta.sensorSignal);
  v_beta.sensorSignal = v_d.sensorSignal * Modelica.Math.sin(Delta.sensorSignal) + v_q.sensorSignal * Modelica.Math.cos(Delta.sensorSignal);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {30, -35.061}, extent = {{-41.162, -43.218}, {41.162, 43.218}}, textString = "alfa-beta"), Text(visible = true, origin = {-35.571, 43.704}, extent = {{-19.215, -20.175}, {19.215, 20.175}}, textString = "dq")}));
end invPark;
