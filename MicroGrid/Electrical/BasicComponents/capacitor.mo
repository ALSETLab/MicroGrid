within MicroGrid.Electrical.BasicComponents;
model capacitor "Ideal capacitor"
  extends MicroGrid.Electrical.Interfaces.OnePort(v(start=0));
  parameter Modelica.SIunits.Capacitance C=1 "Capacitance";
equation
  i = C*der(v);
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-6,28},{-6,-28}}, color={0,0,255}),
        Line(points={{6,28},{6,-28}}, color={0,0,255}),
        Line(points={{-90,0},{-6,0}}, color={0,0,255}),
        Line(points={{6,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-136,-60},{136,-92}},
          lineColor={0,0,0},
          textString="C=%C"),
        Text(
          extent={{-150,85},{150,45}},
          textString="%name",
          lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Line(
            points={{-20,40},{-20,-40}},
            thickness=0.5,
            color={0,0,255}),Line(
            points={{20,40},{20,-40}},
            thickness=0.5,
            color={0,0,255}),Line(points={{-96,0},{-20,0}}, color={0,0,255}),
          Line(points={{20,0},{96,0}}, color={0,0,255})}));
end capacitor;