within MicroGrid.Electrical.Interfaces;
model Wave2Phasor "This model allows the wave-phasor interface between 
  MicroGrid library and OpenIPSL."
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
  parameter SI.ApparentPower S_b(displayUnit="MVA")=SysData.S_b
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
protected
  Modelica.SIunits.PerUnit MagV; // voltage magnitude in phasor domain
  Modelica.SIunits.Angle AngV; // voltage angle in phasor domain
  Modelica.SIunits.Voltage Vm; // voltage wave peak magnitude
equation
  MagV = sqrt(PSPin.vr^2 + PSPin.vi^2);
  AngV = atan2(PSPin.vi/PSPin.vr);

  PinA.v-PinGrd.v = sqrt(2)*(V_b/sqrt(3))*cos(2*pi*fn*time+AngV);
  PinB.v-PinGrd.v = sqrt(2)*(V_b/sqrt(3))*cos(2*pi*fn*time+AngV-2*pi/3);
  PinC.v-PinGrd.v = sqrt(2)*(V_b/sqrt(3))*cos(2*pi*fn*time+AngV+2*pi/3);
end Wave2Phasor;
