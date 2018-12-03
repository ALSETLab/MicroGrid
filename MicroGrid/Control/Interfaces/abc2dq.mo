within MicroGrid.Control.Interfaces;

model abc2dq
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  SignalBus v_A annotation(Placement(visible = true, transformation(origin = {-95, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-90, 64.722}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_B annotation(Placement(visible = true, transformation(origin = {-95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-90, -3.051}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_C annotation(Placement(visible = true, transformation(origin = {-95, -65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus Delta annotation(Placement(visible = true, transformation(origin = {0, -95}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-0, -94.841}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_d annotation(Placement(visible = true, transformation(origin = {95, 35}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.331, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_q annotation(Placement(visible = true, transformation(origin = {95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {91.506, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-35.753, 33.184}, extent = {{-25.753, -16.816}, {25.753, 16.816}}, textString = "abc"), Text(visible = true, origin = {30, -30}, extent = {{-25.753, -16.816}, {25.753, 16.816}}, textString = "dq")}));
end abc2dq;
