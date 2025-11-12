#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=hen_egg_lysozyme-gpu
#SBATCH --partition=node      # GPU partition
#SBATCH --time=24:00:00           # Max runtime (hh:mm:ss)
#SBATCH --output=hen_egg_lysozyme.log      # Standard output (%j = JobID)
#SBATCH --error=hen_egg_lysozyme.err       # Capture errors separately
#SBATCH --cpus-per-task=8         # Use more CPU cores per task
#SBATCH --ntasks=1


export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

activate_miniforge3

gmx mdrun -s relax.tpr -c relax.pdb -ntomp 8 -pin on
