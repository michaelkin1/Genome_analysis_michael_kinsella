


if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("DESeq2", version = "3.16")

# Load necessary libraries
library(DESeq2)

library("gplots")
library("RColorBrewer")
library("genefilter")
library("plyr")
library("pheatmap")
library("ggplot2")




countFiles <- c("counts_human_serum_htseq_ERR1797969.txt",
                "counts_human_serum_htseq_ERR1797970.txt",
                "counts_human_serum_htseq_ERR1797971.txt",
                "counts_BH_serum_htseq_ERR1797972.txt",
                "counts_BH_serum_htseq_ERR1797973.txt",
                "counts_BH_serum_htseq_ERR1797974.txt")

directory_files <- "C:/Users/micha/Desktop/Universitet/Genome_Analysis/countfiles"


sampleCondition <- c("Serum", "Serum", "Serum", "BH", "BH", "BH")
sampleNames <- c("Serum_01", "Serum_02", "Serum_03", "BH_01", "BH_02", "BH_03")
sampleTable <- data.frame(sampleName = sampleNames, fileName = countFiles, condition = sampleCondition)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory_files, design = ~ condition)


# Create a DESeq2 object

# Perform differential expression analysis
dds <- DESeq(ddsHTSeq)

# Get the results
results <- results(dds)

# Filter for significantly differentially expressed genes
alpha <- 0.001
sigResults <- subset(results, padj < alpha)

filteredResults <- sigResults[abs(sigResults$log2FoldChange) > 1 & sigResults$padj < alpha, ]

filteredResults

plotMA(filteredResults, main = "significant reads (alpha=0.001)")

# View the significant results
sigResults


#up and downregulated genes, add signifiance
upregulatedGenes <- sum(results$log2FoldChange > 1 & results$padj < alpha, na.rm = TRUE )
downregulatedGenes <- sum(results$log2FoldChange < -1 & results$padj < alpha, na.rm = TRUE)

print(paste("Number of upregulated genes:", upregulatedGenes))
print(paste("Number of downregulated genes:", downregulatedGenes))


#HEATMAP:

rld <- rlog(dds, blind=FALSE)

mat = assay(rld)[ head(order(results$log2FoldChange),20), ] # select the top 20 genes with the lowest padj
mat = mat - rowMeans(mat) # Subtract the row means from each value
df = as.data.frame(colData(rld)[,c("methodName")]) # Create a dataframe with a column of the conditions
colnames(df) = "methodName" # Rename the column header
rownames(df) = colnames(mat) # add rownames
# and plot the actual heatmap
pheatmap(mat, annotation_col=df)










