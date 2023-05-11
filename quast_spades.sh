#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 05:00:00
#SBATCH -J quast_comparison

module load bioinfo-tools quast

quast.py -r /home/michaelk//Genome_analysis_michael_kinsella/data/raw_data/reference_data/GCF_009734005.1_ASM973400v2_genomic.fna \
        -s /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/spades_asssembly/scaffolds.fasta \
        -o /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/quast_assembly_comparison/spades \
        --large

