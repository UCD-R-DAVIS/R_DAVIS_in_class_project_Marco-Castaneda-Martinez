# Part one Create a tibble named surveys from the portal_data_joined.csv file.
install.packages("tidyverse")
library("tidyverse")
surveys<-read_csv("data/portal_data_joined.csv")
# part two: Subset surveys using Tidyverse methods to keep rows with weight between 30 and 60, and print out the first 6 rows.
surveys2<-surveys %>% 
  filter(weight >30 & weight <60)
print(surveys2)
# no wait 
head(surveys2)
# Create a new tibble showing the maximum weight for each species + sex combination and name it 
#biggest_critters. Sort the tibble to take a look at the biggest and smallest species + 
#sex combinations. HINT: it’s easier to calculate max if there are no NAs in the dataframe…

biggest_critters<- surveys %>% filter(!is.na(weight)) %>% filter(!is.na(sex)) %>% 
  group_by(species_id, sex) %>% 
  summarize(max_weight = max(weight)) %>% 
  arrange(desc(max_weight)
head(biggest_critters)

#Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? 
#There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here.
NA_structure1<-surveys %>% filter(is.na(weight)) %>% 
  group_by(species_id) %>% tally() %>% arrange(desc(n))
#
NA_structure2<-surveys %>% filter(is.na(weight)) %>% 
  group_by(plot_id) %>% tally() %>% arrange(desc(n))
#
NA_structure3<-surveys %>% filter(is.na(weight)) %>% 
  group_by(year) %>% tally() %>% arrange(desc(n))
print(NA_structure1)
print(NA_structure2)
print(NA_structure3)
#Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination to the full surveys dataframe. 
#Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight.
?mutate
surveys_avg_weight<-surveys %>% filter(!is.na(weight)) %>% mutate(avg_weight =mean(weight)) %>% 
  group_by(species_id, sex) %>% select(species_id,sex, weight, avg_weight)
surveys_avg_weight

#Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether 
#or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).

surveys_avg_weight<-surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)
surveys_avg_weight
