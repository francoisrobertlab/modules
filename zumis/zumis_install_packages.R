cran_pcks <- c("inflection","yaml","shiny","shinythemes","shinyBS","ggplot2","mclust","dplyr","cowplot","Matrix",
        "devtools","stringdist","data.table","stringr","extraDistr","stringi","magrittr","glue","ggrastr")
install.packages(cran_pcks, repos="http://cloud.r-project.org")
devtools::install_github(repo = "hhoeflin/hdf5r")
devtools::install_github(repo = "mojaveazure/loomR", ref = "develop")

bioc_pcks <- c("GenomicRanges","GenomicFeatures","GenomicAlignments","AnnotationDbi","GenomeInfoDb","plyranges")
for (i in 1:length(bioc_pcks)) {
    bioc_pck = bioc_pcks[i]
    if (!is.element(bioc_pck, installed.packages()[,1]))
        BiocManager::install(bioc_pck)
}
