% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subFasID.R
\name{subFasID}
\alias{subFasID}
\title{Subtract chromosome ids from fasta file}
\usage{
subFasID(text = text)
}
\arguments{
\item{text}{Large character read by readLines from chromosome fasta file.}
}
\value{
The id list of the fasta file(fasta identifier), refer to http://genetics.bwh.harvard.edu/pph/FASTA.html.
}
\description{
Subtract chromosome ids from fasta file
}
\examples{
data("text")
text<- replaceText(type = "text",input = text)
id <- subFasID(text = text)
}
