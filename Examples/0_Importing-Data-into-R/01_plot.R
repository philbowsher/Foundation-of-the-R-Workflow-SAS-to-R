
######
# 1. Loading R Packages 
#####

library(tidyverse)
library(lubridate)

#####
#2. Import the data in visits_by_hospital.csv and 
# Data simulated using synthea: https://github.com/synthetichealth/synthea
#####


#####
# 3. A few graphs
#####

# A simple graph
ggplot(visits_by_hospital)+
  geom_col(aes(y=name, x= total_visits))

# Adding an aesthetic
ggplot(visits_by_hospital)+
  geom_col(aes(y=name, x= n, fill = encounterclass))

# Change the geom_* to change plot type
ggplot(visits_by_hospital)+
  geom_point(aes(y=name, x= n, col = encounterclass))




