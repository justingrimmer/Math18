##Lab Session 2: Functions, Optimization and Simulation in R
### Stanford Poli Sci. Math Camp, 2018
## Jesse Yoder and Zuhad Hai, TAs
## Credit to Previous TAs: Jonathan Mummolo, Erik Peterson, Elisabeth Van Lieshout, Hans Lueders, Will Marble




#An example of setting directories when working with another person - especially useful if co-authors use different operating systems
jy<-FALSE
zh<-TRUE 
jywd<-"/Users/jesseyoder/Dropbox/Math Camp 2014"
zhwd<-"/Users/zuhadhai/Dropbox/Teaching/Math Camp/Math Camp 2014"
if(jy) setwd(jywd)
if(zh) setwd(zhwd)

#This session covers the following topics:
#1 - Using and Writing Functions
#2 - An Introduction to Optimization
#3 - Using R to Integrate Functions

#Along the way we'll cover some key features of programming in R such as:
# If-Else statements, Bracket Selection, Various Options for Plotting Data and For Loops. 

##################
## Functions in R
##################

#Simply put, functions take an input and produce an output. 
#There are many examples in R. Some help with reading in data (e.g., read.csv()),
#others help with manipulating data (e.g., subset()), or estimating statsitical models (e.g., lm())

#Some functions are part of "base R" (the set of functions that come with R when you install the program)
#and can be called immediately on starting it up. However others must be installed and called as part of a package.


#Once you've found a package and loaded the function someone else wrote (or have identified a function in base R that you want to learn more about)
#You can examine the contents of a package or function for content by placing the function's name
#after a question mark or the packages name after two question marks

#Look through the descriptions of the three functions mentioned above:

?read.csv
?subset
?lm

#However, there will also be instances in which a canned function does not exist for what you want to do. 
#You may have some repetitive task you need to perform over and over throughout a data analysis. 
#Rather than clutter up your code by copy and pasting a single operation multiple times, you can write a 
#function that does the task and use it throughout your code (this also reduces the chances for user error 
#in copying several lines of code)

#So let's write a function in the truest sense. One that takes a numeric vector as an input, performs an operation
#and outputs a numeric vector with the results.

#Throughout this session (and the quarter) we're going to talk a lot about quadratic functions like the following,
#y= -(x-1)^2 + 4.

#Although basic, these sorts of functions are used to underpin sophisticated analyses of voting behavior 
#(e.g., scaling the ideology of membmers of the U.S. Congress; Clinton, Jackman and Rivers 2004). 
#Quadratic loss functions are also central to Ordinary Least Squares Regression which we'll learn more about in 350A. 

##########
##########

# 1 -- Writing a function in R

#To write a function in R, you first need to specify the inputs. Depending on your task, these might be data frames
#or a single number or a string of text. In this case, our function will take a numeric vector we call "input.values". 

#Once inside the braces you specify the operation the function should perform on these inputs. We want to produce a
#numeric vector that performs a set operation on each numeric item it receives

#Finally, using return() you need to specify what the function will put back into the broader R environment

#####Very Brief Aside #########
# Naming functions (and variables) is an art form
# possible candidates for y = -(x-1)^2 + 8 :
#   my.function
#   f1
#   quadratic.function
# Which one should we use? It depends on your audience!
# "Programs must be written for people to read, and only incidentally for machines to execute." - Abelson & Sussman
# pick names that will be (a) understandable to other humans reading your code (b) 'fit' well within the entire R file
# (c) are easily searchable (d) reveal the intent of the function/variable
#### End of Very Brief Aside####

# Lets write out our function
quadratic.function <- function(input.values){
  y.values <- -(input.values-1)^2 + 8
  return(y.values)
}



#Let's try our function out with the sequence of numbers below
domain.1 <- seq(from=-2,to=2,by=1)
domain.1 

#To call the function, you write its name and then place the inputs inside parentheses
quadratic.function(domain.1)

#If you don't provide an object to receive the output, it will display on the screen like above

#However, you can also pass the function output to an object like below

quadratic.outputs <- quadratic.function(domain.1)
quadratic.outputs

#What a great function! Let's take a few moments and figure out some ways to break it. 

# -- Examples that might make the function break or or make it hard to use




#OK, time for a sequel that dramatically improves on the first version.
#Let's write an updated function that more politely informs the user of one reason it may not work.

