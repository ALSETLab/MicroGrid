within MicroGrid.Electrical.Interfaces;
model Wave2Phasor "This model allows the wave-phasor interface between 
  MicroGrid library and OpenIPSL using SOGI filter input."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  // Pins for wave signal:
  PositivePin PinA annotation (Placement(transformation(extent={{80,70},{100,90}}),
        iconTransformation(extent={{80,70},{100,90}})));
  PositivePin PinB annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  PositivePin PinC annotation (Placement(transformation(extent={{80,-90},{100,-70}}),
        iconTransformation(extent={{80,-90},{100,-70}})));
  NegativePin PinGrd annotation (Placement(transformation(extent={{-10,-100},{10,
            -80}}), iconTransformation(extent={{-10,-100},{10,-80}})));
  // Pin for phasor signal:
  OpenIPSL.Interfaces.PwPin PSPin annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  // Pins for filtering:
  Modelica.Blocks.Interfaces.RealInput iapos annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-60,106}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-60,94})));
  Modelica.Blocks.Interfaces.RealInput ibpos annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-20,106}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-20,94})));
  Modelica.Blocks.Interfaces.RealOutput ialpha annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,106}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,98})));
  Modelica.Blocks.Interfaces.RealOutput ibeta annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,106}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,98})));
  // Parameters:
  parameter Modelica.SIunits.ApparentPower S_b(displayUnit="MVA")=100e6
    "System base power"
    annotation (Dialog(group="Power system data", enable=enableS_b));
  parameter Modelica.SIunits.Voltage V_b(displayUnit="kV")=400e3
    "Base voltage of the bus"
    annotation (Dialog(group="Power system data", enable=enableV_b));
  parameter Modelica.SIunits.Frequency fn(displayUnit="Hz")=60
    "System frequency"
    annotation (Dialog(group="Power system data", enable=enablefn));
  // Importing pi constant:
  import Modelica.Constants.pi;
//protected
  Modelica.SIunits.Voltage MagV; // voltage magnitude in phasor domain
  Modelica.SIunits.Angle AngV; // voltage angle in phasor domain
equation
  // ----- Current equations:
  // Calculating Clarke transformation and filtering fundamental component:
  ialpha = (0.5)*(2/3)*(PinA.i - (1/2)*PinB.i - (1/2)*PinC.i);
  ibeta = (0.5)*(2/3)*((sqrt(3)/2)*PinB.i - (sqrt(3)/2)*PinC.i);
  // Real and imaginary parts of the current for phasor using Park transf.:
  PSPin.ii= -(1/sqrt(2))*(V_b/S_b)*(iapos*Modelica.Math.cos(2*pi*fn*time)+ibpos*Modelica.Math.sin(2*pi*fn*time));
  PSPin.ir= -(1/sqrt(2))*(V_b/S_b)*(-iapos*Modelica.Math.sin(2*pi*fn*time)+ibpos*Modelica.Math.cos(2*pi*fn*time));
  // ----- Voltage equations:
  // Magnitude and angle for voltage signal:
  MagV = V_b*sqrt(PSPin.vr^2 + PSPin.vi^2);
  AngV = Modelica.Math.atan2(PSPin.vi,PSPin.vr);
  // Voltage difference between two nodes:
  PinGrd.v = 0;
  PinA.v-PinGrd.v = MagV*sqrt(2/3)*Modelica.Math.sin(2*pi*fn*time+AngV);
  PinB.v-PinGrd.v = MagV*sqrt(2/3)*Modelica.Math.sin(2*pi*fn*time+AngV-2*pi/3);
  PinC.v-PinGrd.v = MagV*sqrt(2/3)*Modelica.Math.sin(2*pi*fn*time+AngV+2*pi/3);
  annotation (Icon(graphics={Text(
          extent={{-72,74},{0,40}},
          lineColor={0,0,0},
          textString="Phasor"), Text(
          extent={{0,-22},{72,-56}},
          lineColor={0,0,0},
          textString="Wave")}));
end Wave2Phasor;
