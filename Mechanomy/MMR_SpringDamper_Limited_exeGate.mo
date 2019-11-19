model MMR_SpringDamper_Limited_exeGate
    inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revoluteLeft(n = {0, 1, 0},phi(fixed = true, start = 0), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(animation = false, r = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = { 10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute revoluteRight(n = {0, 1, 0}, phi(fixed = false, start = 0), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MMR_SpringDamper_Limited limitRight(cAB = 1e6, cOut = 1e1, dAB = 0, dOut = 1e1, phiA = 2.79253, phiB = 6.28319) annotation(
    Placement(visible = true, transformation(origin = {72, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox doorRight(color = {120, 90, 24},height = 0.05, r = {0.5, 0, 0}, width = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Parts.BodyBox doorLeft(color = {133, 80, 24},height = 0.05, r = {0.5, 0, 0}, width = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Forces.WorldForce forceLeft(diameter = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Sources.Step step(height = 1111, offset = -1111, startTime = 0.2) annotation(
    Placement(visible = true, transformation(origin = {10, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    MMR_SpringDamper_Limited limitLeft(cAB = 1e6, cOut = 1e1, dAB = 0, dOut = 1e1, phiA = 2.79253, phiB = 6.28319) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.MultiBody.Forces.WorldForce forceRight(diameter = 0.1) annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  forceLeft.force  = {0, 0, step.y};
  forceRight.force = {0, 0, step.y};
  connect(revoluteRight.axis, limitRight.flange_b) annotation(
    Line(points = {{72, 20}, {82, 20}, {82, 50}}));
  connect(revoluteLeft.frame_b, doorRight.frame_a) annotation(
    Line(points = {{-40, 10}, {-20, 10}, {-20, 10}, {-20, 10}}));
  connect(revoluteLeft.frame_a, world.frame_b) annotation(
    Line(points = {{-60, 10}, {-80, 10}, {-80, 10}, {-80, 10}}));
  connect(fixedTranslation.frame_a, world.frame_b) annotation(
    Line(points = {{1, -70}, {-70, -70}, {-70, 10}, {-80, 10}}));
  connect(limitRight.flange_a, revoluteRight.support) annotation(
    Line(points = {{62, 50}, {54, 50}, {54, 20}, {66, 20}, {66, 20}}));
  connect(forceLeft.frame_b, doorRight.frame_b) annotation(
    Line(points = {{0, 40}, {0, 10}}, color = {95, 95, 95}));
  connect(revoluteLeft.axis, limitLeft.flange_b) annotation(
    Line(points = {{-50, 20}, {-34, 20}, {-34, 50}, {-40, 50}, {-40, 50}}));
  connect(limitLeft.flange_a, revoluteLeft.support) annotation(
    Line(points = {{-60, 50}, {-66, 50}, {-66, 20}, {-56, 20}, {-56, 20}}));
  connect(forceRight.frame_b, doorLeft.frame_a) annotation(
    Line(points = {{20, 40}, {20, 40}, {20, 10}, {20, 10}}));
  connect(fixedTranslation.frame_b, revoluteRight.frame_b) annotation(
    Line(points = {{20, -70}, {96, -70}, {96, 10}, {82, 10}, {82, 10}}));
  connect(doorLeft.frame_b, revoluteRight.frame_a) annotation(
    Line(points = {{40, 10}, {52, 10}, {52, 10}, {62, 10}, {62, 10}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MMR_SpringDamper_Limited_exeGate;