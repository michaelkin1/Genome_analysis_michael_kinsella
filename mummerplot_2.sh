#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J quast_comparison

module load bioinfo-tools MUMmer

# Run nucmer to align the two assemblies
nucmer -p assembly_comparison_mummer /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/canu_assembly/genome_assembly.contigs.fasta \
 /home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/spades_asssembly/scaffolds.fasta

# Run mummerplot to generate a plot of the alignment
mummerplot --postscript -f -R -Q --prefix=assembly_comparison_mummer assembly_comparison_mummer.delta

