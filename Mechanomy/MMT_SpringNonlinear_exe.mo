model MMT_SpringNonlinear_exe
    inner Modelica.Mechanics.MultiBody.World world annotation( Placement(visible = true, transformation(extent = {{-100, 0}, {-80, 20}}, rotation = 0)));
    
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation translation(r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true, start = 4.71239), stateSelect = StateSelect.prefer) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMT_SpringNonlinear mMT_SpringNonlinear(c = 1e5, c_expo = 1)  annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Mechanics.MultiBody.Parts.BodyBox body_damped(color = {100, 200, 255}, r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    
equation

  connect(world.frame_b, translation.frame_a) annotation(    Line(points = {{-79, 10}, {-60, 10}}));
  connect(               translation.frame_b, revolute.frame_a) annotation(    Line(points = {{-20, 10}, {-40, 10}}));
  connect(                                    revolute.frame_b, prismatic.frame_a) annotation(    Line(points = {{0, 10}, {58, 10}, {58, 10}, {60, 10}}, color = {95, 95, 95}));
  connect(                                                      prismatic.frame_b, body_noDamper.frame_a) annotation(    Line(points = {{80, 10}, {100, 10}, {100, 10}, {100, 10}}));
  connect(                                                      prismatic.support, mMT_SpringNonlinear.flange_a) annotation(    Line(points = {{66, 16}, {54, 16}, {54, 30}, {60, 30}, {60, 30}}, color = {0, 127, 0}));
  connect(                                                      prismatic.axis, mMT_SpringNonlinear.flange_b) annotation(    Line(points = {{80, -30}, {86, -30}, {86, -44}, {78, -44}}, color = {0, 127, 0}));
  
  connect(world.frame_b, translation1.frame_a) annotation(    Line(points = {{-60, -70}, {-60, 10}}));
  connect(               translation1.frame_b, revolute1.frame_a) annotation(    Line(points = {{-40, -70}, {-20, -70}}));
  connect(                                     revolute1.frame_b, prismatic1.frame_a) annotation(    Line(points = {{0, -70}, {60, -70}}, color = {95, 95, 95}));
  connect(                                                        prismatic1.frame_b, body_damped.frame_a) annotation(    Line(points = {{80, -70}, {100, -70}}, color = {95, 95, 95}));
  connect(                                                        prismatic1.support, mMT_SpringNonlinear1.flange_a) annotation(    Line(points = {{66, -64}, {56, -64}, {56, -50}, {60, -50}, {60, -50}}, color = {0, 127, 0}));  
  connect(                                                        prismatic1.axis, mMT_SpringNonlinear1.flange_b) annotation(    Line(points = {{80, -50}, {86, -50}, {86, -64}, {78, -64}, {78, -64}}, color = {0, 127, 0}));
  
  
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")));

end MMT_SpringNonlinear_exe;