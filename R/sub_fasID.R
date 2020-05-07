#' Subtract chromosome id from fasta file
#'
#' @param all_text Large character read by readLines from fasta file.
#'
#' @return The id list of the fasta file
#' @export
#'
#' @examples
#' data("all_text")
#' all_text<- replace_all_text(input_type = "all_text",input = all_text)
#' id <- sub_fasID(all_text = all_text)
sub_fasID <- function(all_text = all_text){
    id = list()
    sum = 0
    for (i in 1:length(all_text)) {
      if(strsplit(all_text[i],split = "")[[1]][1] == ">"){
        sum = sum + 1
        id[[sum]] <- all_text[i]
      }
    }
    return(unlist(id))
}
