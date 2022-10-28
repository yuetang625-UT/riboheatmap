#' A heatmap Function
#'
#' This function allows you to express your love of cats.
#' @param cl Do you analyze by cell line? Defaults to FALSE
#' @keywords heatmap
#' @export
#' @examples
#' riboheatmap()

riboheatmap <- function(gene_list,cl=FALSE){
  if (cl== FALSE){
    #load("human_RNA.RData")
    #load("human_RIBO.RData")
    data(human_RNA)
    data(human_RIBO)
    RNA_g=human_RNA[gene,]
    RIBO_g=human_RIBO[gene,]
    rm(human_RNA)
    rm(human_RIBO)
    rownames(RNA_g) <- paste("RNA",rownames(RNA_g),sep="_")
    rownames(RIBO_g) <- paste("RIBO",rownames(RIBO_g),sep="_")
    plot=rbind(RNA_g,RIBO_g)
    my_sample_row <- data.frame(sample = rep(c("RNA", "RIBO"), c(length(gene),length(gene))))
    row.names(my_sample_row) <- row.names(plot)
    pheatmap::pheatmap(plot,annotation_row = my_sample_row,gaps_row = length(gene),
                       show_rownames = TRUE, scale = "row",show_colnames = FALSE, cluster_row=FALSE, cluster_col=TRUE,
                       cellwidth=0.8, cellheight=10, fontsize = 6,color = colorRampPalette(c("blue", "white", "red"))(100))
  }else{
    #load("human_RNA_cl.RData")
    #load("human_RIBO_cl.RData")
    data(human_RNA_cl)
    data(human_RIBO_cl)
    RNA_g=human_RNA_cl[gene,]
    RIBO_g=human_RIBO_cl[gene,]
    rm(human_RNA_cl)
    rm(human_RIBO_cl)
    rownames(RNA_g) <- paste("RNA",rownames(RNA_g),sep="_")
    rownames(RIBO_g) <- paste("RIBO",rownames(RIBO_g),sep="_")
    plot=rbind(RNA_g,RIBO_g)
    my_sample_row <- data.frame(sample = rep(c("RNA", "RIBO"), c(length(gene),length(gene))))
    row.names(my_sample_row) <- row.names(plot)
    pheatmap::pheatmap(plot,annotation_row = my_sample_row,gaps_row = length(gene),
                       show_rownames = TRUE, scale = "row",show_colnames = TRUE, cluster_row=FALSE, cluster_col=TRUE,
                       cellwidth=5, cellheight=10, fontsize = 6,color = colorRampPalette(c("blue", "white", "red"))(100))
  }
  
}