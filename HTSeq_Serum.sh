#!/bin/bash -l
#SBATCH -A uppmax2023-2-8 -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J HTSeq_count
#SBATCH --mail-user=michael.kinsella1999@gmail.com
#SBATCH --mail-type=BEGIN,END



module load bioinfo-tools htseq 


ANNOTATED_REFERENCE=/home/michaelk/Genome_analysis_michael_kinsella/analysis/prokka_annotation/prokka_annotation/annotation_canu_edited.gff
BAM_HUMAN=/home/michaelk/Genome_analysis_michael_kinsella/analysis/BWA_mapping/BWA_human_dir
BAM_BH=/home/michaelk/Genome_analysis_michael_kinsella/analysis/BWA_mapping

#human
htseq-count -f bam -t CDS -r pos -i locus_tag $BAM_HUMAN/trim_paired_ERR1797969_assembly_mapping_RNA_Human.bam $ANNOTATED_REFERENCE > counts_human_serum_htseq_ERR1797969.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $BAM_HUMAN/trim_paired_ERR1797970_assembly_mapping_RNA_Human.bam $ANNOTATED_REFERENCE > counts_human_serum_htseq_ERR1797970.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $BAM_HUMAN/trim_paired_ERR1797971_assembly_mapping_RNA_Human.bam $ANNOTATED_REFERENCE > counts_human_serum_htseq_ERR1797971.txt

#BH
htseq-count -f bam -t CDS -r pos -i locus_tag $BAM_BH/trim_paired_ERR1797972_assembly_mapping_RNA_BH.bam $ANNOTATED_REFERENCE > counts_BH_serum_htseq_ERR1797972.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $BAM_BH/trim_paired_ERR1797973_assembly_mapping_RNA_BH.bam $ANNOTATED_REFERENCE > counts_BH_serum_htseq_ERR1797973.txt
htseq-count -f bam -t CDS -r pos -i locus_tag $BAM_BH/trim_paired_ERR1797974_assembly_mapping_RNA_BH.bam $ANNOTATED_REFERENCE > counts_BH_serum_htseq_ERR1797974.txt

