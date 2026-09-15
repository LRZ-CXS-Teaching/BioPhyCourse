import matplotlib.pyplot as plt
import numpy as np
import glob
import os
import seaborn as sns

def plot_dos(data_folder=".", show_total_only=False):
    """
    Plot DOS from .dat files in the given folder.

    Parameters
    ----------
    data_folder : str
    Path to folder containing .dat files.
    show_total_only : bool
    If True, only plot 'dos_total.dat'. Otherwise plot all .dat files.
    """
    # collect files
    if show_total_only:
        files = [os.path.join(data_folder, "dos_total.dat")]
    else:
        files = glob.glob(os.path.join(data_folder, "*.dat"))
        files.sort()

    # seaborn palette
    colors = sns.color_palette("muted", n_colors=len(files))

    plt.figure(figsize=(8,6))

    for f, c in zip(files, colors):
        data = np.loadtxt(f)
        energy = data[:,0] + 4.67
        dos = data[:,1]
        label = os.path.splitext(os.path.basename(f))[0]
        plt.plot(energy, dos, label=label, color=c, linewidth=4)
        plt.fill_between(energy, dos, color=c, alpha=0.1)

     #vertical line at Fermi level (0 eV)
    plt.axvline(0, color="k", linestyle="--", linewidth=1)

    # labels and title
    plt.xlabel("Energy (eV)")
    plt.ylabel("Density of States (arb. units)")
    plt.title("DFTB+ Density of States")

    # restrict x range to [-8, 8] eV
    plt.xlim(-15, 15)
    plt.ylim(bottom=0)

    plt.legend()
    plt.tight_layout()
    plt.show()
    plt.savefig("a.png")
