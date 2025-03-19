#!/bin/bash
# Part1: Create directory structure for Multiplier_P and its subparts

# Create the top-level directory
mkdir -p Multiplier_P

# Change into the top-level directory
cd Multiplier_P || { echo "Failed to change directory to Multiplier_P"; exit 1; }

# Create subdirectories for each subpart
for subdir in Mreg_V Qreg_V Areg_V AddSub_V FSM_Control_V Multiplier_V; do
    mkdir -p "$subdir"
    # Create a placeholder file for step instructions
    echo "Add your corresponding step for ${subdir} here." > "$subdir/README.md"
    rm -f "$subdir/README.txt"
done

echo "Directory structure created successfully."
