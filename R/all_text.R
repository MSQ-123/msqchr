#' Fasta file of chromosome sequence read in by readLines function
#'
#' A dataset containing the hg19 chromosome sequence from the
#' hg19 blacklist.
#'
#'
#' @format A large character with 232381 elements
#' @details The hg19 blacklist is obtained from the supplementary
#' dataset from the referenced article, and then it is sent to
#' the UCSC Table Browser for obtaining the corresponding
#' sequence file. The sequence file is processed with
#' replace_all_text function to simplify the fasta id.
#' @source \url{https://github.com/greenleaflab/10x-scatac-2019}
#' @references \url{https://doi.org/10.1038/s41587-019-0206-z}
"all_text"
