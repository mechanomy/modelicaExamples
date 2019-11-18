model MMT_SpringNonlinear
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;

  parameter Modelica.SIunits.TranslationalSpringConstant c(final min=0, start=1) "Spring constant";
  parameter Real c_expo(final min=0, start=1) "Spring exponent";
  parameter Modelica.SIunits.Distance s_rel0=0 "Unstretched spring length";

equation
  //f = c*abs(s_rel - s_rel0)^c_expo*sign(s_rel - s_rel0);
  f = if ( abs(s_rel) < 1 ) then 0 else c*abs(s_rel - s_rel0)^c_expo*sign(s_rel - s_rel0);


annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})));

end MMT_SpringNonlinear;
