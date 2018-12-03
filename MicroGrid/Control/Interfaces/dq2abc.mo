within MicroGrid.Control.Interfaces;

model dq2abc
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  SignalBus v_A annotation(Placement(visible = true, transformation(origin = {95, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93.723, 63.514}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_B annotation(Placement(visible = true, transformation(origin = {95, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.719, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_C annotation(Placement(visible = true, transformation(origin = {95, -65}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {92.719, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus Delta annotation(Placement(visible = true, transformation(origin = {0, -95}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-0, -94.841}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_d annotation(Placement(visible = true, transformation(origin = {-95, 40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-94.404, 37.992}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SignalBus v_q annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-93.221, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {30, -23.184}, extent = {{-25.753, -16.816}, {25.753, 16.816}}, textString = "abc"), Text(visible = true, origin = {-34.247, 36.816}, extent = {{-25.753, -16.816}, {25.753, 16.816}}, textString = "dq")}));
end dq2abc;
