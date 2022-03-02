de <- read.table("d:/1.PHUONG/1.STA8005/Week 2/emdecade.dat", header=TRUE)
str(de)
head(de)
attach(de)

# Create a star plot for the variables rain, maxt and mint.
# starplot display requires one row of data per category
stars( de[,2:4], draw.segments=TRUE,  labels =(de[,1]),key.loc=c(7,2), main="Emerald Qld weather by Decade" )

# Interpret: rain was relatively high in the decades of 1890,1950 and 1970. But very low other decades,
# particularly 1930 and 1960.
# 1920 had very high max temps and low min temps. 1950 had low min temps and low max
# temps. No clear relationship between low rain and high max temps (except 1920)

## Create a profile plot of variable means by decade. Do not connect points by lines.

library(reshape2)
(demeans_melt<-melt(de, id=c("decade")))
attach(demeans_melt)
##plot varaible profiles my group
library(ggplot2)
ggplot(demeans_melt, aes(variable, value, colour=as.factor(decade))) +  geom_point(size=3)

# Higher measurement scale of rain obscures detail on y-axis for other variables. Average
# rain has varied quite a bit over the decades.

## Redo the profile plot excluding the variable 'rain'.
ggplot(demeans_melt[12:66,], aes(variable, value, colour=as.factor(decade))) +  geom_point(size=3)

# Very little variation in 'pan' over the decades.
# No consistent decade for high and low across the variables