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
hist(null)
abline(v=diff, col="red")

# Gapminder data set
library(devtools)
install_github("jennybc/gapminder")
library(gapminder)
data(gapminder)

y1952 <- gapminder[gapminder$year == 1952,]
mean(y1952$lifeExp <= 40) # trick to calculate empirical cumulative density

# To mimic plot(ecdf(x))
x <- gapminder$lifeExp
props = sapply(qs, function(q) mean(x <= q))

F = function(q) pnorm(q, mean=mean(x), sd=sd(x))

# To mimic qqnorm(x)
n = length(x)
ps = ((1:n) - 0.5)/n
plot(qnorm(ps), sort(x))
