model MMM_BodyBox_Frames3_exe
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {1, 0, 1})  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {1, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MMM_BodyBox_Frame3 body3(density = 7700,rAB = {0.5, 0, 0.5}, rAC = {0.5, 0, -0.5})  annotation(
    Placement(visible = true, transformation(origin = {128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(r_rel_a(each fixed = true, start = {0.5, 1, 0.5}))  annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel0(c = 500, d = 100)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel1(c = 500, d = 100) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel2(c = 500, d = 100) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedTranslation1.frame_a, world.frame_b) annotation(
    Line(points = {{-60, 50}, {-70, 50}, {-70, 10}, {-80, 10}, {-80, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_a, world.frame_b) annotation(
    Line(points = {{-60, -30}, {-70, -30}, {-70, 10}, {-80, 10}}, color = {95, 95, 95}));
  connect(freeMotion.frame_b, body3.frame_a) annotation(
    Line(points = {{60, 30}, {60, 31}, {118, 31}, {118, 10}}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
    Line(points = {{40, 30}, {-62, 30}, {-62, 10}, {-80, 10}}, color = {95, 95, 95}));
  connect(world.frame_b, springDamperParallel0.frame_a) annotation(
    Line(points = {{-80, 10}, {-20, 10}, {-20, 10}, {-20, 10}}));
  connect(springDamperParallel0.frame_b, body3.frame_a) annotation(
    Line(points = {{0, 10}, {118, 10}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, springDamperParallel2.frame_a) annotation(
    Line(points = {{-40, -30}, {-20, -30}, {-20, -30}, {-20, -30}}));
  connect(springDamperParallel2.frame_b, body3.frame_c) annotation(
    Line(points = {{0, -30}, {138, -30}, {138, 6}}));
  connect(body3.frame_b, springDamperParallel1.frame_b) annotation(
    Line(points = {{138, 14}, {138, 50}, {0, 50}}));
  connect(fixedTranslation1.frame_b, springDamperParallel1.frame_a) annotation(
    Line(points = {{-40, 50}, {-20, 50}, {-20, 50}, {-20, 50}}, color = {95, 95, 95}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.01),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MMM_BodyBox_Frames3_exe;