model MMT_SpringNonlinear_exe
    inner Modelica.Mechanics.MultiBody.World world annotation( Placement(visible = true, transformation(extent = {{-100, 0}, {-80, 20}}, rotation = 0)));
    
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation translation(r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = 4.71239), stateSelect = StateSelect.prefer) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMT_SpringNonlinear mMT_SpringNonlinear(c = 1e5, c_expo = 1)  annotation(
    Placement(visible = true, transformation(origin = {68, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox body_noDamper(color = {100, 200, 255}, r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation translation1(r = {2, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(fixed = true, start = 4.71239), stateSelect = StateSelect.prefer) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMT_SpringNonlinear mMT_SpringNonlinear1(c = 1e5, c_expo = 1)  annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox body_dampedPosition(color = {100, 200, 255}, r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMT_DamperLimited mMT_DamperLimited(d = 50, dampAccordingToPosition = true, s_rel_damping_start = 0.1, s_rel_damping_stop = 0.8, v_rel_damping_start = 0.5, v_rel_damping_stop = 3)  annotation(
    Placement(visible = true, transformation(origin = {68, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {70, -136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMT_DamperLimited mMT_DamperLimited1(d = 50, dampAccordingToPosition = false, s_rel_damping_start = 0.1, s_rel_damping_stop = 0.8, v_rel_damping_start = 0.5, v_rel_damping_stop = 3) annotation(
    Placement(visible = true, transformation(origin = {68, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {3, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed = true, start = 4.71239), stateSelect = StateSelect.prefer) annotation(
    Placement(visible = true, transformation(origin = {-10, -136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMT_SpringNonlinear mMT_SpringNonlinear2(c = 1e5, c_expo = 1) annotation(
    Placement(visible = true, transformation(origin = {70, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox body_dampedVelocity(color = {100, 200, 255}, r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, -136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, translation.frame_a) annotation(
    Line(points = {{-79, 10}, {-60, 10}}));
  connect(translation.frame_b, revolute.frame_a) annotation(
    Line(points = {{-20, 10}, {-40, 10}}));
  connect(revolute.frame_b, prismatic.frame_a) annotation(
    Line(points = {{0, 10}, {58, 10}, {58, 10}, {60, 10}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, body_noDamper.frame_a) annotation(
    Line(points = {{80, 10}, {100, 10}, {100, 10}, {100, 10}}));
  connect(prismatic.support, mMT_SpringNonlinear.flange_a) annotation(
    Line(points = {{66, 16}, {58, 16}, {58, 38}}, color = {0, 127, 0}));
  connect(world.frame_b, translation1.frame_a) annotation(
    Line(points = {{-60, -70}, {-60, 10}}));
  connect(translation1.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-40, -70}, {-20, -70}}));
  connect(revolute1.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{0, -70}, {60, -70}}, color = {95, 95, 95}));
  connect(prismatic1.frame_b, body_dampedPosition.frame_a) annotation(
    Line(points = {{80, -70}, {100, -70}}, color = {95, 95, 95}));
  connect(prismatic1.support, mMT_SpringNonlinear1.flange_a) annotation(
    Line(points = {{66, -64}, {56, -64}, {56, -50}, {60, -50}, {60, -50}}, color = {0, 127, 0}));
  connect(prismatic1.axis, mMT_SpringNonlinear1.flange_b) annotation(
    Line(points = {{80, -50}, {86, -50}, {86, -64}, {78, -64}, {78, -64}}, color = {0, 127, 0}));
  connect(mMT_DamperLimited.flange_b, prismatic1.axis) annotation(
    Line(points = {{78, -26}, {78, -64}}, color = {0, 127, 0}));
  connect(mMT_DamperLimited.flange_a, prismatic1.support) annotation(
    Line(points = {{58, -26}, {58, -44}, {66, -44}, {66, -64}}, color = {0, 127, 0}));
  connect(prismatic.axis, mMT_SpringNonlinear.flange_b) annotation(
    Line(points = {{78, 16}, {86, 16}, {86, 38}, {78, 38}, {78, 38}}, color = {0, 127, 0}));
  connect(prismatic2.axis, mMT_SpringNonlinear2.flange_b) annotation(
    Line(points = {{78, -130}, {86, -130}, {86, -116}, {80, -116}}, color = {0, 127, 0}));
  connect(prismatic2.support, mMT_SpringNonlinear2.flange_a) annotation(
    Line(points = {{66, -130}, {56, -130}, {56, -116}, {60, -116}}, color = {0, 127, 0}));
  connect(fixedTranslation.frame_b, revolute2.frame_a) annotation(
    Line(points = {{-40, -136}, {-20, -136}}));
  connect(mMT_DamperLimited1.flange_b, prismatic2.axis) annotation(
    Line(points = {{78, -92}, {78, -130}}, color = {0, 127, 0}));
  connect(mMT_DamperLimited1.flange_a, prismatic2.support) annotation(
    Line(points = {{58, -92}, {66, -92}, {66, -130}}, color = {0, 127, 0}));
  connect(prismatic2.frame_b, body_dampedVelocity.frame_a) annotation(
    Line(points = {{80, -136}, {100, -136}}, color = {95, 95, 95}));
  connect(revolute2.frame_b, prismatic2.frame_a) annotation(
    Line(points = {{0, -136}, {60, -136}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_a, world.frame_b) annotation(
    Line(points = {{-60, -136}, {-80, -136}, {-80, 10}, {-80, 10}}, color = {95, 95, 95}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")));

end MMT_SpringNonlinear_exe;