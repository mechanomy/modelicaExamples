model MMT_DamperLimited "Linear 1D translational damper"
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  
  parameter Boolean dampAccordingToPosition = true "true = apply damping according to position limits" annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Modelica.SIunits.Position s_rel_damping_start(final min=0, start=0) "Damping is applied beginning at this position";
  parameter Modelica.SIunits.Position s_rel_damping_stop( final min=0, start=0) "Damping is removed at this position";
  
  parameter Modelica.SIunits.Velocity v_rel_damping_start(final min=0, start=0) "Damping is applied beginning at this velocity";
  parameter Modelica.SIunits.Velocity v_rel_damping_stop( final min=0, start=0) "Damping is removed at this velocity";
  
  parameter Modelica.SIunits.TranslationalDampingConstant d(final min=0, start=0) "Damping applied between start and stop";
  
equation
  //f = d*v_rel;
  //f = if ( abs(s_rel) <= 1 ) then 0 else d*v_rel;
  if (dampAccordingToPosition) then 
    assert( s_rel_damping_start < s_rel_damping_stop, "MMT_DamperLimited given s_rel_damping_start !< s_rel_damping_stop, ignoring stop position");
    if (s_rel_damping_stop < s_rel_damping_start ) then
      s_rel_damping_stop = s_rel_damping_start * 10;
    end if;
  
    f = if ( s_rel_damping_start < abs(s_rel) and abs(s_rel) < s_rel_damping_stop ) then d*v_rel else 0;
    
  else //damp according to velocity
    assert( v_rel_damping_start < v_rel_damping_stop, "MMT_DamperLimited given v_rel_damping_start !< v_rel_damping_stop, ignoring stop velocity");
    if (v_rel_damping_stop < v_rel_damping_start ) then
      v_rel_damping_stop = v_rel_damping_start *10;
    end if;
  
    f = if ( v_rel_damping_start < abs(v_rel) and abs(v_rel) < v_rel_damping_stop ) then d*v_rel else 0;
  
  end if;
  
  
  
  
  lossPower = f*v_rel;



  annotation (
    Documentation(info="<html>
<p>
<i>Linear, velocity dependent damper</i> element. It can be either connected
between a sliding mass and the housing (model Fixed), or
between two sliding masses.
</p>

</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Line(points={{-90,0},{-60,0}}, color={0,0,
          0}),Line(points={{-60,-30},{-60,30}}),Line(points=
          {{-60,-30},{60,-30}}),Line(points={{-60,30},{60,30}}),Rectangle(
              extent={{-60,30},{30,-30}},
              lineColor={0,0,0},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Line(points={{30,0},{90,0}}),Polygon(
              points={{50,-90},{20,-80},{20,-100},{50,-90}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),Line(points={{-60,-90},{20,-90}}),Text(
              extent={{-150,90},{150,50}},
              textString="%name",
              lineColor={0,0,255}),Text(
              extent={{-150,-45},{150,-75}},
              lineColor={0,0,0},
              textString="d=%d"),Line(
              visible=useHeatPort,
              points={{-100,-100},{-100,-20},{-14,-20}},
              color={191,0,0},
              pattern=LinePattern.Dot)}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={Line(points={{-90,0},{-60,0}}, color={0,
          0,0}),Line(points={{-60,-30},{-60,30}}),Line(
          points={{-60,-30},{60,-30}}),Line(points={{-60,30},
          {60,30}}),Rectangle(
              extent={{-60,30},{30,-30}},
              lineColor={0,0,0},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Line(points={{30,0},{90,0}}),Line(points={{-50,60},{50,60}}, color={128,128,128}),
          Polygon(
              points={{50,63},{60,60},{50,57},{50,63}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),Text(
              extent={{-58,68},{42,78}},
              lineColor={128,128,128},
              textString="der(s_rel)")}));



end MMT_DamperLimited;
