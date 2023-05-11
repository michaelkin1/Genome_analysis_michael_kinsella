#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy 
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J fastQC_pretrim 

# load module
module load bioinfo-tools 
module load FastQC

# run FastQC on raw data
fastqc /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Illumina/* -o /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/fastQC_preprocessed



