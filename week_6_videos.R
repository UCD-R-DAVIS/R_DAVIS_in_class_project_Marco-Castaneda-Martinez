library(tidyverse)
install.packages("ggplot2")


surveys_complete<- read_csv("data/portal_data_joined.csv") %>% filter(complete.cases(.))

# syntax for ggplot 
#  ggplot(data= the data you have, mapping = aes(columns name) )+ geom_functon 


# example 
ggplot(data=surveys_complete)

# ass aes argument 

ggplot(data=surveys_complete, mapping= aes(x= weight, y= hindfoot_length))

# add geom function. 

ggplot(data=surveys_complete, mapping= aes(x= weight, y= hindfoot_length))+
  geom_point()

# add more plot elements 

ggplot(data=surveys_complete, mapping = aes(x= weight, y= hindfoot_length))+
  geom_point(alpha=0.5)  # transparency 

ggplot(data=surveys_complete, mapping = aes(x= weight, y= hindfoot_length))+
  geom_point(colour="Light Green", alpha=0.5)

# you can color by group, lets color by species ID

ggplot(data=surveys_complete, mapping = aes(x= weight, y= hindfoot_length))+
  geom_point(aes(colour=genus), alpha=0.5)+
  geom_smooth() # this tool all the points together and took a line. 
#  can you plot a line for genus. 

ggplot(data=surveys_complete, mapping = aes(x= weight, y= hindfoot_length))+
  geom_point(aes(colour=genus), alpha=0.5)+
  geom_smooth(aes(colour = genus))

# how would we have R only do this one?

ggplot(data=surveys_complete, mapping = aes(x= weight, y= hindfoot_length, color = genus, alpha= 0.5))+
  geom_point()+
  geom_smooth()


# creating a box plot- For categorical vs. continuous 
ggplot(data = surveys_complete, mapping = aes(x=species_id, y= weight))+
  geom_boxplot(color="orange")
# to fill and add features 
ggplot(data = surveys_complete, mapping = aes(x=species_id, y= weight))+
  geom_boxplot(fill="orange")+geom_jitter(color ="black", alpha=0.1)

# change order of how to construct plot-
ggplot(data = surveys_complete, mapping = aes(x=species_id, y= weight))+
  geom_jitter(color ="black", alpha=0.1)+
  geom_boxplot(fill="orange")


#

----------------------------------
head(surveys_complete)  


yearly_counts<- surveys_complete %>% 
  count(year, species_id)
yearly_counts


ggplot(data = yearly_counts)+
  geom_path(mapping = aes(x= year, y=n, group = species_id))


# Add more fun features: 
ggplot(data = yearly_counts)+
  geom_path(mapping = aes(x= year,colour = species_id, y=n, group = species_id))


# what if you want to have some points
ggplot(data = yearly_counts)+
  geom_path(mapping = aes(x= year,colour=species_id, y=n, group = species_id))+

