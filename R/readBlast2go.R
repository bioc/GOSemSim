##'
##' given a BLAST2GO file, this function extracts the information from it and make it use for TERM2GENE.
##' @title read.blast2go
##' @param file BLAST2GO file
##' @importFrom rlang check_installed
##' @return a data frame with two columns: GO and Gene
##' @export
read.blast2go <- function(file) {
    blast2go <- utils::read.table(file, header = TRUE, sep = "\t", stringsAsFactors = FALSE, fill = TRUE)
    go_annotation_data <- blast2go[, c("Blast.Top.Hit.GOs", "Sequence.Name")]
    check_installed('tidyr', 'for `read.blast2go()`.')
    check_installed('tidyselect', 'for `read.blaset2go()`.')
    go_annotation_data <- tidyr::separate_rows(go_annotation_data, tidyselect::all_of("Blast.Top.Hit.GOs"), sep = ", ")

    names(go_annotation_data) <- c("GO", "Gene")
    build.df <- buildGOmap(go_annotation_data)

    bind.info <- rbind(build.df, go_annotation_data)

    bind.info <- bind.info[order(bind.info$GO, bind.info$Gene), ]
    bind.info <- bind.info[!duplicated(bind.info), ]
    bind.info[, "Gene"] <- as.character(bind.info$Gene)

    return(bind.info[, c("GO", "Gene")])
}
