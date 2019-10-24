within MicroGrid.Control.PhaseLockedLoop.Utilities;
block IntegratorWithReset "Integrator with Automatic Reset for PLLs"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  import Modelica.Constants.pi;
  parameter Real k(unit="1")=1 "Integrator gain";
  parameter Real y_start=0 "Initial or guess value of output (= state)" annotation (Dialog(group="Initialization"));
initial equation
  y = y_start;
equation
  der(y) = k*u;
  when y > 2*pi then
    reinit(y,y_start);
  end when;
  annotation(Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
          Line(
            points={{-80.0,78.0},{-80.0,-90.0}},
            color={192,192,192}),
          Polygon(
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
          Line(
            points={{-90.0,-80.0},{82.0,-80.0}},
            color={192,192,192}),
          Polygon(
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
          Text(
            lineColor={192,192,192},
            extent={{0.0,-70.0},{60.0,-10.0}},
            textString="I"),
          Text(
            extent={{-150.0,-150.0},{150.0,-110.0}},
            textString="k=%k"),
          Line(
            points={{-80.0,-80.0},{80.0,80.0}},
            color={0,0,127})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={0,0,255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),
        Text(
          extent={{-36,60},{32,2}},
          lineColor={0,0,0},
          textString="k"),
        Text(
          extent={{-32,0},{36,-58}},
          lineColor={0,0,0},
          textString="s"),
        Line(points={{-46,0},{46,0}})}));
end IntegratorWithReset;
