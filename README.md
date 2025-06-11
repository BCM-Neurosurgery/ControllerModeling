# ControllerModeling

## Overview
Fit continuous controllers of a proportional-integral nature.
Estimate the mixing coefficient that determines how each controller contributes to 
the actor's control at each moment ( t ). <br>

Best practice is to follow the example in the notebook:
controllers/Notebooks/Example_NoSlack.ipynb

## Usage:
### UNIX-like
```
./fit_all_controllers.sh /path/to/input_dir -o /path/to/output_dir
```
### Windows batch
```
fit_all_controllers.bat path\to\input_dir -o path\to\output_dir
```
### PowerShell
```
.\fit_all_controllers.ps1 -input_dir "C:\path\to\input_dir" -output_dir "C:\path\to\output_dir"
```

