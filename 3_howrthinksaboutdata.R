sex <- factor(c("male", "female", "female", "male"))
class(sex)
typeof(sex)
# we will be looking at importing csv
?read.csv
surveys<-read.csv("portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
dim(surveys)
?str
str(surveys)
# a data set is just a bunch of vectors together. 
summary(surveys)
?summary
?summary.data.frame
# we now now have a matrix. x and y. we will do row, then colunm. I want the first row, 5th coulm value 
surveys[1,5]
# we usually dony want a value. we usually want a set of coulumns or a set of rows. 
surveys[1:5]

#if you want to pull more rowsum
surveys[c(1,5,24,3001)]

dim(surveys [,1:5])
dim(surveys[1])

surveys[1,]
surveys['record_id']
will print column names 
colnames(surveys)

surveys[c('record_id', 'year','day')]
dim(surveys[c('record_id', 'year','day')])
#### this pulls the name, not the column size. becuase if your dataset changes, it will still look for the name and not the location. 

head(surveys)
head(surveys,1)
head(surveys[1])
head(surveys[,1])
# how to keep track fo what I am doing. 

head(surveys["genus"])
head(surveys[["genus"]])
# get to that second level thats living in there. get vector out
#single get me the column and see that there. subset. keep structure, but point out subset

head(surveys['genus',])
head(surveys[,'genus'])

surveys$genus
# the dollar sign is how you open up an object, and its saying, next level please. 

surveys$hindfoot_length  # only works one at a time. 
class(surveys$hindfoot_length) # only way it works if it has a names. usually all columns have names. This is an operator of rows.
install.packages('tidyverse')
library(tidyverse)
?read_csv
t_surveys<-read_csv('portal_data_joined.csv')
class(surveys)
t_surveys
surveys[,1]
t_surveys[,1]
