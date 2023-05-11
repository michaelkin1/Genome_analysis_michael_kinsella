#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy 
#SBATCH -p core
#SBATCH -n 1
#SBATCH --error=trim.err
#SBATCH -t 5:00:00
#SBATCH -J trim_MK

#load modules
module load bioinfo-tools trimmomatic 

#path to illumina reads: 
#path_reads="/home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Illumina"

trimmomatic PE -threads 4 -phred33 \
  /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
  /home/michaelk/Genome_analysis_michael_kinsella/data/raw_data/genomic_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
  op_fw_paired.fq.gz op_fw_unpaired.fq.gz op_rev_paired.fq.gz op_rev_unpaired.fq.gz \
  LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:36




