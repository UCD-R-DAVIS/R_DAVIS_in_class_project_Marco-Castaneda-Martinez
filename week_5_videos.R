library(tidyverse)
surveys <-read_csv("data/portal_data_joined.csv")

# when working with data, you may want to create a new variable in a data frame
#but only if conditions are true. Conditional statements are a series of logical
#conditions that can help manipulate your data to create new variables. 

# the logic: 
# if the statement is true, execute x, if the statement is false execute y. 

# lets create a categorical variable for hind foot length data. Using the summary 
# function. 
str(surveys)
summary(surveys$hindfoot_length)
# in this care we want the mean we want to go from numeric to a category 

# pseudocode 
# ifelse(test or condition, what to due if the test is true, what to do if the the
#test is false. )

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length<29.29, yes = "small",no="big")
head(surveys$hindfoot_cat)

# tidyverse allows a way to integrate conditional statements by combining mutate
# with the conditional function case_when(). 
# allows you to set as many arguments and tests that you want to do. 

surveys %>% 
  mutate(hindfoot_cat =case_when(
    hindfoot_length>29.29 ~ "big", # if hindfoot is bigger than 29.29 then label big if not small. 
    TRUE~ "small"  # catch all for everything that not has been labeled yet. 
    )) %>% select(hindfoot_length, hindfoot_cat) %>% 
  head()

# to adjust this we need one more condition
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big",
    is.na(hindfoot_length) ~ NA_character_, # looks for an NA and labels NA
    TRUE ~ "small"  # correctly classifies NA
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()


# can we add more categories? # lets add a new argument 
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~ "medium",  # these are two conditional arguments 
    is.na(hindfoot_length) ~ NA_character_, # looks for an NA and labels NA
    TRUE ~ "small"  # correctly classifies NA
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% # we cant tell what is in each category 
  group_by(hindfoot_cat) %>% # so we will group by cat and tally up each category. 
  tally()
data("iris")
summary(iris$Petal.Length)

iris %>% 
  mutate(
    petal.length.cat = case_when(
      Petal.Length <= 1.6 ~ "small",
      Petal.Length > 1.6 & Petal.Length < 5.1 ~ "medium",
      TRUE ~ "large")) %>% 
  head()


###############################

# joining two dataframes 
# bringing dataframes together. 
# pivoting from lots of columns to lots of rows. 

tail<-read.csv("data/tail_length.csv")
head(tail)
dim(tail)
# join functions joins data together based on shared columns between two 
#data frames. 
# lucky both surveys and tail length both have record_id column. 
summary(surveys$record_id)
summary(tail$record_id)


# join_function(dataframe a, data frame b, how to join them)
#inner_join (x and y or a of b)
# we cant to merge only on the commmon column. Match both and get rid of any that do not match 
# inner_join(data frame a, data frame b, common id)

dim(inner_join(x=surveys, y = tail, by = "record_id"))
dim(surveys)
dim(tail)

# left_join 
#left_join takes dataframe x and dataframe y and it keeps everything on left hand side and removes on the right side.
#left_join(x,y)==right_join(y,x)
#right_join take datafram x and dataframe y and keeps everything in the right and removes pairs in y 
#right_join(x,y) == left_join(y,x)  < you can just run left join

surveys_left_joined <- left_join(x=surveys, y= tail, by='record_id')


surveys_right_joined <- right_join(y=surveys, x= tail, by='record_id')
                                  
                                  
dim(surveys_left_joined)   
dim(surveys_right_joined)  


# full_join (x,y)  keeps everything. it can get crazy especially if you dont have a match

surveys_full_joined<-full_join(x=surveys, y=tail)
dim(surveys_full_joined)
# Challenge 
surveysNL<-surveys %>% filter(species_id == "NL")

surveysNL_tail_left<- left_join(x= surveysNL,y= tail, by ="record_id")
nrow(surveysNL_tail_left)


# reshaping with pivot functions: 
#Each variable has its own column
#Each observation has its own row
#Each value must have its own cell
#Each type of observational unit forms a table

#pivot_wider makes data with more columns 
#pivot_longer makes data with more rows. 

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) 

surveys_mz
unique(surveys_mz$genus)

# we will take 3 columns and make a cross tab, and plot id on columns and genus on row

wide_surveys<- surveys_mz %>% 
  pivot_wider(names_from = 'plot_id', values_from = mean_weight)
head(wide_surveys)


 wide_surveys %>% pivot_longer(-genus, names_to= "plot_id", values_to = 'mean_weight')