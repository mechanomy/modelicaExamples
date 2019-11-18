model RevoluteJoint_withAngleConstraints_omedit
    inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity) annotation(
    Placement(visible = true, transformation(extent = {{-100, 0}, {-80, 20}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.Body body(m = 1.0, r_CM = {0.5, 0, 0}) annotation(
    Placement(visible = true, transformation(extent = {{20, 0}, {40, 20}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.2) annotation(
    Placement(visible = true, transformation(extent = {{-20, 40}, {0, 60}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev(animation = true,n = {0, 0, 1}, phi(fixed = true, start = 0.174533), useAxisFlange = true, w(fixed = true)) annotation(
    Placement(visible = true, transformation(extent = {{-20, 0}, {0, 20}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = true, r = {1, 0, 0}, width = 0.02)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
    connect(damper.flange_b, rev.axis) annotation(
    Line(points = {{0, 50}, {4, 50}, {4, 26}, {-10, 26}, {-10, 20}}));
    connect(rev.support, damper.flange_a) annotation(
    Line(points = {{-16, 20}, {-16, 26}, {-28, 26}, {-28, 50}, {-20, 50}}));
    connect(body.frame_a, rev.frame_b) annotation(
    Line(points = {{20, 10}, {0, 10}}, color = {95, 95, 95}, thickness = 0.5));
    connect(world.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-80, 10}, {-60, 10}}, color = {95, 95, 95}));
    connect(fixedTranslation.frame_b, rev.frame_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}}, color = {95, 95, 95}));

annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")));
end RevoluteJoint_withAngleConstraints_omedit;