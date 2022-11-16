#!/bin/sh

#SBATCH -J Gepard
#SBATCH -D .
#SBATCH -o gepard2.out
#SBATCH -e gepard2.err
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --partition=long
#SBATCH --mem=100G
##SBATCH --nodelist=cpu-node-6

source ~/.bashrc
unset PYTHONPATH
conda activate gepard

Gepard=/shared/home/rguyot/coffea_genomes/Simon/G-SAIP/Gepard_software/dist/Gepard-1.40.jar
mat=/shared/home/rguyot/coffea_genomes/Simon/G-SAIP/Gepard_software/resources/matrices/edna.mat


for i in {1..6..1}
  do
     start_t=$(date +%s) 
     java -cp $Gepard org.gepard.client.cmdline.CommandLine -seq1 ../Chr1Human.fasta  -seq2 ../Chr1Human.fasta -matrix $mat -outfile gepardplot.png
     finish=$(date +%s)
     echo "Run ${i} execution time: = $((finish - start_t)) secs."
     
 done
