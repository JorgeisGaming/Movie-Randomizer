library(readr)
library(tidyverse)

Watchlist <- read_csv("C:/Users/User/Desktop/Watchlist.csv")


#Without year indicator
Watchlist1<-Watchlist[c(1,2,3)]
NameAndYear<-paste(Watchlist1$Name, ",", Watchlist1$Year)
Watchlist1<-cbind(Watchlist1,NameAndYear)
Watchlist1<-Watchlist1[c(1,3,4)]
Watchlist1<-Watchlist1[Watchlist1$Date < Sys.Date(),]
Probabailities<-as.numeric(difftime(Sys.Date(), Watchlist1$Date))/
  as.numeric(sum(difftime(Sys.Date(), Watchlist1$Date)))
Watchlist1<-cbind(Watchlist1, Probabailities)
Watchlist1<-Watchlist1[c(3,4)]
sample(Watchlist1$NameAndYear, size = 10, prob = Watchlist1$Probabailities)

#With year :3
Watchlist2<- Watchlist[c(1,2,3)] %>%
  filter(Year > 2010)
NameAndYear<-paste(Watchlist2$Name, ",", Watchlist2$Year)
Watchlist2<-cbind(Watchlist2,NameAndYear)
Watchlist2<-Watchlist2[Watchlist2$Date < Sys.Date(),]
Probabailities<-as.numeric(difftime(Sys.Date(), Watchlist2$Date))/
  as.numeric(sum(difftime(Sys.Date(), Watchlist2$Date)))
Watchlist2<-cbind(Watchlist2, Probabailities)
Watchlist2<-Watchlist2[c(4,5)]
sample(Watchlist2$NameAndYear, size = 10, prob = Watchlist2$Probabailities)





URL<-"https://letterboxd.com/gioniku/watchlist/export/"
Destfile<-"output.csv"
download.file(URL, Destfile)

read.csv(url("https://letterboxd.com/gioniku/watchlist/export/"))


