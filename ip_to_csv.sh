#!/bin/bash

# Check if an input file was provided
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <input file>"
  exit 1
fi

# Get the name of the input file from the command line
input_file=$1

# Construct the output file name
output_file="${input_file%.*}.csv"

# Read the addresses into an array
addresses=($(< "$input_file"))

# Write the CSV file
{
  # Write the address rows
  for address in "${addresses[@]}"; do
    echo "$address,"
  done
} > "$output_file"

echo "CSV file created: $output_file"
