##putting together the R code for the Binomial simulation

N<- 100
M<- 50


plot(dbinom(0:100, 100, 0.5)~c(0:100), type='h', lwd = 3, pch=20, xlab='Number', ylab='Probability')
dev.copy(device=pdf, file='~/dropbox/teaching/pol350a/prob3/binom1.pdf', height=6, width = 6)
dev.off()
points(dbinom(50:100, 100, 0.5)~c(50:100), col='cornflowerblue', lwd = 3, pch=20, type='h')
dev.copy(device=pdf, file='~/dropbox/teaching/pol350a/prob3/binom2.pdf', height=6, width = 6)
dev.off()

sum(dbinom(50:100, 100, 0.5))

##let's use a simulation


m_at_least<- c()
sims<- 10000

for(z in 1:sims){
	out<- rbinom(1, size = 100, prob = 1/2)
	m_at_least[z]<- ifelse(out>49, 1, 0)
	}

mean(m_at_least)


##but now suppose that individuals' turnout decisions are 

net.sim<- function(n.iters){
	turn.net<- c()
	turn.indep<- c()
	for(z in 1:n.iters){
		start<- rbinom(100, size = 1, prob = 1/2)
		turn.indep[z]<- sum(start)
		nets<- start[1:50]
		for(g in 1:50){
			nets[50 + g]<- rbinom(1, size = 1, prob = ifelse(nets[g]==1, 0.6, 0.4))
			}
		turn.net[z]<- sum(nets)
		}
	output<- list(turn.net, turn.indep)
	return(output)
	}
	
first.run<- net.sim(1000)

mean(first.run[[1]])
mean(first.run[[2]])
	
var(first.run[[1]])	
var(first.run[[2]])	
plot(density(first.run[[2]]), col='red', lwd = 3, main='Comparing Network, Independent')	
lines(density(first.run[[1]]), col='blue', lwd = 3)
text(40, 0.03, labels = 'Network', col='blue')
dev.copy(device= pdf, file='~/dropbox/teaching/pol350a/prob3/BinomNetwork.pdf', height=6, width = 6)
dev.off()
	
var(first.run[[1]])	
var(first.run[[2]])	





plot(dpois(1:100, 5)~c(1:100), type='h', lwd =3 , xlab='Number Threats', ylab='Probability')
dev.copy(device = pdf, file='~/dropbox/teaching/pol350a/prob3/PoissonExamp1.pdf', height=6, width = 5)
dev.off()

points(dpois(10:100, 5)~c(10:100), type='h', lwd =3 , col='cornflowerblue')
dev.copy(device = pdf, file='~/dropbox/teaching/pol350a/prob3/PoissonExamp2.pdf', height=6, width = 5)
dev.off()



##analytically
1- sum(dpois(0:9, 5))


##via simulation
ten_or_more<- c()
sims<- 10000
for(j in 1:sims){
	ten_or_more[j]<- ifelse(rpois(1, 5)>9, 1, 0)}
	



tran<- matrix(NA, nrow = 2, ncol = 2)
tran[1,1]<- 0.8
tran[1,2]<- 0.2
tran[2,1]<- 0.3
tran[2,2]<- 0.7

##after one transition 
c(1,0)%*%tran
##after two transitions
c(1,0)%*%(tran%*%tran)
after three transitions
c(1,0)%*%(tran%*%tran%*%tran)

##if that continues we get 
start<- c(1, 0)
for(z in 1:100000){
	start<- start%*%tran
	}
	
	
start_2<- c(0, 1)
for(z in 1:100000){
	start_2<- start_2%*%tran
	}
		
##the same.  	
	
##we can also use the eigen values

vec_temp<- eigen(t(tran))$vectors[,1]	
stat<- vec_temp/sum(vec_temp)	

##Page Rank!