quadratic.function.2.the.second.one <- function(input.values){
  if(is.numeric(input.values)){
    y.values <- -(input.values-1)^2 + 8
    return(y.values)
  }
  
  else{
    return("Error: Only Input Numeric Objects, Please!")
  }
}

quadratic.function("a")
quadratic.function.2.the.second.one("a")
#Wow, much improved. 

#You'll note that the work this updated function does is based on an "if-else" statement.
#These are conditional statements which are incredibly useful in writing functions and constructing variables.
#The basic structure is as follows, 
#   first you specify some sort of logic condition that may or may not be met. 
#   In the above case, the condition is whether our function receieved a numeric vector from the outside environment. 

is.numeric(2)
is.numeric("2")



#In the above examples you can see that is.numeric produces a "TRUE" value if passed a numeric vector and a "FALSE" if this is not the case.
#To make an if-else statement work you'll need to specificy a condition that produces logic statements likes this. 

#If the statement is evaluated as true, then the operation in the braces immediately following the statement is performed. 
#However, if the statement evaluates as false, then the action taken comes from the second "else" portion of the statement.
#In the above example this means we get an error message when passing a non-numeric vector to the function. 

#Conditional Statements in R

#R has a variety of logic statements that can be used in if-else statements or any other setting where you need to employ a TRUE/FALSE logic, here are a few of the most useful

# "==" tests the equality of two objects
2==2
2=="A"

# "!=" test whether two objects are NOT equal
2 != 2 
2 != "A"

# ">", "<", "<=", ">=" test greater than / less than for two objects
3 > 2
4 >= 4
4 <= 4

#Sometimes logic statements might have multiple parts, "&" lets you chain together multiple conditions that must be simultaneously satisfied to be evaluated as true

number <- 5
number !=3 & number > 1

number <- 1
number !=3 & number > 1


# You can also use "|" to specify an "or" condition. This means the overall statement evaluates as "TRUE" if any single component of the logic chain is satsified
number <- 10

number == "A"
number > 8

number == "A" | number > 8

###############EXAMPLES

#This function doesn't produce any output. Let's take a few moments and try and figure out a way to fix it.

broken.function <- function(stuff){
  if(inputs==5){
    return("FIVE")
  }
  else{
    return("NOT FIVE")
  }
}

broken.function(8)

###############
###############



# 2 -- An introduction to optimization in R

#Now let's talk about optimization in R. But first, a brief aside about spatial models of politics.

#Building off of work in economics by Hoetelling (1929), Black (1948) (and later Downs (1957)) formalized a spatial model of politics. In simple spatial models, politics is conceived as a single dimension running from left (extremely liberal) to right (extremely conservative). Policy proposals, legislators and voters all occupy places on this political dimension. The action of politics is structured by where these actors are placed.

#Let's assume our humble quadratic function from before actually represents the utility of a single legislator considering a variety of policy alternatives

#Here's a plot of what this function looks like. To make the plot we pass R the x and y values we just generated. There are additional parameters in plot that help with labeling the graph and determining what exactly is plotted. We won't have time to go through these in great detail today, but there are plenty of plots in this lab that should help you figure out what the different parameters do. 

#Utility Function
x.values <- seq(from=-2, to=4, by=.2)
y.values <- quadratic.function(seq(from=-2, to=4, by=.2))

plot(x=x.values, y=y.values, type='l', xlab="Policy Ideology", ylab="Legislator Utility From Policy", xlim=c(-4,4), ylim=c(-.5,10), main="Legislator's Utility Function")

#What policy will make our legislator happiest? We can find out by optimizing this function. Let's do this by taking the derivative. 

#What's the derivative of -(x-1)^2 + 8? Figure this analytically using what we've talked about so far this week. 

# -- Wait for moment while students figure this out....

#Let's plot the original function and its derivative together 

#Derivative of Utility Function
derivative.y.values <- -2*x.values+2

#Plotting These Together, the par parameter lets you specify many things about the plot, in this case we'll use mfrow to stack two individual plots on top of each other

par(mfrow=c(2,1))
plot(x=x.values,y=y.values, type='l', xlab="Policy Ideology", ylab="Legislator Utility From Policy", xlim=c(-4,4), ylim=c(-.5,10), main="Legislator's Utility Function")
plot(x=x.values,y=derivative.y.values, type='l', main="Derivative of Legislator's Utility Function", xlab="Policy Ideology", ylab="",xlim=c(-4,4))

