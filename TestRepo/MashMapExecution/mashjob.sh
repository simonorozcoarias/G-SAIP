#!/bin/sh

#SBATCH -J Dotplot_mashmap
#SBATCH -D .
#SBATCH -o dot8.out
#SBATCH -e dot8.err
#SBATCH -n 16
#SBATCH -N 1
##SBATCH --partition=bigmem
#SBATCH --mem=200G
#SBATCH --nodelist=cpu-node-7

source ~/.bashrc
unset PYTHONPATH
conda activate Gsaip

cores=8

for i in {1..1..1}
  do
     start_t=$(date +%s)
     perl generateDotPlot.pl png medium mashmap.${cores}.h
     finish=$(date +%s)
     echo "Run ${i} execution time: = $((finish - start_t)) secs."

 done
