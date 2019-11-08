model RevoluteJoint_withAngleConstraints "Simple pendulum with one revolute joint and one body"

  inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity);
  //inner Modelica.Mechanics.MultiBody.World world;

  Modelica.Mechanics.MultiBody.Parts.Body body(m=1.0, r_CM={0.5,0,0});

  Modelica.Mechanics.MultiBody.Joints.Revolute rev(n={0,0,1}, //unit vector to specify the axis of rotation, with y vertical x to the right, swinging is in xy about z
                                                   phi(fixed=true, start=0.1), //fixed = require starting at phi.start; phi is measured from x about z
                                                   w(fixed=true),
                                                   useAxisFlange=true );
  Modelica.Mechanics.Rotational.Components.Damper damper( d=0.2);

equation
  connect(world.frame_b, rev.frame_a);
  connect(               rev.frame_b, body.frame_a);
  connect(rev.support, damper.flange_a);
  connect(             damper.flange_b, rev.axis);

  annotation( experiment(StartTime=0, StopTime=15), uses(Modelica(version="3.2.2")) );

end RevoluteJoint_withAngleConstraints;
