## Import visits_by_date.csv
visits_by_date<- read_csv('~/Foundation-of-the-R-Workflow-workshop-2019-09-06/Examples/data/visits_by_date.csv')
# Data simulated using synthea: https://github.com/synthetichealth/synthea

# Filter by year
# exactly 2020
filter(visits_by_date, year == '2020')

# later than or equal to 2000
filter(visits_by_date, year >= '2000')

# If we want visits for a specific hospital, e.g. 'rhode island hospital'
# what should replace the ???
filter(visits_by_date, ??? == 'rhode island hospital')

# to save this we want to assign it a variable name
rih <- filter(visits_by_date, name == 'rhode island hospital')

# simplify this data set to just have the name, start_date, and n
rih <- select(rih, name, start_date, n)

### A simpler way to do both steps
rih_2 <- visits_by_date %>% 
       filter(name == 'rhode island hospital') %>% 
       select(name, start_date, n)

# Import visits_by_hospital
visits_by_hospital<-read_csv('~/Foundation-of-the-R-Workflow-workshop-2019-09-06/Examples/data/visits_by_hospital.csv')

# filter for just newport hospital
newport_hosp<- visits_by_hospital %>%  
  filter(name == 'newport hospital') 

# Add a new column that calculates percentage of total visits for each encounterclass
newport_hosp %>% mutate(visit_perc = (n / total_visits)*100)

