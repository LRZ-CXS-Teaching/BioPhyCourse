#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20  # 
#SBATCH --cpus-per-task=4
#SBATCH --job-name=cp2k-job
#SBATCH --time=12:00:00
#SBATCH --partition=node  # node-small 
#SBATCH --job-name=myjob # your job name
#SBATCH --output=myjob_%j.out # redirects stdout
#SBATCH --error=myjob_%j.err  # redirects stderror 
cd $SLURM_SUBMIT_DIR
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
module purge
module load cp2k/2025.1-gcc-11.5.0-ootgchm 
mpirun -np 20 cp2k.psmp -i input_cp2k.inp > output.out 2>&1
