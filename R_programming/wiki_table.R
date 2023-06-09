library(httr)
library(rvest)

url <- "https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country"
document <- read_html(url)

htmlTables <- html_table(document)[2]
df <- as.data.frame(htmlTables)

colnames(df) <- c("Country","Date", "Tested","Units","Confirmed.cases","Confirmed.tested","Tested.population","Confirmed.population", "REF")
df <- df[-173,]

df[,"Tested"] <- df[,"Tested"] %>% gsub(pattern = ",",replacement = "") %>% as.numeric()
# summary(df)
sum(df[,"Tested"] )