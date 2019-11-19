model invertedPendulum
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {96, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {124, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {0, 0, 1}, phi(fixed = true, start = 0), useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {200, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 1, r_CM = {0, 1, 0})  annotation(
    Placement(visible = true, transformation(origin = {200, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 0.1, freqHz = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-84, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = 0.000001, d = 0.000001)  annotation(
    Placement(visible = true, transformation(origin = {166, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true)  annotation(
    Placement(visible = true, transformation(origin = {122, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor1 annotation(
    Placement(visible = true, transformation(origin = {230, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {42, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add err(k1 = +1, k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-54, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(
    Placement(visible = true, transformation(origin = {8, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 100)  annotation(
    Placement(visible = true, transformation(origin = {42, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation(
    Placement(visible = true, transformation(origin = {82, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain bodyLength(k = 1) annotation(
    Placement(visible = true, transformation(origin = {62, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Sin sin1 annotation(
    Placement(visible = true, transformation(origin = {30, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Derivative derivative1 annotation(
    Placement(visible = true, transformation(origin = {8, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1) annotation(
    Placement(visible = true, transformation(origin = {42, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain1.u, err.y) annotation(
    Line(points = {{30, 68}, {-43, 68}}, color = {0, 0, 127}));
  connect(gain1.y, add31.u2) annotation(
    Line(points = {{53, 68}, {70, 68}}, color = {0, 0, 127}));
  connect(sin1.y, err.u2) annotation(
    Line(points = {{20, -12}, {-66, -12}, {-66, 62}, {-66, 62}}, color = {0, 0, 127}));
  connect(bodyLength.u, relAngleSensor1.phi_rel) annotation(
    Line(points = {{74, -12}, {242, -12}, {242, 48}, {242, 48}}, color = {0, 0, 127}));
  connect(bodyLength.y, sin1.u) annotation(
    Line(points = {{52, -12}, {44, -12}, {44, -12}, {42, -12}}, color = {0, 0, 127}));
  connect(gain3.y, add31.u3) annotation(
    Line(points = {{54, 36}, {70, 36}, {70, 60}, {70, 60}}, color = {0, 0, 127}));
  connect(derivative1.y, gain3.u) annotation(
    Line(points = {{20, 36}, {30, 36}, {30, 36}, {30, 36}}, color = {0, 0, 127}));
  connect(derivative1.u, err.y) annotation(
    Line(points = {{-4, 36}, {-20, 36}, {-20, 68}, {-42, 68}, {-42, 68}}, color = {0, 0, 127}));
  connect(add31.u1, gain2.y) annotation(
    Line(points = {{70, 76}, {70, 76}, {70, 98}, {54, 98}, {54, 98}}, color = {0, 0, 127}));
  connect(position1.s_ref, add31.y) annotation(
    Line(points = {{110, 68}, {94, 68}, {94, 68}, {94, 68}, {94, 68}}, color = {0, 0, 127}));
  connect(gain2.u, integrator1.y) annotation(
    Line(points = {{30, 98}, {18, 98}, {18, 98}, {20, 98}}, color = {0, 0, 127}));
  connect(integrator1.u, err.y) annotation(
    Line(points = {{-4, 98}, {-20, 98}, {-20, 68}, {-42, 68}, {-42, 68}}, color = {0, 0, 127}));
  connect(revolute1.support, relAngleSensor1.flange_a) annotation(
    Line(points = {{190, 46}, {190, 39}, {190, 39}, {190, 32}, {230, 32}, {230, 35}, {230, 35}, {230, 38}}));
  connect(relAngleSensor1.flange_b, revolute1.axis) annotation(
    Line(points = {{230, 58}, {230, 64}, {190, 64}, {190, 52}}));
  connect(position1.support, prismatic1.support) annotation(
    Line(points = {{122, 58}, {122, 51}, {122, 51}, {122, 44}, {120, 44}, {120, 37}, {120, 37}, {120, 30}}, color = {0, 127, 0}));
  connect(position1.flange, prismatic1.axis) annotation(
    Line(points = {{132, 68}, {132, 30}}, color = {0, 127, 0}));
  connect(springDamper1.flange_a, revolute1.support) annotation(
    Line(points = {{166, 44}, {182, 44}, {182, 46}, {190, 46}}));
  connect(revolute1.axis, springDamper1.flange_b) annotation(
    Line(points = {{190, 52}, {190, 58}, {190, 58}, {190, 64}, {166, 64}}));
  connect(revolute1.frame_b, body1.frame_a) annotation(
    Line(points = {{200, 62}, {200, 66}}, color = {95, 95, 95}));
  connect(prismatic1.frame_b, revolute1.frame_a) annotation(
    Line(points = {{134, 24}, {200, 24}, {200, 33}, {200, 33}, {200, 42}}, color = {95, 95, 95}));
  connect(world.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{106, 24}, {114, 24}}, color = {95, 95, 95}));
  connect(err.u1, sine1.y) annotation(
    Line(points = {{-66, 74}, {-73, 74}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));end invertedPendulum;