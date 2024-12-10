library(tidyverse)
activity_data<-"https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
tyler_data<-read_csv(activity_data)
# okay, so I used read_csv here cause its the tidyverse
# at least from part 1-4 this looks like the midterm 
unique(tyler_data$sport) # make sure you spelled it right haha
#1,2,3,4,
tyler_data2<- tyler_data %>% filter(sport == "running") %>% # remove all other sports
  filter(minutes_per_mile<= 10, minutes_per_mile >=5) %>% # removed obervations that dont follow into the correct range.
  mutate(time_period = case_when(
    year < 2024 ~ "pre-2024",
    year == 2024 & month <= 6 ~ "first six",
    year == 2024 & month >= 7 ~ "last six",
    T ~ "other"# you're just categorizing columns here, like the midterm.
  )) %>% mutate(speed_mph = 60 /minutes_per_mile) # granted, this isn't M/S but it's okay
tyler_data2
str(tyler_data2)
#5,6,7
install.packages("wesanderson") # yeah, im using it. 
library(wesanderson)
tyler_graph<-ggplot(tyler_data2, aes(x=speed_mph, y= steps_per_minute, colour= time_period))+
  geom_smooth(method = "lm", formula = y ~ poly(x, 3), se = FALSE)+
  scale_color_manual(values = wes_palette("FantasticFox1", n = 4),
    name = "Time Period", # Legend title
    labels = c("Jan-Jun", "Jul-Dec", "Pre-2024"))+ # omg this took me forever
  xlab("Speed (MPH)") + # X-axis label
  ylab("Steps Per Minute (SPM)") + # Y-axis label 
  ggtitle("Speed Vs. Steps Per Minute Across Time Periods")+ theme_classic()# I like doing my titles like this, and theme classic is solid
tyler_graph
ggsave("tyler_graph_1.png", plot = tyler_graph, dpi = 300, width = 10, height = 8, units = "in") # its a big photo
#8
library(lubridate)
tyler_data3<- filter(ymd_hms(timestamp) > ymd("2024-07-01")) %>% 
  mutate(date = date(ymd_hms(timestamp))) %>% 
  # Sorry, this is how far as I got in an hour, I tried my best, I think I got too into the asthetics of the last plot. 