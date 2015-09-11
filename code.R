dat <- read.csv("femaleMiceWeights.csv")
tab = read.csv("msleep_ggplot2.csv")

plot(tab$brainwt, tab$sleep_total, log='x')
mean(tab$sleep_total[tab$sleep_total > 18])
which(tab$sleep_total > 18 & tab$sleep_rem < 3)

population <- read.csv("femaleControlsPopulation.csv")

# actual difference
diff <- mean(dat[13:24,2]) - mean(dat[1:12,2])

# simulation on null hypothesis
n <- 10000
null <- vector("numeric", n)

for (i in 1:n) {
  control <- sample(population[,1], 12)
  treatment <- sample(population[,1], 12)
  null[i] <- mean(treatment) - mean(control)
}

# better version
null = replicate(10000, mean(sample(population[,1], 12)) - mean(sample(population[,1], 12)))

