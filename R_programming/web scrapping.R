library(httr)
library(rvest)

get_wiki_covid19_page <- function() {
  wiki_base_url <- "https://en.wikipedia.org/w/index.php"
  url_parameters <- "?title=Template:COVID-19_testing_by_country"
  response <- GET(paste0(wiki_base_url ,url_parameters))
  return(response)
}

html_file <- get_wiki_covid19_page()
html <- read_html("https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country")
cont <- html_nodes(html,"body")
table <- html_table(cont)
df <- as.data.frame(html_table(cont))
summary(df)
head(df)