#The Legislator's utility will be maximized at the peak of the utility function or, alternatively, where the derivative of the utility function is equal to zero. Let's find this exact point using each method. 

#Make a data frame that binds together the x and y statements
utility <- cbind.data.frame(x.values,y.values)

#The data then looks like this
head(utility)

#We can use bracket selection to see the value of X in the same row where Y (legislator utility) is maximized
utility$x.values[utility$y.values==max(utility$y.values)]

#The same operation works for the derivative, although this time we want to set it equal to 0
derivative.utility <- cbind.data.frame(x.values,derivative.y.values)

derivative.utility$x.values[derivative.utility$derivative.y.values==0]

#We get the same answer from both approaches, the legislator will be happiest when the policy has an ideology of "1", whatever that means. 
#As you see in each of the above answers, brackets select particular rows/columns of a data frame based on some criteria (e.g., the values of other variables in that row).
#So we look at the value of the x column in our utility data frame that is across from the largest y value or with the derivative.utility data frame we can look at the x
#value that is across from where the derivative of y is equal to 0. 

#Here's what this looks like visually

par(mfrow=c(2,1))
plot(x=x.values,y.values, type='l', xlab="Policy Ideology", ylab="Legislator Utility From Policy", xlim=c(-4,4), ylim=c(-.5,10), main="Legislator's Utility Function")
abline(v=1, lty=2)
abline(h=8, lty=2)
plot(x=x.values,y=derivative.y.values, type='l', main="Derivative of Legislator's Utility Function", xlab="Policy Ideology", ylab="",xlim=c(-4,4))
abline(v=1, lty=2)
abline(h=0, lty=2)

#So where the derivative equals 0, the function in the top panel is at its maximum value, 8. 

#This was a relatively simple optimization example. Later in Math Camp we'll discuss using the "optim" function to optimize more complicated multivariate functions, but for now let's move on to an integration problem. 

dev.off()
#Dev.off closes out plotting, you'll want to do this before you start more plots if you are altering many things inside the "par" parameter when you plot

###############
###############


# 3 -- Using R to integrate functions

#Before we considered the policy that made a single legislator happiest. Now let's focus on the entire legislature. 
#Suppose we've been given the ideal points of the entire chamber. We want to use this information to make some descriptive
#statements about particular particular legislators (e.g., what percentage of the chamber is more liberal or conservative than a given politician?)

#In a simple case, we might use the integration techniques we learned to figure out this problem. How? Consider the following. 

#Suppose another quadratic function y = -(3-x)^2 + 81, describes the distribution of ideal points within the entire legislature.

ideal.points <- seq(from=-5, to=12, by=.2)
number.legislators.at.point <- -(3-ideal.points)^2 + 81

#Here's what that looks like when plotted

plot(x=ideal.points, y=number.legislators.at.point, type='l', xlim=c(-5, 12), ylim=c(0, 100), ylab="Number of Legislators at Point", xlab="Ideology", main="Distribution of Legislator Ideology In Overall Chamber")

#Let's keep the focus on an individual legislator with an ideal point of ".5" on this policy dimension. 
#Given that ideal point,  what % of the chamber is to the left of this politician?

#Mechanically, this means we want to find the area under the curve to the left of ".5". 
abline(v=.5, lty=2)

#More specifically, we want to find the area of this shape, which when divided by the overall area under the curve,
#will tell us the percent of the chamber that is more liberal than our representative 

plot(x=ideal.points, y=number.legislators.at.point, type='l', xlim=c(-5, 12), ylim=c(0, 100), ylab="Number of Legislators at Point", xlab="Ideology", main="Distribution of Legislator Ideology")

topline <- - (3 - seq(from=-5,to=.5,by=.2) )^2 + 81
bottomline <- rep(0, times=length(topline))
interval <- seq(from=-5,to=.5, length=length(topline))

polygon(x=c(interval, rev(interval)), y=c(topline, bottomline), col=rgb(0,.4,.8,0.25), border=NA)

#We could solve this problem using the techniques we learned this morning. Assuming the function is defined over (-5,12),
#we could find the antiderivative of -(3-x)^2 + 81, solve for the overall area under the overall curve from (-5,12) and the
#area to the left of our legsislator (-5, .5). Dividing the second number by the first would give us the percentage of the
#chamber to the left of the legislator at .5.

