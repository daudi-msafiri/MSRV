rm(list=ls())
graphics.off()

#install.packages(rbacon)
library(rbacon)

setwd("~/YOURDRIVE/")
MSRV_C1 <- read.csv("~/YOURDRIVE/MSRV_C1.csv")


Bacon(core="MSRV_C1", d.min=0,d.max=245,hiatus.depths=225, acc.mean=1, acc.shape=1.25, accept.suggestions = TRUE,verbose=FALSE)
core<-rep("MSRV_C1",6)
sampleNo<-c("234433","234434","234435","AA-8327","234436","234437")
depth<-c(67,122,135,192,220,245)
ageBP<-c()
ageMin<-c()
ageMax<-c()
for (i in depth){
  ageBP<-append(ageBP,round(mean(Bacon.Age.d(i))))
  ageMin<-append(ageMin,round(min(Bacon.Age.d(i))))
  ageMax<-append(ageMax,round(max(Bacon.Age.d(i))))
}
MSRV_C1data<-data.frame(core,sampleNo,depth,ageBP,ageMin,ageMax)
print(MSRV_C1data)
#dir.create("~/Library/YOURDRIVE/cores_bacon")

write.csv(MSRV_C1data,"MSRV_C1data.csv",row.names = FALSE)
