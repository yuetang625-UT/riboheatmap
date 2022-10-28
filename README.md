# riboheatmap
install the package through install_github("yuetang625-UT/riboheatmap")
load your library with 
library(Riboheatmap)
You have to provide input gene list with:
gene=c("FUS","ATM")
plot sample level heatmap with 
riboheatmap(gene)

plot cell line level heatmap with 
riboheatmap(gene,cl=TURE)
