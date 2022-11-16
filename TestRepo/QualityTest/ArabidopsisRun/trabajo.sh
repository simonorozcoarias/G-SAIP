#!/bin/bash

#SBATCH -J G_SAIP-Arab
#SBATCH -D .
#SBATCH -o Assemblies.out
#SBATCH -e Assemblies.err
#SBATCH -n 54
#SBATCH -N 1
#SBATCH --partition=bigmem
#SBATCH --mem=100G

source ~/.bashrc
unset PYTHONPATH
conda activate Gsaip


cores=$SLURM_NPROCS
window=110000
#mpirun -np $cores -host=$SLURM_JOB_NODELIST python3 ../Gsaip_MashServer.py -q ../Drosophila.fa -n DrosoVsref -w $window
echo $SLURM_JOB_NODELIST 
echo $cores
conda list
