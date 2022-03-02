us<-read.table("d:/1.PHUONG/1.STA8005/Week 2/usair.dat", header=TRUE)
head(us)
str(us)
names(us)


## Draftsman's display of the first four variables only
plot(us[,1:4])

##plot on the 4th row and 1st col
#y-axis: pop
#x-axis: SO2

##plot on the 3rd row and 2nd col
#y-axis: manuf
#x-axis: temp

## Pop ~ manuf suggest a strong linear relationship

## Create a 3D scatterplot between temp, pop and manuf
attach(us)
library(scatterplot3d)
scatterplot3d(temp, pop, manuf, main="3D Scatterplot")

## Create 5 plots showing the relationship between temp and each of the other variables.
## Display these plots in the same window in 2 rows and 3 columns
par(mfrow = c(2,3))
plot(temp ~ manuf)
plot(temp ~ pop)
plot(temp ~ wind.speed)
plot(temp ~ annual.precip)
plot(temp ~ days.precip)
par(mfrow = c(1,1))

## Create a scatterplot matrix for the variables: temp, manuf, pop, wind.speed and
## annual.precip
library(car)
scatterplotMatrix(us[2:6])

#Both pop and manuf are skewed right (a few large outliers). The relationships between the
#environmental variables and each of the other variables show a lot of variation and
#although a linear relationship can be fitted, it is not obvious. The linear relationship between
#pop and manuf still seems quite strong.

## Identify the cities (rows) of data with the highest populations causing the skew in that
## variable. Use syntax to remove these observations from the plotting. Interpret any
## changes to the plot

# View all data to identify the rows to be removed
us
attach(us)
us[order(-pop),]

# Rows 11, 18 and 29 are outliers on both manuf and pop. I will also removed row 35
# because its value for pop was still quite a bit higher than other values (the next highest pop 
# value is 905 for row 17). 

# Remove rows 11, 18, 29 and 35 from the analysis
scatterplotMatrix(us[-c(11,18,29,35),2:6])

# The relationship between pop and manuf is much less clear. The appearance of a strong
# linear relationship was driven by a few cities with both high pop and high manuf. It is
# debatable whether these cities should be removed from future analysis of this data. It
# depends strongly on the research question

######## New data file ######

