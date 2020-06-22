#!/usr/bin/env Rscript

args=commandArgs(T)
library(magrittr)
library(marge)

# load dge
dge <- read.table(args[1])

# upregulated genes
up.genes <- data.frame(A = dge[,1],B = dge[,2])
rownames(up.genes) <- rownames(dge)
up.genes$score <- up.genes$B - up.genes$A
up.genes <- up.genes[up.genes$score > 0,]

# downregulated genes
down.genes <- data.frame(A = dge[,1],B = dge[,2])
rownames(down.genes) <- rownames(dge)
down.genes$score <- down.genes$B - down.genes$A
down.genes <- down.genes[down.genes$score < 0,]

# motif analysis
homer.known <- read_known_results(args[2])
result.up <- homer.known[(homer.known$motif_name %>% toupper()) %in% (row.names(up.genes) %>% toupper()),] %>% subset(subset = log_p_value > 1)
result.down <- homer.known[(homer.known$motif_name %>% toupper()) %in% (row.names(down.genes) %>% toupper()),] %>% subset(subset = log_p_value > 1)

write.table(result.up[,1:7],file = 'result.up')
write.table(result.down[,1:7],file = 'result.down')