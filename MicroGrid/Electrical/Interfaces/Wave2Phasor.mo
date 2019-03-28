within MicroGrid.Electrical.Interfaces;
model Wave2Phasor "This model allows the wave-phasor interface between 
  MicroGrid library and OpenIPSL using PLL input."
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
  parameter Real K_bpf = 1 "Band-pass filter gain";
  // Importing pi constant:
  import Modelica.Constants.pi;
  Control.PhaseLockedLoop.SOGI AlfF(FilterGain=2, FrequencyHz=fn)
    annotation (Placement(transformation(extent={{10,20},{-10,40}})));
  Control.PhaseLockedLoop.SOGI BetF(FilterGain=2, FrequencyHz=fn)
    annotation (Placement(transformation(extent={{10,-40},{-10,-20}})));
protected
  Modelica.SIunits.PerUnit MagV; // voltage magnitude in phasor domain
  Modelica.SIunits.Angle AngV; // voltage angle in phasor domain
  Modelica.SIunits.Voltage Vm; // voltage wave peak magnitude
  Modelica.SIunits.Current Ibase = S_b/V_b; // current base
  Modelica.SIunits.PerUnit ia; // alpha current
  Modelica.SIunits.PerUnit ib; // beta current
  Modelica.SIunits.PerUnit ipa; // alpha current filtered
  Modelica.SIunits.PerUnit qipa; // quadrature of alpha current filtered
  Modelica.SIunits.PerUnit ipb; // beta current filtered
  Modelica.SIunits.PerUnit qipb; // quadrature of beta current filtered
  Modelica.SIunits.PerUnit iapos; // alpha positive current
  Modelica.SIunits.PerUnit ibpos; // beta positive current
equation
  // ----- Current equations:
  // Kirchhoff's First Law:
  PinGrd.i=-PinA.i-PinB.i-PinC.i;
  // Calculating Clarke transformation and filtering fundamental component:
  AlfF.v_in = (1/Ibase)*(0.5)*(2/3)*(PinA.i - (1/2)*PinB.i - (1/2)*PinC.i);
  BetF.v_in = (1/Ibase)*(0.5)*(2/3)*((sqrt(3)/2)*PinB.i - (sqrt(3)/2)*PinC.i);
  // Synthesizing positive components for alga and beta:
  iapos = AlfF.v-BetF.qv;
  ibpos = BetF.v+AlfF.qv;
  // Real and imaginary parts of the current for phasor using Park transf.:
  PSPin.ir= iapos*Modelica.Math.cos(2*pi*fn*time)+ibpos*Modelica.Math.sin(2*pi*fn*time);
  PSPin.ii=-iapos*Modelica.Math.sin(2*pi*fn*time)+ibpos*Modelica.Math.cos(2*pi*fn*time);
  // ----- Voltage equations:
  // Magnitude and angle for voltage signal:
  MagV = sqrt(PSPin.vr^2 + PSPin.vi^2);
  AngV = atan2(PSPin.vi/PSPin.vr);
  // Voltage difference between two nodes:
  PinA.v-PinGrd.v = sqrt(2)*(V_b/sqrt(3))*Modelica.Math.cos(2*pi*fn*time+AngV);
  PinB.v-PinGrd.v = sqrt(2)*(V_b/sqrt(3))*Modelica.Math.cos(2*pi*fn*time+AngV-2*pi/3);
  PinC.v-PinGrd.v = sqrt(2)*(V_b/sqrt(3))*Modelica.Math.cos(2*pi*fn*time+AngV+2*pi/3);
end Wave2Phasor;
