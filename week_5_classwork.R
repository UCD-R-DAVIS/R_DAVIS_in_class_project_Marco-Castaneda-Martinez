library(tidyverse)

surveys<-read_csv("data/portal_data_joined.csv")

summary(surveys$hindfoot_length)



#################### conditional statements from the code######################
# Conditional statements ---- 
## ifelse: run a test, if true do this, if false do this other thing
## case_when: basically multiple ifelse statements
# can be helpful to write "psuedo-code" first which basically is writing out what steps you want to take & then do the actual coding
# great way to classify and reclassify data

## Load library and data ----
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
# we want you to do the test and also perform an organising function to this. 
## ifelse() ----


# from base R
# ifelse(test, what to do if yes/true, what to do if no/false)
## if yes or no are too short, their elements are recycled
## missing values in test give missing values in the result
## ifelse() strips attributes: this is important when working with Dates and factor
surveys$hindfoot_cat<-ifelse(surveys$hindfoot_length < mean(
  surveys$hindfoot_length, na.rm = TRUE), yes ="small", no="big")
head(surveys$hindfootcat)

summary(surveys$hindfoot_cat)
head(surveys$hindfoot_length)


## case_when() ----
# GREAT helpfile with examples!
# from tidyverse so have to use within mutate()
# useful if you have multiple tests
## each case evaluated sequentially & first match determines corresponding value in the output vector
## if no cases match then values go into the "else" category

# case_when() equivalent of what we wrote in the ifelse function
surveys %>%
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big",  #hindfoot length over the mean, 29.29, it is reclassifying as big. 
    TRUE ~ "small"  #"else" part of the statement. 
  )) %>%
  select(hindfoot_length, hindfoot_cat) %>%
  head()
#case)when functions runs from top to bottom. 
# but there is one BIG difference - what is it?? (hint: NAs)
# we will add multiple cases and take care of the N/A issue. 

d<- surveys %>% 
  mutate(hindfoot_cat=case_when(
    hindfoot_length>31.5 ~"big",
    hindfoot_length>29 ~ "medium",
    is.na(hindfoot_length)~NA_character_,
   TRUE~"small"                    ##### always label it small 
  )) %>% 
  select(hindfoot_length,hindfoot_cat) %>% 
  head(100)
d

# if no "else" category specified, then the output will be NA


# lots of other ways to specify cases in case_when and ifelse
surveys %>%
  mutate(favorites = case_when(
    year < 1990 & hindfoot_length > 29.29 ~ "number1", 
    species_id %in% c("NL", "DM", "PF", "PE") ~ "number2",
    month == 4 ~ "number3",
    TRUE ~ "other"
  )) %>%
  group_by(favorites) %>%
  tally()