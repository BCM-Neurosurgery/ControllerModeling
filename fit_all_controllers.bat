@echo off
setlocal

REM Check that input_dir was provided
if "%~1"=="" (
    echo Error: No input directory provided.
    echo Usage: %~nx0 input_dir [-o output_dir]
    exit /b 1
)

REM Get input_dir and shift arguments
set "input_dir=%~1"
shift /1

REM Default output_dir to current directory
set "output_dir=%cd%"

REM Parse optional arguments
:parse_args
if "%~1"=="" goto done_parse
if "%~1"=="-o" (
    set "output_dir=%~2"
    shift /1
    shift /1
    goto parse_args
)
if "%~1"=="--output-dir" (
    set "output_dir=%~2"
    shift /1
    shift /1
    goto parse_args
)
echo Unknown argument: %~1
exit /b 1

:done_parse

REM Run fits for each controller type
for %%C in (p pv pf pvi pif pvf pvif) do (
    echo Fitting controller type: %%C
    python -m create_model -i "%input_dir%" -o "%output_dir%" -c %%C -s 6
)

endlocal