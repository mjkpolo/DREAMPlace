#!/usr/bin/env bash

#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --ntasks=1
#SBATCH --output=sbatch_dreamplace_%j.out

set -eux

module load apptainer
apptainer build -F dreamplace.sif dreamplace.def
