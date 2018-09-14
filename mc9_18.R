##Simulating Results from Lecture



monty.hall<- function(n.iters){
	stay<- switch<- 0
	doors<- 1:3
	##always guess 1
	for(z in 1:n.iters){
		prize<- sample(doors, 1, replace=F)
		stay<- stay + ifelse(prize==1, 1, 0)
		reveal<- ifelse(prize==1, sample(c(2:3), 1, replace=F), ifelse(prize==2, 3, 2))
		remain<- c(1:3)[-c(1, reveal)]
		switch<- switch + ifelse(prize==remain, 1, 0)
		}
		out<- c(stay/n.iters, switch/n.iters)
		return(out)
		}
	
monty.hall(100000)	
	
	
	