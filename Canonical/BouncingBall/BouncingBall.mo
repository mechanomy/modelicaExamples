model BouncingBall "Elementary model of a ball dropped from a height. Ball modeled as a point mass."
    //based on

    Real height(fixed=true, start=111) "[m] - height of ball at the start of the simulation";

    //physics
    Real cor=0.92 "[-] - the coefficient of restitution, or how quickly the ball bounces. 0.92 = 'superball bouncy ball'";
    Real gravity=9.81 "[m/s2] - acceleration";

    //internal variables
    Real vel(fixed=true) "[m/s] - velocity of ball";
    Boolean flying(fixed=true, start=true) "true = ball is in the air";
    Boolean impact "true = the center of the ball is touching the ground";
    Real v_new(fixed=true) "holds the new velocity post-upate/-impact";

  equation
    impact = height <= 0.0; //if the ball height is < 0, it is 'in the ground'
    der(vel) = if (flying) then -gravity else 0; //der(vel) = acceleration
    der(height) = vel;

    when {height <= 0.0 and vel <= 0.0, impact} then //when (in the ground) && (traveling downward) set impact=true
      v_new = if edge(impact) then -cor*pre(vel) else 0; //edge(impact) = impact was false and is now true, then switch the downward velocity for vel*cor
      flying = v_new > 0; //update the flying boolean
      reinit(vel, v_new); //assign v_new to vel in the next iteration of the loop
    end when;

  annotation(
    //License("BSD-3-Clause"),
    experiment( StartTime=0, StopTime=50, Interval=0.001, Tolerance=0.001 ), //setup the simulation
    uses(Modelica(version = "3.2.2")));
end BouncingBall;

// BSD 3-Clause License
// Copyright (c) [2020], [Mechanomy, LLC] All rights reserved.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from   this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
