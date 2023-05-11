#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J prokka

module load bioinfo-tools prokka

prokka --kingdom Bacteria --genus Enterococcus --outdir ./prokka_annotation --prefix annotation_canu /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/canu_assembly/genome_assembly.contigs.fasta



