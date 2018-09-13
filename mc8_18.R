#######
##This file provides simulation results for propositions that we've proven in class
######

##We're going to simulate the results using the ``sample" function


##first, let's define a population to sample from

population <- 1:10 
##and 1:10 is a sequence that goes from 1:10

##for both simulations, let's define our event as selecting 
##a number that is less than or equal to 5
##
##E = {1, 2, 3, 4, 5} E = {x: x \in N and 0<x<= 5}  
##E^{c} = {6, 7, 8, 9, 10}, E^{c} = {x: 5<x <= 10}  



##writing a function to perform the simulation
##let n be the number of simulations
##we're going to use the sample function
##which takes population, number of draws, replace (T or F) 


##first proposition
compliment_sim<- function(n, population){
	event1<- event2<- 0
	for(i in 1:n){
		sampled_value<- sample(population, 1, replace =F )
		if(sampled_value<6){
			event1<- event1 + 1
			}
		if(sampled_value>5){
			event2<- event2 + 1}
		}
	prob.event<- c(event1/n, event2/n)
	return(prob.event)
	}
	
##let's examine this now
n<- 1000
first_run<- compliment_sim(n, population)	
1 - first_run[1]; first_run[2] ##it works

##let's define a second event now: that the draw is less than sub
##and simulate the results

subset.sim<- function(n, population, sub){
	event1<- event2<- 0
	for(i in 1:n){
		sampled_value<- sample(population, 1, replace=F)
		##E, sampled value is 5 or less
		if(sampled_value<6){
			event1<- event1 + 1}
		##F sampled value is 1	
			
		if(sampled_value< (sub)){
			event2 <- event2 + 1}
		}
	prob.event<- c(event1/n, event2/n)
	return(prob.event)
	}
		

first_run<- subset.sim(1000, 1:10, 5)




## this simulation will evaluate what happens when there is overlapping probabilities

inc.exc<- function(n, population, ev1, ev2){
	event1<- event2<- event3<- event4<- 0 
	for(i in 1:n){
		sampled_value<- sample(population, 1, replace = F)
		if(sampled_value> ev1[1] & sampled_value< ev1[2]){
			event1<- event1 + 1
			}
		if(sampled_value>ev2[1] & sampled_value< ev2[2]){
			event2<- event2 + 1
			}
		if(	(sampled_value>ev2[1] & sampled_value< ev2[2]) & (sampled_value> ev1[1] & sampled_value< ev1[2]) ){
			event3<- event3 + 1}
		if( (sampled_value> ev1[1] & sampled_value< ev1[2]	) | (sampled_value> ev2[1] & sampled_value< ev2[2])){
			event4<- event4 + 1}
		prob.event<- c(event1/n, event2/n, event3/n, event4/n)}
		
		return(prob.event)
		}
		
test.run<- inc.exc(1000, 1:10, c(2, 5), c(3, 6))
##checking the theorem
test.run[4]
sum(test.run[1:2]) - test.run[3]


################################
################################
#####Birthday Problem


birth.sim<- function(n, iters){
	birth.day<- 1:366
	birth.prob<- 0
	for(z in 1:iters){
		room<- sample(birth.day, n, replace=T)
		birth.prob<- birth.prob + ifelse(any(as.matrix(table(room))[,1]>1)==T, 1, 0)
		}
	return(birth.prob/iters)
	}
	

prob.same<- c()
	
for(z in 2:366){
	store<- birth.sim(z, 1000)	
	prob.same[z]<- store
	print(z)
	}
	
plot(prob.same[-1]~c(2:366), type='l', lwd = 3, xlab='Number of People', ylab = 'Prob. same birthday', axes = F)	
axis(2, c(0, 0.25, 0.5, 0.75, 1))	
axis(1, seq(0, 325, by = 25), c('0', '', '50', '', '100', '', '150', '', '200', '', '250', '', '300', ''))	
dev.copy(device= pdf, file='~/dropbox/teaching/pol350a/prob1/BirthdayProblem.pdf', height = 7, width = 7)
dev.off()	
	
	
	















