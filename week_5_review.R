###
# conditional statements: 
#
# When working with conditional statements, you may want to create a new data
#frame, but if only certain conditions are true
#conditional statements are a series of logical conditions that can help you manipulate your data 
#to create new variables. 

library(tidyverse)
surveys<-read_csv("data/portal_data_joined.csv")

#The general logic of conditional statements is this: if a statement is true, then execute x, 
#if it is false, then execute y. For example, let’s say that we want to create a categorical variable 
#for hindfoot length in our data. Using the summary function below, we see that the mean hindfoot length is 
#29.29, so let’s split the data at the mean using a conditional statement.

summary(surveys$hindfoot_length)

#ifelse() function
#To do this, we define the logic: if hindfoot length is less than the mean of 29.29, 
#assign “small” to this new variable, otherwise, assign “big” to this new variable.
#We can call this hindfoot_cat to specify the categorical variable. We will first do this using the 
#ifelse() function, where the first argument is a TRUE/FALSE statement, 
#the second argument is the new variable if the statement is true, and the third argument is the new variable
#atement is false.

# The money sign here allows you to look for this specific vector (column) in a dataframe. 
surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length <29.29, "small", "Big")
head(surveys$hindfoot_cat)


# Casewhen function: You can do the same thing on top when you combine 
# Mutate with the casewhen function. 

hindfoot_cat2<- surveys %>% mutate(hindfoot_cat2 = case_when(hindfoot_length>29.29 ~ "big",
                                                             TRUE ~ "small")) %>%
  select(hindfoot_length, hindfoot_cat2) %>% head()

hindfoot_cat2

# Challenge 
library(datasets)
data(iris)
summary(iris)

petal_length_cat<- iris %>% mutate(petal_length_cat =case_when(Petal.Length < 1.600 ~ "small",
                                                               Petal.Length >= 3.758 & Petal.Length <= 5.100 ~"medium",
                                                               TRUE ~ "lage")) %>% 
  head()
petal_length_cat


# Joining two dataframes 
# you can join two datasets from two different files using the the join family. 
# we will cover usuing left join. 

tail<-read.csv("data/tail_length.csv")
summary(tail$record_id) 
summary(surveys$record_id)

#The basic structure of a join looks like this: join_type(FirstTable, SecondTable, by=columnTojoinBy)
# four our purposes we will use left_join 

# we want all the rows from the survey dataframe, and we want all the columns from both data 
# frames to be in our new dataframe. 

surveys_joined <-left_join(surveys, tail, by= "record_id")
surveys_joined

#challenge 

surveysNL <-surveys %>% 
  filter(species_id =="NL")

surveysNL_tail_left<-left_join(surveysNL, tail, by="record_id")
surveysNL_tail_right<-right_join(surveysNL, tail, by="record_id")
surveysNL_tail_left
surveysNL_tail_right

# Reshaping pivot functions- Each type of observational unit forms a table
# each type of observational unit forms a table. Meaning that each unit
#For example, if you have sales data with product types, regions, and months as variables, 
#you could reshape the data so that each table is structured around one observational unit,
#such as sales per product type or sales per region. This makes analysis easier and more logical.

summary(surveys)
head(surveys)

#pivot_wider() widens data by increasing the number of columns and decreasing the number of rows. It takes three main arguments:
#the data
#names_from the name of the column you’d like to spread out
#values_from the data you want to fill all your new columns with

# Calculated the mean for each species in each plot
# we are never combining data, we are just arranging the array. 

# pivot_wider- Makes data with more columns 
#pivot_longer- Makes data with more rows. 
surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% # filters NA
  group_by(genus, plot_id) %>% #groups by genus and plot ID
  summarize(mean_weight = mean(weight)) # summarizing mean weight by genus and plot ID

surveys_mz
unique(surveys$genus)
# we are going to great a cross tab or a table that has plot ID on the column and genus on the row. 

wide_survey<-surveys_mz %>% 
  pivot_wider(names_from= 'plot_id', values_from = "mean_weight") # Were taking the column names from plot ID, and fill those columns with "mean weight" 
head(wide_survey)
# what does R do when there is no value for the combination you want? it fills it in with NA


#pivot longer: 
  
surveys_long<-wide_survey %>% pivot_longer(-genus, names_to = 'plot_id', values_to = 'mean_weight') # send all the column names beside genus, every
  #other column you see to be plot id, then to mean weights, create a second column 
head(surveys_long)
# genus has to stay the same to preserve the order of the matrix. 


# Challenge 
# pivot wider 1, summarize before reshaping. 
q1<- surveys %>% 
  group_by(plot_id, year) %>%  # groups by plotid and year 
  summarize(n_genera = n_distict(genus)) %>% # we are getting the different number of genus.
  pivot_wider(names_from= "year", values_from = "n_genera") # were taking the cplumn names from year, and fill the rows with the differen genus that was seem each year. 
q1
#q2
q2a <- surveys %>%
  pivot_longer(cols = c("hindfoot_length", "weight"), names_to = "measurement_type", values_to = "value")
q2a
q2b <- q2a %>% 
  group_by(measurement_type, plot_type) %>% 
  summarize(mean_value = mean(value, na.rm=TRUE)) %>% 
  pivot_wider(names_from = "measurement_type", values_from = "mean_value")
q2b


# Assignment 5 part 1
surveys_wide<- surveys %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_hindfoot_lenght = mean(hindfoot_length, na.rm=TRUE)) %>% 
  pivot_wider(names_from = "plot_id", values_from = "mean_hindfoot_lenght")
surveys_wide 
