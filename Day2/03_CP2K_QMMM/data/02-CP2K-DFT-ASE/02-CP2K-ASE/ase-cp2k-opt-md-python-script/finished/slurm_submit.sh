#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=4
#SBATCH --job-name=cp2k-job
#SBATCH --time=24:00:00
#SBATCH --partition=node  # node-small 
#SBATCH --job-name=myjob # your job name
#SBATCH --output=myjob_%j.out # redirects stdout
#SBATCH --error=myjob_%j.err  # redirects stderror 
cd $SLURM_SUBMIT_DIR
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export ASE_CP2K_COMMAND="mpirun -n 20 /custom_software_rocky/additional/cp2k/exe/local/cp2k_shell.psmp"
export CP2K_DATA_DIR="/custom_software_rocky/additional/cp2k/data/"
module purge
module load miniforge3/25.9.1 
source activate base
conda activate biophy
source /custom_software_rocky/additional/cp2k/tools/toolchain/install/setup
python3 MMS_cp2k_ase.py > output.out 2>&1
