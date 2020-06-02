model springSliderSpring
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1(a(start = 0), m = 1, v(start = 10))  annotation(
    Placement(visible = true, transformation(origin = {10, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Spring spring1(c = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Spring spring2(c = 1)  annotation(
    Placement(visible = true, transformation(origin = {44, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Damper damper1(d = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(mass1.flange_a, damper1.flange_b) annotation(
    Line(points = {{0, 54}, {0, 42}}, color = {0, 127, 0}));
  connect(damper1.flange_a, fixed1.flange) annotation(
    Line(points = {{0, 20}, {5, 20}, {5, 22}, {10, 22}, {10, 12}}, color = {0, 127, 0}));
  connect(spring2.flange_a, mass1.flange_b) annotation(
    Line(points = {{34, 54}, {28, 54}, {28, 52}, {20, 52}, {20, 52}, {20, 52}, {20, 54}, {20, 54}}, color = {0, 127, 0}));
  connect(spring2.flange_b, fixed1.flange) annotation(
    Line(points = {{54, 54}, {56, 54}, {56, 52}, {56, 52}, {56, 12}, {33, 12}, {33, 14}, {10, 14}}, color = {0, 127, 0}));
  connect(mass1.flange_a, spring1.flange_b) annotation(
    Line(points = {{0, 54}, {-9, 54}, {-9, 52}, {-20, 52}, {-20, 52}, {-20, 52}, {-20, 54}, {-20, 54}}, color = {0, 127, 0}));
  connect(fixed1.flange, spring1.flange_a) annotation(
    Line(points = {{10, 14}, {-15, 14}, {-15, 12}, {-40, 12}, {-40, 34}, {-40, 34}, {-40, 54}}, color = {0, 127, 0}));

annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(graphics = {Text(origin = {-66, 90}, fillColor = {0, 170, 255}, extent = {{-30, 2}, {138, -6}}, textString = "attempt modeling #4.51", textStyle = {TextStyle.UnderLine}, horizontalAlignment = TextAlignment.Left)}));
end springSliderSpring;
// BSD 3-Clause License
// Copyright (c) [2020], [Mechanomy, LLC] All rights reserved.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from   this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
