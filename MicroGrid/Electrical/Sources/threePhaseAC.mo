within MicroGrid.Electrical.Sources;
model threePhaseAC "Three Phase AC Voltage Source"

  Interfaces.PositivePin p1
    annotation (Placement(transformation(extent={{-106,50},{-86,70}})));
  Interfaces.PositivePin p2
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  Interfaces.PositivePin p3
    annotation (Placement(transformation(extent={{-106,-70},{-86,-50}})));
  singlePhaseAC Phase1
    annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
  singlePhaseAC Phase2
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  singlePhaseAC Phase3
    annotation (Placement(transformation(extent={{-58,-70},{-38,-50}})));
  Interfaces.NegativePin gnd
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
equation
  connect(p1, p1)
    annotation (Line(points={{-96,60},{-96,60}}, color={0,0,255}));
  connect(Phase1.p, p1)
    annotation (Line(points={{-55.6,60},{-96,60}}, color={0,0,255}));
  connect(Phase2.p, p2)
    annotation (Line(points={{-57.6,0},{-96,0}}, color={0,0,255}));
  connect(Phase3.p, p3)
    annotation (Line(points={{-57.6,-60},{-96,-60}}, color={0,0,255}));
  connect(Phase2.n, gnd)
    annotation (Line(points={{-38.4,0},{96,0}}, color={0,0,255}));
  connect(Phase3.n, gnd) annotation (Line(points={{-38.4,-60},{0,-60},{0,0},{96,
          0}}, color={0,0,255}));
  connect(Phase1.n, gnd) annotation (Line(points={{-36.4,60},{0,60},{0,0},{96,0}},
        color={0,0,255}));
end threePhaseAC;
