library(httr)
library(rvest)

url <- "https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country"
document <- read_html(url)

htmlTables <- html_table(document)[2]
df <- as.data.frame(htmlTables)

print(head(df))
# summary(htmlTables)
# datasets::airquality

