#' Make a list file from large chromosome fasta file
#'
#' @param id The id list made from subFasID function.
#' @param text Large character read in by readLines function from fasta file.
#' @param con A connection object or a character string, the connection must refer to the same fasta file as text.
#'
#' @return Chromosome fasta file in list format.
#' @export
#
#' @examples
#' data("text")
#' id <- subFasID(text = text)
#' fil <- tempfile(fileext = ".data")
#' write(text,file = fil)
#' con0 <- file(fil, "r")
#' tex <- readToList(id,text = text,con = con0)
readToList <- function(id = id, text = text,con = con){

  #match the subtracted ids and the fasta file ids.
  pos<- match(id, text)
  tex = list()

  #creat new list for storing fasta file
  for(i in 1:(length(pos)-1)){
    tex[[i]] = readLines(con,n=(pos[i+1]-pos[i]))
    if (i == (length(pos)-1)){
      tex[[i+1]] <- readLines(con,n=-1)
    }
  }
  return(tex)
}
