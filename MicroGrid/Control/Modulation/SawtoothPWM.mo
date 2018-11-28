within MicroGrid.Control.Modulation;
model SawtoothPWM
  "Generates a pulse width modulated (PWM) boolean fire signal"
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Boolean useConstantDutyCycle=true
    "Enables constant duty cycle";
  parameter Real constantDutyCycle=0 "Constant duty cycle"
    annotation (Dialog(enable=useConstantDutyCycle));
  parameter Modelica.SIunits.Frequency f=1000 "Switching frequency";
  parameter Modelica.SIunits.Time startTime=0 "Start time";
  Modelica.Blocks.Interfaces.RealInput dutyCycle if not
    useConstantDutyCycle "Duty cycle"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput fire "Firing PWM signal"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.BooleanOutput notFire "Firing PWM signal"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,110})));
  Modelica.Blocks.Sources.Constant const(final k=constantDutyCycle) if
    useConstantDutyCycle
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Logical.Less greaterEqual annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        origin={22,-8})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(final startTime=
        startTime, final samplePeriod=1/f)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Sources.SawTooth sawtooth(
    final period=1/f,
    final amplitude=1,
    final nperiod=-1,
    final offset=0,
    final startTime=startTime) annotation (Placement(transformation(
        origin={-50,-50},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Not inverse annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={52,20})));
equation
  connect(const.y, limiter.u) annotation (Line(
      points={{-79,-50},{-70,-50},{-70,0},{-62,0}},
      color={0,0,127}));
  connect(dutyCycle, limiter.u) annotation (Line(
      points={{-120,0},{-62,0}},
      color={0,0,127}));
  connect(limiter.y, zeroOrderHold.u) annotation (Line(
      points={{-39,0},{-32,0}},
      color={0,0,127}));
  connect(zeroOrderHold.y, greaterEqual.u2) annotation (Line(
      points={{-9,0},{10,0}},
      color={0,0,127}));
  connect(sawtooth.y, greaterEqual.u1) annotation (Line(
      points={{-39,-50},{0,-50},{0,-8},{10,-8}},
      color={0,0,127}));
  connect(greaterEqual.y, inverse.u) annotation (Line(
      points={{33,-8},{52,-8},{52,8}},
      color={255,0,255}));
  connect(greaterEqual.y, fire) annotation (Line(
      points={{33,-8},{36,-8},{36,80},{-60,80},{-60,110}},
      color={255,0,255}));
  connect(inverse.y, notFire) annotation (Line(
      points={{52,31},{52,80},{60,80},{60,110}},
      color={255,0,255}));
end SawtoothPWM;
