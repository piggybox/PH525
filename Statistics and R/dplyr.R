library(downloader)
library(dplyr)
        
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

d <- read.csv("msleep_ggplot2.csv")

d %>% filter(order == "Primates")

d %>% filter(order == "Primates") %>% select(sleep_total)

d %>% filter(order == "Primates") %>% select(sleep_total) %>% unlist %>% mean

d %>% filter(order == "Primates") %>% select(sleep_total) %>% unlist %>% mean

d %>% filter(order == "Primates") %>% select(sleep_total) %>% summarise(mean(sleep_total))
