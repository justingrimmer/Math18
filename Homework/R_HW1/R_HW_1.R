

############# R HOMEWORK #1 ################
### Stanford Poli Sci. Math Camp, 2018
## Zuhad Hai and Jesse Yoder, TAs

## Note: if you see a line of code in this script like the "set.seed(98)" command below, execute it.  This will help with replicability across student answers.

## You will get more out of this if you try the assignment on your own first. If you get stuck, search around online for a solution. If you get totally stuck, team work is permitted, but you must write up your OWN script file.

set.seed(98)

# 1. Creating a data frame

#a) Create a numeric vector that is the sequence of all integers between 1 and 1000 and assign this vector the name "vec"

#b) Create another vector of 1000 integers that are randomly drawn from the vector "vec" and label this new vector "vec2". Hint: use the "sample()" function

#c) Bind these two vectors together in a data frame, and call the data frame "df"

#d) Replace all instances of the numbers 2, 47, 29, and 509 in column 2 with missing values (NA). 

#e) Rename the columns of df "case_id" and "income"

#f) Calculate the mean, median, and standard deviation of "income" and report those values.

#e) Create a data frame, df2, that is df without the missing values. In other words, delete all observations (rows) that are missing. 


#2. 

set.seed(98)

#a) Generate a matrix with 5000 rows and 200 columns and call the matrix "mat"

#b) Populate the cells of "mat" with numbers that are drawn randomly from the vector "vec"

#c) Identify the values in the following locations of mat:

# 3rd row, 158th column
# 403rd row, 76th column
# 902nd row, 103rd column
# 301st row, 59th column

#d) Create a data frame, df3, that is columns 100 through 200 of mat.

#e) Report the sum of all the values in the 34th column of df3.


#3. 

set.seed(98)

#a) Generate a vector of ten first names of people in this class and call the list "first.names"

#b) Write a simple loop to have R print the name of every person in this vector (You could print out the list by just executing its name, but this will be good practice working with an easy loop.)

#c) Create a vector of the last names of the people in this class that correspond to the first names of the same people, and call the vector "last.names". (hint: we should all be on the slack channel together, so you can see the member list there if you can't remember last names!) So if the first element in the "first.names" list is "Jesse", the first element in the "last.names" vector should be "Yoder".

#d) Create an empty vector and call it "full.names". 

#e) Write another loop that will iterate through each element of first.names and last.names and paste the corresponding elements together (Hint: Use the paste() function, using an argument to separate the first and last names with a space). Deposit this full name in the corresponding element of full.names. Print out the list full.names.

#4. Some of the following code is broken. Some of it is missing. Work through the code checking that each line works and repairing/writing it as necessary so it accomplishes the commented note next to it, and explain (briefly) in commented code what the problem was. 

vec<-NA##create an empty vector

vec[2]<-rnorm(1000, 2, 1) ##replace the contents of vec with 1,000 draws from a Normal distribution with mean=2 and sd=1

##replace the contents of vec with the same values it currently has rounded to 3 digits

x.range<-seq(1,1000,4) ##create a sequence of all the integers between 1 and 1000

#Bonus: Plot a frequency histogram of vec that has 20 bins using the hist() function. You don't need to save the picture, just write the code to produce it.


#4. Working with actual data. 

#a) Load the "cces.2012.small.csv" data set that is posted online with this R Homework. This is a random subset of the 2012 Cooperative Congressional Election Study.

#b) Calculate the proportion of Democrats (using the variable "dem") that are non-Hispanic white (using the variable "nhwhite")

#c) What is the mean income among people who voted for Pres. Obama ("obama"=1)?

#d) What is the mean income among people who did not vote for Pres. Obama  ("obama"=0)?

#d) What share of the vote did Pres. Obama win in Rhode Island, Michigan and New Jersey, respectively?















