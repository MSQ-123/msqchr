#' Make a list file from large character file
#'
#' @param id The id list made from sub_fasID function.
#' @param all_text Large character read in by readLines function from fasta file.
#' @param con A connection object or a character string, the connection must refer to the same fasta file as all_text.
#'
#' @return Chromosome fasta file in list format.
#' @export
#'
#' @examples
#' data("all_text")
#' id <- sub_fasID(all_text = all_text)
#' fil <- tempfile(fileext = ".data")
#' write(all_text,file = fil)
#' con0 <- file(fil, "r")
#' tex <- read_aslist(id,all_text = all_text,con = con0)
read_aslist <- function(id = id, all_text = all_text,con = con){
  pos<- match(id, all_text)
  tex = list()
  for(i in 1:(length(pos)-1)){
    tex[[i]] = readLines(con,n=(pos[i+1]-pos[i]))
    if (i == (length(pos)-1)){
      tex[[i+1]] <- readLines(con,n=-1)
    }
  }
  return(tex)
}
