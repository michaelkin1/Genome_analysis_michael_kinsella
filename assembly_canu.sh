#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy 
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J canu_assembly_MK

module load bioinfo-tools canu/2.2

canu -p genome_assembly -d /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/canu_assembly genomeSize=3m \
 -pacbio-raw /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/PacBio/*  \
 -nanopore-raw /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Nanopore/* useGrid=false
