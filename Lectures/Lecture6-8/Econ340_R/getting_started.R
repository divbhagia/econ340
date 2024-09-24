library(tidyverse)

# Load data
data <- read.csv("caschool.csv")

# Summary of all variables in the data
summary(data)

# Summary of a variable
summary(data$avginc)

# Average of a variable
mean(data$math_scr)