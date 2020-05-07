#' Split all chromosomes from the sorted chromosome list
#'
#' @param tex The sorted chromosome list made by sort_list.
#' @param chr The chromosome sequence,if the chromosome list is "single", try seq(1,9) because you should start with 1; if the chromosome list is "double", try seq(10,22) because you should start with 10.
#' @param sex Whether to output the sex chromosomes like X chromosome and Y chromosome.
#'
#' @return Write the splitted chromosome fasta file to separated txt file according to the chromosome number.
#' @export
#' @importFrom utils tail
#'
#' @examples
#' data("tex")
#' data("all_text")
#' all_text<- replace_all_text(input_type = "all_text",input = all_text)
#' id <- sub_fasID(all_text = all_text)
#' tex2<- sort_list(id=id,tex = tex,chrsig = "single")
#' tex3 <- sort_list(id=id,tex = tex,chrsig = "double")
#' splitChr(tex = tex2,chr=seq(1,9),sex = TRUE)
#' #chromosome X or Y is "single",so the tex should be a
#' #"single" chromosome list.
#' #In the below case, sex should be F.
#' splitChr(tex = tex3,chr=seq(10,22),sex = FALSE)
splitChr <- function(tex = tex,chr=chr,sex = FALSE){
  pos2 <- list()
  for(eachchr in chr){
    t <- unlist(lapply(lapply(tex, function(x){grep(strsplit(x,split = ":")[[1]][1],
                                                    pattern = paste("chr",eachchr,sep = ""))}),
                       function(x){ifelse(x == 0, FALSE, TRUE)}))
    pos2[eachchr] <- length(t)

  }
  fil <- list()
  for(eachchr in chr){
    if(eachchr == 1){
      fil[[1]] <- unlist(tex[1:pos2[[eachchr]]])
      write(fil[[eachchr]],file = paste("chr",eachchr,".txt",sep = ""))
    }
    else if(eachchr == 10){
      fil[[10]] <- unlist(tex[1:pos2[[eachchr]]])
      write(fil[[eachchr]],file = paste("chr",eachchr,".txt",sep = ""))
    }
    else{
      fil[[eachchr]] <- unlist(tex[(pos2[[eachchr-1]]+1):((pos2[[eachchr-1]]+1) + pos2[[eachchr]]-1)])
      pos2[[eachchr]]<- pos2[[eachchr-1]]+1 + pos2[[eachchr]]-1
      write(fil[[eachchr]],file = paste("chr",eachchr,".txt",sep = ""))
    }
  }

  if(sex == TRUE){
    t_X <-  unlist(lapply(lapply(tex, function(x){grep(strsplit(x,split = ":")[[1]][1],
                                                       pattern = "chr[XY]$",fixed = F)}),
                          function(x){ifelse(x == 0, FALSE, TRUE)}))
    pos_x <- length(t_X)
    fil2 <- list()
    Xnum <- utils::tail(chr,1)+1
    fil[[Xnum]] <- unlist(tail(tex,pos_x))
    write(fil[[Xnum]],file = paste("sex_chrom",".txt",sep = ""))
  }
}
