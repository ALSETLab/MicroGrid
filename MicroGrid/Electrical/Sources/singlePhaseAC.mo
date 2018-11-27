within MicroGrid.Electrical.Sources;
model singlePhaseAC "Single Phase AC Voltage Source"
  parameter Modelica.SIunits.Voltage V(start=1) "Amplitude of voltage waveform";
  parameter Modelica.SIunits.Angle phase=0 "Phase of voltage waveform";
  parameter Modelica.SIunits.Frequency freq(start=1) "Frequency of voltage waveform";
  extends MicroGrid.Electrical.Interfaces.OnePort;

equation
  v = V*Modelica.Math.sin(2*pi*freq*time + phase);
   annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-50,0}}, color={0,0,0}),
        Line(points={{50,0},{90,0}}, color={0,0,0}),
        Line(points={{-50,0},{50,0}}, color={0,0,0}),
        Text(
          extent={{-150,-104},{150,-64}},
          textString="%name",
          lineColor={0,0,255}),Line(points={{-66,0},{-56.2,29.9},{-49.8,46.5},
              {-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},
              {-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{
              19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,
              -67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}},
            color={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-50,0}}, color={0,0,0}),
        Line(points={{50,0},{90,0}}, color={0,0,0}),
        Line(points={{-50,0},{50,0}}, color={0,0,0}),
        Line(points={{-66,0},{-56.2,29.9},{-49.8,46.5},
              {-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},
              {-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{
              19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,
              -67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}},
            color={0,0,0})}));
end singlePhaseAC;
