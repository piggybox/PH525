babies = read.table("babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

alpha = 0.01
N = 15

rejection <- sapply(1:1000, function(i) {
  s1 <- sample(bwt.nonsmoke, N)
  s2 <- sample(bwt.smoke, N)
  mytest <- t.test(s1, s2)
  mytest$p.value < alpha
})

mean(rejection) # power
