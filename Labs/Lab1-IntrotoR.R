################  LAB 1: INTRO TO R  ################
### Stanford Poli Sci. Math Camp, 2018
## Zuhad Hai and Jesse Yoder, TAs

#########################
############ This is an R Script file. R scripts have a .R or .Rd file extension (depending on your version of R) and are text documents that store commands. Keeping clean and annotated script files is important for many reasons, including avoiding errors and replicating work. 
############

############ Script files have active and inactive lines. Inactive or "commented" lines of code, like this one, begin with a hashtag mark, and R will skip over them if you tell it to execute your script.  Commenting using the # mark is useful for annotaing a script file and making notes with collaborators. Once you type a # symbol, R will comment out (disregard) all subsequent characters until you hit return and start a new line. 
############

############ Active lines, by contrast, are executable. Let's execute the line of code below. Select the entire line, and then press COMMAND+RETURN on a Mac, (CNTRL+ENTER on a PC ?)
############

##clear everything from R's workspace to start
WS=c(ls())
rm(list=WS)
ls()

## Let's run another command...

paste("Hello World!")
paste("Welcome to Stanford! You are one in a ", sample(c("million!","billion!","trillion!","cohort of roughly 15?"), size=1), sep="")


#########################
############ SETTING A WORKING DIRECTORY
##########################


############ One of the first things you'll want to do when working on R is set a working directory for your project. This is the folder on your computer that R will default to for saving and loading files (unless told otherwise). To do this, we use the "setwd()" function. Below is the line of code I'm using to set my working directory as the "Data" folder, which is a directory within my private DropBox. Take a moment to set yours using this line as a template.
############

setwd("/Users/jesse/Dropbox/Math Camp 2014/Math Camp Labs (FINAL)/Data")##insert your file path between the quote marks

############ You'll notice that the "setwd()" command I wrote above contains a specific file path on my personal laptop. This is not ideal if I'm writing a script that I want a collaborator to be able touse. If the folder is in a shared directory like DropBox, you can write a more universal command as follows
############

setwd("~/Dropbox/Math Camp 2014/Math Camp Labs (FINAL)/Data") ##note the placement of the tilda

############ This command would now work on anyone who had access to this folder. No need to alter this dependning on who is using the R script. Super useful.

## Let's see if it worked:

getwd()

#########################
############ R as a calculator
##########################

4+4 #addition

6-2 #subtraction

100/10 #division

450*3 #multiplication

(4+4)*(6-2)/(100/10)*(450*3) ##order of operations work as they should

(4+4)*(6-2)/100/10*(450*3) ##we get different answers when the parens move

8^2 ##raise a number to a power

sqrt(64) ##square root

pi ##the constant pi

log(10) ##the natural log

exp(10) ##exponentiate (Take Euler's constant and raise it to some power)

exp(log(10))

10 %% 2 # remainders: 2 goes into ten 5 times, no remainder

11 %% 2  #2 goes into 11 five times, remainder=1



####################  ASSIGNING VALUES TO OBJECTS #############################################
############ One of the main virtues of R is its efficient and clear method of storing pieces of information that we generate during data analysis. These storage units are known as "objects" and they take many forms, or "classes". The general format for assigning the value of an object is "[Object NAME]<-[VALUE]". The "<-" symbols is known as "gets" because of the operation it performs: The object on the left hand side "gets" the value you place on the right hand side. For example, we could have stored all the numeric results we just computed as follows:

add.obj <- 4+4
sub.obj <- 6-2
div.obj <- 100/10
mult.obj <- 450*3

############ You may notice that the output displayed did not include the numeric results themselves. This is because R computed these operations "quietly" and simply stored them. If we need them, they are there, but they need not clutter up our screen. To access them, we simply execute the names we assigned as follows:

##Names of R objects are case sensitive and cannot begin with numbers. They can include "." and "_" to separate words. It is good coding practice to name objects with unituive labels to avoid confusion. 

add.obj
sub.obj
div.obj
mult.obj

############ Behind the scenes, R keeps track of all the objects we create. To display them at any time, use the "ls()" function:

ls()

############ If we create a new object that has the same name as an existing object, R overwrites the old with the new:

add.obj
add.obj<-4+8
add.obj

############ To remove all user-defined objects, execute the following:

rm(add.obj) ##remove one object
ls()
rm(list=ls()) ##remove all objects
ls() ##confirm there are no objects in active memory

