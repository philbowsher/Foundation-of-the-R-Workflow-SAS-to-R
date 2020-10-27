# data are from 

# library("rgdal")

# Torn = readOGR(dsn = ".", layer = "torn")

# Torn$Year = as.integer(Torn$yr)
# Torn = subset(Torn, Year > 2010)

# View(Torn)

#Torn1 <- as_tibble(Torn)
#Torn1 %>% write_csv('Torn.csv')

library(tidyverse)

Torn <- read_csv("~/Foundation-of-the-R-Workflow-workshop-2019-09-06/Examples/data/torn/Torn3.csv")

Torn1 <- Torn[ which((Torn$st=='ME' | Torn$st=='NH') & Torn$yr== 2017), ]

View(Torn1)

library("leaflet") 

leaflet() %>% addTiles() %>% setView(-70.275740, 43.653360, zoom = 9) %>% 
  
  addMarkers(data = Torn1, lat = ~ slat, lng = ~ slon, popup = Torn1$date)

# Torn2 <- as_tibble(Torn1)

# Torn2 %>% write_csv('Torn2.csv')
