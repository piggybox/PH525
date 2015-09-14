dat <- read.csv("femaleMiceWeights.csv")

control <- dat[1:12, 2]
treatment <- dat[12+1:12,2]
diff <- mean(treatment) - mean(control)

t.test(treatment, control)

sd(control)/sqrt(length(control))
sd(treatment)

se <- sqrt(var(treatment)/length(treatment) + 
             var(control)/length(control))

tstat <- diff / se # se is also a random variable

1 - pnorm(tstat) + pnorm(-tstat) # but this is wrong

# because ample size is too samll, we can't use CLT, thus 
# we will use T distribution that assumes the population is 
# approximately a normal distribution

qqnorm(control)


# Exercise
babies = read.table("babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]
mean(bwt.nonsmoke)-mean(bwt.smoke)
sd(bwt.nonsmoke)
sd(bwt.smoke)


dat.ns = bwt.nonsmoke[1:30]
dat.s = bwt.smoke[1:30]
N = 30

X.ns = mean(dat.ns)
sd.ns = sd(dat.ns)
X.s = mean(dat.s)
sd.s = sd(dat.s)
sd.diff = sqrt(sd.ns^2/N+sd.s^2/N)
tval = (X.ns - X.s)/sd.diff
t.test(dat.ns, dat.s)$statistic
pval = 1- pnorm(abs(tval)) + pnorm(-abs(tval))