############ Be careful with the "rm()" function. Some objects take a long time to create, and "rm()" will remove them in a blink. In this case it's not a big deal. Let's restore our objects:

add.obj<-4+4
sub.obj<-6-2
div.obj<-100/10
mult.obj<-450*3

###################  FUNCTIONS and CLASSES of OBJECTS #############################################

############ There are many classes of objects in R, each with their own properties. Knowing the class of an object lets us know the range of things we can do with that object. We can use the "class()" function to find out which class an object belongs to. But first, a word about functions...

############ Functions in R operate just like functions in mathematics: they take an input, perform some pre-specified operation, and produce an output.  There are many functions that come with R. Others need to be downloaded in supplemental packages. And we can also write our own functions to perform specialized tasks (stay tuned). To find out how the "class()" function works, execute the following line to access the help file for this function:

?class

############ In R, the input we give a function always goes inside parentheses. These inputs are called  "arguments". The help file for the "class()" function tells us that this function only has one required argument, "x", which can be any object. Other functions will require more than one argument, or have optional arguments, but this is a simple one. Now, let's use the class function:

class(add.obj)
class(sub.obj)
class(div.obj)
class(mult.obj)


############ The objects we created are of the numeric class (they are numbers). This means we can perform mathametical operations on them. Here is an example of a "character" object:

char.ex<-"10"
class(char.ex)
print(char.ex)


##It has no numeric value so we can't do math on it; it may look like a number, but if we put it in quotes, it's just text. See:

char.ex*5


##Text objects are also known as "strings". The first command we ran above output a character object (a string). See:

class(paste("Welcome to Stanford! You are one in a ", sample(c("million!","billion!","trillion!","cohort of roughly 20? (Idk. Not great with numbers.)"), size=1), sep=""))



############ We'll encounter more complex classes of objects in the coming sessions, but for now just be aware of how to determine the class of an object. This is the key piece of information in terms of knowing which operations can be performed on an object.


############
############ VECTORS
############ We may wish to store the different objects we have created inside a single object. One such object that can store mutliple elements is a vector (same meaning as in matrix algebra). Vectors are created using the "c()" function, with each element separated by a comma, as follows:

vec1<-c(1,2,3,5)
vec1
vec<-c(add.obj, sub.obj, div.obj, mult.obj)
vec


############ Note that like objects that have only one element, vectors have classes too. 

class(vec)

############ Mixing numeric and character objects in a single vector transforms that vector into an object that is of the character class.

vec2<-c(vec, char.ex) ##combine the two objects in a single vector
class(vec2)
vec2

## We can also use the vector function to combine vectors, like so:

mega.vector<-c(c(1,2,3),c(4,5,6))
mega.vector


###### FACTORS
### Factors are categorical objects. Each category of a factor is known as a "level." We can use the "factor()" function to create a factor object:

places<-factor(c("city","state","country"))
class(places)
levels(places)

### This vector is now of class factor, and has three levels: city, state and country


####### CHANGING CLASSES


##Sometimes we need to change the class of an object in order to manipulate it

###Sometimes, a vector can appear numeric but actually be a factor. This can be confusing. For example:

nums<-factor(c(1,2,3))
nums
class(nums)

##If I tried to perform a mathematical operation on the object "nums", I'll get an error. 

nums*3 ##attempt to multiply each element of nums by 3

##The error occurs because the elements in nums only look like numbers, when they are in fact categories (like dog, cat and fish). To do math with nums, we need to make it numeric. This means we have to change its class. If this were a character vector, the task would be easy. We'd just use the "as.numeric()" function. For example:

nums2<-c("1","2","3")
class(nums2)
nums2*3
nums3<-as.numeric(nums2)
nums3
nums3*3

##To transform a factor object into a numeric one, we need a middle step. First we need to transform it into a character, THEN we need to transform it into a numeric. The reason is that asking R to turn categories into numbers makes no sense to R. (Again, the elements only LOOK like numbers. But telling R to turn category "3" into a number does not provide R any info as to which number to choose.)

class(nums)
nums<-as.character(nums)
class(nums)
nums<-as.numeric(nums)
nums
nums*3


##Note that in practice, you would do this in one line of code by "nesting" the functions. That's right, functions inside functions.)

