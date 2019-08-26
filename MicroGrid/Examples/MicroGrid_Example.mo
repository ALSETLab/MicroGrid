within MicroGrid.Examples;
model MicroGrid_Example
  extends Modelica.Icons.Example;
  Electrical.Sources.threePhaseAC threePhaseAC1 annotation(Placement(visible = true, transformation(origin = {-154.222, -0}, extent = {{15.778, -15.778}, {-15.778, 15.778}}, rotation = 0)));
  Electrical.BasicComponents.ground ground1 annotation(Placement(visible = true, transformation(origin = {-187.817, -0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.BasicComponents.resistor resistor1(R = 0.0754) annotation(Placement(visible = true, transformation(origin = {-82.734, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.resistor resistor2(R = 0.0754) annotation(Placement(visible = true, transformation(origin = {-82.67, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.resistor resistor3(R = 0.0754) annotation(Placement(visible = true, transformation(origin = {-82.67, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.inductor inductor1(L = 0.002, i(
                                                           fixed =   true))
                                                                           annotation(Placement(visible = true, transformation(origin = {-54.829, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.inductor inductor2(L = 0.002, i(
                                                           fixed =   true))
                                                                           annotation(Placement(visible = true, transformation(origin = {-54.829, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.inductor inductor3(L = 0.002, i(
                                                           fixed =   true))
                                                                           annotation(Placement(visible = true, transformation(origin = {-54.44, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.switch switch1(g_off = 1E-7) annotation(Placement(visible = true, transformation(origin = {-26.442, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.switch switch2(g_off = 1E-7) annotation(Placement(visible = true, transformation(origin = {-5.833, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.BasicComponents.switch switch3(g_off = 1E-7) annotation(Placement(visible = true, transformation(origin = {13.999, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.VoltageSensor Sensor_Va annotation(Placement(visible = true, transformation(origin = {-132.386, -75}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Electrical.BasicComponents.ground ground2 annotation(Placement(visible = true, transformation(origin = {-118.05, -145}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.VoltageSensor Sensor_Vb annotation(Placement(visible = true, transformation(origin = {-117.719, -95}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Sensors.VoltageSensor Sensor_Vc annotation(Placement(visible = true, transformation(origin = {-102.386, -115}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime = 0.01, startValue = false) annotation(Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-7.638, -7.638}, {7.638, 7.638}}, rotation = 0)));
  Control.PhaseLockedLoop.DSOGI_PLL dSOGI_PLL1 annotation(Placement(visible = true, transformation(origin = {-50, -103.749}, extent = {{-16.251, -16.251}, {16.251, 16.251}}, rotation = 0)));
  Sensors.CurrentSensor Sensor_Ca annotation(Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.CurrentSensor Sensor_Cb annotation(Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.CurrentSensor Sensor_Cc annotation(Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Electrical.Converters.VSC01 VSC(f_s=20e3) annotation (Placement(visible=true,
        transformation(
        origin={118.529,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Electrical.BasicComponents.capacitor capacitor1(v(
                                                  fixed =   true, start =   400),C = 0.002) annotation(Placement(visible = true, transformation(origin = {176.95, 0}, extent = {{-16.95, -16.95}, {16.95, 16.95}}, rotation = -90)));
  Electrical.Sources.currentDC currentDC1 annotation(Placement(visible = true, transformation(origin = {275, -0}, extent = {{-15, -15}, {15, 15}}, rotation = -90)));
  Control.Interfaces.abc2dq abc2dq1 annotation(Placement(visible = true, transformation(origin = {50, -53.352}, extent = {{15, -15}, {-15, 15}}, rotation = 90)));
  Sensors.VoltageSensor voltageSensor2 annotation(Placement(visible = true, transformation(origin = {160, 0}, extent = {{-12.417, -12.417}, {12.417, 12.417}}, rotation = -90)));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E panelData annotation(Placement(visible = true, transformation(origin = {327.852, 106.018}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.PV_module PV1(moduleData = panelData, Ns = 3, Np = 3) annotation(Placement(visible = true, transformation(origin = {210.312, -214.087}, extent = {{15, -15}, {-15, 15}}, rotation = 360)));
  Electrical.Converters.Boost Boost(
    Vdrop=0,
    r_diode=1E-5,
    g_diode=1E-5,
    r_switch=1E-5,
    g_switch=1E-5,
    f_s=100000,
    L_boost=0.005) annotation (Placement(visible=true, transformation(
        origin={210,-78.621},
        extent={{15,-15},{-15,15}},
        rotation=270)));
  Sensors.VoltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {212.028, -181.039}, extent = {{12.214, 12.214}, {-12.214, -12.214}}, rotation = 0)));
  Sensors.CurrentSensor currentSensor1 annotation(Placement(visible = true, transformation(origin = {224.869, -156.462}, extent = {{12.841, 12.841}, {-12.841, -12.841}}, rotation = -90)));
  Control.RefGenerators.mppt mppt1(
    vref(                          start =      75,                                       fixed =      true),
                                                    Ts = 0.0001, deltaVpvRefPanel = 0.05)                    annotation(Placement(visible = true, transformation(origin = {270.847, -162.424}, extent = {{12.829, -12.829}, {-12.829, 12.829}}, rotation = 180)));
  Control.Feedback.BoostControl boostControl1(TimeCons = 0.005, Gain = 0.005) annotation(Placement(visible = true, transformation(origin = {295, -105.813}, extent = {{15, 15}, {-15, -15}}, rotation = 270)));
  Electrical.BasicComponents.resistor resistor4(R = 0.02) annotation(Placement(visible = true, transformation(origin = {232.93, -106.429}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Electrical.BasicComponents.capacitor capacitor2(C = 0.00004, v(
                                                               start =   0, fixed =   true))
                                                                                            annotation(Placement(visible = true, transformation(origin = {209.211, -119.852}, extent = {{10.789, -10.789}, {-10.789, 10.789}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Temperature(k = 303) annotation(Placement(visible = true, transformation(origin = {180, -236.031}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid irradiation(offset = 600.0, falling = 0.02, rising = 0.02, amplitude = 200, width = 0.04, startTime = 0.03) annotation(Placement(visible = true, transformation(origin = {248.371, -235.681}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Control.Feedback.StateFeedback stateFeedback1(Kd_id = 0.07892, Kq_id = -0.003071, Kd_iq = 0.00202, Kq_iq = 0.056939, Kd_vdc = -0.113977, Kq_vdc = -0.001361, Kd_int_iq = 0.328665, Kq_int_iq = -10.7532, Kd_int_vdc = 16.8255, Kq_int_vdc = 0.152513,
    add2(                                                                                                                                                                                                        k2 =      -1),
    add1(                                                                                                                                                                                                        k1 =      -1))
                                                                                                                                                                                                        annotation(Placement(visible = true, transformation(origin = {118.343, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Load(height = 10, duration = 0.01, offset = 0.0, startTime = 0.015) annotation(Placement(visible = true, transformation(origin = {325, 0}, extent = {{15, -15}, {-15, 15}}, rotation = 0)));
equation
  connect(ground1.p, threePhaseAC1.gnd) annotation(Line(visible = true, origin = {-173.593, -0}, points={{-4.224,
          0},{4.22412,0}},                                                                                                            color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(Line(visible = true, origin = {-68.781, 10}, points={{-5.953,
          0},{5.952,0}},                                                                                                        color = {0, 0, 255}));
  connect(resistor2.n, inductor2.p) annotation(Line(visible = true, origin = {-68.749, 0}, points={{-5.921,
          0},{5.92,0}},                                                                                                         color = {0, 0, 255}));
  connect(resistor3.n, inductor3.p) annotation(Line(visible = true, origin = {-68.555, -10}, points = {{-6.115, 0}, {6.115, 0}}, color = {0, 0, 255}));
  connect(inductor1.n, switch1.p) annotation(Line(visible = true, origin = {-40.635, 10}, points={{-6.194,
          0},{6.193,0}},                                                                                                       color = {0, 0, 255}));
  connect(inductor2.n, switch2.p) annotation(Line(visible = true, origin = {-30.331, 0}, points = {{-16.498, 0}, {16.498, 0}}, color = {0, 0, 255}));
  connect(inductor3.n, switch3.p) annotation(Line(visible = true, origin = {-20.22, -10}, points={{-26.22,
          0},{26.219,0}},                                                                                                       color = {0, 0, 255}));
  connect(threePhaseAC1.p1, resistor1.p) annotation(Line(visible = true, origin = {-105.32, 9.733}, points={{
          -33.7551,-0.2662},{9.585,-0.2662},{9.585,0.267},{14.586,0.267}},                                                                                                          color = {0, 0, 255}));
  connect(threePhaseAC1.p2, resistor2.p) annotation(Line(visible = true, origin = {-114.873, 0}, points={{
          -24.2021,0},{24.203,0}},                                                                                                      color = {0, 0, 255}));
  connect(booleanStep1.y, switch1.control) annotation(Line(visible = true, origin = {-38.161, 39}, points={{
          -23.4372,11},{11.719,11},{11.719,-22}},                                                                                                         color = {190, 52, 178}));
  connect(booleanStep1.y, switch2.control) annotation(Line(visible = true, origin = {-24.421, 35.667}, points={{
          -37.1772,14.333},{18.588,14.333},{18.588,-28.667}},                                                                                                             color = {190, 52, 178}));
  connect(booleanStep1.y, switch3.control) annotation(Line(visible = true, origin = {-11.2, 32.333}, points={{
          -50.3982,17.667},{25.199,17.667},{25.199,-35.333}},                                                                                                           color = {190, 52, 178}));
  connect(Sensor_Va.voltSignal, dSOGI_PLL1.vA) annotation(Line(visible = true, origin = {-84.158, -84.19}, points={{-38.878,
          9.19},{9.985,9.19},{9.985,-9.18956},{18.9068,-9.18956}},                                                                                                                     color = {255, 0, 0}));
  connect(Sensor_Vb.voltSignal, dSOGI_PLL1.vB) annotation(Line(visible = true, origin = {-90.651, -90.271}, points={{-17.718,
          -4.729},{10.651,-4.729},{10.651,-14.0195},{25.4891,-14.0195}},                                                                                                                        color = {255, 0, 0}));
  connect(Sensor_Vc.voltSignal, dSOGI_PLL1.vC) annotation(Line(visible = true, origin = {-81.84, -105.688}, points={{-11.196,
          -9.312},{-0.545,-9.312},{-0.545,-9.4367},{16.5852,-9.4367}},                                                                                                                          color = {255, 0, 0}));
  connect(ground2.p, Sensor_Vb.n) annotation(Line(visible = true, origin = {-117.885, -114}, points={{-0.165,
          -21},{-0.165,6},{0.166,6},{0.166,9}},                                                                                                             color = {0, 0, 255}));
  connect(ground2.p, Sensor_Vc.n) annotation(Line(visible = true, origin = {-110.218, -129}, points = {{-7.832, -6}, {-7.832, 1}, {7.832, 1}, {7.832, 4}}, color = {0, 0, 255}));
  connect(ground2.p, Sensor_Va.n) annotation(Line(visible = true, origin = {-125.218, -119.009}, points = {{7.168, -15.991}, {7.168, -9.009}, {-7.168, -9.009}, {-7.168, 34.009}}, color = {0, 0, 255}));
  connect(threePhaseAC1.p1, Sensor_Va.p) annotation(Line(visible = true, origin = {-133.966, -32.022}, points={{
          -5.10912,41.4888},{1.58,41.4888},{1.58,-32.978}},                                                                                                         color = {0, 0, 255}));
  connect(threePhaseAC1.p2, Sensor_Vb.p) annotation(Line(visible = true, origin = {-124.188, -45}, points={{
          -14.8871,45},{6.469,45},{6.469,-40}},                                                                                                         color = {0, 0, 255}));
  connect(threePhaseAC1.p3, Sensor_Vc.p) annotation(Line(visible = true, origin = {-113.966, -57.978}, points={{
          -25.1091,48.5112},{11.58,48.5112},{11.58,-47.022}},                                                                                                          color = {0, 0, 255}));
  connect(VSC.vdc_p, capacitor1.p) annotation(Line(visible = true, origin = {158.188, 17.225}, points={{
          -21.1496,-0.893},{-8.188,-0.893},{-8.188,2.725},{18.762,2.725},{
          18.762,-3.665}},                                                                                                                                                                         color = {0, 0, 255}));
  connect(VSC.vdc_n, capacitor1.n) annotation(Line(visible = true, origin = {158.203, -17.359}, points={{
          -21.0868,0.716},{-8.203,0.716},{-8.203,-2.641},{18.747,-2.641},{
          18.747,3.799}},                                                                                                                                                                          color = {0, 0, 255}));
  connect(capacitor1.n, currentDC1.n) annotation(Line(visible = true, origin = {225.975, -17.115}, points = {{-49.025, 3.555}, {-49.025, -2.835}, {49.025, -2.835}, {49.025, 2.115}}, color = {0, 0, 255}));
  connect(capacitor1.p, currentDC1.p) annotation(Line(visible = true, origin = {225.975, 17.115}, points = {{-49.025, -3.555}, {-49.025, 2.835}, {49.025, 2.835}, {49.025, -2.115}}, color = {0, 0, 255}));
  connect(threePhaseAC1.p3, resistor3.p) annotation(Line(visible = true, origin = {-105.271, -9.733}, points={{
          -33.8041,0.2662},{9.601,0.2662},{9.601,-0.267},{14.601,-0.267}},                                                                                                            color = {0, 0, 255}));
  connect(abc2dq1.v_C, Sensor_Cc.currSignal) annotation(Line(visible = true, origin = {65.2, -33.706}, points={{-4.7,
          -5.7695},{-4.7,0.706},{4.7,0.706},{4.7,4.356}},                                                                                                                    color = {255, 0, 0}));
  connect(abc2dq1.v_B, Sensor_Cb.currSignal) annotation(Line(visible = true, origin = {50.179, -18.706}, points={{0.27865,
          -20.7695},{0.27865,5.706},{-0.279,5.706},{-0.279,9.356}},                                                                                                                     color = {255, 0, 0}));
  connect(abc2dq1.v_A, Sensor_Ca.currSignal) annotation(Line(visible = true, origin = {35.196, -23.689}, points={{5.0957,
          -15.7865},{5.0957,-8.452},{-5.296,-8.452},{-5.296,34.339}},                                                                                                                      color = {255, 0, 0}));
  connect(dSOGI_PLL1.Delta, abc2dq1.Delta) annotation(Line(visible = true, origin = {66.345, -60.475}, points={{
          -101.107,-54.6497},{-101.107,-54.6497},{13.655,-54.6497},{13.655,
          7.123},{-2.11885,7.123}},                                                                                                                                                                          color = {0, 128, 0}));
  connect(capacitor1.p, voltageSensor2.p) annotation(Line(visible = true, origin = {168.475, 16.494}, points = {{8.475, -2.934}, {8.475, 3.506}, {-8.475, 3.506}, {-8.475, -4.077}}, color = {0, 0, 255}));
  connect(capacitor1.n, voltageSensor2.n) annotation(Line(visible = true, origin = {168.475, -16.494}, points = {{8.475, 2.934}, {8.475, -3.506}, {-8.475, -3.506}, {-8.475, 4.077}}, color = {0, 0, 255}));
  connect(currentSensor1.p, voltageSensor1.p) annotation(Line(visible = true, origin = {224.66, -177.127}, points = {{0.209, 7.824}, {0.209, -3.912}, {-0.418, -3.912}}, color = {0, 0, 255}));
  connect(currentSensor1.currSignal, mppt1.i) annotation(Line(visible = true, origin = {251.376, -156.394}, points={{
          -14.5007,0.06041},{3.626,0.06041},{3.626,-0.0604097},{7.24894,
          -0.0604097}},                                                                                                                                                                  color = {255, 0, 0}));
  connect(voltageSensor1.voltSignal, mppt1.u) annotation(Line(visible = true, origin = {238.556, -167.435}, points={{-26.528,
          -2.18391},{-26.528,1.61},{16.446,1.61},{16.446,-0.516503},{20.1626,
          -0.516503}},                                                                                                                                                                                         color = {255, 0, 0}));
  connect(mppt1.y, boostControl1.V_ref) annotation(Line(visible = true, origin = {295.493, -148.181}, points={{
          -12.5176,-14.243},{6.2594,-14.243},{6.2594,28.4885}},                                                                                                         color = {0, 128, 0}));
  connect(boostControl1.DutyRatio, Boost.DutyRatio) annotation(Line(visible = true, origin = {249.354, -64.608}, points={{45.9959,
          -26.9728},{45.9959,0.531},{45.9959,0.987},{45.9959,10.563},{-65.507,
          10.563},{-65.507,-14.013},{-53.904,-14.013}},                                                                                                                                                                                                       color = {0, 128, 0}));
  connect(Boost.Input_p, resistor4.n) annotation(Line(visible = true, origin = {227.465, -95.577}, points = {{-5.465, 2.556}, {-5.465, 0.148}, {5.465, 0.148}, {5.465, -2.852}}, color = {0, 0, 255}));
  connect(resistor4.p, currentSensor1.n) annotation(Line(visible = true, origin = {228.9, -134.823}, points={{4.03,
          20.394},{4.03,-5.798},{-4.031,-5.798},{-4.031,-8.798}},                                                                                                                 color = {0, 0, 255}));
  connect(voltageSensor1.voltSignal, boostControl1.V_measured) annotation(Line(visible = true, origin = {250.514, -136.713}, points={{-38.486,
          -32.9059},{-38.486,7.944},{38.486,7.944},{38.486,17.018}},                                                                                                                                             color = {255, 0, 0}));
  connect(capacitor2.p, resistor4.p) annotation(Line(visible = true, origin = {227.901, -118.044}, points={{
          -10.0588,-1.808},{5.029,-1.808},{5.029,3.615}},                                                                                                         color = {0, 0, 255}));
  connect(Temperature.y, PV1.T) annotation(Line(visible = true, origin = {198.875, -232.716}, points = {{-7.875, -3.315}, {3.937, -3.315}, {3.937, 6.629}}, color = {1, 37, 163}));
  connect(Boost.Input_n, capacitor2.n) annotation(Line(visible = true, origin = {197.485, -105.328}, points={{0.515,
          12.307},{0.515,8.37},{-2.063,8.37},{-2.063,-14.524},{3.0948,-14.524}},                                                                                                                     color = {0, 0, 255}));
  connect(capacitor2.n, voltageSensor1.n) annotation(Line(visible = true, origin = {197.809, -150.446}, points={{2.7708,
          30.594},{-2.387,30.594},{-2.387,-30.593},{2.005,-30.593}},                                                                                                                      color = {0, 0, 255}));
  connect(PV1.p, voltageSensor1.p) annotation(Line(visible = true, origin = {224.794, -197.563}, points = {{-2.482, -16.524}, {1.517, -16.524}, {1.517, 16.524}, {-0.552, 16.524}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, PV1.n) annotation(Line(visible = true, origin = {196.687, -197.563}, points = {{3.127, 16.524}, {-2.375, 16.524}, {-2.375, -16.524}, {1.625, -16.524}}, color = {0, 0, 255}));
  connect(irradiation.y, PV1.Irr) annotation(Line(visible = true, origin = {224.332, -232.483}, points = {{13.039, -3.198}, {-6.52, -3.198}, {-6.52, 6.396}}, color = {1, 37, 163}));
  connect(capacitor1.n, Boost.Output_n) annotation(Line(visible = true, origin = {187.475, -29.445}, points = {{-10.525, 15.885}, {-10.525, 9.445}, {10.525, 9.445}, {10.525, -34.776}}, color = {0, 0, 255}));
  connect(capacitor1.p, Boost.Output_p) annotation(Line(visible = true, origin = {204.19, -14.976}, points = {{-27.24, 28.536}, {-27.24, 34.976}, {18.336, 34.976}, {18.336, -49.245}, {17.81, -49.245}}, color = {0, 0, 255}));
  connect(dSOGI_PLL1.Delta, stateFeedback1.Delta) annotation(Line(visible = true, origin = {56.568, -105.08}, points={{
          -91.3302,-10.0447},{23.432,-10.0447},{23.432,10.0454},{42.8096,
          10.0454}},                                                                                                                                                                              color = {0, 128, 0}));
  connect(abc2dq1.v_q, stateFeedback1.i_q) annotation(Line(visible = true, origin = {70.448, -79.026}, points={{-14.448,
          11.9481},{-14.448,-5.974},{28.895,-5.974}},                                                                                                                     color = {0, 128, 0}));
  connect(abc2dq1.v_d, stateFeedback1.i_d) annotation(Line(visible = true, origin = {62.448, -72.401}, points={{-18.448,
          5.19935},{-18.448,-2.599},{36.895,-2.599}},                                                                                                                    color = {0, 128, 0}));
  connect(voltageSensor2.voltSignal, stateFeedback1.v_dc) annotation(Line(visible = true, origin = {119.759, -58.333}, points={{28.6311,
          58.333},{24.824,58.333},{24.824,-51.667},{-29.759,-51.667},{-29.759,
          -6.667},{-20.416,-6.667}},                                                                                                                                                                                                        color = {255, 0, 0}));
  connect(VSC.switching1, stateFeedback1.switching1) annotation(Line(visible = true, origin = {108.436, -48.559}, points={{0.093,
          29.2718},{0.093,-8.416},{-0.093,-8.416},{-0.093,-12.441}},                                                                                                                                color = {0, 128, 0}));
  connect(VSC.switching2, stateFeedback1.switching2) annotation(Line(visible = true, origin = {118.28, -48.579}, points={{0.249,
          29.214},{0.249,-8.396},{-0.2496,-8.396},{-0.2496,-12.421}},                                                                                                                              color = {0, 128, 0}));
  connect(VSC.switching3, stateFeedback1.switching3) annotation(Line(visible = true, origin = {128.147, -48.637}, points={{0.8034,
          29.0388},{0.8034,-8.338},{-0.804,-8.338},{-0.804,-12.363}},                                                                                                                               color = {0, 128, 0}));
  connect(currentDC1.i, Load.y) annotation(Line(visible = true, origin = {297, 0}, points = {{-11.5, -0}, {11.5, 0}}, color = {1, 37, 163}));
  connect(switch1.n, Sensor_Ca.n) annotation(Line(visible = true, origin = {8.889, 15}, points = {{-27.331, -5}, {8.111, -5}, {8.111, 5}, {11.111, 5}}, color = {0, 0, 255}));
  connect(Sensor_Ca.p, VSC.p1) annotation(Line(visible = true, origin = {82.544, 18.322}, points={{-42.544,
          1.678},{12.535,1.678},{12.535,-1.679},{17.4756,-1.679}},                                                                                                          color = {0, 0, 255}));
  connect(switch2.n, Sensor_Cb.n) annotation(Line(visible = true, origin = {21.084, 0}, points={{-18.917,
          0},{18.916,0}},                                                                                                     color = {0, 0, 255}));
  connect(Sensor_Cb.p, VSC.p2) annotation(Line(visible = true, origin = {87.389, 0.155}, points={{-27.389,
          -0.155},{7.69,-0.155},{7.69,0.156},{12.0084,0.156}},                                                                                                         color = {0, 0, 255}));
  connect(switch3.n, Sensor_Cc.n) annotation(Line(visible = true, origin = {40.5, -15}, points = {{-18.501, 5}, {-0.5, 5}, {-0.5, -5}, {19.5, -5}}, color = {0, 0, 255}));
  connect(Sensor_Cc.p, VSC.p3) annotation(Line(visible = true, origin = {92.369, -18}, points={{-12.369,
          -2},{2.71,-2},{2.71,2},{6.9506,2}},                                                                                                      color = {0, 0, 255}));
  annotation(__Wolfram(PlotSet(plots = {Plot(name = "mppt1.pot", subPlots = {SubPlot(curves = {Curve(x = time, y = mppt1.pot)}), SubPlot(curves = {Curve(x = time, y = abc2dq1.v_d.sensorSignal), Curve(x = time, y = abc2dq1.v_q.sensorSignal)}, range = Range(xmin = 0, xmax = 0.16, ymin = auto, ymax = auto))})})), experiment(StopTime = 0.15, NumberOfIntervals = 100000, __Wolfram_Algorithm = "cvodes"), Diagram(coordinateSystem(extent = {{-200, -258.368}, {360, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})));
end MicroGrid_Example;
