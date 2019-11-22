model MMM_BodyBox_FramesABC_exeSpringPlate
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MMM_Body_FramesABC body3(m = 5, rAB = {0.5, 0, 0.5}, rAC = {0.5, 0, -0.5}, r_CM = (body3.rAB + body3.rAC) / 2) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sdA(c = 5, d = 2, s_unstretched = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion1(r_rel_a(each fixed = true, start = {1, 0, 0})) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedC(r = {1, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sdC(c = 5, d = 0, s_unstretched = 0.1) annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedB(r = {1, 0, 1}) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sdB(c = 5, d = 0, s_unstretched = 0.1) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
assert(true, "in the simulation, watch how frames bc do not rotate with frame a, or their forces do not influence the rotation of the body...");
  connect(sdA.frame_b, body3.frame_a) annotation(
    Line(points = {{0, 10}, {80, 10}}));
  connect(world.frame_b, sdA.frame_a) annotation(
    Line(points = {{-80, 10}, {-20, 10}, {-20, 10}, {-20, 10}}));
  connect(world.frame_b, freeMotion1.frame_a) annotation(
    Line(points = {{-80, 10}, {-60, 10}, {-60, 40}, {-20, 40}}, color = {95, 95, 95}));
  connect(freeMotion1.frame_b, body3.frame_a) annotation(
    Line(points = {{0, 40}, {20, 40}, {20, 10}, {80, 10}}, color = {95, 95, 95}));
  connect(fixedC.frame_a, world.frame_b) annotation(
    Line(points = {{-19, 70}, {-60, 70}, {-60, 10}, {-80, 10}}));
  connect(fixedC.frame_b, sdC.frame_a) annotation(
    Line(points = {{1, 70}, {21, 70}}));
  connect(sdC.frame_b, body3.frame_c) annotation(
    Line(points = {{41, 70}, {80, 70}, {80, 16}}));
  connect(fixedB.frame_b, sdB.frame_a) annotation(
    Line(points = {{0, -30}, {20, -30}}));
  connect(world.frame_b, fixedB.frame_a) annotation(
    Line(points = {{-80, 10}, {-60, 10}, {-60, -32}, {-20, -32}, {-20, -30}}, color = {95, 95, 95}));
  connect(sdB.frame_b, body3.frame_b) annotation(
    Line(points = {{40, -30}, {80, -30}, {80, 6}, {80, 6}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.01),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_SIMULATION,LOG_SUCCESS", outputFormat = "mat", s = "rungekutta", cpu = "()"));
end MMM_BodyBox_FramesABC_exeSpringPlate;