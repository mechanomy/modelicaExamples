model M_Revolute_Limited
  "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a   frame_a "Coordinate system fixed to the joint with one cut-force and cut-torque" annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b   frame_b "Coordinate system fixed to the joint with one cut-force and cut-torque" annotation (Placement(transformation(extent={{84,-16},{116,16}})));

  parameter Modelica.SIunits.Angle phi_min(start=-6.29);
  parameter Modelica.SIunits.Angle phi_max(start= 6.29);
  //parameter Modelica.SIunits.Torque Tlimit(start=10); //N-m
  //Modelica.SIunits.Torque Tlimit = 10;
  
  Modelica.SIunits.Angle delta;
  
  Modelica.SIunits.Angle                                          phi(start=0, final stateSelect=stateSelect) "Relative rotation angle from frame_a to frame_b" annotation (unassignedMessage=" The rotation angle phi of a revolute joint cannot be determined.  Possible reasons: - A non-zero mass might be missing on either side of the parts connected to the revolute joint.  Too many StateSelect.always are defined and the model has less degrees of freedom as specified with this setting (remove all StateSelect.always settings).  ");
  Modelica.SIunits.AngularVelocity                                w(start=0, stateSelect=stateSelect) "First derivative of angle phi (relative angular velocity)";
  Modelica.SIunits.AngularAcceleration                            a(start=0) "Second derivative of angle phi (relative angular acceleration)";
  Modelica.SIunits.Torque                                         tau "Driving torque in direction of axis of rotation";

  Modelica.SIunits.Angle                                          angle "= phi_offset + phi";
  constant Modelica.SIunits.Angle                                 phi_offset=0 "Relative angle offset (angle = phi_offset + phi)";

  parameter StateSelect                                           stateSelect=StateSelect.prefer "Priority to use joint angle phi and w=der(phi) as states" annotation(Dialog(tab="Advanced"));

  parameter Boolean animation=true "= true, if animation shall be enabled (show axis as cylinder)";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n={0,0,1} "Axis of rotation resolved in frame_a (= same as in frame_b)" annotation (Evaluate=true);
 

  //Animation params
  parameter Modelica.SIunits.Distance                             cylinderLength=world.defaultJointLength "Length of cylinder representing the joint axis" annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
  parameter Modelica.SIunits.Distance                             cylinderDiameter=world.defaultJointWidth "Diameter of cylinder representing the joint axis" annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
  input Modelica.Mechanics.MultiBody.Types.Color    cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor "Color of cylinder representing the joint axis" annotation (Dialog(colorSelector=true, tab="Animation", group="if animation = true", enable=animation));
  input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient specularCoefficient =                                                            world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));


protected
  outer Modelica.Mechanics.MultiBody.World world;
  parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalizeWithAssert(n) "Unit vector in direction of rotation axis, resolved in frame_a (= same as in frame_b)";
  Modelica.Mechanics.MultiBody.Frames.Orientation R_rel "Relative orientation object from frame_a to frame_b or from frame_b to frame_a";
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(
    shapeType="cylinder",
    color=cylinderColor,
    specularCoefficient=specularCoefficient,
    length=cylinderLength,
    width=cylinderDiameter,
    height=cylinderDiameter,
    lengthDirection=e,
    widthDirection={0,1,0},
    r_shape=-e*(cylinderLength/2),
    r=frame_a.r_0,
    R=frame_a.R) if world.enableAnimation and animation;

protected
  Modelica.Mechanics.Rotational.Components.Fixed           fixed "support flange is fixed to ground";
  Modelica.Mechanics.Rotational.Interfaces.InternalSupport internalAxis(tau=tau);
  //Modelica.Mechanics.Rotational.Sources.ConstantTorque     constantTorque(tau_constant=0) if not useAxisFlange;
  Modelica.Mechanics.Rotational.Sources.ConstantTorque     constantTorque(tau_constant=0);
  Modelica.Mechanics.Rotational.Sources.Torque TEnforceLimits[3];

