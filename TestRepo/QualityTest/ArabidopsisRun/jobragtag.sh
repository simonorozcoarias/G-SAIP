#!/bin/sh

#SBATCH -J megragtag
#SBATCH -D mega/
#SBATCH -o ragk91.out
#SBATCH -e ragk91.err
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --partition=long
##SBATCH --nodelist=node141

source ~/.bashrc
unset PYTHONPATH
conda activate Gsaip
 
cores=$SLURM_NPROCS
reference="/shared/home/rguyot/coffea_genomes/Simon/G-SAIP/2021/Arab/Arabidopsis.fa"

for subject in mega_arabidopsis-k91.fa;
do
  IFS='.' read -r -a direc <<< "$subject";
  directory=${direc[0]};
  echo $directory;
  ragtag.py scaffold $reference $subject -t $cores -o $directory;
done;
