#!/bin/bash

#SBATCH -J G_SAIP-Arab
#SBATCH -D .
#SBATCH -o Assemblies.out
#SBATCH -e Assemblies.err
#SBATCH -n 54
#SBATCH -N 1
#SBATCH --partition=bigmem
#SBATCH --mem=100G

#module load conda
module load openmpi/
#source ~/.bashrc
#unset PYTHONPATH
conda activate

cores=$SLURM_NPROCS
window=110000
#mpirun -np $cores -host=$SLURM_JOB_NODELIST python3 ../Gsaip_MashServer.py -q ../Drosophila.fa -n DrosoVsref -w $window

for file in *.fa;
do
  start_t=$(date +%s) 
  mpirun -np $cores -H $SLURM_JOB_NODELIST python3 ../G-SAIP.py -q $file -s Arabidopsis.fa -n ArabVs${file} -w $window -Q 1
  finish=$(date +%s)
  echo "file ${file} execution time: = $((finish - start_t)) secs."
done

