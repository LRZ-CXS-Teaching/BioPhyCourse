#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=1
#SBATCH --job-name=graphene # your job name
#SBATCH --time=01:00:00
#SBATCH --partition=node  # or node-small 
#SBATCH --output=graphene.out # redirects stdout
#SBATCH --error=graphene.err  # redirects stderror 
cd $SLURM_SUBMIT_DIR
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
module purge # clears are existing modules 
module load lammps/20250722-gcc-11.5.0-aqpyof3

mpirun -np 16 lmp -in in.graphene 
