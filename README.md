# Genome_analysis_michael_kinsella
Genome analysis project for paper 1 "RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum"

This repository contains code for SLURM batch files, an R-file for differential expression analysis as well as an xl file for Gene Ontology of the top 20 differentially expressed genes. 
Furthermore the wiki contains a project plan pre-analysis and a summary of the analysis performed and results from these. 

Clarification of code files in main branch: 
BWA_RNA_BH_2.sh contains code for BWA mapping as well samtools and indexing for BWA and samtools file for the BH-medium. 

BWA:RNA_human.sh contains code for BWA mapping as well samtools and indexing for BWA and samtools file for the human serum-medium. 

DESEQ2.R is an R file with code for the differential expression analysis and has code for signifiacnatly expressed genes, heatmap of these as well as upa and down regulated genes based of RNA-seq data. 

HTSeq_Serum contains code for the HTSeq counting for all 6 files (3 samples from the two mediums BH and human serum) based of the BWA mapping. 

assembly_canu and asembly_spades contains code for the assemblies based of the RAW sequencing data. 

blast_canu.sh contains code for the blast of the canu assembly against the reference genome of E. faecium (organism of interest).

fastQC_preprocessing.sh contains code for the fastQC quality control of the illumina reads pre trimmomatic-processing. 

fastqc_postassebmly.sh contains code for the fastQC quality contron of the illumina reads post trimmomatic-processing. 


mummerplot_2.sh contains code for the mummerplot 



