#!/bin/bash/

#SBATCH -N GsaipArab
#SBATCH -D .
#SBATCH -o salida.txt
#SBATCH -e error.txt
#SBATCH -n 24
#SBATCH -N 1
#SBATCH --partition=workq
#SBATCH --mem=80G

conda activate Gsaip 

cores=$SLURM_NPROCS
window=110000

for i in *.fa;
do
  start_t=$(date +%s)
  mpirun -np $cores -H $SLURM_JOB_NODELIST python3 ../G-SAIP.py -q $file -s Arabidopsis.fa -n ArabVs${file} -Q 1 -w $window
  finish=$(date +%s)
  echo "file ${file} execution time = $((finish - start)) secs."
done