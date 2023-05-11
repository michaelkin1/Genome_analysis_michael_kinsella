#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 12:00:00
#SBATCH -J BWA_mapping
module load bioinfo-tools bwa samtools

# Set the path to the reference genome and the input assembly
REF_GENOME=/home/michaelk/Genome_analysis_michael_kinsella/data/processed_data/canu_assembly/genome_assembly.contigs.fasta
INPUT_DIR=/home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/transcriptomic_data/RNA-Seq_BH
for FQ in $INPUT_DIR/trim_paired_*_pass_1.fastq.gz
do
  # Get the base name of the input file
  BASE=$(basename $FQ _pass_1.fastq.gz)

  # Set the input and output file names
  ASSEMBLY_F=${FQ}
  ASSEMBLY_R=${INPUT_DIR}/${BASE}_pass_2.fastq.gz
  OUTPUT=./${BASE}_assembly_mapping_RNA_BH

  # Create an index of the reference genome using BWA
  bwa index $REF_GENOME

  # Map the assembly to the reference genome using BWA-MEM algorithm
  bwa mem -t 8 $REF_GENOME $ASSEMBLY_F $ASSEMBLY_R | samtools sort -@ 8 -o ${OUTPUT}.bam -

  # Index the resulting BAM file
  samtools index ${OUTPUT}.bam
done

