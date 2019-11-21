model MMM_BodyBox_Frame3  "Rigid body with box shape. Mass and animation properties are computed from box data and density (12 potential states)"

  import Modelica.Math.Vectors.normalizeWithAssert;
  import Modelica.SIunits.Conversions.to_unit1;

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a    "Coordinate system fixed to the component with one cut-force and cut-torque" annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b    "Coordinate system fixed to the component with one cut-force and cut-torque" annotation (Placement(visible = true, transformation(extent = {{96, 4}, {128, 36}}, rotation = 0), iconTransformation(extent = {{84, 22}, {116, 54}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_c    "Coordinate system fixed to the component with one cut-force and cut-torque" annotation (Placement(visible = true, transformation(extent = {{96, -36}, {128, -4}}, rotation = 0), iconTransformation(extent = {{86, -56}, {118, -24}}, rotation = 0)));

  parameter Modelica.SIunits.Position rAB[3](start={0.1,0,0}) "Vector from frame_a to frame_b resolved in frame_a";
  parameter Modelica.SIunits.Position rAC[3](start={0.1,0,0}) "Vector from frame_a to frame_c resolved in frame_a";

  parameter Modelica.SIunits.Position r_shape[3]={0,0,0} "Vector from frame_a to box origin, resolved in frame_a" annotation(HideResult=false);
  final parameter Modelica.SIunits.Position r_CM[3]=r_shape + normalizeWithAssert(lengthDirection)*length/2 "Position vector from origin of frame_a to center of mass, resolved in frame_a" annotation(HideResult=false);

  
  parameter Modelica.SIunits.Length length = Modelica.Math.Vectors.length((rAB+rAC)/2 - r_shape) "Length of box" annotation(HideResult=false);
  parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection = to_unit1( (rAB+rAC)/2 - r_shape) "Vector in length direction of box, resolved in frame_a" annotation (Evaluate=true, HideResult=true);
  //parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection = {0,1,0} "Vector in width direction of box, resolved in frame_a" annotation (Evaluate=true, HideResult=true);
  parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection = to_unit1( rAB-rAC )"Vector in width direction of box, resolved in frame_a" annotation (Evaluate=true, HideResult=true);
  //parameter Modelica.SIunits.Distance width=length/world.defaultWidthFraction "Width of box" annotation(HideResult=false);
  parameter Modelica.SIunits.Distance width = Modelica.Math.Vectors.length(rAB-rAC);
  //parameter Modelica.SIunits.Distance height=width "Height of box" annotation(HideResult=false);
  parameter Modelica.SIunits.Distance height = length/world.defaultWidthFraction "Height of box" annotation(HideResult=false);
  parameter Modelica.SIunits.Distance innerWidth=0 "Width of inner box surface (0 <= innerWidth <= width)" annotation(HideResult=true);
  parameter Modelica.SIunits.Distance innerHeight=innerWidth "Height of inner box surface (0 <= innerHeight <= height)" annotation(HideResult=true);
  parameter Modelica.SIunits.Density density=7700 "Density of cylinder (e.g., steel: 7700 .. 7900, wood : 400 .. 800)" annotation(HideResult=false);

  parameter Boolean animation=true "= true, if animation shall be enabled (show box between frame_a and frame_b)" annotation(HideResult=true);
  input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of box" annotation( Dialog(colorSelector=true, enable=animation), HideResult=true);
  input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient specularCoefficient=world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation (Dialog(enable=animation), HideResult=true);

  Modelica.SIunits.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation (Dialog(tab="Initialization",showStartAttribute=true));
  Modelica.SIunits.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation (Dialog(tab="Initialization",showStartAttribute=true));
  Modelica.SIunits.Acceleration a_0[3](start={0,0,0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation (Dialog(tab="Initialization",showStartAttribute=true));

  parameter Boolean angles_fixed=false "= true, if angles_start are used as initial values, else as guess values" annotation ( Evaluate=true, choices(checkBox=true), Dialog(tab="Initialization"), HideResult=true);
  parameter Modelica.SIunits.Angle angles_start[3]={0,0,0} "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b" annotation (Dialog(tab="Initialization"), HideResult=true);
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_start={1,2,3} "Sequence of rotations to rotate frame_a into frame_b at initial time" annotation (Evaluate=true, Dialog(tab="Initialization"), HideResult=true);

  parameter Boolean w_0_fixed=false "= true, if w_0_start are used as initial values, else as guess values" annotation ( Evaluate=true, choices(checkBox=true), Dialog(tab="Initialization"), HideResult=true);
  parameter Modelica.SIunits.AngularVelocity w_0_start[3]={0,0,0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation (Dialog(tab="Initialization"), HideResult=true);

  parameter Boolean z_0_fixed=false "= true, if z_0_start are used as initial values, else as guess values" annotation ( Evaluate=true, choices(checkBox=true), Dialog(tab="Initialization"), HideResult=true);
  parameter Modelica.SIunits.AngularAcceleration z_0_start[3]={0,0,0} "Initial values of angular acceleration z_0 = der(w_0)" annotation (Dialog(tab="Initialization"), HideResult=true);

  parameter Boolean enforceStates=false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation (Dialog(tab="Advanced"), HideResult=true);
  parameter Boolean useQuaternions=true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation (Dialog(tab="Advanced"), HideResult=true);
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_angleStates={1,2,3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation (Evaluate=true, Dialog(tab="Advanced", enable=not useQuaternions), HideResult=true);

  final parameter Modelica.SIunits.Mass mo(min=0) = density*length*width*height "Mass of box without hole";
  final parameter Modelica.SIunits.Mass mi(min=0) = density*length*innerWidth*innerHeight "Mass of hole of box";
  final parameter Modelica.SIunits.Mass m(min=0) = mo - mi "Mass of box";

  final parameter Modelica.Mechanics.MultiBody.Frames.Orientation R = Modelica.Mechanics.MultiBody.Frames.from_nxy((rAB+rAC)/2, widthDirection) "Orientation object from frame_a to coordinates system spanned by r and widthDirection";

  final parameter Modelica.SIunits.Inertia I[3, 3] = Modelica.Mechanics.MultiBody.Frames.resolveDyade1(R, diagonal({
    mo*(width*width +   height*height) - mi*(innerWidth*innerWidth + innerHeight*innerHeight),
    mo*(length*length + height*height) - mi*(length*length + innerHeight*innerHeight),
    mo*(length*length + width*width)   - mi*(length*length + innerWidth*innerWidth)} / 12 )) 
    "Inertia tensor of body box with respect to center of mass, parallel to frame_a" annotation( HideResult=true);
protected
  Modelica.Mechanics.MultiBody.Parts.Body body(
    animation=false,
    r_CM=r_CM,
    m=m,
    I_11=I[1, 1],
    I_22=I[2, 2],
    I_33=I[3, 3],
    I_21=I[2, 1],
    I_31=I[3, 1],
    I_32=I[3, 2],
    sequence_start=sequence_start,
    angles_fixed=angles_fixed,
    angles_start=angles_start,
    w_0_fixed=w_0_fixed,
    w_0_start=w_0_start,
    z_0_fixed=z_0_fixed,
    z_0_start=z_0_start,
    useQuaternions=useQuaternions,
    sequence_angleStates=sequence_angleStates,
    enforceStates=false) annotation (Placement(visible = true, transformation(extent = {{0, -80}, {40, -40}}, rotation = 0)));

  Modelica.Mechanics.MultiBody.Parts.FixedTranslation frameTranslationAB(
    r=rAB,
    animation=animation,
    shapeType="box",
    r_shape=r_shape,
    lengthDirection=lengthDirection,
    widthDirection=widthDirection,
    length=length,
    width=width,
    height=height,
    color=color,
    specularCoefficient=specularCoefficient) annotation (Placement( visible = true, transformation(extent = {{0, 0}, {40, 40}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation frameTranslationAC(
    r=rAC,
    animation=animation,
    shapeType="box",
    r_shape=r_shape,
    lengthDirection=lengthDirection,
    widthDirection=widthDirection,
    length=length,
    width=width,
    height=height,
    color=color,
    specularCoefficient=specularCoefficient) annotation (Placement( visible = true, transformation(origin = {20, -20}, extent = {{-19, -23}, {19, 23}}, rotation = 0))); //HideResult isn't applied to components: frameTranslationAC and all its members are visible..make protected


  outer Modelica.Mechanics.MultiBody.World world;

equation
  r_0 = frame_a.r_0;
  v_0 = der(r_0);
  a_0 = der(v_0);

  assert(innerWidth <= width, "parameter innerWidth is greater than parameter width");
  assert(innerHeight <= height, "parameter innerHeight is greater than parameter height");
  connect(frame_a, frameTranslationAC.frame_a) annotation( Line(points = {{-100, 0}, {-20, 0}, {-20, -20}, {2, -20}, {2, -20}}));
  connect(frameTranslationAC.frame_b, frame_c) annotation( Line(points = {{40, -20}, {112, -20}}, color = {95, 95, 95}));
  connect(frameTranslationAB.frame_a, frame_a) annotation( Line(points = {{0, 20}, {-20, 20}, {-20, 0}, {-100, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(frameTranslationAB.frame_b, frame_b) annotation( Line(points = {{42, 20}, {112, 20}, {112, 20}, {112, 20}}));
  connect(body.frame_a, frame_a) annotation(
    Line(points = {{0, -60}, {-40, -60}, {-40, 0}, {-100, 0}, {-100, 0}}, color = {95, 95, 95}));
  
  annotation (Documentation(info="<html>
<p>
<b>Rigid body</b> with positionable frames a,b,c.
The mass properties of the body (mass, center of mass, inertia tensor) are computed from the frame locations.
Optionally, the box may be hollow.
The (outer) box shape is by default used in the animation.
The hollow part is not shown in the animation.
The three connector frames <b>frame_a</b>, <b>frame_b</b>, and <b>frame_c</b> are always parallel to each other.
</p>

<p>
A BodyBox component has potential states. For details of these states and of the \"Advanced\" menu parameters, see model <a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.</p>
</html>"),
Icon( coordinateSystem(initialScale = 0.1),
 graphics={
   Polygon(lineColor = {0, 95, 191}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid, points = {{100, 40}, {100, -30}, {90, -40}, {90, 30}, {100, 40}}),
   Rectangle(lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 30}, {90, -40}}),
   Polygon(lineColor = {0, 95, 191}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid, points = {{-100, 30}, {-90, 40}, {100, 40}, {90, 30}, {-100, 30}}),
   Text(lineColor = {0, 0, 255}, extent = {{-150, 90}, {150, 50}}, textString = "%name"),
   Text(extent = {{150, -80}, {-150, -50}}, textString = "rAB=%rAB"),
   Text(extent = {{52, 8}, {88, -17}}, textString = "b"),
   Text(extent = {{-87, 12}, {-51, -13}}, textString = "a"),
   Text(origin = {0, -24},extent = {{150, -80}, {-150, -50}}, textString = "rAC=%rAC")
 }),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));


end MMM_BodyBox_Frame3;