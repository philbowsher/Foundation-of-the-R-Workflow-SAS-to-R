library(pins)
library(tidyverse)



board_register("rsconnect",
               server = Sys.getenv("CONNECT_SERVER"),
               key = Sys.getenv("CONNECT_SERVER_KEY"))



read_csv('visits_by_hospital.csv') %>% 
    pin("simulated_hospital_visits", board = "rsconnect")
  