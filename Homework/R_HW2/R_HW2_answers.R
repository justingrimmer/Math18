############# R Homework #2 ################
### Stanford Poli Sci. Math Camp, 2018
## Zuhad Hai and Jesse Yoder, TAs

## Note: if you see a line of code in this script like the "set.seed(99)" command below, execute it.
## We should be able to run your script file without errors to accomplish all the tasks below.
## This assignment requires generating several plots, there's no need to save the plots or send them to us. Just write your code so that the plots appear as we run the code.
#If you run into problems with any part of the code especially the aspects of plotting that we haven't covered in great detal, try checking online resources, the code from lab sessions, others in your cohort, the TAs, etc etc...
set.seed(99)

######
# 1. Load the R Data Frame "dta.Rdata". Figure out what this object is called using the ls() function, use head() to look at the data
load("dta.Rdata")
ls()
head(dta)

######
# 2. Write a function to take the mean of the variable "independent.variable" in the dataframe, call this function "average". NOTE: Don't use R's "mean" function to perform this calculation, write your own function to do so

average <- function(data.frame){
  output <- sum(data.frame$independent.variable)/length(data.frame$independent.variable)
  return(output)
}

######
# 3. Write a second function to take the mean of the variable "independent.variable" based on only the first TWO observations in the data frame, call this function "average.two.obs"

average.two.obs <- function(data.frame){
  estimation.data <- data.frame[1:2,]
  output <- sum(estimation.data$independent.variable)/length(estimation.data$independent.variable)
  return(output)
}

#NOTE/ASIDE: Note that writing functions in this way makes them somewhat fragile (e.g., we'd need to rewrite them if we wanted to take the mean of a different variable). While this is beyond the scope of the current assignment, here's a more general average function that would take the mean of any variable you specify in a data frame. This type of structure will be helpful when you write functions in your own work/future problem sets.  

average.any.variable <- function(data.frame, varname){
  output <- sum(data.frame[,varname])/length(data.frame[,varname])
  return(output)
}

average.any.variable(dta, "independent.variable")
average(dta)


######
# 4. Write a for loop that will take a random sample of 100 of the rows (with replacement) from the data frame and apply each of the functions you've just written to that random sample. Loop over this operation 50 times and save the results from each of your functions.

average.output <- NA
average.two.obs.output <- NA

for(i in 1:50){
  vec <- sample(dta$observation.number, size=100, replace=TRUE)
  sample.for.mean <- dta[vec,]
  average.output[i] <- average(sample.for.mean)
  average.two.obs.output[i] <- average.two.obs(sample.for.mean)
}

######
#5. Make two histograms, one based on the 50 outputs from the "average" function applied to the random samples and one based on the 50 outputs from the "average.two.obs" function applied to the random sample.

#On each histogram also draw a vertical line based on the average value (you can use the mean function for this if you like) of the 50 outputs. Use options within the "hist" function to make the two plots cover the same range of values. Give each of your plots a title and label the x-axis. Also use "par" to stack these two plots on top of each other in a single plotting window.  

par(mfrow=c(2,1))
hist(average.output, breaks=10, xlim=c(10,45), xlab="Estimate of Mean", main="Estimates from Average Function")
abline(v=mean(average.output), lty=2)
abline(v=25, lwd=2, col='red')

hist(average.two.obs.output, breaks=10, xlim=c(10,45), xlab="Estimate of Mean", main="Estimates from Two-Observation-Average Function")
abline(v=mean(average.two.obs.output), lty=2)
abline(v=25, lwd=2, col='red')

#This closes the plotting window and resets par so next time we plot only a single plot will go into the window
dev.off()


#If a function gets the right answer on average we call it unbiased. In this case both "average" and "average.two.obs" are unbiased estimators of the mean. However, this doesn't imply we should like them equally well. From the historgrams you can see that the estimates from "average.two.obs" cover a much wider range of values than those from "average". This higher variance in "average.two.obs" means it is a less "efficient" estimator. As we explore later in the problem set, "average.two.obs" is also an inconsistent estimator. So while unbiasedness is great, it shouldn't be the only criteria by which we judge an estimator. 


#####
#6A. Let's focus just on the "average" function for the moment. Write a loop where you randomly sample, with replacement, 2000 rows from the data frame. After drawing this sample, apply your "average" function to it. Loop over this operation 100 times and save the results in a vector. 

rows <- c(1:2000)
average.boot <- NA

for(k in 1:100){
  sample.rows <- sample(rows, size=2000, replace=TRUE)
  sample.data.frame <- dta[sample.rows,]
  average.boot[k] <- average(sample.data.frame)
}

