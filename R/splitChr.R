#' Split all chromosomes from the sorted chromosome list
#'
#' @param tex The sorted chromosome list made by sortList function.
#' @param chr The chromosome number sequence, if the chromosome list is "single"(means a single character following "chr" in the fasta identifier), try seq(1,9), be sure that starting with 1; if the chromosome list is "double"(means two characters following "chr" in the fasta identifier), try seq(10,22), be sure that starting with 10 but the ending can be changed.
#' @param sex Whether to output the sex chromosomes like X chromosome and Y chromosome.
#' @param outdir The output directory.
#'
#' @return Write the splitted chromosome fasta file to separated txt files according to the chromosome number.
#' @export
#' @importFrom utils tail
#'
#' @examples
#' data("tex")
#' data("text")
#' #simplify the fasta id
#' text<- replaceText(type = "text",input = text)
#' #subtract fasta id
#' id <- subFasID(text = text)
#' #sort fasta list
#' tex2<- sortList(id=id,tex = tex,chrsig = "single")
#' tex3 <- sortList(id=id,tex = tex,chrsig = "double")
#' #split and output
#' outdir <- tempdir()
#' #chromosome X or Y is "single",so the tex should be a
#' #single" chromosome list like tex2.
#' splitChr(tex = tex2,chr=seq(1,9),sex = TRUE,outdir = outdir)
#' #In the below case, sex should be FALSE.
#' splitChr(tex = tex3,chr=seq(10,22),sex = FALSE,outdir = outdir)
splitChr <- function(tex = tex,chr=chr,sex = FALSE, outdir = outdir){
  pos2 <- list()
  #calculate the length of each chromosome
  for(eachchr in chr){
    t <- unlist(lapply(lapply(tex, function(x){grep(strsplit(x,split = ":")[[1]][1],
                                                    pattern = paste("chr",eachchr,sep = ""))}),
                       function(x){ifelse(x == 0, FALSE, TRUE)}))
    pos2[eachchr] <- length(t)#pos2 stores the length of each chromosome fasta file

  }
  fil <- list() #each element in fil list is the fasta file of the same chromosome number.

  #output each chromosome
  for(eachchr in chr){
    if(eachchr == 1){
      fil[[1]] <- unlist(tex[1:pos2[[eachchr]]])
      write(fil[[eachchr]],file = paste(outdir,"\\","chr",eachchr,".txt",sep = ""))
    }
    else if(eachchr == 10){
      fil[[10]] <- unlist(tex[1:pos2[[eachchr]]])
      write(fil[[eachchr]],file = paste(outdir,"\\","chr",eachchr,".txt",sep = ""))
    }
    else{
      fil[[eachchr]] <- unlist(tex[(pos2[[eachchr-1]]+1):((pos2[[eachchr-1]]+1) + pos2[[eachchr]]-1)])
      pos2[[eachchr]]<- pos2[[eachchr-1]]+1 + pos2[[eachchr]]-1
      write(fil[[eachchr]],file = paste(outdir,"\\","chr",eachchr,".txt",sep = ""))#这里可以设置一个条件判断，只输出指定的chr
    }
  }
#Note that single char chromosomes like X and Y can be output separately
  if(sex == TRUE){
    tX <-  unlist(lapply(lapply(tex, function(x){grep(strsplit(x,split = ":")[[1]][1],
                                                       pattern = "chr[XY]$",fixed = F)}),
                          function(x){ifelse(x == 0, FALSE, TRUE)}))
    posx <- length(tX)
    fil2 <- list()
    #for chr = seq(1,9), the X and Y chromosomes are output lastly
    Xnum <- tail(chr,1)+1
    fil[[Xnum]] <- unlist(tail(tex,posx))
    write(fil[[Xnum]],file = paste(outdir,"\\","sexchrom",".txt",sep = ""))
  }
}
