#!/bin/sh

#SBATCH -J G_SAIP-Droso
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
window=230000
#mpirun -np $cores -host=$SLURM_JOB_NODELIST python3 ../Gsaip_MashServer.py -q ../Drosophila.fa -n DrosoVsref -w $window

for file in *.fa;
do
  start_t=$(date +%s) 
  mpirun -np $cores -host=$SLURM_JOB_NODELIST python3 ../G-SAIP.py -s $file -q Drosophila.fa -n DrosoVs${file} -w $window
  finish=$(date +%s)
  echo "file ${file} execution time: = $((finish - start_t)) secs."
done

