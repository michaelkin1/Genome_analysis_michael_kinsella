#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J mummer_comparison

module load bioinfo-tools blast

blastn -query /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/canu_assembly/genome_assembly.contigs.fasta \
 -subject /home/michaelk//Genome_analysis_michael_kinsella/data/raw_data/reference_data/GCF_009734005.1_ASM973400v2_genomic.fna \
 -outfmt 6 > blast_canu.out 

