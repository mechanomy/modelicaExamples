model components
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = 1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {-56, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring spring1 annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(
    Placement(visible = true, transformation(origin = {72, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Disc disc1 annotation(
    Placement(visible = true, transformation(origin = {72, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper1 annotation(
    Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1 annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash1 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash2 elastoBacklash annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction1 annotation(
    Placement(visible = true, transformation(origin = {30, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Brake brake1 annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(position1.flange, spring1.flange_a) annotation(
    Line(points = {{-46, 90}, {-10, 90}, {-10, 90}, {-10, 90}}));
  connect(ramp.y, position1.phi_ref) annotation(
    Line(points = {{-79, 90}, {-69, 90}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-6, Interval = 0.024));end components;