#But what if the the distribution of preferences in the legislature wasn't analytically tractable?

#Suppose, instead of following a quadratic function, the distribution of preferences follows the "Messy Distribution" a mixture of two normal distributions.

#We'll talk more about probabilty distributions later in Math Camp, for now just think of the normal distribution as a function that takes inputs
#(values on the x axis, a particular point on the ideological spectrum) and produces outputs (values on the y axis, the # of legislators with a given ideology)

#Here's a function to produce values from the messy distribution by feeding it points on the ideological spectrum.

messy.distribution <- function(input.points){
  return(dnorm(input.points, mean=-1.25, sd=1)*17 + dnorm(input.points, mean=1.1, sd=.6)*16)
}

#Here's a graph of the distribution of preferences in this legislature we'll be working with. It's a mixture of two normal distributions defined over the interval (-5,5). 

ideal.points <- seq(from=-5, to=5, by=.1)
number.legislators.at.point <- messy.distribution(ideal.points)

legislator.distribution <- cbind.data.frame(ideal.points, number.legislators.at.point)
area.under.curve <- subset(legislator.distribution, legislator.distribution$ideal.points < .5)

plot(x=ideal.points, y=number.legislators.at.point, type='l', main="What % of Chamber is to the left of a legislator at .5?", ylab="# of Legislators With That Ideal Point", xlab="Ideal Points")

interval <- area.under.curve$ideal.points
topline <- area.under.curve$number.legislators.at.point
bottomline <- rep(0, times=length(interval))
polygon(x=c(interval, rev(interval)), y=c(topline, bottomline), col=rgb(0,.4,.8,0.25), border=NA)

#So now we just have to find the area shaded in blue....

#Wait, how do we do that? This isn't something we know how to integrate using the techniques we discussed earlier,
#so the analytical approach suggested above isn't going to work. Rather than banging our head against the wall
#trying to find an analytical solution, let's use computing power to get us out of this jam. 

################################
########Monte Carlo Integration
################################

# We'll use R to implement an alternative approach to evaluating the integral of a function called MONTE CARLO INTEGRATION.
#Per Wikipedia this "is a technique for numerical intergration using random numbers." Basically, this means we define a function,
#evaluate it at many randomly chosen points over a given interval and sum the results. If finding and evaluating the anti-derivative
#of a function is the 'clever' way to integrate, this is a brute force way to do the same thing. 

#Monte Carlo integration comes in handy when it isn't clear how to obtain an analytic answer (or when we just don't feel like thinking too much).
#So back to our guiding question. Given this distribution of preferences what % of the chamber is to the left of the politician at ".5"?

#Before we start into sampling random numbers, make sure to set the seed in R. If you are doing simulations/drawing
#random numbers this ensures that someone else will be able to replicate your work. Once you set the same seed as them,
#you should get the same result that they do from the simulation. If you have different seeds when generating random numbers
#you could come to slightly different conclusions. 

set.seed(seed=123)

#Ok, now let's define the interval that we'll integrate over. First we'll find the total area under the curve by integrating
#this function from -5 to 5. 

start <- -5
end <- 5
interval <- seq(from=start, to=end, by=.01)

#Then we pick how many randomly chosen points we want to evaluate the function at, in this example we'll do 100
number.evaluation.points <- 100

#Now randomly draw 100 points on this interval at which to evaluate the function
monte.carlo.1.points <- sample(interval, size=number.evaluation.points)

#We then plug these points into our messy.distribution function
monte.carlo.evaluations <- messy.distribution(monte.carlo.1.points)

#This is the form of the Monte Carlo estimate: we take the interval we're estimating over times the average value of the
#function over that interval

estimate.overall <- (end - start)*(sum(monte.carlo.evaluations)/length(monte.carlo.evaluations))
estimate.overall

#This is our estimate of the total area under the curve. 

#Let's go back and do the same thing, this time looking for the area to the left of our politician at 0.5. 

start.left <- -5
end.left <- .5
interval.left <- seq(from=start.left, to=end.left, by=.01)

#Pick how many randomly chosen points we want to evaluate the function at, in this example we'll do 100
number.evaluation.points <- 100

#Pick 100 randomly chosen points on this interval at which to evaluate this function

monte.carlo.2.points <- sample(interval.left, size=number.evaluation.points)

#Evaluate these points, once again using our messy distribution function.
monte.carlo.evaluations.left <- messy.distribution(monte.carlo.2.points)

