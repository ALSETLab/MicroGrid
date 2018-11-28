within MicroGrid.Electrical.BasicComponents;
model diode "basic diode"
  extends MicroGrid.Electrical.Interfaces.OnePort;
  parameter Modelica.SIunits.Resistance r_on(final min=0) = 1.E-5 "Forward ON state resistance";
  parameter Modelica.SIunits.Conductance g_off(final min=0) = 0 "Backward OFF state conductance";
  parameter Modelica.SIunits.Voltage v_knee(final min=0) = 0 "Forward threshold voltage";
protected
  Boolean off(start=true) "Switching off-state indicator";
  Real s(start=0, final unit="1") "Auxiliary variable for actual position on the diode characteristic";
  constant Modelica.SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
  constant Modelica.SIunits.Current unitCurrent=1 annotation (HideResult=true);
equation
  off = s < 0;
  v = (s*unitCurrent)*(if off then 1 else r_on) + v_knee;
  i = (s*unitVoltage)*(if off then g_off else 1) + g_off*v_knee;
 annotation (
 Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),graphics={
    Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}},lineColor={0,0,0},fillColor={255,255,255},
            fillPattern =                                                                                   FillPattern.Solid),
       Line(points={{-90,0},{40,0}}, color={0,0,255}),
       Line(points={{40,0},{90,0}}, color={0,0,255}),
       Line(points={{30,40},{30,-40}}, color={0,0,255}),
       Text(extent={{-150,-40},{150,-80}},textString="%name",lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),graphics={
       Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}},lineColor={0,0,0},fillColor={255,255,255},
            fillPattern =                                                                                      FillPattern.Solid),
       Line(points={{-80,0},{40,0}}, color={0,0,255}),
       Line(points={{40,0},{80,0}}, color={0,0,255}),
       Line(points={{30,40},{30,-40}}, color={0,0,255})}));
end diode;
