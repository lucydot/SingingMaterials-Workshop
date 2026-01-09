# MD data

Data files output from a `GPUMD` calculation. 

### The trajectory file
The key file is the trajectory file in `.xyz` format. The raw files can be very big (in this case it was 200GB!). Here there is the output from a single step, stored in `dump_head.xyz`. The first line is the number of atoms. The second line contains details about the calculation. The third line onwards contain the position of each atom.

The full trajectory files follow exactly the same format, but with this data repeated for each MD step taken. A 20GB version is available on the Sharepoint, along with a gif visualisation of the trajectory. 

### Initial geometry
The initial geometry is contained in `mode.xyz`

### Thermodynamic quantities
This contains temperature, energy, potential energy, pressure and lattice constants. They are sampled at a specified frequency (there isn't one for every MD step).
