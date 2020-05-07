#' The first part of fasta file of chromosome sequence produced
#' from tex
#'
#' A dataset containing the hg19 chromosome sequence from the
#' hg19 blacklist, but only chr1 to chr9 and chrX/chrY.
#'
#' @format A large list containing 299 elements.
#' @details Please first refer to the document of all_text dataset
#' and tex dataset.
#' The tex dataset is transformed into tex2 by using sort_list
#' function:sort_list(id=id,tex = tex,chrsig = "single")
#' @references \url{https://doi.org/10.1038/s41587-019-0206-z}
"tex2"
