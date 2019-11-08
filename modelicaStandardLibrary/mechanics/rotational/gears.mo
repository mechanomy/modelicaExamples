model gears
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(
    Placement(visible = true, transformation(origin = {-48, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 10)  annotation(
    Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.LossyGear lossyGear1(lossTable = [0, 1, 1, 0, 0], ratio = 10)  annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary pgFixedPlanet(ratio = 10)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-28, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary pgFixedRing(ratio = 10) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(pgFixedRing.carrier, fixed1.flange) annotation(
    Line(points = {{4, -30}, {4, -30}, {4, -16}, {-28, -16}, {-28, 4}, {-28, 4}}));
  connect(pgFixedRing.sun, position1.flange) annotation(
    Line(points = {{0, -30}, {0, -30}, {0, -20}, {-20, -20}, {-20, 80}, {-38, 80}, {-38, 80}}));
  connect(fixed1.flange, pgFixedPlanet.carrier) annotation(
    Line(points = {{-28, 4}, {-10, 4}}));
  connect(pgFixedPlanet.sun, position1.flange) annotation(
    Line(points = {{-10, 0}, {-20, 0}, {-20, 80}, {-38, 80}, {-38, 80}}));
  connect(lossyGear1.flange_a, position1.flange) annotation(
    Line(points = {{-10, 40}, {-20, 40}, {-20, 80}, {-38, 80}}));
  connect(position1.phi_ref, ramp1.y) annotation(
    Line(points = {{-60, 80}, {-78, 80}, {-78, 80}, {-78, 80}}, color = {0, 0, 127}));
  connect(position1.flange, idealGear1.flange_a) annotation(
    Line(points = {{-38, 80}, {-10, 80}, {-10, 80}, {-10, 80}}));

annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-6, Interval = 0.024));end gears;