# learning objectives: 
# Understand when and why to iterate code
# Be able to start with a single use and build up to iteration 
# use loops to apply functions and purr to iterate
# be able to write functions to clearly iterate code: 

# data uplodad 

head(iris)
head (mtcars)


# subsetting refresher 

# square brackets to indexing 

iris[1] # looks at first column 
iris[[1]] # pulls out vector of values from first column 
iris$Sepal.Length

iris[,1]# to get specific column 
iris[1,1]# to get specific cell "row, and column"
iris$Sepal.Length[1] # same thin on the top. 

# for loops - 
# when you want to do something down the rows of data
# takes an index value and runs it throuh your function 
#Layout: use if I to specify index value (although you could use any value here)

# where trying to recreate a process down all the rows. It takes an index value and
# runs it through the function 

for(i in 1:10){
  print(i)
}
# for every index value, in the range from 1 to 10, print that value. 

for(i in 1:10){
  print(iris$Sepal.Length[i])
}
# same thing as 
head(iris$Sepal.Length, n=10)


# you can have it do multiple things at once, and it could be complex 

for(i in 1:10){
  print(iris$Sepal.Length[i])
  print(mtcars$mpg[i])
}
# each output is alternating in the lines of code. 


#store output- What is we wanted to know that the values were in a more systematic way 

results<-rep(NA, nrow(mtcars))
results

for(i in 1:nrow(mtcars)){
  results[i]<-mtcars$wt[i]*100
}
results


# Map Family of Functions -----------------------------------------------------------
# map functions are useful when you want to do something across multiple columns
library(tidyverse)
# two arguments: the data & the function
# think about output, but instead of creating a blank output, you can just use the specific function

 # you can do stuff across multiple column, a family of functions that are use for this. 

map(iris,mean)
# calculates mean of each column
# default output is a list to get a data fram 
map_df(iris, mean)

head(mtcars)
print_mpg<- function(x,y){
  paste(x, "gets", y, "miles per gallon")
}

# map2_chr(input1, input 2, function)

map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)

#embed "anonymous" funciton 
# _______________________________________________

# A for loop will repeat some bit of code, each time with a new input value. Here’s the basic structure:

for(i in 1:10){
  print(i)
}
#You’ll often see i used in for loops, you can think of it as the iteration value. 
#For each i value in the vector 1:10, we’ll print that index value. 
#You can use the i value more than once in a loop:
for (i in 1:10) {
  print(letters[i])
  print(mtcars$wt[i])
}
# here we printed out the first 10 letters of the alphabet from the letters vector, as well as the
# First 10 car weights 
# What’s happening is the value of i gets inserted into the code block, the block gets run, the value of i changes, and the process repeats. For loops can be a way to explicitly lay out fairly complicated procedures, since you can see exactly where your i value is going in the code.
#You can also use the i value to index a vector or dataframe, which can be very powerful!

# to store restuls 

results<-rep(NA,nrow(mtcars))
for(i in seq_along(mtcars$wt)){
  results[i]<-mtcars$wt[i]*1000
}
results

# MAP and tidyverse 

mtcars %>% map(mean)

mtcars %>% map_dbl(mean)
mtcars %>% map_chr(mean)

# additional arguments 

mtcars2 <- mtcars # make a copy of the mtcars dataset
mtcars2[3,c(1,6,8)] <- NA # make one of the cars have NAs for several columns
mtcars2

mtcars2 %>% map_dbl(mean) # returns NA for mpg, wt, and vs columns


#You can use the map2 series of functions if you need to map across two sets of 
#inputs in parallel. Here, we’ll map across both the names of cars and their mpg 
#values, using an anonymous function to paste the two together into a sentence.

#We’ll use what’s called an “anonymous function”, which is a small function we 
#define within the map function call. Our function will take 2 arguments, x and y, 
#and paste them together with some other text.
map2_chr(rownames(mtcars), mtcars$mpg, function(x,y) paste(x, "gets", y, "miles per gallon")) %>% 
  head()

# complete iteration example: 
# 3 basic steps 
# 1. write the code that does the think you want once
# 2. generalize the code into a function that can take different input 
# 3. apply the funciton across your data: 

# single case. 

(mtcars$wt[1] - min(mtcars$wt, na.rm = T)) /
  (max(mtcars$wt, na.rm = T) - min(mtcars$wt, na.rm = T))

mtcars$wt_scaled <- (mtcars$wt - min(mtcars$wt, na.rm = T)) /
  diff(range(mtcars$wt, na.rm = T))

mtcars$wt_scaled


