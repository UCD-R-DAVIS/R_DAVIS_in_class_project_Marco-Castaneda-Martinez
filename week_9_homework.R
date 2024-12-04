surveys <- read.csv("data/portal_data_joined.csv")

#1
for(i in unique(surveys$taxa)){
  taxon<-surveys[surveys$taxa==i,]
  longestn<-taxon[nchar(taxon$species) == max(nchar(taxon$species)),] %>% select(species)
  print(paste0("Longest names", i, "are"))
  print(unique(longestn$species))
}

# 2
mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mycols <- mloa %>% select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m","temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr")
mycols %>% map(max, na.rm = TRUE)


#3
Celcius_to_Fahrenheit <- function(x){
  x * 1.8 + 32
}

mloa$temp_F_2m <- Celcius_to_Fahrenheit(mloa$temp_C_2m)
mloa$temp_F_10m <- Celcius_to_Fahrenheit(mloa$temp_C_10m)
mloa$temp_F_towertop <- Celcius_to_Fahrenheit(mloa$temp_C_towertop)


mloa$temp_C_2m
mloa$temp_C_10m
mloa$temp_C_towertop

# Nice! it worked! 