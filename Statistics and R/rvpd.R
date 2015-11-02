library(downloader) 
library(dplyr)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

mean(x)

set.seed(1)
abs(mean(x) - mean(sample(x, 5)))

set.seed(5)
abs(mean(x) - mean(sample(x, 5)))
