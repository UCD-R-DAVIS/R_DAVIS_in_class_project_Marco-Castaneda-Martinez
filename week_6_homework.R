gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") 
#ONLY change the "data" part of this path if necessary
# Part 1
gapminder<-gapminder %>% 
  group_by(continent, year) %>% 
  summarise(lifeexp_mean = mean(lifeExp))

ggplot(data = gapminder) +geom_line(aes(x= year, y= lifeexp_mean, colour= continent))+
  geom_point(aes(x= year, y= lifeexp_mean, colour= continent)) 

# Part 2. 

ggplot(gapminder, aes(x = gdppPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

# the scale_x_log10() displays the data in a smoother logarithmic scale, instead of 
# increasing by a discrete number. It makes everything a little more proportional. 

# in this case geom_smooth() added a smother line to fit the data, but it also had a
# trend line, which casts a shadow to create and express how much the data at that
# moment deviates from the mean. The more shadow, the more deviation and vice versa. 

# Challenge
ggplot(data = gapminder) +geom_line(aes(x= year, y= lifeexp_mean, colour= continent))+
  geom_point(aes(x= year, y= lifeexp_mean, colour= continent)) + scale_x_log10()
# looks more proportial now 

# part 3

countries<- C("Brazil", "China", "El Salvador", "Niger", "United States") 

gapminder %>% 
  filter(country %in% countries)

lifeexptable<-ggplot(aes(x=country, y=lifeExp))+ geom_jitter(alpha=0.1, colour = "light blue")+ 
  geom_boxplot()+ theme_classic()+ggtitle("Life expectancy")+xlab("Country")+ylab("Life Expectancy")
  # took a while, had to look it up. 