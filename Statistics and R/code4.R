babies = read.table("babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

fun <- function() {
  N = 30
  s1 <- sample(bwt.nonsmoke, N)
  s2 <- sample(bwt.smoke, N)
  mytest <- t.test(s1, s2)
  return(c(mytest$p.value, mytest$conf.int))
}

res <- replicate(1000, fun())
popdiff = mean(bwt.nonsmoke) - mean(bwt.smoke)


dat.ns = sample(bwt.nonsmoke, 30)
dat.s = sample(bwt.smoke, 30)
X.ns = mean(dat.ns)
sd.ns = sd(dat.ns)
X.s = mean(dat.s)
sd.s = sd(dat.s)
sd.diff = sqrt(sd.ns^2/30 + sd.s^2/30)
tval = (X.ns - X.s)/sd.diff
