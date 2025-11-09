rm(list=ls())
graphics.off()

library(rbacon)

setwd("~/YOURDRIVE/")
MSRV_C1 <- read.csv("~/YOURDRIVE/MSRV_2S.csv")

Bacon(core="MSRV_2S", d.min=310, d.max=460, accept.suggestions = TRUE,verbose=FALSE)
core<-rep("MSRV_2S",5)
sampleNo<-c("234449","234450","259365","234452","234451")
depth<-c(310,380,381,410,460)
ageBP<-c()
ageMin<-c()
ageMax<-c()
for (i in depth){
  ageBP<-append(ageBP,round(mean(Bacon.Age.d(i))))
  ageMin<-append(ageMin,round(min(Bacon.Age.d(i))))
  ageMax<-append(ageMax,round(max(Bacon.Age.d(i))))
}
MSRV_2Sdata<-data.frame(core,sampleNo,depth,ageBP,ageMin,ageMax)
print(MSRV_2Sdata)
#dir.create("~/YOURDRIVE/cores_bacon")

write.csv(MSRV_2Sdata,"MSRV_2Sdata.csv",row.names = FALSE)
