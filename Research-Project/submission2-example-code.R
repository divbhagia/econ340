### Housekeeping
rm(list = ls()) # Clear workspace (optional)
library(tidyverse)
library(stargazer) 

################################################################################
# Load and prepare data
################################################################################

# Load data
data <- read.csv("caschool.csv")

# Create high_comp_stu
data <- data %>% 
  mutate(high_comp_stu = ifelse(comp_stu>=median(comp_stu),1,0))

# Select variables and sample
finaldata <- data %>% 
  filter(gr_span=="KK-08") %>% 
  select(testscr, str, high_comp_stu, meal_pct)

################################################################################
# Create Summary Statistics Table
################################################################################

finaldata %>%
  as.data.frame() %>% 
  stargazer(type = 'text', digits = 2, median=TRUE)

# If you copy and paste the table into Word, make sure to select a fixed width 
# font like Courier New. You can also take a screenshot and insert that into 
# your document. 

################################################################################
# Relationship between test score and student-teacher ratio
################################################################################

# Scatter plot (optional: geom_smooth to add linear fit)
ggplot(finaldata, aes(y=testscr, x=str))+
  geom_point(shape=1) +
  #geom_smooth(method=lm, se=FALSE, size=0.5, color="black") +
  labs(y="Test Score", x="Student-Teacher Ratio")+
  theme_classic()
ggsave("scatter.png", width = 5, height=3.5)

# Correlation
corr_tst_str <- cor(finaldata$testscr, finaldata$str)


######## If my primary independent variable was categorical, I would need a bar plot 

tab <- finaldata %>% 
  group_by(high_comp_stu) %>% 
  summarise(testscr = mean(testscr))

ggplot(tab, aes(y=testscr, x=as.factor(high_comp_stu)))+
  geom_bar(stat="identity") +
  theme_classic()

################################################################################
# Correlation Table
################################################################################

# If any of your variables are categorical, convert them to numerical variables
# before finding the correlations

finaldata %>% 
  select(testscr, str, meal_pct, high_comp_stu) %>% 
  cor() %>% 
  stargazer(type = 'text', digits = 2)

################################################################################