dat <- read.csv("femaleMiceWeights.csv")
tab = read.csv("msleep_ggplot2.csv")

plot(tab$brainwt, tab$sleep_total, log='x')
mean(tab$sleep_total[tab$sleep_total > 18])