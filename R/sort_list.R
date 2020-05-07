#' Sort the chromosome list  according to the chromosome number
#'
#' @param id The id list of the fasta file made by sub_fasID.
#' @param tex A chromosome list made by read_aslist
#' @param chrsig The number of characters of the chromosome. Either "single" or "double". eg."chr1,chrX,chrY,chrM" is "single","chr10,chr11" is "double".
#' If you want to obtain both "single" and "double" sorted list of chromosome, try "single" and "double" respectively.
#'
#' @return The sorted chromosome list.
#' @export
#'
#' @examples
#' data("tex")
#' data("all_text")
#' all_text<- replace_all_text(input_type = "all_text",input = all_text)
#' id <- sub_fasID(all_text = all_text)
#' tex2<- sort_list(id=id,tex = tex,chrsig = "single")
#' tex3 <- sort_list(id=id,tex = tex,chrsig = "double")
sort_list <- function(id = id,tex = tex,chrsig = "single"){
  id2 <- c()
  if(chrsig == "single"){
    for(i in 1:length(id)){
      if(length(strsplit(strsplit(id[i],split=":")[[1]][1],split = "")[[1]]) == 5){
        id2 <- c(id2,id[i])
      }
    }
    id2<- sort(id2)
    tex2 <- list()
    for(i in 1:length(id2)){
      for(j in 1:length(tex)){
        if(tex[[j]][1] == id2[i]){
          tex2[[i]] <- tex[[j]]
        }

      }
    }
  }
  else if(chrsig == "double"){
    for(i in 1:length(id)){
      if(length(strsplit(strsplit(id[i],split=":")[[1]][1],split = "")[[1]]) == 6){
        id2 <- c(id2,id[i])
      }
    }
    id2<- sort(id2)
    tex2 <- list()
    for(i in 1:length(id2)){
      for(j in 1:length(tex)){
        if(tex[[j]][1] == id2[i]){
          tex2[[i]] <- tex[[j]]
        }

      }
    }
  }
  return(tex2)
}
