model MMR_SpringDamper_Limited_exeDriven
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyFree(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyDriven(r = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteFree(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteDriven(useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MMR_SpringDamper_Limited mMR_SpringDamper_Limited(cAB = 1e1, cOut = 5e0, dAB = 1e1, dOut = 5e0, phiA = 0.872665, phiB = 1.39626)  annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(speed.flange, revoluteDriven.axis) annotation(
    Line(points = {{20, 30}, {50, 30}, {50, 20}}));
  connect(const.y, speed.w_ref) annotation(
    Line(points = {{-18, 30}, {-2, 30}, {-2, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(world.frame_b, revoluteDriven.frame_a) annotation(
    Line(points = {{-80, 10}, {38, 10}, {38, 10}, {40, 10}}, color = {95, 95, 95}));
  connect(revoluteDriven.frame_b, bodyDriven.frame_a) annotation(
    Line(points = {{60, 10}, {80, 10}, {80, 10}, {80, 10}}, color = {95, 95, 95}));
  connect(bodyDriven.frame_b, revoluteFree.frame_a) annotation(
    Line(points = {{100, 10}, {120, 10}, {120, 10}, {120, 10}}, color = {95, 95, 95}));
  connect(revoluteFree.frame_b, bodyFree.frame_a) annotation(
    Line(points = {{140, 10}, {160, 10}, {160, 10}, {160, 10}}, color = {95, 95, 95}));
  connect(mMR_SpringDamper_Limited.flange_a, revoluteFree.support) annotation(
    Line(points = {{120, 50}, {114, 50}, {114, 20}, {124, 20}, {124, 20}}));
  connect(revoluteFree.axis, mMR_SpringDamper_Limited.flange_b) annotation(
    Line(points = {{130, 20}, {150, 20}, {150, 50}, {140, 50}, {140, 50}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),
  experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MMR_SpringDamper_Limited_exeDriven;