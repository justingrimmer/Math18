

############# R LAB ASSIGNMENT #1 ################
### Stanford Poli Sci. Math Camp, 2018
## Zuhad Hai and Jesae Yoder, TAs



set.seed(98)

# 1. Creating a data frame

#a) Create a numeric vector that is the sequence of all integers between 1 and 1000 and assign this vector the name "vec"

vec<-seq(1,1000, by=1)

#b) Create another vector of 1000 integers that are randomly drawn from the vector "vec" and label this new vector "vec2". Hint: use the "sample()" function

vec2<-sample(vec, 1000, replace=TRUE) 

#c) Bind these two vectors together in a data frame, and call the data frame "df"

df<-cbind.data.frame(vec, vec2)

#d) Replace all instances of the numbers 2, 47, 29, and 509 in column 2 with missing values (NA). 

missings<-which(df[,2]%in%c(2,47,29,509))
missings
df[missings,2]<-NA
df[missings[1],2] ##check that it worked
df[missings[2],2] ##check that it worked

#e) Rename the columns of df "case_id" and "income"

colnames(df)<-c("case_id","income")
head(df)

#f) Calculate the mean, median, and standard deviation of "income" and report those values.

mean(df$income, na.rm=TRUE) #489.138
median(df$income, na.rm=TRUE) #491
sd(df$income, na.rm=TRUE) #287.6229

#e) Create a data frame, df2, that is df without the missing values. In other words, delete all observations (rows) that are missing. 

df2<-na.omit(df)
dim(df2)##see if the dimensions changed

#2. 

set.seed(98)

#a) Generate a matrix with 5000 rows and 200 columns and call the matrix "mat"

mat<-matrix(nrow=5000, ncol=200)

#b) Populate the cells of "mat" with numbers that are drawn randomly from the vector "vec"

##there are many ways to do this, but here is one which loops through each column:
for(i in 1:ncol(mat)){	
  vals<-sample(vec, nrow(mat), replace=TRUE)
  mat[,i]<-vals
}

head(mat)




#c) Identify the values in the following locations of mat:

# 3rd row, 158th column
mat[3,158]
#339

# 403rd row, 76th column
mat[403, 76]
#714

# 902nd row, 103rd column
mat[902,103]
#629

# 301st row, 59th column
mat[301, 59]
#686


#d) Create a data frame, df3, that is columns 100 through 200 of mat.

df3<-as.data.frame(mat[,100:200])
dim(df3)

#e) Report the sum of all the values in the 34th column of df3.

sum(df3[,34], na.rm=TRUE)
#2487355


#3. 

set.seed(98)

#a) Generate a vector of ten first names of people in this class and call the list "first.names"
first.names <- c("anna","apoorva","bradford","brett","caroline","catherine","christina","jamal","jesse","joan")

#b) Write a simple loop to have R print the name of every person in this vector (You could print out the list by just executing its name, but this will be good practice working with an easy loop.)

for(i in 1:length(first.names)){
  
  print(first.names[i])
  
}

#c) Create a vector of the last names of the people in this class that correspond to the first names of the same people, and call the vector "last.names". (hint: we should all be on the slack channel together, so you can see the member list there if you can't remember last names!) So if the first element in the "first.names" list is "Jesse", the first element in the "last.names" vector should be "Yoder".

last.names <- c("popova","lal","waldie","parker","muraida","chen","toenshoff","johnson","yoder","o'bryan")

#d) Create an empty vector and call it "full.names". 

full.names <- c()

#e) Write another loop that will iterate through each element of first.names and last.names and paste the corresponding elements together (Hint: Use the paste() function, using an argument to separate the first and last names with a space). Deposit this full name in the corresponding element of full.names. Print out the list full.names.


for(i in 1:length(first.names)){
  full.names[i] <- paste(first.names[i], last.names[i], sep=" ")
  }

full.names


#4. Some of the following code is broken. Some of it is missing. Work through the code checking that each line works and repairing/writing it as necessary so it accomplishes the commented note next to it, and explain (briefly) in commented code what the problem was. 

vec<-NA##create an empty vector

vec[2]<-rnorm(1000, 2, 1) ##replace the contents of vec with 1,000 draws from a Normal distribution with mean=2 and sd=1
#should be:
vec<-rnorm(1000, 2, 1)

##replace the contents of vec with the same values it currently has rounded to 3 digits
vec<-round(vec, digits=3)


x.range<-seq(1,1000,4) ##create a sequence of all the integers between 1 and 1000
#should be:
x.range<-seq(1,1000,1) 


#Bonus: Plot a frequency histogram of vec that has 20 bins using the hist() function. You don't need to save the picture, just write the code to produce it.

hist(vec, breaks=20, freq=TRUE, main="Distribution of vec", xlab="vec" , ylab="Frequency", col="lightskyblue")


#4. Working with actual data. 

#a) Load the "cces.2012.small.csv" data set that is posted online with this R Homework. This is a random subset of the 2012 Cooperative Congressional Election Study.

cces <- read.csv("~/Dropbox/Math Camp 2014/Math Camp Labs (FINAL)/Data/cces.2012.small.csv")
head(cces)
dim(cces)


#b) Calculate the proportion of Democrats (using the variable "dem") that are non-Hispanic white (using the variable "nhwhite")

table(cces$dem) ##dd$dem only takes on the values 0 and 1, so if I take the mean, that's the proportion of dems
mean(cces$dem[cces$nhwhite==1], na.rm=TRUE)
#0.3372765

#c) What is the mean income among people who voted for Pres. Obama ("obama"=1)?
mean(cces$faminc3[cces$obama==1], na.rm=TRUE)
#69.00718

#d) What is the mean income among people who did not vote for Pres. Obama  ("obama"=0)?
mean(cces$faminc3[cces$obama==0], na.rm=TRUE)
#71.87654

#d) What share of the vote did Pres. Obama win in Rhode Island, Michigan and New Jersey, respectively?

mean(cces$obama[cces$state=="Rhode Island"], na.rm=TRUE) #0.7647059
mean(cces$obama[cces$state=="Michigan"], na.rm=TRUE) #0.5474453
mean(cces$obama[cces$state=="New Jersey"], na.rm=TRUE) #0.5208333



