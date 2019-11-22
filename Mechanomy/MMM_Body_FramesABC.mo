model MMM_Body_FramesABC
  extends Modelica.Mechanics.MultiBody.Parts.Body;
  
  parameter Modelica.SIunits.Position rAB[3](start={0.1,0,0}) "Vector from frame_a to frame_b resolved in frame_a";
  parameter Modelica.SIunits.Position rAC[3](start={0.1,0,0}) "Vector from frame_a to frame_b resolved in frame_a";
  
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_b( r_0 = frame_a.r_0 + rAB, R = frame_a.R ) "Coordinate system fixed at body" annotation (Placement(visible = true, transformation(extent = {{-116, -66}, {-84, -34}}, rotation = 0), iconTransformation(extent = {{-116, -66}, {-84, -34}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_c( r_0 = frame_a.r_0 + rAC, R = frame_a.R ) "Coordinate system fixed at body" annotation (Placement(visible = true, transformation(extent = {{-116, 36}, {-84, 68}}, rotation = 0), iconTransformation(extent = {{-116, 36}, {-84, 68}}, rotation = 0)));
  
  //Modelica.Mechanics.MultiBody.Visualizers.FixedArrow arrowB( n = Modelica.Math.Vectors.normalizeWithAssert( rAB ), length=Modelica.Math.Vectors.length( rAB) );
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Arrow arrowB(
    r=frame_a.r_0, R=frame_b.R, r_head=rAB,
    diameter=0.1, color={200,0,200}, specularCoefficient=0.1 );
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Arrow arrowC(
    r=frame_a.r_0, R=frame_c.R, r_head=rAC,
    diameter=0.1, color={200,0,200}, specularCoefficient=0.1 );
  
  //Modelica.Mechanics.MultiBody.Parts.FixedTranslation a2b( r = rAB );
equation
  //connect(frame_a, a2b.frame_a);
  
  
  //connect(         a2b.frame_b, frame_b);
  //connect(frame_a, a2c.frame_a);
  //connect(         a2c.frame_b, frame_c);
  //connect( frame_a, arrowB.frame_a);
  //arrowB.frame_a.r_0 = frame_a.r_0;
  //arrowB.frame_a.R   = frame_a.R;
  

annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MMM_Body_FramesABC;