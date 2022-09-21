################################################################################
# Title: Assignment 1

# Name of file: assignment_1.R
# A script containing instructions for Assignment 1, FOCD 2021 UMD/UM
# Author: -- Noah R Marcotte --
# Date: Mon Sep 26, 2022
################################################################################
# Please write down the R command(s) needed after each question!
# Some questions require an interpretation of the results in addition to code!

# There is a total of 22 questions.


### Data types
# 1. Which command do you use to determine the type of an object?

typeof()

# 2. What is the type of vector A?
A <- c("2", "3", "4", "5", "6", "7", "8")

typeof(A) 
#"character"

# 3. Convert A into an integer vector

A <- as.integer(A)

# 4. Create an integer vector B containing the numbers one through ten

B <- c(1:10)
typeof(B)
"integer"

# 5. Create a new vector C from B which has the type "double"

C <- B*2
typeof(C)

# 6. Change the third value of B to "3.5"
B <- replace(B, 3, 3.5)

# 7. Did this affect the type of B? How?

typeof(B)
# the type of B became a "double" instead of an integer

### Reading in data
# Download both the Angell.dta (Stata data format) dataset and the Angell.txt dataset from this website
# https://stats.idre.ucla.edu/stata/examples/ara/applied-regression-analysis-by-fox-data-files/

# 8. Read in the .dta version and store in an object called angell_stata
library(haven)
angell_stata <- read_dta("angell.dta")

# 9. Read in the .txt version and store it in an object called angell_txt

angell_txt <- read.table("angell.txt")

# 10. Drop the first five observations in the angell_txt object

library(dplyr)

angell_txt <- angell_txt %>% slice(-c(1:5))

head(angell_stata)
head(angell_txt)

# 11. Select columns 2 and 3 of the angell_stata object and store them in a new object called angell_small

angell_small <- angell_stata %>% select(2,3)

# R comes also with many built-in datasets. The "MASS" package, for example, comes with the "Boston" dataset
# 12. Install the "MASS" package, load the package. Then, load the Boston dataset

install.packages("MASS")
library(MASS)
data("Boston")

# 13. What is the type of the Boston object?
typeof(Boston)
#The Boston object is a list.

# 14. What is the class of the Boston object?

class(Boston)
#The class of the Boston object is a data.frame.


### Basic data summarizing and description
# 15. How many of the suburbs in the Boston data set bound the Charles river?

sum(with(Boston, chas==1))
#35 suburbs in the Boston dataset are bound by the Charles river.

# 16. Do any of the suburbs of Boston appear to have particularly high crime rates? Tax rates?
# Pupil-teacher ratios? Comment on the range of each variable.

summary(Boston$crim)
hist(Boston$crim)
boxplot(Boston$crim)
sum(with(Boston, crim>=30))
sum(with(Boston, crim>=20))
sum(with(Boston, crim>=3.67708))
    
# Some suburbs have high crime rates. These crime rates range from less than 0.01 to 88.98. 
# 8 suburbs have crime rates higher than or equal to 30. 18 suburbs have rates higher than 20.
# 127 suburbs have higher crime rates than those suburbs at or below the 3 quartile.   

summary(Boston$tax)
hist(Boston$tax)
boxplot(Boston$tax)
sum(with(Boston, tax>=500))
# Tax rates for suburbs range from 187 to 711. 
# 137 suburbs have the highest tax rates.


summary(Boston$ptratio)
hist(Boston$ptratio)
boxplot(Boston$ptratio)
sum(with(Boston, ptratio>=20))
sum(with(Boston, ptratio<=14))

# The pupil-teacher ratios in the Boston suburbs range from 12.6 to 22. 
# Here, 201 of the suburbs have a ratio of at least 20.
# Of note here are the ones with particularly low ratios: 16 suburbs have ratios of 14 or less.  

# 17. What is the median pupil-teacher ratio among the towns in this data set that
# have a per capita crime rate larger than 1 ?


### Functions
# 18. Write a function that calculates the squareroot of an integer


# 19. Write a function that calculates 95% confidence intervals for a point estimate.
# The function should be called "my_CI"
# When called with "my_CI(2, 0.2)", the output of the function should read
# "The 95% CI upper bound of point estimate 2 with standard error 0.2 is 2.392. The lower bound is 1.608."
# Note: the function should take a point estimate and its standard error as arguments
# You may use the formula for 95% CI: point estimate +/- 1.96*standard error)
# Pasting text in R: paste() and paste0()

# 20. Write a function that converts all negative numbers in the following dataset into NA
# Use as little code as possible and try to avoid code repetition
set.seed(1002)
df <- data.frame(replicate(10, sample(c(1:10, c(-99,-98,-5)), 6, rep = TRUE)))
names(df) <- letters[1:6]
df



# 21. Use your function to convert all negative numbers in the dataset into NA without changing the class of the object



# 22. Change the function you wrote above such that it turns any negative number into NA!