model MMR_SpringDamper_Limited "Linear 1D rotational spring and damper in parallel, applying cAB and dAB within angles phiA--phiB and cOut and dOut outside AB"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  
  parameter Modelica.SIunits.Angle phiA = 0 "Angular limit A";
  parameter Modelica.SIunits.Angle phiB = 0 "Angular limit B";
    
  parameter Modelica.SIunits.RotationalSpringConstant  cAB  = 1.0e6 "Spring constant applied within AB";
  parameter Modelica.SIunits.RotationalDampingConstant dAB  = 0 "Damping constant applied within AB";
  parameter Modelica.SIunits.RotationalSpringConstant  cOut = 0 "Spring constant applied outside AB";
  parameter Modelica.SIunits.RotationalDampingConstant dOut = 0 "Damping constant applied outside AB";
  parameter Modelica.SIunits.Angle phi_rel0=0 "Unstretched spring angle";
  
//protected
  Modelica.SIunits.Torque tauC "Torque due to the spring";
  Modelica.SIunits.Torque tauD "Torque due to the damper";
  Modelica.SIunits.Angle phiWrap "Wrapped angle";
  
equation
  phiWrap = Modelica.Math.wrapAngle( phi_rel );
  
  //assert( abs(phiA - Modelica.Math.wrapAngle(phiA)) < 1e-3, "phiA should lie in [-pi, pi]", level=AssertionLevel.warning);
  //assert( abs(phiB - Modelica.Math.wrapAngle(phiB)) < 1e-3, "phiB should lie in [-pi, pi]", level=AssertionLevel.warning);
  assert( 0 <= phi_rel0, "phi_rel_0, the unstretched spring angle, cannot be negative", level=AssertionLevel.warning);
  
  if (phiA <= phiWrap and phiWrap <= phiB) then //phiA < phiB
    //tauC = cAB * (phiWrap - phiA - phi_rel0);
    tauC = cAB * (phi_rel - phiA - phi_rel0);
    tauD = dAB * w_rel;
  elseif (phiB <= phiWrap and phiWrap <= phiA) then //phiB < phiA
    //tauC = cAB * (phiWrap - phiB - phi_rel0);
    tauC = cAB * (phi_rel - phiB - phi_rel0);
    tauD = dAB * w_rel;
  else //phi is not in AB
    tauC = cOut * (phiWrap - phi_rel0);
    //tauC = cOut * (phi_rel - phi_rel0);
    tauD = dOut * w_rel;
  end if;
  
  tau = tauC + tauD;
  lossPower = tauD * w_rel;
  
  annotation (
    Documentation(info="<html>
<p>A <b>spring</b> and <b>damper</b> element <b>connected in parallel</b> active within the specified angles <b>phiA</b> and <b>phiB</b>.
Angle AB is always defined as less than 180; if a larger active angle is desired, set cOut and dOut.
</p>
<p>This component is primaily designed to allow joint limits to be added to revolute joints.
In this usage, ensure that the controlled revolute joint has the support/axis flanges enabled and begins within the allowed range of motion.
Set the spring constant on the order of 1e6N/m; when the joint encounters the limited region the spring torque is applied causing the joint to bounce back from the limit.
</p>
<p>For instance, as a joint in a robot arm can move freely within [-70,70]deg, set phiA=-70, phiB=70, cAB=0 and cOut=1e6.</p>
<p>Alternately, a 270deg hinge can be created by setting phiA=270, phiB=360, cAB=1e6, and cOut=0, with perhaps dOut=1e2 to approximate static friction.</p>

<p>See the <b>MMR_SpringDamper_PhiTable</b>, where a table on the joint angle is used to determine which spring and damping constants are used, and <b>MMR_SpringDamper_Nonlinear</b> for spring and damping contants that are a function of phi and w.
</p>
</html>"),
    Icon(
      coordinateSystem(initialScale = 0.1),
        graphics={Line(points = {{-80, 40}, {-80, -40}}), Line(points = {{-80, -40}, {-50, -40}}), Rectangle(fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-60, -10}, {0, -70}}), Line(points = {{-90, 0}, {-80, 0}}), Line(points = {{80, 0}, {90, 0}}), Text(origin = {0, -9}, extent = {{-150, -144}, {150, -104}}, textString = "phiB=%phiB"), Text(origin = {0, 2},lineColor = {0, 0, 255}, extent = {{-190, 110}, {190, 70}}, textString = "%name"), Text(origin = {0, -7}, extent = {{-150, -108}, {150, -68}}, textString = "phiA=%phiA"), Line(visible = false, points = {{-100, -100}, {-100, -55}, {-5, -55}}, color = {191, 0, 0}, pattern = LinePattern.Dot), Line(origin = {-70, 40}, points = {{-10, 0}, {10, 0}, {10, 0}}), Line(origin = {-35.6917, 39.4086}, points = {{-24.2724, 0.522704}, {-18.2724, 20.5227}, {-8.2724, -19.4773}, {-0.27237, 20.5227}, {9.7276, -19.4773}, {15.7276, 0.522704}, {55.7276, 0.522704}}), Line(origin = {-14.6613, -36}, points = {{-25, 36}, {25, 36}, {25, -44}, {-25, -44}, {-25, -44}}), Line(origin = {15, 0}, points = {{5, 40}, {5, -40}, {-5, -40}}), Line(origin = {51.1664, 10.1664}, points = {{-31.1664, -10.1664}, {-11.1664, -10.1664}, {30.8336, 9.8336}, {30.8336, 9.8336}}), Line(origin = {80, 0}, points = {{-10, 0}, {10, 0}, {10, 0}})}),
    Diagram(coordinateSystem(
        initialScale = 0.1), graphics={
        Line(
          points={{-80,32},{-58,32},{-43,2},{-13,62},{17,2},{47,62},{62,32},
              {80,32}},
          thickness=0.5),
        Line(points={{-68,32},{-68,97}}, color={128,128,128}),
        Line(points={{72,32},{72,97}}, color={128,128,128}),
        Line(points={{-68,92},{72,92}}, color={128,128,128}),
Polygon(lineColor = {128, 128, 128}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid, points = {{62, 95}, {72, 92}, {62, 89}, {62, 95}}), 
Polygon(origin = {-86, 12},lineColor = {128, 128, 128}, fillColor = {0,105,255}, fillPattern = FillPattern.Solid, points = {{0,90},{0,70},{0,90}}), 
Text(lineColor = {0, 0, 255}, extent = {{-44, 79}, {29, 91}}, textString = "phi_rel"), Rectangle(fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-50, -20}, {40, -80}}), Line(points = {{-50, -80}, {68, -80}}), Line(points = {{-50, -20}, {68, -20}}), Line(points = {{40, -50}, {80, -50}}), Line(points = {{-80, -50}, {-50, -50}}), Line(points = {{-80, 32}, {-80, -50}}), Line(points = {{80, 32}, {80, -50}}), Line(points = {{-96, 0}, {-80, 0}}), Line(points = {{96, 0}, {80, 0}})}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MMR_SpringDamper_Limited;