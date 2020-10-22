# ParameterSensitivity
Model and Script files to run the ParameterSensitivity example given on [https://www.openmodelica.org/doc/OpenModelicaUsersGuide/latest/parametersensitivity.html]
'Sensitivity' describes how sensitive the output of the model is to changes in model parameters, giving a hint as to how the model output would change if one of the parameters were larger or smaller than given.

# Running
With `ParameterSensitivity` as your working directory, run `omc --showErrorMessages calcLVSensitivity.mos > ../temp/calcLVSensitivity.termlog`.
Look in `../temp` for the build and result files; as written the result is named `LotkaVolterra_res.mat`.
You can use a variety of programs to read `.mat` files; e.g., OMEdit -> File -> Open Result File(s).
The sensitivity results are in the `$Sensitivities` table.

# Interpretation
The Lotka Volterra model has four parameters, `lambda1`, `lambda2`, `mu1`, and `mu2` which influence the two state variables `x` and `y`.
When `lambda1.x` is positive, this is to say that increasing `lambda1` would correspondingly increase the value of `x` while `lambda1.y` suggests that that increase will have a minimal effect on `y`.
