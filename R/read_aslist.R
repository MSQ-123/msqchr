#' Make a list file from large character file
#'
#' @param id The id list made from sub_fasID function.
#' @param all_text Large character read by readLines function from fasta file.
#'
#' @return A chromosome list file
#' @export
#'
#' @examples
#' data("all_text")
#' id <- sub_fasID(all_text = all_text)
#' tex <- read_aslist(id,all_text = all_text)
read_aslist <- function(id = id, all_text = all_text){
  pos<- match(id, all_text)
  tex = list()
  for(i in 1:(length(pos)-1)){
    tex[[i]] = all_text[pos[i]:(pos[i+1]-pos[i])]
  }
  tex[[length(pos)]] <- all_text[pos[length(pos)]:(pos[length(pos)]+length(all_text)-pos[length(pos)])]
  return(tex)
}
