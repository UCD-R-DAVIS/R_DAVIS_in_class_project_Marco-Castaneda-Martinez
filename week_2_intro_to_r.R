# introduction to R: arithmetic 
3+4
2*5
# order of operations: 
4+(8*3)^2
# This is how you write a comment. 
# Scientific notation
2/500000000000000
4e3

# Mathematical functions 
exp(1)
exp(10)
log(10)

# R Helpfiles
?log
log(2,4)
log(4,2)
# you should be more explicit with your code so people can understand you commands
 log(base= 4, x= 2)
# we can rename that variable, dont create redundancies with variables 
 x<-1
# nested functions 
 sqrt(exp(4))
 log(exp(100))

 # Comparison functions, it is important to use two == as = assigns a variable, us an arrow better 
 mynumber<-6
 mynumber==5
 
 # lets try logic negation 
 mynumber !=6
 mynumber<10
 mynumber<10
 mynumber<-7
 
 # you can run equations with different numbers 
mynumber * x
# object name conversion 
numsamples<-50
numsamples<-40

rm(numsamples)
# how to delete samples from your environment.

# errors and warnings 
log_of_word<-log("a_word")
log_of_word

# Challenge 

log_of_negative<-log(-2)
ls()
rm(list = ls())



# chalenge 
elephant1_kg<-3492
elephant2_lb<-7757

elephant2_lb<-elephant1_kg * 2.2

elephant2_lb > elephant1_lb


#############################################################
getwd()
# change working directory 
setwd()


d<-read.csv("the dolation of your date file")

# create scrpits file ---------
dir.create("./lectures")

# how r thinks about data---------
### This is setting a series of values. ------

## Vectors -----
weight_g<-c(50,60,65,82)
weight_one_value<-c(50)

animals<-c("mouse","rat","dog")
animals

### inspection ---------
length(weight_g)
str(weight_g)

### change vector--------

weight_g<-c(weight_g,90)
weight_g

num_char <-c(1,2,3, "a")
num_char
num_logical<-c(1,2,3,"TRUE")
num_logical
# coerces values to be all the ame, e.g. when TRUE is included. 
char_logical<-c("a","b","c", TRUE)
char_logical
tricky<-c(1,2,3,"4")

####### chooses the lowest common denominator # vectors have to be the SAME class of values. 


# subsetting 
animals<-c("mouse", "rat","dog","cat")
animals 
animals[2]
animals[c(2,3)]
# give me some combination or subset of the original document 
##### conditional sub-setting 
weight_g<c(21,34,39,54,55)
weight_g>50
weight_g[weight_g>50]

## additional symbols you can use in the subset 
# I want to grab these values from another set of values %in%
animals %in% c("rat","cat","dog","duck","goat")
animals == c("rat","cat","dog","duck","goat")
# == has to be matched pairwise 

