############# R Homework #2 ################
### Stanford Poli Sci. Math Camp, 2018
## Zuhad Hai and Jesse Yoder, TAs

## Note: if you see a line of code in this script like the "set.seed(99)" command below, execute it.
## We should be able to run your script file without errors to accomplish all the tasks below.
## This assignment requires generating several plots, there's no need to save the plots or send them to us. Just write your code so that the plots appear as we run the code.
#If you run into problems with any part of the code especially the aspects of plotting that we haven't covered in great detal, try checking online resources, the code from lab sessions, others in your cohort, the TAs, etc etc...
set.seed(99)

######
# 1. Load the R Data Frame "dta.Rdata" (hint: the load() function in R can help read in .Rdata files). Figure out what this object is called using the ls() function, use head() to look at the data




######
#Below write some functions to estimate the mean value of a variable. Let's consider two different estimators for a variable's mean.   

# 2. Write a function called "average" to take the mean of the variable "independent.variable" in the dataframe. This function should take a *data frame* as an input and return the average value of "independent.variable" in the data frame it's supplied with.  NOTE: Don't use R's "mean" function to perform this calculation, write your own function to do so



######
# 3. Write a second function, "average.two.obs" to take the mean of the variable "independent.variable" based on only the first two observations in the data frame that is passed to it. This function should return the average value of "independent.variable" based on these two observations.



######
# 4. Write a for loop that will take a random sample of 100 of the rows (with replacement) from the data frame "dta" and apply each of the functions you've just written to that random sample. Loop over this operation 50 times and save the results from each of your two functions.



######
#5A. Make two histograms (using the "hist" function), one based on the 50 outputs from the "average" function applied to the random samples and one based on the 50 outputs from the "average.two.obs" function applied to the random samples.

#On each histogram also draw a vertical line based on the average value (you can use the mean function to determine this if you like) of the 50 outputs from each function. Use options within the "hist" function to make the two plots cover the same range of values on the x-axis. Give each of your plots a title and label the x-axis. Also use "par" to stack these two plots on top of each other in a single plotting window.

#5B. We've generated the data from a normal distribution with mean=25. If, on average, an estimator gets the right answer we call it unbiased. Roughly speaking, should we consider each of these estimators, "average" and "average.two.obs" to be unbiased based on these results?

#To compare the average value of these estimators to, 25, the mean value of the distribution these data were drawn from. Draw a thick, red vertical line on each plot at 25. Does this look close to the average value obtained from these two estimators? 



#####
#6A. Let's focus just on the "average" function for the moment. Write a loop where you randomly sample, with replacement, 2000 rows from the data frame. After drawing this sample, apply your "average" function to it. Loop over this operation 100 times and save the results in a vector. 

#6B. Using the "quantile" function, find the 5th and 95th percentile values of the vector where you saved the averages. 

#6C. Apply the average function to the overall data frame, dta

#6D. Plot the resulting information. In your plot use a solid, black point to illustrate the mean you found in 6C, the value of the mean should be the x-axis in the plot. Then draw a line through this point indicating the 5th and 95th percentile values of the vector you found in 6A. When finished the result should look similar to single point plotted in figure 3 in this paper "http://stanford.edu/~jgrimmer/cc.pdf"



######
#7A. Let's get back to using both of our functions, "average" and "average.two.obs". Write a loop that applies your functions to an increasingly large portion of the overall dataframe. Start by applying the functions to the first 10 rows of the dataframe and save the resulting averages. Then apply the functions to the first 50, 100, 200, 300, 400, 500 and 1000 rows of the data frame.

#7B. Plot the resulting information. On the x-axis plot the sample size used to estimate the mean (e.g., the first mean will be at 10 on the xaxis, the second at 50 and so on...). On the y-axis plot the resulting estimate. Rather than points, plot these values as a solid line. On the same plot, graph the estimates from "average.two.obs" on the same plot using a dashed line. Produce a title and label each of the axes in your plot. 

#How does this compare to the true value we were supposed to get, 25? Draw a thick, black horizontal line at 25. 



######
#8. Rather than look at a couple of individual points, write a loop that will do the previous calculations for every sample size between 10 and 2000 (e.g. average applied to first 10 rows, average applied to first 11 rows, and so on). Store the results and plot them the same way you did in problem 7. 



######
#9. Finally, plot the difference between your estimates at each sample size and 25, the central value of the distribution this data was drawn from. Again make a plot where the x-axis is the sample size the estimator was applied to and the y-axis displays the value of the difference between the resulting estimate and 25. Label the axes and draw a solid, blue line at 0 on the y-axis (i.e. where the estimate has the same value as the mean of the distribution the data is drawn from).

#If an estimator gets closer to the value it's trying to estimate as the sample it's applied to grows in size, we call it consistent. Do either of these estimators appear to be consistent based on your graph?













