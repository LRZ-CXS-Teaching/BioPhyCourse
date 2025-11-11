# Tips to use Redlion (138.246.237.46)

## 1. Registration 

	Register at https://mokey.red-lion.rl.gcs-devcloud.hpc.lrz.de/auth/signup to use the cluster

	Please wait for admins to approve your registration.

	For issues, please contact Matteo Foglieni/Prasanth Ganta/Ferdinand Jamitzky.

## 2. Login to redlion 

	Once registration is successful, one can login to Redlion via below options:

### 1. ssh into Redlion 

	``` bash
	ssh USERNAME@138.246.237.46
	```

	To check compute and gpu nodes 

	``` bash
	sinfo 
	```

### 2. Desktop and jupyterlab environments on Redlion 

	1. Open https://vm-138-246-237-46.cloud.mwn.de:8443/
	2. Enter username and password 
	3. Click on "Remote Desktop Container" or "Jupyter Notebook"

## 3. Cluster Nodes Specifications

### 1. CPU Nodes

| Partition  | VCPUS | RAM    | Total |
|------------|-------|--------|-------|
| node       | 80    | 990 GB | 4     |
| node-small | 8     | 99 GB  | 4     |

### 2. GPU Nodes

| Partition   | TensorCores | CUDACores   | GPU Memory |  GPU                  | Total |
|-------------|-------------|-------------|------------|-----------------------|-------|
| gpu-node    | 640         |  5120       |  16GB      |  Tesla V100-PCIE-16GB |  5    |

## 4. Slurm on Redlion

### 1. Using Modules 

Scientific softwares are made available on Redlion via two sources. One is EESSI (European Environment for Scientific Software Installations) and another is custom softwares installed using spack. 

One can find EESSI modules at path "/cvmfs/software.eessi.io/versions/2023.06/software/linux/x86_64/intel/icelake/modules/all" and custom-softwares at "/custom_software_rocky/spack/share/spack/modules/linux-rocky9-icelake".

Common commands used in HPC systems:

``` bash
# to see all modules 
module av

# to search for modules 
module spider SOFTWARENAME 

# to load modules
module load MODULE_NAME

# to unload modules 
module unload MODULE_NAME 

# to list already loaded modules 
module list 

# to see module file content 
module show MODULE_NAME
```

### 2. Using Slurm on CPU/GPU

Sample slurm scripts to run jobs on cpu/gpu

``` bash
# on cpu nodes for cp2k 
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=1
#SBATCH --job-name=myjob # your job name
#SBATCH --time=01:00:00
#SBATCH --partition=node  # or node-small 
#SBATCH --output=myjob_%j.out # redirects stdout
#SBATCH --error=myjob_%j.err  # redirects stderror 
cd $SLURM_SUBMIT_DIR
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
module purge # clears are existing modules 
module load cp2k/2025.1-gcc-11.5.0-ootgchm 
mpirun -np 16 cp2k.psmp -i H2O-32.inp > cp2k.out 2>&1
```

``` bash
# on gpu nodes for cp2k 
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=job-name
#SBATCH --partition=gpu-node      # GPU partition
#SBATCH --gres=gpu:1              # Request 1 GPU
#SBATCH --time=01:00:00           # Max runtime (hh:mm:ss)
#SBATCH --output=myjob_%j.log      # Standard output (%j = JobID)
#SBATCH --error=myjob_%j.err       # Capture errors separately
#SBATCH --mem=260G                # Total memory
#SBATCH --cpus-per-task=4         # Use more CPU cores per task

echo "Job running on node(s): $SLURM_NODELIST"
echo "Allocated GPU(s): $CUDA_VISIBLE_DEVICES"
echo "Job started at: $(date)"

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=close

module purge
module load cp2k/2025.1-gcc-11.5.0-bkgiadz
srun cp2k.psmp -i H2O-32.inp > cp2k.out 2>&1
```

### 3. Interactive runs 

``` bash
# on cpus
srun --partition=node-small --ntasks=1 --cpus-per-task=8 --mem=10G --time=02:00:00 --pty bash
nvidia-smi
```

``` bash
# on gpus 
srun --partition=gpu-node --gres=gpu:1 --ntasks=1  --time=00:30:00 --pty bash
```

## 5. OOD on Redlion 

For visualization use desktop environment at: https://vm-138-246-237-46.cloud.mwn.de:8443/ 

Click on "Remote Desktop Container". Select 8 or 16 cores and RAM 32GB. Start the desktop. 

Once desktop is ready, click terminal and follow corresponding instructions below to use visualization softwares Ovito, Vesta, Pymol and vmd. 

The course data is available at /course_data

#### 1. Ovito

Ovito is installed at /custom_software_rocky/additional/ovito-basic-3.14.0-x86_64/bin/ovito

``` bash
# run this to start ovito 
ovito
# or
/custom_software_rocky/additional/ovito-basic-3.14.0-x86_64/bin/ovito
```

### 2. Vesta 

``` bash
# load vesta module 
module load vesta
# open vesta
VESTA
```

### 3. Pymol 

``` bash
# load pymol
module load py-pymol
# open pymol 
pymol 
```

### 4. VMD

``` bash
# load VMD
module load vmd
# open vmd
vmd 
```

## 6. Jupyterlab on Redlion 

To use Jupyterlab on Redlion, login to : https://vm-138-246-237-46.cloud.mwn.de:8443/ and click Jupyter Notebook. 

Once the Launch settings window is ready, please select the following:

Python distribution: miniforge3/25.9.1
custom environment: /custom_software_rocky/miniforge3/envs/biophy
