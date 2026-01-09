# Data files relating to phonon calculations

These are intermediate files produced by the `phonopy` software, the most commonly used software for phonon calculations.

- [FORCE_CONSTANTS](https://phonopy.github.io/phonopy/input-files.html#force-constants-and-force-constants-hdf5): This is a central mathematical object in phonon analysis (see Section 2 of [this paper](https://iopscience.iop.org/article/10.1088/2516-1075/ac78b3)). For each pair of atoms there is a matrix of force constants in Cartesian coordinates. This matrix is fourier transformed (at a particular value in reciprocal space) to give the eigenvalues and eigenvectors in `band.yaml` and `mesh.yaml`. It is not directly visualised.

- [FORCE_SETS](https://phonopy.github.io/phonopy/input-files.html#force-file-force-sets): The first two lines specify the number of atoms in the supercell (the repeating unit), and the number of displacements made. Below this are a list of blocks containing: (i) atom number (label) in supercell; (ii) the atomic displacement in cartesian co-ordinates; (iii) the atomic forces in cartesian coordinates. `FORCE_SETS` and `FORCE_CONSTANTS` contain the same information, they can be used interchangably in processing.

- plot.png contains the resulting visualisation from standard phonon analysis.

- band.yaml: contains the eigenvectors and eigenvalues which result from diagonalising `FORCE_CONSTANTS` at specified points in reciprocal space. The points are chosen along high symmetry lines in reciprocal space. The eigenvalues are displayed in the bandstructure in `plot.png` (the eigenvectors are not visualised).

- mesh.yaml:  contains the eigenvectors and eigenvalues which result from diagonalising `FORCE_CONSTANTS` at specified points in reciprocal space. The points are chosen as a dense mesh across the whole of reciprocal space. The eigenvalues are used to calculate a density of states, the number of phonon vibrational modes per unit frequency. This dos data is reported in `total_dos.dat`.

- total_dos.dat: see explanation above.

- geometry.in: the geometry file for the material.

- phonopy.yaml: an intermediate phonopy file, included for reproducibility.

- band.conf: is a configuration file, included for reproducibility.

### Other datasets

We can use the Materials Project API or the phonon database to access other phonon datasets. I'm not sure whether the FORCE_CONSTANTS will be available.
