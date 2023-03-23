library(httr)
library(rvest)

baseurl <-"https://www.amazon.eg/s?i=electronics&rh=n%3A21832982031&fs=true&language=en&qid=1679591136&ref=sr_pg_2&page="
df <- data.frame(matrix(nrow = 0, ncol = 3))
colnames(df) <- c("title", "price", "image_link")

for(pageindex in 1:10){
  print(paste("progress is Page : ", pageindex))
  url <- paste0(baseurl,pageindex)
  document <- read_html(url)

  allcards <- html_element(document,".s-search-results")
  cardshtml <- html_elements(allcards,".sg-col-4-of-24")

  for (cardhtml in cardshtml){
    image_link <- html_element(cardhtml,".s-image") %>% html_attr("src")
    title <- html_element(cardhtml,".a-size-mini") %>% html_text()
    price <- html_element(cardhtml,".a-price-whole") %>% html_text()

    df[nrow(df) + 1,] <- c(title, price, image_link)
  }
}
write.csv(df, "amazonTVs.csv")

