import os
import numpy as np
import matplotlib.pyplot as plt
from ase import Atoms
from ase.build import molecule, add_adsorbate
from ase.io import write, read
from ase.visualize import view
from ase.md.velocitydistribution import MaxwellBoltzmannDistribution
from ase.md.verlet import VelocityVerlet
from ase.md.langevin import Langevin
from ase.md.nvtberendsen import NVTBerendsen
from ase import units
from ase.optimize import QuasiNewton, BFGS
from ase.io.trajectory import Trajectory
from ase.calculators.emt import EMT
from ase.calculators.cp2k import CP2K
from ase.build import fcc110
from ase.constraints import FixAtoms
from ase.optimize import QuasiNewton


#####################################################
# Modelling: Solvate Hydrophosphoric acid (H3PO4)   #
# with water                                        #
#####################################################

# Read H3PO4 Molecule
H3PO4 = read("h3po4.xyz")


# create a single water molecule
water = molecule('H2O')
write('water.xyz', water)


# Install PACKMOL https://m3g.github.io/packmol/
work_path = os.getcwd()
print(f' Your simulation is at', work_path)
os.chdir("/tmp/")
os.system(' wget https://github.com/m3g/packmol/archive/refs/tags/v21.0.1.tar.gz')
os.system(' tar -xf v21.0.1.tar.gz')
os.chdir("/tmp/packmol-21.0.1")
os.system(' ./configure')
os.system(' make && make install > /dev/null 2>&1')
os.chdir(work_path)
print(f' Your simulation is at', work_path)


# Write packmol input file
with open('packmol.inp', 'w') as f:
    f.write(f"""
tolerance 1.5
filetype xyz
output solvated.xyz
pbc 10 10 10 

structure h3po4.xyz
  number 1
  center
  fixed 5. 5. 5. 0. 0. 0. # fix h3po4 at center
end structure

structure water.xyz
  number 30 # based on 1gm/cm3
  inside box 0. 0. 0. 10. 10. 10. 
end structure
""")

# solvate H3PO4 with water using packmol
os.system(' /tmp/packmol-21.0.1/packmol < packmol.inp')

# Read Solvated structure and add set cell dimensions
solvated = read('solvated.xyz')
solvated.set_cell([10, 10, 10, 90, 90, 90])
#solvated.set_cell([solvated.positions[:, 0].max() + 0.5, solvated.positions[:, 1].max() + 0.5, solvated.positions[:, 2].max() + 0.5, 90, 90, 90])
solvated.set_pbc([True, True, True])

# Add CP2K Calculator/Software

inp = '''
&FORCE_EVAL
  &DFT
    CHARGE 0
    # BASIS_SET_FILE_NAME BASIS_MOLOPT
    # POTENTIAL_FILE_NAME POTENTIAL
    # https://manual.cp2k.org/trunk/methods/dft/cutoff.html
    &MGRID
      NGRIDS 5
      REL_CUTOFF 50
      # CUTOFF 500
    &END MGRID
    # https://manual.cp2k.org/trunk/CP2K_INPUT/FORCE_EVAL/DFT/QS.html
    &QS
      METHOD GPW
      EPS_DEFAULT 1.0E-12
      EXTRAPOLATION ASPC
    &END QS
    # https://manual.cp2k.org/trunk/CP2K_INPUT/FORCE_EVAL/DFT/SCF.html
    &SCF
      SCF_GUESS RESTART
      EPS_SCF 1.0E-4
      # MAX_SCF 50
      CHOLESKY INVERSE
      IGNORE_CONVERGENCE_FAILURE
      &OT
        MINIMIZER DIIS
        PRECONDITIONER FULL_ALL
      &END OT
    &END SCF
    &XC
      &XC_FUNCTIONAL PBE
      &END XC_FUNCTIONAL
      &VDW_POTENTIAL
            POTENTIAL_TYPE PAIR_POTENTIAL
            &PAIR_POTENTIAL
          PARAMETER_FILE_NAME dftd3.dat
          TYPE DFTD3
              CALCULATE_C9_TERM .TRUE.
              REFERENCE_C9_TERM .TRUE.
          REFERENCE_FUNCTIONAL PBE
            &END PAIR_POTENTIAL
      &END VDW_POTENTIAL
    &END XC
  &END DFT
&END FORCE_EVAL
'''

#########################
# # Add CP2K calculator #
#########################
calc = CP2K(label='PWater',
            cutoff=500 * units.Rydberg,
            basis_set='SZV-MOLOPT-GTH',
            pseudo_potential='auto',
            charge=0,
            xc='PBE',
            print_level='LOW',
            set_pos_file=True,
            max_scf=50,
            inp=inp)

solvated.calc = calc


###############################
# # Run Geometry Optimization #
###############################

opt = BFGS(solvated, trajectory="optimized.traj", append_trajectory=False, logfile="opt.log")
energies = []

def print_status(a=solvated):
    epot = a.get_potential_energy()
    ekin = a.get_kinetic_energy()
    energies.append(epot+ekin)
    print(f' Energy | Epot = {epot:.3f} eV | Ekin = {ekin:.3f} eV | Etot = {epot+ekin:.3f} eV')

# One can attach functions to modify the output
opt.attach(print_status, interval=10)
print("Running optimization...")
opt.run(fmax=0.02, steps=500)
print("Simulation complete.")


# Energy profile 
plt.figure()
plt.plot(range(len(energies)), energies, marker='o')
plt.xlabel('Optimization Step')
plt.ylabel('Energy (eV)')
plt.title('Geometry Optimization of Solvated benzene')
plt.savefig("optimization_energy.png")


############################
# # Run Molecular Dynamics #
############################

# Read geometry optimized trajectory
frames = read('optimized.traj', index=':')
optimized = Trajectory('optimized.traj')[-1]
optimized.get_cell()

optimized.calc = calc

# Run MD simulation

MaxwellBoltzmannDistribution(optimized, temperature_K=300)
mddyn = NVTBerendsen(optimized, timestep=0.5 * units.fs, temperature_K=300, taut=10 * units.fs, trajectory='md.traj', logfile='md.log', append_trajectory=True)
energies = []

def print_status(a=optimized):
    epot = a.get_potential_energy()
    ekin = a.get_kinetic_energy()
    energies.append(epot+ekin)
    print(f' Energy | Epot = {epot:.3f} eV | Ekin = {ekin:.3f} eV | Etot = {epot+ekin:.3f} eV')

mddyn.attach(print_status, interval=20)
print("Running MD simulation...")
mddyn.run(100000)
print("Simulation complete.")

plt.figure()
plt.plot(range(len(energies)), energies, marker='o')
plt.xlabel('MD Step')
plt.ylabel('Energy (eV)')
plt.title('MD simulation of Solvated H3PO4')
plt.savefig("MD_energyprofile.png")
