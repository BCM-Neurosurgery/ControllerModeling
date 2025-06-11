#!/bin/bash

# Parse first positional argument as input_dir
input_dir="$1"

# Shift positional arguments so $2 onwards can be processed by getopts
shift

# Default output_dir to current directory
output_dir="$(pwd)"

# Parse optional arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -o|--output-dir) output_dir="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Check that input_dir was provided
if [ -z "$input_dir" ]; then
    echo "Error: No input directory provided."
    echo "Usage: $0 <input_dir> [-o|--output-dir <output_dir>]"
    exit 1
fi

# Run fits for each controller type
for ct_type in "p" "pv" "pf" "pvi" "pif" "pvf" "pvif"; do
    echo "Fitting controller type: $ct_type"
    python -m create_model -i "$input_dir" -o "$output_dir" -c "$ct_type" -s 6
done
