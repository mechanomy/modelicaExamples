package SimplePendulumPackage "A series of BouncingBall models illustrating Modelica's package and inheritance mechanisms"
  import MM = Modelica.Mechanics; //a convenience reference to Mechanics
  import MU = Modelica.SIunits;

  model System_SimplePendulum_Ideal "This simple pendulum model is extensible"
    parameter MU.Distance pendulumLength = 1 "[m] - length of the massless pendulum arm";
    parameter MU.Damping jointDamping = 0.1 "[N-m/rad-s] - damping coefficient for the revolute damper";
    parameter MU.Angle pendulumStartAngleDeg = 90;// "[deg] - starting angle of the pendulum as measured from the lowest point";

    inner MM.MultiBody.World world; //establishes a global reference frame and gravity

    MM.MultiBody.Joints.Revolute    revolute(final n = {0, 0, 1}, phi(max = 1, start = MU.Conversions.from_deg(-90+pendulumStartAngleDeg) ), useAxisFlange = true); // resting angle is at -90deg, so set start there
    MM.Rotational.Components.Damper damper(final d = jointDamping);

    replaceable MM.MultiBody.Parts.FixedTranslation link(r = {pendulumLength, 0, 0});  //make the translation replaceable, so that fidelity could be increased by modeling a shaft with inertia
    replaceable MM.MultiBody.Parts.PointMass body (m=1) constrainedby MM.MultiBody.Parts.Body; //make the body replaceable so that other body types can be used //constrainedby says taht body can be anything compatible with Body, uses PointMass with m=1 if not overridden
  equation
    connect(world.frame_b, revolute.frame_a);

    connect(revolute.support, damper.flange_a);
    connect(revolute.axis,    damper.flange_b);

    connect(revolute.frame_b, link.frame_a);
    connect(link.frame_b, body.frame_a);

  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));

  end System_SimplePendulum_Ideal;

  model System_SimplePendulum_CubeBody "Replaces the pointmass pendulum for an inertial cube"
    extends System_SimplePendulum_Ideal(
      redeclare MM.MultiBody.Parts.BodyBox body( r = {1,0,0}, length=0.1, width=0.1, height=0.01 ) //redeclare requires that the part name be the same, other types .. ok. //no ;
    );
  end System_SimplePendulum_CubeBody;

  model System_SimplePendulum_RealShaft "Replaces the massless pendulum shaft with a thin cylindrical shaft"
    extends System_SimplePendulum_Ideal(
      redeclare MM.MultiBody.Parts.PointMass body( m = 0.9 ),
      redeclare MM.MultiBody.Parts.BodyShape link( r={pendulumLength,0,0},r_CM={0.5,0,0}, m=0.1 ) //be sure to utilize the parent's parameters!
    );
  end System_SimplePendulum_RealShaft;

  model Instance_SimplePendulum "Compare the different pendulum models"
    System_SimplePendulum_Ideal     sysId( pendulumLength = 2, pendulumStartAngleDeg = 45 ); //instantiate so we can customize this instance
    System_SimplePendulum_CubeBody  sysCB( pendulumLength = 2, pendulumStartAngleDeg=45 );  //massless shaft with an inertial 1kg cube pendulum
    System_SimplePendulum_RealShaft sysRS( pendulumLength = 2, pendulumStartAngleDeg=45 ); //0.1kg shaft with 0.9kg point mass pendulum

    annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.002));
  end Instance_SimplePendulum;

  annotation(uses(Modelica(version = "3.2.2")));
end SimplePendulumPackage;

// BSD 3-Clause License
// Copyright (c) [2020], [Mechanomy, LLC] All rights reserved.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from   this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
