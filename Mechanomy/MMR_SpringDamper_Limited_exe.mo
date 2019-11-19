model MMR_SpringDamper_Limited_exe
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldTorque torque annotation(
    Placement(visible = true, transformation(origin = {30, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MMR_SpringDamper_Limited mMR_SpringDamper_Limited(c = 1000, d = 0, phi_rel_start = 1, phi_rel_stop =2)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MMR_SpringDamper_Limited mMR_SpringDamper_Limited1(c = 0, d = 1000, phi_rel_start = 1, phi_rel_stop = 2) annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {2, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldTorque torque1 annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  torque.torque = {0, 0, 500};
  torque1.torque = {0, 0, 500};
  connect(torque.frame_b, bodyCylinder.frame_b) annotation(
    Line(points = {{40, 52}, {40, 10}}, color = {95, 95, 95}));
  connect(world.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-80, 10}, {-60, 10}}));
  connect(fixedTranslation.frame_b, revolute.frame_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}}));
  connect(revolute.frame_b, bodyCylinder.frame_a) annotation(
    Line(points = {{0, 10}, {20, 10}}, color = {95, 95, 95}));
  connect(mMR_SpringDamper_Limited.flange_b, revolute.axis) annotation(
    Line(points = {{0, 50}, {4, 50}, {4, 20}, {-10, 20}}));
  connect(revolute.support, mMR_SpringDamper_Limited.flange_a) annotation(
    Line(points = {{-16, 20}, {-28, 20}, {-28, 50}, {-20, 50}}));
  connect(revolute1.frame_b, bodyCylinder1.frame_a) annotation(
    Line(points = {{0, -80}, {20, -80}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-40, -80}, {-20, -80}}));
  connect(mMR_SpringDamper_Limited1.flange_b, revolute1.axis) annotation(
    Line(points = {{0, -40}, {4, -40}, {4, -70}, {-10, -70}}));
  connect(revolute1.support, mMR_SpringDamper_Limited1.flange_a) annotation(
    Line(points = {{-16, -70}, {-28, -70}, {-28, -40}, {-20, -40}}));
  connect(fixedTranslation1.frame_a, world.frame_b) annotation(
    Line(points = {{-60, -80}, {-80, -80}, {-80, 10}, {-80, 10}}, color = {95, 95, 95}));
  connect(torque1.frame_b, bodyCylinder1.frame_b) annotation(
    Line(points = {{40, -50}, {40, -50}, {40, -80}, {40, -80}}, color = {95, 95, 95}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")));
end MMR_SpringDamper_Limited_exe;