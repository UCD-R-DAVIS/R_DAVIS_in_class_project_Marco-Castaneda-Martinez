# ggplot2 ----
## Grammar of Graphics plotting package (included in tidyverse package - you can see this when you call library(tidyverse)!)
## easy to use functions to produce pretty plots
## ?ggplot2 will take you to the package helpfile where there is a link to the website: https://ggplot2.tidyverse.org - this is where you'll find the cheatsheet with visuals of what the package can do!
library(tidyverse)
library(ggplot2)
install.packages("ggplot2")

## ggplot basics
## every plot can be made from these three components: data, the coordinate system (ie what gets mapped), and the geoms (how to graphical represent the data)
## Syntax: ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPING>))

## tips and tricks
## think about the type of data and how many data  variables you are working with -- is it continuous, categorical, a combo of both? is it just one variable or three? this will help you settle on what type of geom you want to plot
## order matters! ggplot works by layering each geom on top of the other
## also aesthetics like color & size of text matters! make your plots accessible 


## example ----
library(tidyverse)
## load in data
surveys_complete <- read_csv("data/portal_data_joined.csv") %>%
  filter(complete.cases(.)) # remove all NA's
## ggplot(data=<DATA>, mapping = aes(<MAPPING>))+ <geom_fucntion> ()
ggplot(data = surveys_complete)

## Let's look at two continuous variables: weight & hindfoot length
## Specific geom settings
ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length))
#add geom_function

## Universal geom settings
ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length))+
  geom_point()
#add more plot elements: 
ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length))+
  geom_point(alpha= 0.1)
#add color to the point: 
ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length))+
  geom_point(alpha= 0.8, color ="light blue")
# color by group, by species ID
ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length))+
  geom_point(alpha= 0.8, aes(color=genus))+
  geom_smooth() # was there a line per genus? 

ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length))+
  geom_point(aes(color = genus))+
  geom_smooth(aes(color = genus)) # was there a line per genus? 
# how about to tell r to do thsi once
ggplot(data = surveys_complete, mapping = aes(x= weight, y=hindfoot_length, color =genus))+
  geom_point()+
  geom_smooth()           
 
#boxplot for categorical and continuous data
ggplot(data=surveys_complete, mapping =aes(x=species_id, y= weight))+
  geom_boxplot(color = "orange")

ggplot(data=surveys_complete, mapping =aes(x=species_id, y= weight))+
  geom_jitter(alpha = 0.01, color= "black")+
  geom_boxplot(color = "orange")
  
              
## Visualize weight categories and the range of hindfoot lengths in each group
## Bonus from hw: 
sum_weight <- summary(surveys$weight)
surveys_wt_cat <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= sum_weight[[2]] ~ "small", 
    weight > sum_weight[[2]] & weight < sum_weight[[5]] ~ "medium",
    weight >= sum_weight[[5]] ~ "large"
  )) 

table(surveys_wt_cat$weight_cat)


## We have one categorical variable and one continuous variable - what type of plot is best?




## What if I want to switch order of weight_cat? factor!


library(tidyverse)

surveys_complete <- read_csv('data/portal_data_joined.csv') %>%
  filter(complete.cases(.))

# these are two different ways of doing the same thing
head(surveys_complete %>% count(year,species_id))
head(surveys_complete %>% group_by(year,species_id) %>% tally())

yearly_counts <- surveys_complete %>% count(year,species_id)# shows how many are available
head(yearly_counts)

ggplot(data = yearly_counts,
       mapping = aes(x = year, y = n)) + 
  geom_point() # add grouping variable 

ggplot(data = yearly_counts,
       mapping = aes(x = year, y = n,group = species_id)) + # group in species ID
  geom_line(aes(colour = species_id)) + theme_gray()

#faceting instead of altering the color, we can give each species a plot. 
ggplot(data = yearly_counts[yearly_counts$species_id%in%c('BA','DM','DO','DS'),],
       mapping = aes(x = year, y = n,group = species_id)) + 
  geom_line() +
  facet_wrap(~species_id) +
  scale_y_continuous(name = 'obs',breaks = seq(0,600,100)) +
  theme()


install.packages('ggthemes')
library(ggthemes)
library(tigris)
library(sf)
ca_counties = tigris::counties(state = 'CA',class='sf',year = 2024)
tigris::block_groups(state = 'CA',year = 2012)
ca_counties
ggplot(data=ca_counties) + 
  geom_sf(aes(fill = -ALAND)) + theme_map() +
  scale_fill_continuous_tableau()


gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
str(gapminder)
gapminder

plot1<- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_life_exp = mean(lifeExp)) %>% 
  ggplot(aes(x=year, y=mean_life_exp, colour = continent))+
  geom_smooth()+geom_point()+xlab("time")+ylab("average life expextancy")+scale_x_log10()
plot1


#plot1<- ggplot(data=surveys_complete, mapping =aes(x=species_id, y= weight))+
 # geom_jitter(alpha = 0.01, color= "black")+
  #geom_boxplot(color = "orange")

countries<-c("Brazil", "China", "El Salvador", "Niger", "United States")
gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 0.3, color = "blue")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") + #title the figure
  theme(plot.title = element_text(hjust = 0.5)) + #centered the plot title
  xlab("Country") + ylab("Life Expectancy")