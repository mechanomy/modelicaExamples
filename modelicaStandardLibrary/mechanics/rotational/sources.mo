model sources
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 1, period = 1, rising = 1)  annotation(
    Placement(visible = true, transformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Sources.Position position annotation(
    Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia positionInertia(J = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring positionSpring(c = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
    Placement(visible = true, transformation(origin = {-20, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring speedSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia speedInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Sources.Accelerate accelerate annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia accelerateInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring accelerateSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Sources.Move move annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring moveSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia moveInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring torqueSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia torqueInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.Rotational.Sources.Torque2 bitorque annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring bitorqueSpringRight(c = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia bitorqueInertiaRight(J = 1) annotation(
    Placement(visible = true, transformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring bitorqueSpringLeft(c = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Components.Inertia bitorqueInertiaLeft(J = 1) annotation(
    Placement(visible = true, transformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

  Modelica.Mechanics.Rotational.Sources.LinearSpeedDependentTorque linearSpeedDependentTorque(tau_nominal = 1, w_nominal = 1)  annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring linearSpeedDependentTorqueSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia linearSpeedDependentTorqueInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {160, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring quadraticSpeedDependentTorqueSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia quadraticSpeedDependentTorqueInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {160, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring constantTorqueSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia constantTorqueInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {160, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring signTorqueSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {130, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia signTorqueInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {160, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring constantSpeedSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia constantSpeedInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Sources.TorqueStep torqueStep(offsetTorque = 0.2, stepTorque = 1)  annotation(
    Placement(visible = true, transformation(origin = {100, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Spring torqueStepSpring(c = 1) annotation(
    Placement(visible = true, transformation(origin = {130, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia torqueStepInertia(J = 1) annotation(
    Placement(visible = true, transformation(origin = {160, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Routing.Multiplex3 multiplex31 annotation(
    Placement(visible = true, transformation(origin = {-52, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque quadraticSpeedDependentTorque(tau_nominal = 1, w_nominal = 1)  annotation(
    Placement(visible = true, transformation(origin = {100, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(tau_constant = 1)  annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.SignTorque signTorque(tau_constant = 1, w0 = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {98, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 1)  annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(speed.w_ref, trapezoid.y) annotation(
    Line(points = {{-32, 52}, {-92, 52}, {-92, 80}, {-98, 80}, {-98, 80}, {-98, 80}}, color = {0, 0, 127}));
  connect(position.phi_ref, trapezoid.y) annotation(
    Line(points = {{-32, 80}, {-98, 80}, {-98, 80}, {-98, 80}}, color = {0, 0, 127}));
  connect(torque.tau, trapezoid.y) annotation(
    Line(points = {{-32, -40}, {-92, -40}, {-92, 80}, {-99, 80}}, color = {0, 0, 127}));
  connect(torqueSpring.flange_a, torque.flange) annotation(
    Line(points = {{0, -40}, {-10, -40}}));
  connect(move.u, multiplex31.y) annotation(
    Line(points = {{-32, -10}, {-41, -10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex31.u3[1], trapezoid.y) annotation(
    Line(points = {{-64, -17}, {-92, -17}, {-92, 80}, {-98, 80}}, color = {0, 0, 127}));
  connect(multiplex31.u2[1], trapezoid.y) annotation(
    Line(points = {{-64, -10}, {-92, -10}, {-92, 80}, {-98, 80}}, color = {0, 0, 127}));
  connect(multiplex31.u1[1], trapezoid.y) annotation(
    Line(points = {{-64, -3}, {-92, -3}, {-92, 80}, {-98, 80}}, color = {0, 0, 127}));
  connect(move.flange, moveSpring.flange_a) annotation(
    Line(points = {{-10, -10}, {0, -10}}));
  connect(accelerate.a_ref, trapezoid.y) annotation(
    Line(points = {{-32, 20}, {-92, 20}, {-92, 80}, {-99, 80}}, color = {0, 0, 127}));
  connect(accelerateSpring.flange_a, accelerate.flange) annotation(
    Line(points = {{0, 20}, {-10, 20}}));
  connect(position.flange, positionSpring.flange_a) annotation(
    Line(points = {{-10, 80}, {2.98024e-7, 80}}));
  connect(trapezoid.y, position.phi_ref) annotation(
    Line(points = {{-34, 80}, {-32, 80}}, color = {0, 0, 127}));
  connect(speed.flange, speedSpring.flange_a) annotation(
    Line(points = {{-10, 52}, {0, 52}}));
  connect(bitorque.tau, trapezoid.y) annotation(
    Line(points = {{-20, -66}, {-20, -66}, {-20, -54}, {-92, -54}, {-92, 80}, {-98, 80}, {-98, 80}}, color = {0, 0, 127}));
  connect(bitorque.flange_a, bitorqueSpringLeft.flange_a) annotation(
    Line(points = {{-30, -70}, {-40, -70}}));
  connect(bitorque.flange_b, bitorqueSpringRight.flange_a) annotation(
    Line(points = {{-10, -70}, {0, -70}}));
  connect(torqueStep.flange, torqueStepSpring.flange_a) annotation(
    Line(points = {{110, -72}, {120, -72}}));
  connect(torqueStepSpring.flange_b, torqueStepInertia.flange_a) annotation(
    Line(points = {{140, -72}, {150, -72}}));
  connect(constantSpeedSpring.flange_a, constantSpeed.flange) annotation(
    Line(points = {{120, -40}, {110, -40}}));
  connect(constantSpeedInertia.flange_a, constantSpeedSpring.flange_b) annotation(
    Line(points = {{150, -40}, {140, -40}}));
  connect(signTorqueSpring.flange_a, signTorque.flange) annotation(
    Line(points = {{120, -12}, {108, -12}}));
  connect(signTorqueSpring.flange_b, signTorqueInertia.flange_a) annotation(
    Line(points = {{140, -12}, {150, -12}}));
  connect(constantTorqueSpring.flange_a, constantTorque.flange) annotation(
    Line(points = {{120, 20}, {110, 20}}));
  connect(constantTorqueSpring.flange_b, constantTorqueInertia.flange_a) annotation(
    Line(points = {{140, 20}, {150, 20}}));
  connect(quadraticSpeedDependentTorqueSpring.flange_a, quadraticSpeedDependentTorque.flange) annotation(
    Line(points = {{120, 48}, {110, 48}}));
  connect(quadraticSpeedDependentTorqueSpring.flange_b, quadraticSpeedDependentTorqueInertia.flange_a) annotation(
    Line(points = {{140, 48}, {150, 48}}));
  connect(linearSpeedDependentTorqueSpring.flange_a, linearSpeedDependentTorque.flange) annotation(
    Line(points = {{120, 80}, {110, 80}}));
  connect(linearSpeedDependentTorqueInertia.flange_a, linearSpeedDependentTorqueSpring.flange_b) annotation(
    Line(points = {{150, 80}, {140, 80}}));
  connect(torqueSpring.flange_b, torqueInertia.flange_a) annotation(
    Line(points = {{20, -40}, {30, -40}}));
  connect(bitorqueInertiaRight.flange_a, bitorqueSpringRight.flange_b) annotation(
    Line(points = {{30, -70}, {20, -70}}));
  connect(bitorqueSpringLeft.flange_b, bitorqueInertiaLeft.flange_a) annotation(
    Line(points = {{-60, -70}, {-70, -70}}));
  connect(positionInertia.flange_a, positionSpring.flange_b) annotation(
    Line(points = {{30, 80}, {20, 80}}));
  connect(speedSpring.flange_b, speedInertia.flange_a) annotation(
    Line(points = {{20, 52}, {30, 52}}));
  connect(accelerateInertia.flange_a, accelerateSpring.flange_b) annotation(
    Line(points = {{30, 20}, {20, 20}, {20, 20}, {20, 20}}));
  connect(moveInertia.flange_a, moveSpring.flange_b) annotation(
    Line(points = {{30, -10}, {20, -10}, {20, -10}, {20, -10}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")));end sources;