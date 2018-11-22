within MicroGrid.Electrical.Interfaces;
partial model OnePort
  "Electrical component with two electrical pins, one positive and one negative."
  Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.SIunits.Current i "Current flowing from pin p to pin n";
  MicroGrid.Electrical.Interfaces.PositivePin p "Potential p.v greater than potential n.v"
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  MicroGrid.Electrical.Interfaces.NegativePin n
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
equation
  // Current enter by the positive pin:
  i = p.i;
  // Kirchhoff's First Law:
  p.i+n.i=0;
  // Voltage drop betweem pins:
  p.v-n.v = v;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end OnePort;
