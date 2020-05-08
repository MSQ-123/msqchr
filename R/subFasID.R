#' Subtract chromosome ids from fasta file
#'
#' @param text Large character read by readLines from chromosome fasta file.
#'
#' @return The id list of the fasta file(fasta identifier), refer to http://genetics.bwh.harvard.edu/pph/FASTA.html.
#' @export
#'
#' @examples
#' data("text")
#' text<- replaceText(type = "text",input = text)
#' id <- subFasID(text = text)
subFasID <- function(text = text){
    id = list()
    sum = 0
    #fasta id is started with ">"

    for (i in 1:length(text)) {
      if(strsplit(text[i],split = "")[[1]][1] == ">"){
        sum = sum + 1
        id[[sum]] <- text[i]
      }
    }
    return(unlist(id))
}
