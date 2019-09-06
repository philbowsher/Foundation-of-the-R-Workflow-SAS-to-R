
# This script creates the sqlite database file

library(DBI)
library(readr)
library(dplyr)
library(odbc)

mssql_server_name <- "SQL Server (DSN)" # Replace with actual DB location

con <- dbConnect(odbc(), 
                 mssql_server_name,
                 Database = "master")



dbSendQuery(con, "CREATE DATABASE immunogenicity")
dbDisconnect(con)

con <- dbConnect(odbc(), 
                 mssql_server_name,
                 Database = "immunogenicity")

add_schema <- function(schema_name, seed_value){
  dbSendQuery(con, paste0("CREATE SCHEMA ", schema_name))
  
  confirmatory <- read_csv("Data/Sample_Immunogenicity_Data/Sample_ADA_Data_05062017_Confirmatory.csv")
  dbWriteTable(con, SQL(paste0(schema_name, ".confirmatory")), confirmatory)
  
  titer <- read_csv("Data/Sample_Immunogenicity_Data/Sample_ADA_Data_05062017_Titer.csv")
  dbWriteTable(con, SQL(paste0(schema_name, ".titer")), titer)
  
  screening <- read_csv("Data/Sample_Immunogenicity_Data/Sample_ADA_Data_05062017_Screening.csv")
  dbWriteTable(con, SQL(paste0(schema_name, ".screening")), screening)

  set.seed(seed_value)
  Subject <- 1:nrow(screening)
  Blood_Type <- sample(1:3, nrow(screening), replace = TRUE) 
  Weight <- sample(120:220, nrow(screening), replace = TRUE)
  subjects <- data.frame(
    Subject,
    Blood_Type, 
    Weight) %>%
    mutate(Blood_Type = case_when(
      Blood_Type == 1 ~ "A",
      Blood_Type == 2 ~ "O",
      Blood_Type == 3 ~ "B"
    ))
  dbWriteTable(con, SQL(paste0(schema_name, ".subjects")), subjects)
}

add_schema("study_01", 100)
add_schema("study_02", 999)

dbDisconnect(con)

rm(confirmatory, titer, screening, con, db_location, mssql_server_name)

# Run if the database needs to be deleted
delete_database <- function(){
  con <- dbConnect(odbc(), 
                   mssql_server_name,
                   Database = "master")
  dbSendQuery(con, "DROP DATABASE immunogenicity") 
  dbDisconnect(con)
}

