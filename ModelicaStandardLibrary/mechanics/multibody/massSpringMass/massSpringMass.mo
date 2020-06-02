model massSpringMass
  Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {-56, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {-24, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass2(m = 2)  annotation(
    Placement(visible = true, transformation(origin = {48, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 100)  annotation(
    Placement(visible = true, transformation(origin = {10, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-56, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 10)  annotation(
    Placement(visible = true, transformation(origin = {-88, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(spring1.flange_b, mass2.flange_a) annotation(
    Line(points = {{20, 28}, {38, 28}}, color = {0, 127, 0}));
  connect(spring1.flange_a, mass1.flange_b) annotation(
    Line(points = {{0, 28}, {-14, 28}}, color = {0, 127, 0}));
  connect(force1.flange, mass1.flange_a) annotation(
    Line(points = {{-46, 28}, {-34, 28}, {-34, 28}, {-34, 28}}, color = {0, 127, 0}));
  connect(force1.support, fixed1.flange) annotation(
    Line(points = {{-56, 18}, {-56, 18}, {-56, 10}, {-56, 10}}, color = {0, 127, 0}));
  connect(force1.f, sine1.y) annotation(
    Line(points = {{-68, 28}, {-77, 28}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "3.2.2")));

end massSpringMass;
