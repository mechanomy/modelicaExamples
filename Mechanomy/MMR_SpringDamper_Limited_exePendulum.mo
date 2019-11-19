model MMR_SpringDamper_Limited_exePendulum
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = false, start = 0), useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MMR_SpringDamper_Limited mMR_SpringDamper_Limited(cAB = 0, cOut = 1e3, dAB = 0, dOut = 1e3, phiA = -1.39626, phiB = 0)  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{0, 10}, {18, 10}, {18, 10}, {20, 10}}, color = {95, 95, 95}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{40, 10}, {60, 10}, {60, 10}, {60, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, pointMass.frame_a) annotation(
    Line(points = {{80, 10}, {110, 10}, {110, 10}, {110, 10}}, color = {95, 95, 95}));
  connect(mMR_SpringDamper_Limited.flange_a, revolute.support) annotation(
    Line(points = {{20, 50}, {10, 50}, {10, 20}, {24, 20}}));
  connect(revolute.axis, mMR_SpringDamper_Limited.flange_b) annotation(
    Line(points = {{30, 20}, {46, 20}, {46, 50}, {40, 50}}));

annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.001),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MMR_SpringDamper_Limited_exePendulum;