#task 1
library(readr)
urlfile="https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv"

tyler_ex_data<-read_csv(url(urlfile))
head(tyler_run_data)

# task 2 - in this case we will filter out by sport
unique(tyler_ex_data$sport)
tyler_run_data<- filter(tyler_ex_data, sport == "running")
str(tyler_run_data)
summary(tyler_run_data)
tyler_run_data
# okay so only the only sport is running now. 


# task 3, remove anything above 10 minute mile and anything below 5 minute mile. 
tyler_run_data<- filter(tyler_ex_data, sport == "running") %>% 
  filter(minutes_per_mile >= 5.00 & minutes_per_mile <=10.00) # watch out for the greater than and less than sings. 
tyler_run_data  
str(tyler_run_data)

# task 4, Okay, so you learned this last week. use mutate and casewhen and icasewhen
tyler_run_data<- filter(tyler_ex_data, sport == "running") %>% 
  filter(minutes_per_mile >= 5.00 & minutes_per_mile <=10.00) %>%
  mutate(run_cat = case_when(minutes_per_mile >=6 ~ "fast",
                             minutes_per_mile >6 & minutes_per_mile <8 ~ "medium",
                             TRUE ~"slow"),
         form =case_when(year == 2024 ~ "new form",
                         TRUE ~"old form"))
tyler_run_data
str(tyler_run_data)
# task 5, im guessing use group by, and a pivot?       
tyler_run_data %>%  group_by(form, run_cat) %>% 
  summarize(avg_steps_per_min =mean(steps_per_minute)) %>%
  pivot_wider(id_cols = form, values_from = avg_steps_per_min, names_from = run_cat) %>% 
  select("form", "slow", "fast")# which pivot?
  

# Ran out of time on question 6
# I have a good idea of wha needs to be done, it justs takes me a while. its a matter of practice. 
  