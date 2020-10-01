# G-SAIP: Graphical Sequence Alignment in Parallel

an HPC-based strategy to perform graphical pairwise sequence alignment to speed up execution times at genomic level, in order to provide tools for analyzing huge amount of data produced by large scale projects such as the 10K plant genomes, and the Earth BioGenome.

### Prerequisites

G-SAIP was developed using Python 3.8 and with support of parallel computing using mpi4py. G-SAIP is a DNA graphical aligner that takes advantage of MashMap 56 for sequence alignment due to its speed. It requires input parameters as the reference and query sequence in FASTA format that must be declared in the command line execution to calculate the dot-plot. Also, G-SAIP uses Python libraries such as Biopython, numpy, and matplotlib.


### Installation

We highly recommend to use and install Python packages within an Anaconda enviroment. To create, execute the command below:
```
conda create -n G_SAIP python=3.8
conda activate G_SAIP
```
Then install required Python packages
```
conda install -c conda-forge biopython
conda install -c anaconda numpy
conda install -c conda-forge matplotlib
conda install -c anaconda mpi4py
```
Install prerequisite
```
conda install -c bioconda mashmap
```
Finally, download G-SAIP
```
git clone https://github.com/simonorozcoarias/G-SAIP.git
```
## Usage

To get help, run: 
```
mpirun -np 1 python3 G-SAIP.py -h
```
Usage: mpirun -np <threads> python3 G-SAIP.py -q file.fasta ... [options]