nums<-factor(c(1,2,3))##re-create the factor vector
nums<-as.numeric(as.character(nums)) ##turn the factor into a character object, and then to a numeric
nums*3 ##now do some math



############
############ MATRICES
############ We can combine multiple vectors to form matrices. Lets make a new vector and use it to create some matrices. We'll use two very important functions, "cbind()" and "rbind()". Then we'll use the "dim()" function to confirm the dimensions of the matrices we create.

vec3<-c(3,7,4,1) ##create a new vector
mat<-cbind(vec, vec3) ##create a matrix by binding these two vectors column-wise
mat2<-rbind(vec, vec3) ##create a matrix by binding these two vectors row-wise
class(mat)
class(mat2)
dim(mat) ## what are the dimensions of mat? In the output, the number of rows is always listed first, then the number of columns
dim(mat2) ## what are the dimensions of mat2?
mat
mat2



############
############ COLUMN/ROW NAMES
############ Notice that by default, R named the columns in "mat" and the rows in "mat2" after the names of objects we supplied. In the case of mat, we told R to treat each object as a column, so it named each column "vec" and "vec3", repsectively. We didn't specify row names, so it just numbered them. We can use the "rownames()" and "colnames()" functions to both display and change either of these.

colnames(mat)##print the colnames
rownames(mat)##print the row names
colnames(mat)<-c("var1","var2") ##replace the colnames
rownames(mat)<-c("obs1","obs2","obs3","obs4") ##replace the rownames
mat


############ DATA FRAMES
############ Data frames are similar to matrices in R (both types of objects consist of rows and columns) but R uses each to perform different functions. For example, we can use matrices to perform matrix algebra tasks (we'll get into those details later). But for most functions we use to model data (e.g., regression), R requires a data frame. Building data frames is straightforward, as is transforming matrices into data frames and vice versa:

df<-cbind.data.frame(vec, vec3) #column bind two vectors to form a data frame
class(df)
df



##another way to create matrices and data frames is with the "matrix()", "data.frame()", "as.matrix()" and "as.data.frame()". 


df<-as.data.frame(mat) ##convert the matrix "mat" to a data frame
class(df)
df


#Let's create a 3x3 matrix and replace te rows with vectors which we will create using some very useful functions:

mat3<-matrix(nrow=3, ncol=3)##create an empty 3x3 matrix
df3<-data.frame(rep(NA, 3), rep(NA, 3), rep(NA, 3)) ##create an empty 3x3 data frame

v1<-seq(from=1,to=5,by=2) ##create a vector, "v1", that is a sequence of numbers that range from 1 to 3 by interval 2
v2<-rep(4,size=3) ##create a vector, "v2", of length 3, which each element equal to 4
v3<-1:3 ##create a vector, "v3", that consists of each integer between 1 and 3

## we can replace these rows one at a time...

mat3[1,]<-v1
mat3[2,]<-v2
mat3[3,]<-v3

##or all at once:

mat3<-rbind(v1, v2, v3)

df3<-as.data.frame(mat3) ##Now let's turn the matrix into a data frame
df3



############ LISTS
############ Lists are like onions: they have layers, and have made many people weep openly.  Lists are also amazingly powerful once you get to know how they work. Like vectors, they can store multiple elements. BUT, the elements in a list can be ANY type of object, including massive objects such as whole data frames. This is extremely useful when working with multiple data sets, and for storing the output of repetitive tasks. Let's make some lists:

vehicles<-list("car","truck","bike")
class(vehicles)
vehicles

grades<-list(94, 25, 38)
class(grades)
grades

mats<-list(mat, mat2, df)
class(mats)
mats


mega.list<-list(vehicles, grades, mats)
mega.list


################################# INDEXING
##### One of the most crucial facets of R---often a source of frustration to beginners---involves indexing. We have already seen several types of objects that can store multiple elements. Depending on which type of object we are dealing with, each of those elements is indexed in a particular way, which we'll need to know if we want to access it.

##### The number of values in an index depends on the dimenions of the object we are working with. For example....

###VECTORS. For vectors, each element is denoted using brackets, and inside the brackets we input a singple number, since vectors are one dimensional. Let's say we want to print the 3rd element of the vector "vec":

vec[3]


###MATRICES. The matrices we created are two-dimensional (they have rows and columns), so each index value will take two inputs: a row number, and a column number (in that order!). Lets print the element contained in the 2nd row, 1st column of the matrix "mat":

