set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
# Take your hw2 vector and removed all the NAs then select all the numbers 
#between 14 and 38 inclusive, call this vector prob1.
# I learned that | wont do it, so using & is better data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAEo0lEQVR4XrWW7U9bdRTHr9qytvdeWrqWQoGhuCE4ySaW0gd6ewurbUB9ofFhRn1BfGMyDRJHHHELb/wv9lJfGrIluoDTF5psDeAWk0UClEJ5kvE4xsM6Te71973lB5e7lrZk3uTLJb2/cz7n/H7n3nMYZu96Te+srbVZy06cZq3OsLHYcd7A2zv1vO1TPW/tzEumtAzEhrc6O0scVedLT5wKn3z5zOmKurrjBKLf56WvZxwOB1tf/2q1p+Wc6A+Ge5t9bf1urxhzNQsjRMMuNxHumYRnahGbZm8o5guc6w+EIr0u4vMF4tvpdJrA2oMS6Y3G4xWAfvBR59Wurp744OAvqfHxCWl6Oinn0tTUtKJEYkqenEzIExNx+d69UenGjcHUhS++ine89f7Vs64WEQywKPhZImNREfeK0Br9uufS5Tgxlubm5uW5uYU8NS/Pzs7JMzOzSiAIIB6flMfHEcBf0mcXuuMef1svy5Y0EBayBpN5jqiY0Rm9XiH8w2+/33q0uLgk37+/LC8treQlrIXNwsKiEggCwA5Q+I8/DaT8gfA1i71cYBiLhWaNPyU6nUEkUd2en/9bWl1dl9fWHsjr6xt5CWths7y8qgRAfChwZE633RcID5VXnYxwHGcnPAPARURWAm51e1tH4GhjY1N++HBL3tzczktYCxvYrqysycaLA0rmyeSMcubI2i+8freypr6dtdvLGFLIe2BGZwi5vaFhONna2pG3tx/JOzupvIS1sIEtoBC2XZ21Pxi5U11T32Gy2ZyMzcYDfEwNhgM4S6X+KUiwoVAIW46Cw1nvg091pCvbWvwEGNHD0ePH/xYkNRRCwaHaaZEBXFFNwcxBcBMB02zVDrUQrbRQCNWOc8br9SRYk3E28GFwLRBCkT01cCa4Fgihyp86WA3X/g7B9n8DZxOt7COBUdVacD5wrCkMrKlqty8z+DA4fZ4LHBAPy/gQcCa4+lkusCBGlS9XRjBp/oeC1XDt77nAyDgbuJV0p5Fc4GzKBRbEyF1stclkchLe/rdaZ+BC3kA4Royko4LxuUWjQJtUfzJHR8ekgBAespc/H2UYtozwlO4EcInOwLeIbe39f9z5M0WzLkSwQYNBe0RvVjeJgYGbKSEYvc5ZbEHCshEZAUZb5FnWcjbS8c6Vy1e+nV5dfSAdtS1imzEQ0LY4NjYudV/8JknGqj6TydzIpF8lJMvoEIHZXFrjF6Ltb7/38Xdfdl9K3ro9nFpZWZe0TT+TtIMAsk0kpqWfb/6a+ryrJ/nuh598TybODrPZ/CKTnrmU0QczVxHHldkra+oa6s6433D7xL4mT/BaozsQw7ja2BQYKkTKiOsRYmSiuU4m175GT/BN4roBjN1skawCJv/YOZZlHcd4vpZsiYvjLCJrtobZYmtEuecj1pzWrg1nsYgms9nF87aX2NJSB2O3c7vZgqmMmhDOGoeOM8DUj+rD562KqHL3no/oWtjCB3zBJ3yDAagy3mKgh3YzVx5iO3AWKHu8cxCM8xFdD1v4gC/4hG8wKG/voj8gGhoIhK05iqi92ucBIL3UYIgaIlJI6zib6HpqT/0dAP8H3NVfiM/oU1UAAAAASUVORK5CYII=
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
