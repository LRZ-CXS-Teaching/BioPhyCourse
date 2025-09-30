#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=hen_egg_lysozyme-gpu
#SBATCH --partition=node                   # GPU partition
#SBATCH --time=01:00:00                    # Max runtime (hh:mm:ss)
#SBATCH --output=hen_egg_lysozyme.log      # Standard output (%j = JobID)
#SBATCH --error=hen_egg_lysozyme.err       # Capture errors separately
#SBATCH --cpus-per-task=10                 # Use more CPU cores per task
#SBATCH --ntasks=1

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module purge
module use /custom_software_rocky/spack/share/spack/modules/linux-rocky9-icelake/
module load gromacs/2025.2-gcc-11.5.0-s6ws2hp 

mpirun -np 1 gmx_mpi mdrun -s relax.tpr -c relax.pdb -ntomp 10
