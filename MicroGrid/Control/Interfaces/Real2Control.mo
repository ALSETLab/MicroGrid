within MicroGrid.Control.Interfaces;
model Real2Control

  MicroGrid.Control.Interfaces.SignalBus OutputSignal annotation (Placement(
        transformation(extent={{82,-14},{106,12}}), iconTransformation(extent={{86,-10},
            {106,10}})));
  Modelica.Blocks.Interfaces.RealInput InputReal
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
equation
  OutputSignal.sensorSignal = InputReal;

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
