within MicroGrid.Control.Interfaces;
model Real2Control

  MicroGrid.Control.Interfaces.SignalBus InputReal annotation (Placement(
        transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{
            90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput OutputSignal
    annotation (Placement(transformation(extent={{-104,-10},{-84,10}})));
equation
  InputSignal = OutputReal;

  annotation (Icon(graphics={
        Rectangle(
          extent={{-92,28},{92,-28}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Polygon(points={{-80,0},{-80,0}}, lineColor={0,140,72}),
        Polygon(
          points={{90,0},{72,2},{-86,18},{-86,-20},{90,0}},
          lineColor={0,140,72},
          fillColor={0,140,72},
          fillPattern=FillPattern.CrossDiag)}));
end Real2Control;
