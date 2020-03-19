# Import from JSON
library(jsonlite)
json <- fromJSON("data/Water_Right_Applications.json")
json[[1]][[1]]

# Import from XML
library(xml2)
xml <- read_xml("data/Water_Right_Applications.xml")
xml_children(xml_children(xml))

# Import from HTML
# library("rvest")
# url <- "http://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population"
# population <- url %>%
#   read_html() %>%
#  html_nodes(xpath='//*[@id="mw-content-text"]/table[2]') %>%
#  html_table()
# population <- population[[1]]
# head(population)

library("rvest")
page <- read_html("https://en.wikipedia.org/wiki/List_of_largest_employers_in_the_United_States")
employers <- page %>%
  html_nodes("table") %>%
  .[1] %>%
  html_table()
employers <- employers[[1]]

library(rvest)
DN_movie <- read_html("http://www.imdb.com/title/tt0468569/")
rating <- DN_movie %>% 
  html_nodes("strong span") %>%
  html_text() %>%
  as.numeric()
rating

library(rvest)

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

rating <- lego_movie %>% 
  html_nodes("strong span") %>%
  html_text() %>%
  as.numeric()
rating

https://rpubs.com/swaps/275810