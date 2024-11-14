gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
colnames(gapminder)
str(gapminder)
summary(gapminder)
head(gapminder)
# part 1, in this case, first i would pivot wider, then after that mutate to get 
# the population difference from 2002 to 2007 

gapminder2 <- gapminder %>% 
  select(pop,continent, year, country) %>%# this is for selecting columns, NOT ROWS
  filter(year >=2002 & year<=2007) %>%
  filter(continent != "Oceania") %>% # now you can choose which rows you want to see
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(popchange= `2007`-`2002`)# you mutate AFTER THE pivot, doing it before, make it turn out weird for you. 
gapminder2  # this was stupid, the column names took a long time to transfer over.


# part two, you should be using the facet function from two weeks ago. 
install.packages("wesanderson")
library(wesanderson)
wes_anderson()

facet<-ggplot(gapminder2, aes(x= reorder(country, popchange), y= popchange))+ # this is what he meant, it looks better when its reordered
  geom_col(aes(fill=continent))+# fills in the columns # bar did not work 
  facet_wrap(~continent, scales = "free")+  # this is to create the table, you can also create the graphs, then make a table. 
  ggtitle("Population Change as A Function of Time")+ # adds title 
  theme(plot.title = element_text(hjust = 0.5),axis.text.x = element_text(angle = 60, hjust = 0.5, vjust = 0.5),legend.position="none")+ # cleans the x asis within the graphs
  xlab("Nations")+ylab("Population Change from 2002 to 2007")+ # do not contradict the themes
  scale_fill_manual(values = wes_palette(5, name = "Zissou1", type = "discrete"), name = "") # use the wes anderson color pallete. 
  
facet  
