within MicroGrid.Electrical.Sources;
model voltageDC "DC Voltage Source"
  parameter Modelica.SIunits.Voltage V(start=1) "Voltage value";
  extends MicroGrid.Electrical.Interfaces.OnePort;

equation
  v = V;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-90,0},{-10,0}}, color={0,0,255}),
        Line(points={{-10,60},{-10,-60}}, color={0,0,255}),
        Line(points={{0,30},{0,-30}}, color={0,0,255}),
        Line(points={{0,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,-112},{150,-72}},
          textString="%name=%V",
          lineColor={0,0,255}),
        Text(
          extent={{-120,50},{-20,0}},
          lineColor={0,0,255},
          textString="+"),
        Text(
          extent={{20,50},{120,0}},
          lineColor={0,0,255},
          textString="-")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Line(points={{-96,0},{-10,0}}, color={0,0,
          255}),Line(points={{-10,60},{-10,-60}}, color={0,0,255}),Line(
          points={{0,30},{0,-30}}, color={0,0,255}),Line(points={{0,0},{96,0}},
          color={0,0,255})}));
end voltageDC;