#6B. Using the "quantile" function, find the 5th and 95th percentiles of average boot. 

boot.95 <- quantile(average.boot, probs=c(.95))
boot.5 <- quantile(average.boot, probs=c(.05))

#6C. Apply the average function to the overall data frame, dta

dta.mean <- average(dta)

#6D. Plot the resulting information. In your plot use a solid, black point to illustrate the mean you found in 6C, the value of the mean should be on the x-axis. Then draw a line through this point indicating the 5th and 95th percentile values of the vector you found in 6A. When finished results should look like something like a single point plotted in figure 3 in this paper "http://stanford.edu/~jgrimmer/cc.pdf"

plot(y=1, x=dta.mean, pch=16, yaxt='n', xlab="Estimate of Mean", ylab="", main="Mean of Independent Variable", xlim=c(23,27))
lines(y=c(1,1), x=c(boot.5, boot.95))

#In the previous steps you've used a process called "bootstrapping" to construct a 90% confidence interval around the estimate of the mean in this data, in other words 90% of the time we would expect this interval to contain the mean of "independent variable" if we applied our average function to another sample drawn from the same distribution. You'll see these types of plots, displaying means or coefficient values with an associated confidence interval, employed often in political science. We'll cover confidence intervals in much greater detail in 450A. 

######
#7. Write a loop that applies your functions to an increasingly large portion of the overall dataframe. Start by applying the functions to the first 10 rows of the dataframe and save the resulting averages. Then apply the functions to the first 50, 100, 200, 300, 400, 500 and 1000 rows of the data frame.

row.length <- c(10,50,100,200,300,400,500,1000)
averages.part2 <- NA
averages.two.obs.part2 <- NA

for(i in 1:length(row.length)){
  subset.frame <- dta[1:row.length[i], ]
  averages.part2[i] <- average(subset.frame)
  averages.two.obs.part2[i] <- average.two.obs(subset.frame)
}

#Plot the resulting information. On the x-axis plot the sample size we used to estimate the mean. On the y-axis plot the resulting estimate using a solid line. Plot the estimates from "average.two.obs" on the same plot using a dashed line. Produce a title and label each of the axes in your plot. 

plot(x=row.length, y=averages.part2, type='l', ylim=c(18,30), ylab="Estimate", xlab="Sample Size", main="Estimates of Mean as Sample Size Increases")
lines(x=row.length, y=averages.two.obs.part2, lty=2)
abline(h=25, lwd=3)


######
#8:
#Rather than look at a couple of individual points, write a loop that will do the previous calculations for every sample size between 10 to 1000. Store the results and plot them the same way you did in problem 7. 

averages.part3 <- NA
averages.two.obs.part3 <- NA

sizes <- seq(from=10,to=2000,by=1)

for(i in 1:length(sizes)){
  subset.frame <- dta[1:sizes[i], ]
  averages.part3[i] <- average(subset.frame)
  averages.two.obs.part3[i] <- average.two.obs(subset.frame)
}

#Plot the resulting information. On the x-axis plot the sample size we used to estimate the mean. On the y-axis plot the resulting estimate using a solid line. Plot the estimates from "average.two.obs" on the same plot using a dashed line. Produce a title and label each of the axes in your plot. 

plot(x=seq(from=10,to=2000, by=1), y=averages.part3, type='l', ylim=c(18,30), ylab="Estimate", xlab="Sample Size", main="Estimates of Mean as Sample Size Increases")
lines(x=seq(from=10,to=2000, by=1), y=averages.two.obs.part3, lty=2)
abline(h=25, lwd=3)

######
#9:
#Finally, plot the difference between each of your estimates and 25. Again make a plot where x-axis is the sample size used in the estimate, y-axis is the estimate. Label the axes and draw a solid, blue line at 0 on the y-axis.

#If an estimator gets closer to the value its trying to estimate as the sample it's applied to grows in size, we call it "consistent". Do either of these estimators appear to be consistent from your graph?

plot(x=seq(from=10,to=2000, by=1), y=(averages.part3-25), type='l', ylim=c(-10,10), ylab="Estimate - True Value", xlab="Sample Size", main="Difference between estimate and true value")
lines(x=seq(from=10,to=2000, by=1), y=(averages.two.obs.part3 - 25), lty=2)
abline(h=0, col='blue')

#Mean "average.two.obs" is not consistent because it does not get any closer to the true value as the amount of data it is applied to increases. On the other hand, "average" does get better so it appears to be a consistent estimator of the mean. 




