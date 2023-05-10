


if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("DESeq2", version = "3.16")

# Load necessary libraries
library(DESeq2)



# Create a sample table
sampleTable <- data.frame(
  sampleName = c("Sample1_Human", "Sample2_Human", "Sample3_Human", 
                 "Sample1_BH", "Sample2_BH", "Sample3_BH"),
  methodName = c("Human", "Human", "Human", "BH", "BH", "BH")
)

# Read in the count data for each sample
countFiles <- c("C:/Users/micha/Downloads/counts_human_serum_htseq_ERR1797969.txt",
                "C:/Users/micha/Downloads/counts_human_serum_htseq_ERR1797970.txt",
                "C:/Users/micha/Downloads/counts_human_serum_htseq_ERR1797971.txt",
                "C:/Users/micha/Downloads/counts_BH_serum_htseq_ERR1797972.txt",
                "C:/Users/micha/Downloads/counts_BH_serum_htseq_ERR1797973.txt",
                "C:/Users/micha/Downloads/counts_BH_serum_htseq_ERR1797974.txt")

countData <- lapply(countFiles, function(file) {
  read.table(file, header = TRUE, row.names = 1)
})

# Create a DESeq2 object
dds <- DESeqDataSetFromMatrix(countData = Reduce(cbind, countData), colData = sampleTable, design = ~ methodName)

# Perform differential expression analysis
dds <- DESeq(dds)

# Get the results
results <- results(dds)

plotMA(dds)
plotMA(results, ylim=c(-1,1))

# Filter for significantly differentially expressed genes
alpha <- 0.05
sigResults <- subset(results, padj < alpha)

# View the significant results
head(sigResults)
