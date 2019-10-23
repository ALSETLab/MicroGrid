within MicroGrid.Control.Interfaces;
model invClarke "Inverse Clarke transformation block."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  import Modelica.Constants.pi;
  SignalBus v_alfa annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.93, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_beta annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.965, -38.245}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_A annotation(Placement(visible = true, transformation(origin = {93.445, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.723, 63.514}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_B annotation(Placement(visible = true, transformation(origin = {95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.719, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_C annotation(Placement(visible = true, transformation(origin = {95, -70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.719, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  v_A.sensorSignal = v_alfa.sensorSignal;
  v_B.sensorSignal = (-1 / 2) * v_alfa.sensorSignal + sqrt(3) / 2 * v_beta.sensorSignal;
  v_C.sensorSignal = (-1 / 2) * v_alfa.sensorSignal - sqrt(3) / 2 * v_beta.sensorSignal;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {-25.601, 30}, extent = {{-41.162, -43.218}, {41.162, 43.218}}, textString = "alfa-beta"), Text(visible = true, origin = {39.208, -39.333}, extent = {{-29.208, -30.667}, {29.208, 30.667}}, textString = "abc")}));
end invClarke;
