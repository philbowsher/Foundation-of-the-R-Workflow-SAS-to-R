

# This script creates the sqlite database file

library(RSQLite)
library(DBI)
library(readr)

db_location <- "Shiny/4_Shiny_Database_Immunogenicity_3Tier/database.sqlite"

if(file.exists(db_location)) unlink(db_location)

con <- dbConnect(RSQLite::SQLite(), db_location)

confirmatory <- read_csv("Data/Sample_Immunogenicity_Data/Sample_ADA_Data_05062017_Confirmatory.csv")
titer <- read_csv("Data/Sample_Immunogenicity_Data/Sample_ADA_Data_05062017_Titer.csv")
screening <- read_csv("Data/Sample_Immunogenicity_Data/Sample_ADA_Data_05062017_Screening.csv")

dbWriteTable(con, "confirmatory_01", confirmatory)
dbWriteTable(con, "titer_01", titer)
dbWriteTable(con, "screening_01", screening)



dbDisconnect(con)

rm(confirmatory, titer, screening, con, db_location)

