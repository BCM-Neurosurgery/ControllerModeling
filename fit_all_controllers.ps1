param(
    [Parameter(Mandatory=$true)][string]$input_dir,
    [string]$output_dir = (Get-Location)
)

# Run fits for each controller type
$p_types = @("p", "pv", "pf", "pvi", "pif", "pvf", "pvif")

foreach ($ct_type in $p_types) {
    Write-Host "Fitting controller type: $ct_type"
    python -m create_model -i $input_dir -o $output_dir -c $ct_type -s 6
}
