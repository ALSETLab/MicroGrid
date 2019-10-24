within MicroGrid.Control.RefGenerators;
model mppt
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  Sensors.Interfaces.SignalBus u annotation(Placement(visible = true, transformation(origin = {-95.876, 40}, extent = {{-15.876, -15.876}, {15.876, 15.876}}, rotation = 0), iconTransformation(origin = {-94.539, 43.086}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.Interfaces.SignalBus i annotation(Placement(visible = true, transformation(origin = {-95, -40}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-95.269, -46.532}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.SignalBus y annotation(Placement(visible = true, transformation(origin = {95, -0}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {94.539, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real Ts;
  parameter Real deltaVpvRefPanel;
  Real pot;
  Real potActFiltered;
  discrete Real potact;
  discrete Real potprev;
  discrete Real prevu;
  discrete Real actu;
  discrete Real deltau;
  discrete Real deltap;
  discrete Real vref(start = 30);
equation
  pot = u.sensorSignal * i.sensorSignal;
  der(potActFiltered) = (pot - potActFiltered) * 100;
  y.sensorSignal = pre(vref);
algorithm
  when sample(0, Ts) then
    potprev := potact;
    potact := potActFiltered;
    prevu := actu;
    actu := u.sensorSignal;
    deltau := actu - prevu;
    deltap := potact - potprev;
    if abs(deltau) > 0.1 * deltaVpvRefPanel then
      if abs(deltap) > 0.2 then
        if deltap / deltau > 0 then
          vref := vref + deltaVpvRefPanel;
        end if;
        if deltap / deltau < 0 then
          vref := vref - deltaVpvRefPanel;
        end if;
      end if;
    end if;
  end when;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics={  Rectangle(visible = true, origin = {0, -1.101}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid,
            lineThickness =                                                                                                                                                                                                        0.75, extent = {{-80, -81.101}, {80, 81.101}}), Line(visible = true, points = {{-34, -34}, {-10, 4}, {14, 30}, {32, 30}, {36, -32}}, smooth = Smooth.Bezier), Ellipse(visible = true, fillColor = {255, 0, 0}, pattern = LinePattern.None,
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{14, 24}, {26, 36}})}), Diagram(coordinateSystem(preserveAspectRatio = false)));
end mppt;
