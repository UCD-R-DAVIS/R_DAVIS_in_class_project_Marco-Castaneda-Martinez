set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
# Take your hw2 vector and removed all the NAs then select all the numbers 
#between 14 and 38 inclusive, call this vector prob1.
# I learned that | wont do it, so using & is better 
prob1<-hw2[!is.na(hw2)] # we created a new vector 
prob1
prob1<-prob1[prob1 >14 &prob1 <38] # in this case were selecting from problem 1
prob1

#Multiply each number in the prob1 vector by 3 to create a new vector called times3.
#then add 10 to each number in your times3 vector to create a new vector called plus10

times3<-prob1*3
 ### cbind(prob1, 3,prob1*3)  # I just wanted to see how it would look 
times3

plus10<-times3+10
### cbind(times3,10, times3+10) # I just wanted to see how it would look
plus10

#####Select every other number in your plus10 vector by selecting the first number, not the second, the third, not the fourth, etc.
#######If you’ve worked through these three problems in order, you should now have a vector that is 12 numbers long that looks exactly like this one:

### plus10[c(TRUE, FALSE, FALSE, FALSE)]
##### no wait this is wong, just simply true and false. In this case it skips 3
plus10[c(TRUE, FALSE)]

finalsubset<-plus10[c(TRUE, FALSE)]
finalsubset
