rm(list=ls())
graphics.off()

#install.packages("ggplot2")
#install.packages("curl")
library(curl)
library(ggplot2)
ISO_MSRV <- read.csv(curl("https://raw.githubusercontent.com/daudi-msafiri/MSRV/main/MSRV_CN.csv"), sep =";")

as.vector(ISO_MSRV)

Context <- factor(ISO_MSRV$Context, levels = c("Phase IA", "Phase IB", "Phase II", "Phase IIIA", "Mixed III IV V", "Sterile"))

x1 <- ISO_MSRV$d13C
y1 <- ISO_MSRV$d15N
subs <- Context
Corr <- cor(x1, y1)

#get intercept and slope value
reg<-lm(formula = y1 ~ x1)                      
coeff<-coefficients(reg)          
intercept<-coeff[1]
slope<- coeff[2]

ggplot(ISO_MSRV, aes(x = x1, y = y1, colour = subs, linetype=subs)) +
  geom_point(aes(shape=subs, color=subs)) +
  #geom_abline(intercept = intercept, slope = slope, color="black", 
  #           linetype="dashed", linewidth=1.5) +
  stat_ellipse(aes(x=x1, y=y1, group = subs), type = "norm", level = 0.95,na.rm = TRUE) +
  scale_linetype_discrete(name  ="Context", 
                          labels = c(bquote(italic("Phase IA")), bquote(italic("Phase IB")), bquote(italic("Phase II")), bquote(italic("Phase IIIA")), bquote(italic("Mixed III IV V")), bquote(italic("Sterile")))) +
  scale_colour_discrete(name  ="Context", labels = c(bquote(italic("Phase IA")), bquote(italic("Phase IB")), bquote(italic("Phase II")), bquote(italic("Phase IIIA")), bquote(italic("Mixed III IV V")), bquote(italic("Sterile")))) +
  ggtitle("Middle Senegal River Valley C and N isotopes") +
  labs(x = (expression({delta}^13*C~'\u2030')), 
       y = (expression({delta}^15*N~'\u2030')), 
       colour = "subs", linetype = "subs", shape = "subs") +
  scale_shape(guide="none") +
  theme(panel.background = element_rect(fill = 'white'), legend.position = "right")

