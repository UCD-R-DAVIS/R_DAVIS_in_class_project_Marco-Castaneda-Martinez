library(tidyverse)
library(ggplot)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa2 <- mloa %>% 
  # Filter invalid data values
  filter(rel_humid != -99, temp_C_2m != -999.9, windSpeed_m_s != -999.9) %>% 
  # Create datetime and convert to local time zone
  mutate(datetime = make_datetime(year = year, month = month, day = day, hour = hour24, min = min),
         datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"),
         localMon = month(datetimeLocal, label = TRUE),
         localHour = hour(datetimeLocal)) 

# Summarize and plot
mloa_summary <- mloa2 %>% 
  group_by(localMon, localHour) %>% 
  summarize(meantemp = mean(temp_C_2m, na.rm = TRUE), .groups = 'drop')

ggplot(mloa_summary, aes(x = localMon, y = meantemp)) + 
  geom_point(aes(col = localHour)) + 
  scale_color_continuous() + 
  xlab("Month") + 
  ylab("Mean Temperature (°C)") + 
  theme_classic()
 #### okay, this one took forever 