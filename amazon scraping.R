library(httr)
library(rvest)

baseurl <-"https://www.amazon.eg/s?i=electronics&rh=n%3A21832982031&fs=true&language=en&qid=1679591136&ref=sr_pg_2&page="

# for(pageindex in 1:10){
#   print(paste("progress is Page : ", pageindex))
#   url <- paste0(baseurl,pageindex)
#   document <- read_html(url)
# }

  url <- paste0(baseurl,1)
  document <- read_html(url)
  allcards <- html_element(document,".s-search-results")
  cardshtml <- html_elements(allcards,".sg-col-4-of-24")

     for (cardhtml in cardshtml){
       image_link <- html_element(cardhtml,".s-image") %>% html_attr("src")
       # image_link <- html_element(cardhtml,".s-image")
       print(image_link)

     }


# print(html_text(cardhtml))


