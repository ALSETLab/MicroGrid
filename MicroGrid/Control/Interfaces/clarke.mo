within MicroGrid.Control.Interfaces;
model clarke "Clarke transformation block."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  import Modelica.Constants.pi;
  SignalBus v_alfa annotation(Placement(visible = true, transformation(origin = {95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.303, 34.008}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_beta annotation(Placement(visible = true, transformation(origin = {95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.774, -33.225}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MicroGrid.Sensors.Interfaces.SignalBus v_A annotation(Placement(visible = true, transformation(origin = {-95, 70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.51, 64.722}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MicroGrid.Sensors.Interfaces.SignalBus v_B annotation(Placement(visible = true, transformation(origin = {-95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.986, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MicroGrid.Sensors.Interfaces.SignalBus v_C annotation(Placement(visible = true, transformation(origin = {-95, -70}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-92.51, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  v_alfa.sensorSignal = 2 / 3 * (v_A.sensorSignal - 1 / 2 * v_B.sensorSignal - 1 / 2 * v_C.sensorSignal);
  v_beta.sensorSignal = 2 / 3 * (sqrt(3) / 2 * v_B.sensorSignal - sqrt(3) / 2 * v_C.sensorSignal);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {31.162, -33.218}, extent = {{-41.162, -43.218}, {41.162, 43.218}}, textString = "alfa-beta"), Text(visible = true, origin = {-30.792, 40}, extent = {{-29.208, -30.667}, {29.208, 30.667}}, textString = "abc")}));
end clarke;
