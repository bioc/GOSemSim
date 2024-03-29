% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readBlast2go.R
\name{read.blast2go}
\alias{read.blast2go}
\title{read.blast2go}
\usage{
read.blast2go(file, add_indirect_GO = FALSE)
}
\arguments{
\item{file}{BLAST2GO file}

\item{add_indirect_GO}{whether add indirect GO annotation}
}
\value{
a data frame with three columns: GENE, GO and ONTOLOGY
}
\description{
given a BLAST2GO file, this function extracts the information from it and make it use for TERM2GENE.
}