equation
  Connections.branch(frame_a.R, frame_b.R);

  assert(cardinality(frame_a) > 0, "Connector frame_a of revolute joint is not connected");
  assert(cardinality(frame_b) > 0, "Connector frame_b of revolute joint is not connected");

  angle = phi_offset + phi;
  w = der(phi);
  a = der(w);

  // relationships between quantities of frame_a and of frame_b
  frame_b.r_0 = frame_a.r_0;

  if Connections.rooted(frame_a.R) then
    R_rel = Modelica.Mechanics.MultiBody.Frames.planarRotation(e, phi_offset + phi, w);
    frame_b.R = Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_a.R, R_rel);
    frame_a.f = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_b.f);
    frame_a.t = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_b.t);
  else
    R_rel = Modelica.Mechanics.MultiBody.Frames.planarRotation(-e, phi_offset + phi, w);
    frame_a.R = Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_b.R, R_rel);
    frame_b.f = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_a.f);
    frame_b.t = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_a.t);
  end if;

  // d'Alemberts principle
  tau = -frame_b.t*e;
  
  //TEnforceLimits = Tlimit * e * delta;
  //TEnforceLimits = e*Tlimit;
  //TEnforceLimits = {Tlimit*e[1], Tlimit*e[2], Tlimit*e[3]};//*delta;
  //TEnforceLimits[1] = Tlimit*e[1];
  //TEnforceLimits[2] = Tlimit*e[2];
  //TEnforceLimits[3] = Tlimit*e[3];
  //TEnforceLimits[1] = Tlimit;
  //TEnforceLimits[2] = Tlimit;
  //TEnforceLimits[3] = Tlimit;
  
  // joint limits
  if ( phi_min <= phi and phi <= phi_max ) then
    //TEnforceLimits = delta*Tlimit*e;
    delta = 0;
  elseif (phi < phi_min ) then
    delta = phi-phi_min;
    //TEnforceLimits = delta*Tlimit*e;
  elseif (1 < phi ) then
    delta = phi-phi_max;
    //TEnforceLimits = delta * Tlimit * (-1.0) * e;
  else
    delta=0;
    //TEnforceLimits = delta*Tlimit*e;
  end if;


  // Connection to internal connectors
  phi = internalAxis.phi;

  
  
  connect(constantTorque.flange, internalAxis.flange) annotation (Line( points={{20,80},{0,80}}));




  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-60},{-30,60}},
          lineColor={64,64,64},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255},
          radius=10),
        Rectangle(
          extent={{30,-60},{100,60}},
          lineColor={64,64,64},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255},
          radius=10),
        Rectangle(extent={{-100,60},{-30,-60}}, lineColor={64,64,64}, radius=10),
        Rectangle(extent={{30,60},{100,-60}}, lineColor={64,64,64}, radius=10),
        Text(
          extent={{-90,14},{-54,-11}},
          lineColor={255,0,0},
          textString="a"),
        Text(
          extent={{51,11},{87,-14}},
          lineColor={128,128,128},
          textString="b"),
        Rectangle(
          extent={{-30,11},{30,-10}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,-110},{150,-80}},
          lineColor={0,0,0},
          textString="n=%n")}),
    Documentation(info="<html>

<p>
Joint where frame_b rotates around axis n which is fixed in frame_a.
The two frames coincide when the rotation angle \"phi = 0\".
</p>


<p>
In the \"Advanced\" menu it can be defined via parameter <b>stateSelect</b>
that the rotation angle \"phi\" and its derivative shall be definitely
used as states by setting stateSelect=StateSelect.always.
Default is StateSelect.prefer to use the joint angle and its
derivative as preferred states. The states are usually selected automatically.
In certain situations, especially when closed kinematic loops are present,
it might be slightly more efficient, when using the StateSelect.always setting.
</p>
<p>
If a <b>planar loop</b> is present, e.g., consisting of 4 revolute joints
where the joint axes are all parallel to each other, then there is no
longer a unique mathematical solution and the symbolic algorithms will
fail. Usually, an error message will be printed pointing out this
situation. In this case, one revolute joint of the loop has to be replaced
by a Joints.RevolutePlanarLoopConstraint joint. The
effect is that from the 5 constraints of a usual revolute joint,
3 constraints are removed and replaced by appropriate known
variables (e.g., the force in the direction of the axis of rotation is
treated as known with value equal to zero; for standard revolute joints,
this force is an unknown quantity).
</p>

<p>
In the following figure the animation of a revolute
joint is shown. The light blue coordinate system is
frame_a and the dark blue coordinate system is
frame_b of the joint. The black arrow is parameter
vector \"n\" defining the translation axis
(here: n = {0,0,1}, phi.start = 45<sup>o</sup>).
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Joints/Revolute.png\">
</p>

</html>"));
end M_Revolute_Limited;