mat[2,1]

##If we know the row and column names of a matrix, we can input those in place of the row and column numbers to get the same result. 

mat["obs2","var1"] ##input the row and column names in place of the row and column numbers, but as characters (put inside quotes)

###DATA FRAMES. Good news. We can access the elements of a 2-D data frame in the exact same ways:

df
df[2,1] #numeric indices
df[2,"var1"] ##numeric and name indices

## we can also access columns in data frames using the "$" operator followed by the name of the volumn:

df$var1

## We can also print multiple elements at a time. The ":" operator means "include every integer in between". For example

df[1:2, 1] ##print rows 1 through 2, and column 2

##also, if we leave either the row or column index blank, ALL rows or columns will be accessed, but we still need to use the comma to let R know we are accounting for all dimensions:

df[1:2,]

## a very useful command is the "head()" command. It prints the first few rows of a data frame, or elements of a vector.

head(df)

###LISTS. The first layer in a list is always one-dimensional, so its index takes one value inside double-brackets "[[]]". Lets print the second element of the "mats" list we created.
df
mats[[3]]
class(mats[[3]])

##Recall this third element is a 2x4 data frame. To print a specific element of this matrix within the list, we use a double index: one to specify which element of the list we are using, and one to specify the row/column of the element in the data frame in various ways:

mats[[3]][2,1]
mats[[3]][2,"var1"]
mats[[3]]$var1[2] ###Can someone volunteer to talk through what each piece of this line of code is doing?


################################# SAVING DATA
#### We have created a simple data frame, "df". Let's pretend this was a data set we cared about, and we wanted to save it to our computer as a .csv file, (a super-common file format that's easy to share with others no matter what statistical software they use). We use the "write.csv()" function, which has two key inputs: the object to be saved, and the file path in which to save it. Because we have specified a working directory, the file path is assumed, so instead of 

# "~/Dropbox/Math Camp 2014/Math Camp Labs (FINAL)/Data/df.csv"

## We can simply use:

# "df.csv"

write.csv(df, "df.csv") ##Done. Check the working directory on your computer. The file should be there.



################################# LOADING DATA / PACKAGES
########## Another great virtue of R is its ability to read nearly any type of data file. We just saved a .csv file, but R can read just about anything, including .sav files (native to SPSS), .dta files (native to Stata), and of course files native to R, .Rdata files. (Try reading all those file types in Stata. It will be a long day.)

## To read a foreign file type, we need to install the package "foreign". Packages are basically bundles o functions that don't come with R when you download it. There are several methods of installing packages (see here: http://math.usask.ca/~longhai/software/installrpkg.html). 

### We can use the "install.packages()" command

install.packages("foreign")


###Once the package installs sucessfully, you need to load it to use it. Do this with the "library()" command. 

library(foreign)

## Now we can read in our .csv file.

dd<-read.csv("df.csv", header=T) ##load the .csv file and assign it to an object "dd"
## we input the file name (no file path necessary since this file is stored in our working directory, and specified "header=T" to tell R to treat column headings as variable names)
class(dd)# this should be of class "data.frame"
dd ##print the data frame



############ MISSING VALUES and LOGIC STATEMENTS

####Creating new columns and rows

df$new<-NA ##create a new column called "new" and populate it with empty values
df
## the letters "NA" have special meaning in R. If an element of an object is "NA" it means that NOTHING exists in that element. It does not mean that the element = 0 ! You can't do math on NA's, but you detect/replace/eliminate them in various ways. So if it's not a number, what is NA?

class(NA)

##We see it is of class "logical". This means it generates TRUE/FALSE statements, and nothing else. This information is useful if we want to know how to detect missing values in data. For example:

##Which values in this column are NA?

is.na(df$new) ##We use the "is.na()" function, which is a logic operator (it returns TRUE/FALSE values). We get back four "TRUE" statements. This means all 4 values are missing.

##Let's ask this another way. Which values are NOT missing?

!is.na(df$new) #Using the "!" operator, we invert a logic statement, and get the exact opposite set of answers

#We can think of logic operators as functions which ask yes/no questions of R. The "==" operator asks R whether one object is equivalent to another. The "!=" operator asks if things are unequal. For example

2+2==4 ##are these two things equal? Yes.
2+3==4 ##No.
2+2!=4 ## The ! symbol reverses the meaning and asks, are these two things unequal?



