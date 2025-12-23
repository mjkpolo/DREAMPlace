#!/usr/bin/env bash

#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
#SBATCH --ntasks=1
#SBATCH --gres=gpu:tesla_v100-pcie-32gb:1
#SBATCH --output=sbatch_build_%j.out

# allow errors for clearing /tmp
set -u

module load apptainer

# clear /tmp to not run out of space
rm -rf /tmp/*

echo "SBATCH_BUILD_START $(date +%s)"
apptainer build --nv -F dreamplace.sif dreamplace.def
echo "SBATCH_BUILD_START $(date +%s)"
