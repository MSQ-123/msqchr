#' Replace tedious chromosome identifier into simple format
#'
#' Make the chromosome id starting with ">" into simple format like:
#' ">chr:1091194-1093520...",this is helpful for sorting the chromosome according to their number
#' @param input_type This can be either "all_text" or "list", The previous is a large character containing each line of the fasta file, the latter is a list in which each element contains a unit of fasta file.
#' @param input The large character or list containing ids that need to be simplified.
#'
#' @return The large character or list of Chromosome fasta file with simplified id
#' @export
#'
#' @examples
#' data("complicated_id")
#' all_text<- replace_all_text(input_type = "all_text",input = complicated_id)
replace_all_text <- function(input_type = "all_text",input = input){
  if(input_type == "all_text"){
    for (i in 1:length(input)) {
      if(strsplit(input[i],split = "")[[1]][1] == ">"){
        n <- regexpr(pattern = "chr",input[i])[1]
        m<- length(strsplit(input[i],split = "")[[1]])
        chr <- ">"
        for(c in strsplit(input[i],split = "")[[1]][c(seq(from = n,to=m))]){
          chr = paste(chr,c,sep = "")
        }
        input[i]<- replace(x = input[i],values = chr)
      }
    }
    return(input)
  }
  if(input_type == "list"){
    for (i in 1:length(input)) {
      n <- regexpr(pattern = "chr",input[[i]][1])[1]
      m<- length(strsplit(input[[i]][1],split = "")[[1]])
      chr <- ">"
      for(c in strsplit(input[[i]][1],split = "")[[1]][c(seq(from = n,to=m))]){
        chr = paste(chr,c,sep = "")
      }
      input[[i]][1]<- replace(x =input[[i]][1],values = chr)
    }
    return(input)
  }
}
