#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH --error=fastqc_post.err
#SBATCH -t 01:00:00
#SBATCH -J fastQC_posttrim

# load module
module load bioinfo-tools
module load FastQC

# run FastQC on raw data
fastqc /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/trimmomatic/* -o /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/fastqc_post_trimmomatic/