########## A bit of practice...



####Who wants to volunteer to show the class how to show us how to display the value of the 1st row, 3rd column in the "df" data frame?


#### Now, using what we have learned, how do we replace it with the value 6?



#### Now, using what we have learned, how do we replace the 3rd and 4th elements of that vector with 3 and 3?

df$new[3:4] <- c(3,3)

##### The mean value in this column is now (6+3+3)/3=4, agree? Let's verify this using the "mean()" function, which takes as its necessary input a vector:

mean(df$new)


##Woops. We got "NA" as an answer. We know this isn't right. As usual, when something goes wrong in R, it is our fault. We asked R to do the impossible: compute the mean of 4 elements in a vector, one of which, element 2, has NO VALUE. (Again, this element is not equal to 0, it is just "missing"---deep existential nothingness. Don't think about that too long or you might pass out.) Many functions in R have built-in arguments for dealing with missing values. For the "mean()" function, we need to specify a value for the "na.rm" argument as follows:


mean(df$new, na.rm=TRUE) ##tell R to disregard elements that are NA


#####This may seem like an annoying feature--"Why doesn't R just assume that I want it to ignore missing values?" In the end, this amount of specificity is a virtue. The fewer assumptions R makes on our behalf, the more it forces us to specificy exactly what we want done. This means we have to do something other software packages allow us not to do: think, all the time. In the end this leads to fewer mistakes. 





##################### PRACTICE WITH OTHER SUPER USEFUL FUNCTIONS #####################
####### Let's break into groups of two, take 10 minutes, and perform the following tasks using these functions. If you're not sure how a function works, use the help menu.

sd() ##compute the sample standard deviation of the $new column in df
var() ##compute the sample variance of the $new column in df
median() ##compute the median value of the $new column in df
min() #find the minimum value in row 3 of df
max() #find the maximum value in column 2 of df; now find the maximum value in the whole data frame
unique() ##how many different elements are in the second column of df?
length() ##how long is the list mats? what class of object is each element?
paste() ## combine the character strings "Hello" and "world." into a single string, separating the words by a space. Assign this new string to an object named "greetings".
c() ##store the strings "Hello" and "world." in a vector. Assign this new vector to an object named "greetings.vec".
grep() ##get R to tell you which element(s) in the object "greetings.vec" contains the word "world."




##################################
##### A BRIEF INTRO TO FOR LOOPS
##################################

##Let's suppose we have a vector that is a series of randomly drawn integers between 1 and 1000

set.seed(98)
vec<-sample(1:1000, size=25, replace=TRUE)


## We can display the elements in the vector by simply executing its name

vec


## We could also ask R to iterate over each element in the vector and display its contents using a for loop. This is a somewhat trivial task, but the idea here is to keep things very simple and concentrate instead on the architecture of a loop. A for loop begins with a for statement...

for(i in 1:length(vec)){

## This opening line translates as follows: "For each iteration "i" in the sequence of numbers ranging from 1 to the length of the vector 'vec'..." Every time the loop runs, the value of "i" will change, or "iterate." So the first time through, "i" will equal 1; the second time through "i" will equal 2, and so on. 

## The name of each iteration, "i", is arbitrary. We could have used "j" or "k"; any letter will do. The open bracket signifies the start of the loop: after this bracket will come the commands we want R to perform for each iteration. In this case, we want R to take the mean of $obama for state i, and store that result in the results data frame. We can do this in two steps, for clarity. 

## The key to writing a functional loop is placing an "i" in the necessary locations. 

print(vec[i]) ##display the value of the ith element of the vector "vec"
} ##Close the loop. After R reaches this symbol, it will go back up to the top and repeat the process until the last iteration is complete


## We can ask R to perform any task inside a loop as well as store the results. For example, suppose we wanted to create a new vector that was equal to the values in "vec" squared. First, we create an empty storage vector:

vec.sq<-NA

##Now we can use the loop to populate this new vector

for(i in 1:length(vec)){
	vec.sq[i]<-vec[i]^2
}

## Can someone volunteer to talk through what this code is doing, piece by piece?

vec.sq

##Loops are not always the most efficient way to do repetitive tasks, but they are almost always more efficient than writing a separate line of code for each iteration of a repetitive task. We will keep returning to them throughout these labs to demonstrate how to use them to perform more complex tasks.
