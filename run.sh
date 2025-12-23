#!/usr/bin/env bash

#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
#SBATCH --ntasks=1
#SBATCH --gres=gpu:tesla_v100-pcie-32gb:1
#SBATCH --output=sbatch_run_%j.out

set -eu

module load apptainer

cd $SLURM_SUBMIT_DIR
[[ -d results ]] || mkdir results

echo "SBATCH_RUN_START $(date +%s)"
apptainer exec --bind results:/opt/DREAMPlace/results --cwd /opt/DREAMPlace --nv dreamplace.sif python install/dreamplace/Placer.py test/ispd2005/adaptec1.json
echo "SBATCH_RUN_STOP $(date +%s)"
