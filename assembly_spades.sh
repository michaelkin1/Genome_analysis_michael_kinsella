#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy 
#SBATCH -p core
#SBATCH -n 1
#SBATCH --error=spades.err
#SBATCH -t 10:00:00
#SBATCH -J spades_MK


module load bioinfo-tools spades/3.15.5

spades.py -k 21,33,55,77 --careful -1 /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz -2 /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz --nanopore /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Nanopore/* -o /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/spades_asssembly
