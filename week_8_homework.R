library(tidyverse)
library(ggplot)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")


 mloaplot<- mloa %>% 
   filter(rel_humid !=-99 & temp_C_2m !=-999.9 & windSpeed_m_s != -999.9) %>%
   mutate(datetime = ymd_hm(paste0(year, "-", month, "-", day, " ", hour24, ":", min), tz = "UTC")) %>% 
   mutate(datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"),
          localMon = month(datetimeLocal, label = TRUE), localHour = hour(datetimeLocal)) %>% 
   group_by(localMon, localHour) %>% summarize(mean(temp_C_2m)) %>% 
   ggplot(aes(x=localMon, y= meantemp))+ geom(aes(col=localHour))+
   scale_color_continuous()+ggtitle("Mean Temperature as a Function of time- Mloa")+xlab("Month")+
   ylab(expression(" Mean Temperature ("*~degree*C*")"))+theme_minimal()
              
 #### okay, this one took forever 