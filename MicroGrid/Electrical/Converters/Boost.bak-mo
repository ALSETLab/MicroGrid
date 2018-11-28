within MicroGrid.Electrical.Converters;
model Boost "DC/DC Boost Converter"

  Interfaces.PositivePin Input_p
    annotation (Placement(transformation(extent={{-106,30},{-86,50}})));
  Interfaces.NegativePin Input_n
    annotation (Placement(transformation(extent={{-106,-50},{-86,-30}})));
  Interfaces.PositivePin Output_p
    annotation (Placement(transformation(extent={{86,30},{106,50}})));
  Interfaces.NegativePin Output_n
    annotation (Placement(transformation(extent={{86,-50},{106,-30}})));
  BasicComponents.inductor InputInductor
    annotation (Placement(transformation(extent={{-66,30},{-46,50}})));
  BasicComponents.diode diode
    annotation (Placement(transformation(extent={{34,30},{54,50}})));
  BasicComponents.switch switch annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-2})));
  Modelica.Blocks.Interfaces.BooleanInput GatePulse annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100})));
equation
  connect(InputInductor.p, Input_p)
    annotation (Line(points={{-65.6,40},{-96,40}}, color={0,0,255}));
  connect(diode.n, Output_p)
    annotation (Line(points={{53.6,40},{96,40}}, color={0,0,255}));
  connect(InputInductor.n, diode.p)
    annotation (Line(points={{-46.4,40},{34.4,40}}, color={0,0,255}));
  connect(diode.p, switch.p)
    annotation (Line(points={{34.4,40},{0,40},{0,7.6}}, color={0,0,255}));
  connect(Input_n, Output_n)
    annotation (Line(points={{-96,-40},{96,-40}}, color={0,0,255}));
  connect(switch.n, Output_n)
    annotation (Line(points={{0,-11.6},{0,-40},{96,-40}}, color={0,0,255}));
  connect(Output_n, Output_n)
    annotation (Line(points={{96,-40},{96,-40}}, color={0,0,255}));
  connect(switch.control, GatePulse) annotation (Line(points={{7,-2},{24,-2},{
          24,-66},{0,-66},{0,-100}}, color={255,0,255}));
end Boost;
