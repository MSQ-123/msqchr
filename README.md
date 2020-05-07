<!-- README.md is generated from README.Rmd. Please edit that file -->

### msqchr

Some fasta files contain all chromosomes from one genome，sometimes
users have to split these chromosomes into different files according to
their number label.The msqchr can help to handle this, so that the
choosed chromosome fasta file can be used for downstream analysis.

### Installation

``` r
devtools::install_github("MSQ-123/msqchr")
```

### Usage

Replace tedious chromosome identifier into simple format. So that the
subtracted ids are easy to manipulate.

``` r
data("complicated_id")
all_text<- replace_all_text(input_type = "all_text",input = complicated_id)
```

Subtract chromosome ids from a fasta file

``` r
data("all_text")
all_text<- replace_all_text(input_type = "all_text",input = all_text)
id <- sub_fasID(all_text = all_text)
```

Transform the large character object into special list:

``` r
tex <- read_aslist(id,all_text = all_text)
```

Sort the chromosome list according to their number. Note: the “single”
and “double” chromosome should be sort separately. Note: This data is
already sorted, this is just for expository purposes.

``` r
tex2<- sort_list(id=id,tex = tex,chrsig = "single")
tex3 <- sort_list(id=id,tex = tex,chrsig = "double")
```

Now we can split the chromosome fasta file into different files
according to their number.

``` r
splitChr(tex = tex2,chr=seq(1,9),sex = TRUE)
#chromosome X or Y is "single",so the tex should be a
#"single" chromosome list.
#In the below case, sex should be F.
splitChr(tex = tex3,chr=seq(10,22),sex = FALSE)
```