estimate.left <- (end.left - start.left)*(sum(monte.carlo.evaluations.left)/length(monte.carlo.evaluations.left))
estimate.left

#So let's finally answer our question. What's our estimate of the percent of the chamber that is more liberal than a
#politician at 1?

percent.to.left <- estimate.left/estimate.overall
percent.to.left

#Now remember, this is an estimate rather than an analytic solution and that doesn't come without some costs. 
#If we sampled more, fewer or different points we would get a different answer. So this is unlike an analytic integral
#where the answer has no uncertainty associated with it. Also at times this simulation could be very computationally
#intensive (e.g., doing this in multiple dimensions) and may take a while to run.

################################
########For Loop Introduction
################################

#OK, we've gone through a lot but there's one more task we might be interested in. How much uncertainty is there in this estimate?
#How different would it be with a smaller or greater number of sample points?

plot(x=ideal.points, y=number.legislators.at.point, type='l', main="Sampled Points Used to Estimate Integral", ylab="# Legislators at point", xlab="Ideology")
rug(monte.carlo.1.points)

#As you can see from this rug plot, our estimate of the overall distribution comes from points scattered throughout the distribution,
#but you'll note some gaps where we don't have coverage and some areas that seem to be overrepresented in estimating the integral.
#This means that our estimate may change if we change the distribution of points used. 

#This time we're going to loop over a vector that contains different sample sizes for our monte carlo integral.
#So at first it will only use a sample of n=1 to estimate the integral, as you can guess this will not be a very
#good approximation of the area under the curve. As n gets larger however, we expect our estimates to vary less
#because each additional sample point has much less influence on the average. 

#This is the support of our function. We'll sample from many points along here to estimate the area under the curve like we
#did in the single case above.

start <- -5
end <- 5
interval <- seq(from=start, to=end, length=10000)

#This is a vector containing numbers from 1 to 10000, we'll use this to determine the sample size in each loop estimating our monte carlo integral
size.of.mc.sample <- c(seq(from=1, to=10000, by=1))

#Generate an empty vector that will receive our estimates of the integral from the loop, if you don't do this you will
#receive an error message b/c there will not be a defined object to receive things from the loop
integral.estimates <- NA

#The start of the loop, this tells it to perform one estimate for each sample size listed in the trial.lengths vector
for(q in 1:length(size.of.mc.sample)){
  
  #Draw a sample of points to evaluate from the interval based on the number spelled out in the trial lengths vector. So, for the first run through size will equal 1, for the last iteration size will equal 10000
  
  sample.points <- sample(interval, size=size.of.mc.sample[q])
  
  #Calculate value of the function at these points using our user defined function from before
  
  distribution.evaluated.at.sample.points <- messy.distribution(sample.points)
  
  #the final step is to calculate our estimate of the integral, just as we did above but now each entry in value will contain an estimate based off varying sample sizes
  
  integral.estimates[q] <- (end - start) *( sum(distribution.evaluated.at.sample.points)/length(distribution.evaluated.at.sample.points) )
}

plot(x=size.of.mc.sample, y=integral.estimates, type='l', xlab="Monte Carlo Sample Size", ylab="Estimate of Integral", main="Estimate of Integral by Sample Size", las=1)

#So what does this plot tell us? For one the estimates are certainly noisier when we choose a smaller sample size.
#As the sample size increase the estimates appear to converge. 


###CONCLUSION

#That was a lot to get through. A good way to learn more about R is to review any parts of the code you have trouble understanding, tinker with them, and see if you can get them to work again or slightly change the way they work. 


####
####
####

###EXTRA FOR LOOP PRACTICE

#These for loops don't work right. Can you figure out a way to fix them?

#LOOP 1
#Something is wrong with this loop. 

counter.number <- c()

for(z in 1:6){
  counter.number[i] <- z
}

counter.number

#LOOP 2
#This loop won't even run. Try and fix it. 

for(j in 1:15){
  sample <- runif(n=10, min=-.5, max=1.75)
  average.value[j] <- mean(sample)
}

average.value

#LOOP 3
#This loop should produce 3 numbers, but instead it only produces 1. What's wrong?

loop.number <- seq(from=1,to=5, length=10)

output <- NA

for(k in 1:length(loop.number)){
  output <- rpois(n=1, lambda=3)
}

output



















