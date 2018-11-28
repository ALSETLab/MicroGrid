within MicroGrid.Electrical.BasicComponents;
model inductor "Ideal inductor"
 extends MicroGrid.Electrical.Interfaces.OnePort(i(start=0));
 parameter Modelica.SIunits.Inductance L=1 "Inductance";
equation
 L*der(i) = v; // Faraday law
 annotation (
 Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
 Line(points={{-60,0},{-60,6},{-51,15},{-45,15},{-39,15},{-30,6},{-30,0}}, color={0,0,255}, smooth=Smooth.Bezier),
 Line(points={{-30,0},{-30,6},{-21,15},{-15,15},{-9,15},{0,6},{0,0}}, color={0,0,255}, smooth=Smooth.Bezier),
 Line(points={{0,0},{0,6},{9,15},{15,15},{21,15},{30,6},{30,0}}, color={0,0,255}, smooth=Smooth.Bezier),
 Line(points={{30,0},{30,6},{39,15},{45,15},{51,15},{60,6},{60,0}}, color={0,0,255}, smooth=Smooth.Bezier),
        Line(points={{60,0},{90,0}}, color={0,0,255}),
        Line(points={{-90,0},{-60,0}}, color={0,0,255}),
        Text(
          extent={{-138,-60},{144,-94}},
          lineColor={0,0,0},
          textString="L=%L"),
        Text(
          extent={{-152,79},{148,39}},
          textString="%name",
          lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
   Line(points={{-60,0},{-60,6},{-51,15},{-45,15},{-39,15},{-30,6},{-30,0}}, color={0,0,255}, smooth=Smooth.Bezier),
   Line(points={{-30,0},{-30,6},{-21,15},{-15,15},{-9,15},{0,6},{0,0}}, color={0,0,255}, smooth=Smooth.Bezier),
   Line(points={{0,0},{0,6},{9,15},{15,15},{21,15},{30,6},{30,0}}, color={0,0,255}, smooth=Smooth.Bezier),
   Line(points={{30,0},{30,6},{39,15},{45,15},{51,15},{60,6},{60,0}}, color={0,0,255}, smooth=Smooth.Bezier),
   Line(points={{60,0},{80,0}}, color={0,0,255}),
   Line(points={{-80,0},{-60,0}}, color={0,0,255})}));
end inductor;
