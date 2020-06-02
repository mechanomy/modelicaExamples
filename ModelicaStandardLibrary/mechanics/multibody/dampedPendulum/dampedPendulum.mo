model dampedPendulum
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {0, 0, 1}, phi(max = 1), useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 1, r_CM = {1, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper2(d = 1)  annotation(
    Placement(visible = true, transformation(origin = {14, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(damper2.flange_b, revolute1.axis) annotation(
    Line(points = {{24, 50}, {24, 50}, {24, 20}, {10, 20}, {10, 20}}));
  connect(revolute1.support, damper2.flange_a) annotation(
    Line(points = {{4, 20}, {4, 20}, {4, 50}, {4, 50}}));
  connect(revolute1.frame_b, body1.frame_a) annotation(
    Line(points = {{20, 10}, {40, 10}, {40, 10}, {40, 10}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-20, 10}, {-2, 10}, {-2, 10}, {0, 10}}, color = {95, 95, 95}));
  annotation(

    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    uses(Modelica(version = "3.2.2")),

    experiment( StopTime = 10, Tolerance = 1e-6, Interval = 0.02, StartTime = 0),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),

    __Mechanomy_analyze(plot="{x:time, y: revolute1.phi, linestyle: dash, linecolor:red,pointstyle: dot, pointcolor: green}"),
    __Mechanomy_analyze(plot={x:time, y: revolute1.phi, linestyle: dash, linecolor:red,pointstyle: dot, pointcolor: green})

    );


end dampedPendulum;

// BSD 3-Clause License
// Copyright (c) [2020], [Mechanomy, LLC] All rights reserved.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from   this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
