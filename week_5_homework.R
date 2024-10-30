surveys<-read.csv("data/portal_data_joined.csv")
print(surveys)

#surveys_wide<- surveys %>% 
# filter(!is.na(weight)) %>% 
#group_by(genus, plot_type) %>%
#summarise(mean_lenght = mean(hindfoot_length))
surveys_wide
str(surveys_wide)
unique(surveys_wide$plot_type)
n_distinct(surveys_wide$plot_type)

# okay, now I will add the pivot function
# The dataframe should be sorted by values in the Control plot type column
# in this case, im guessing they want more columns so pivot wider
#So every row has a genus and then a mean hindfoot length value for every plot typ
# so then the dataframe should be sorted by control 
surveys_wide<- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>%
  summarise(mean_length = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = 'plot_type', values_from ='mean_length') %>% arrange(Control)

surveys_wide

###############################################################
library(tidyverse)
surveys<-read_csv('data/portal_data_joined.csv')
# first we read the dataset. 
# we mane the new dataset, we will use surveys %>% mutate %>% then select
summary(surveys$weight)# use this to look at the structure of weight to set your parameters

weight_cat<-surveys %>% 
  mutate(rodent_weight =case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    TRUE ~ "large" 
  )) %>% head()
head(weight_cat)

# okay lets try ifelse 
# Nope did not work. So maybe just try what sebastian said 
surveys$rodent_weight_cat <-ifelse(surveys$rodent_weight <= 20.00, "low",
                                   ifelse(surveys$rodent_weight >20 &
                                            surveys$rodent_weight <48.00, "medium", "high"))
surveys %>% 
  mutate(weight_cat= ifelse(weight<= 20.00, "small",
                            ifelse(weight> 20.00 & weight < 48.00, "medium",
                                   "large")))

# did not do the bonus, as this took me a while to figure out. 
# but i get the idea. pull the distribution data via code and add it to both ifelse and case_when 
#