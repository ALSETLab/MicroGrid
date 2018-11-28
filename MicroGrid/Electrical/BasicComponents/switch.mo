within MicroGrid.Electrical.BasicComponents;
model switch "basic switch"
  extends MicroGrid.Electrical.Interfaces.OnePort;
  Modelica.Blocks.Interfaces.BooleanInput control
    "true => switch is closed, false => switch is open" annotation (Placement(
        transformation(
        origin={0,70},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  parameter Modelica.SIunits.Resistance r_on(final min=0) = 1.E-5 "Forward ON state resistance";
  parameter Modelica.SIunits.Conductance g_off(final min=0) = 0 "Backward OFF state conductance";
protected
  Boolean off "Indicates off-state";
  Real s(final unit="1") "Auxiliary variable for actual position on the switch characteristic";
  Modelica.SIunits.Voltage unitVoltage=1 annotation (HideResult=true);
  Modelica.SIunits.Current unitCurrent=1 annotation (HideResult=true);
equation
  off = not control;
  v = (s*unitCurrent)*(if off then 1 else r_on);
  i = (s*unitVoltage)*(if off then g_off else 1);
  annotation (
  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
        Line(points={{-80,0},{-44,0}}, color={0,0,255}),
        Line(points={{-37,2},{40,50}}, color={0,0,255}),
        Line(points={{40,0},{80,0}}, color={0,0,255})}),
  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
        Line(points={{-90,0},{-44,0}}, color={0,0,255}),
        Line(points={{-37,2},{40,50}}, color={0,0,255}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Text(extent={{-150,-30},{150,-70}}, textString="%name",lineColor={0,0,255})}));
end switch;
