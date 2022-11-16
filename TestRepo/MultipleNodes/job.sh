#!/bin/sh

#SBATCH -J G_SAIP-Simon
#SBATCH -D /shared/home/rguyot/coffea_genomes/Simon/G-SAIP/MPI/Simon
#SBATCH -o chr1.out
#SBATCH -e chr1.err
#SBATCH -n 56
#SBATCH -N 1
#SBATCH --nodelist=cpu/node/6

source ~/.bashrc
unset PYTHONPATH
conda activate Gsaip

file=$1

#for i in {1..10..1}
#  do
     start_t=$(date +%s) 
     python G-SAIP.py -i $file -t 56 -N Chr1_t${cores}
     finish=$(date +%s)
     echo "Run ${i} execution time: = $((finish - start_t)) secs."
# done
