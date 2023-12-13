### Housekeeping
rm(list = ls())
setwd("/Users/dbhagia/Dropbox (CSU Fullerton)/Teaching/Econ 340")
library(tidyverse)
library(stargazer) 

################################################################################
# Load and prepare data
################################################################################

# Load data
data <- read.csv("./Data/Datasets/caschool/caschool.csv")

# Create high_comp_stu
data <- data %>% 
  mutate(high_comp_stu = ifelse(comp_stu>=median(comp_stu),1,0))

# Select variables and sample
finaldata <- data %>% 
  filter(gr_span=="KK-08") %>% 
  select(testscr, str, high_comp_stu, meal_pct)

model1 <- lm(testscr ~ str, data)
model2 <- lm(testscr ~ str + high_comp_stu, data)
model3 <- lm(testscr ~ str + high_comp_stu + meal_pct, data)
stargazer(model1, model2, model3, type="text", keep.stat = c('n', 'adj.rsq'))

stargazer(model1, model2, model3, digits = 2,  out = "./output/final_paper_reg.tex", 
          float=FALSE, keep.stat=c("n","adj.rsq"), dep.var.caption="")

################################################################################