surveys <- read.csv("data/survey_data_spreadsheet_messy.csv")

# surveys_base with only the species_id, the weight, and the plot_type columns
head(surveys)
colnames(surveys)
#######################
### wait, wrong one. 

surveys<-read.csv("data/portal_data_joined.csv")
head(surveys)
class(surveys)
colnames(surveys)
#Create a new data frame called surveys_base with only the species_id, the weight, and the plot_type columns. Have this data frame only be the first 5,000 rows
surveys_base<-surveys[1:5000, c(6,9,13)]

# remove  NA
?complete.cases
surveys_base<-surveys_base[complete.cases(surveys_base),]  # create a subset that has no NAs in it. 
surveys_base  # you see, they are gone 

surveys_base$species_id<- factor(surveys_base$species_id)
surveys_base$plot_type<- factor(surveys_base$plot_type)

levels(surveys_base$species_id)

############### Remmeber to double check its the correct subset, you were stuck for like an hour 
typeof(surveys_base$species_id)
class(surveys_base$species_id)

typeof(surveys_base$plot_type)
class(surveys_base$plot_type)

### Challenge
colnames(surveys_base)
# so weight is 2

challenge_base <-surveys_base[surveys_base[,2]>150,]   # Don't forget the comma 
# in this case you are subsetting, toy are looking for values in the second coulumn. Remember the [x,y] the ,y means rows, and the 2 in there means the second column 
# after that by adding a comma, you are telling it to pull values larger than 150

str(challenge_base)
head(challenge_base)
