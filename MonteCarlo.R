out<- rnorm(1000, mean = 0, sd = 5)

means<- cumsum(out)/(1:len(out))

plot(means, pch ='', xlab='Number of Draws', ylab='Estimate', ylim=c(-10, 10))
abline(h =0 , col=gray(0.5), lwd = 4)
points(means, type='l', lwd = 1.5)

dev.copy(device=pdf,file='~/dropbox/teaching/pol350a/mclass5/MonteCarloExample.pdf', height=6, width = 6)
dev.off()

##showing how this can vary over many trials



plot(means, pch ='', xlab='Number of Draws', ylab='Estimate', ylim=c(-10, 10))
abline(h =0 , col=gray(0.5), lwd = 4)



for(z in 1){
	start<- rnorm(1000, mean = 0, sd = 5)
	means<- cumsum(start)/(1:len(start))
	points(means, type='l', lwd = 1.5, col='black')
}


dev.copy(device=pdf,file='~/dropbox/teaching/pol350a/mclass5/MonteCarloExample1.pdf', height=6, width = 6)
dev.off()


plot(means, pch ='', xlab='Number of Draws', ylab='Estimate', ylim=c(-10, 10))
abline(h =0 , col=gray(0.5), lwd = 4)



for(z in 1){
	start<- rnorm(1000, mean = 0, sd = 5)
	means<- cumsum(start)/(1:len(start))
	points(means, type='l', lwd = 1.5, col='black')
}


dev.copy(device=pdf,file='~/dropbox/teaching/pol350a/mclass5/MonteCarloExample2.pdf', height=6, width = 6)
dev.off()



##working with the uniform random variable

##what is prob(x \in [0.2, 0.6])?

##analytically,  prob(x \in [0.2, 0.6]) = \int_{0.2}^{0.6} 1 dx = 0.4

##via monte carlo simulation we can count the proportion of draws that fall between 0.2 and 0.6


draws<- runif(10000, 0, 1)
estimate<- cumsum(ifelse(draws < 0.6 & draws>0.2, 1, 0))/(1:len(draws))

plot(estimate,pch ='', xlab = 'Number of Draws', ylab='Estimate')
abline(h = 0.4, lwd = 3, col=gray(0.5))
points(estimate, type='l', lwd = 1.5)






