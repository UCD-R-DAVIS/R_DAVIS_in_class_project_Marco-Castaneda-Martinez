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
