#!/usr/bin/env bash

#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
#SBATCH --ntasks=1
#SBATCH --gres=gpu:tesla_v100-pcie-32gb:1
#SBATCH --output=sbatch_build_%j.out

set -ux

module load apptainer
rm -rf /tmp/*
apptainer build --nv -F dreamplace.sif dreamplace.def
