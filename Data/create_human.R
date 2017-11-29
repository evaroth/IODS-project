# Name: Eva Roth
# Date: 29.11.2017
# Exercise no. 4 - data wrangling in preperation for exercise no. 5
# Data source: IODS-course, MOOC platform

# loading the cvs tables "Human development" and "Gender inequality" into R. 
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# Exploring the structures and dimensions.
dim(hd)
str(hd)
summary(hd)
# "Human development" consists of 195 obs. of 8 variables

dim(gii)
str(gii)
summary(gii)
# Gender inequality consists of 195 observations of 10 variables

# Renaming the variables
colnames(hd)
colnames(hd)[1]<-"HDI.rank"
colnames(hd)[2]<-"country"
colnames(hd)[3]<-"HDI"
colnames(hd)[4]<-"lifeexp"
colnames(hd)[5]<-"exp.edu"
colnames(hd)[6]<-"mean.edu"
colnames(hd)[7]<-"GNI.cap"
colnames(hd)[8]<-"GNI.rank-HDI.rank"
colnames(hd)

colnames(gii)
colnames(gii)[1]<-"GII.rank"
colnames(gii)[2]<-"country"
colnames(gii)[3]<-"GII"
colnames(gii)[4]<-"matermor"
colnames(gii)[5]<-"adobr"
colnames(gii)[6]<-"reppar"
colnames(gii)[7]<-"edu2F"
colnames(gii)[8]<-"edu2M"
colnames(gii)[9]<-"labF"
colnames(gii)[10]<-"labM" 
colnames(gii)  

#Mutating the "Gender inequality" data in order to create two new variables.
#First accessing the tidyverse package dplyr
library(dplyr)
gii <- mutate(gii, ratio.edu2 = gii$edu2F/gii$edu2M)
gii <- mutate(gii, ratio.lab = gii$labF/gii$labM)

colnames(gii)  
summary(gii$ratio.edu2)  
summary(gii$ratio.lab)  

#Joining the two datasets using the variable country as the identifier.  
human <- inner_join(hd, gii, by = "country")
dim(human)
#The dataset human has 195 observations of 19 variables

setwd("/Users/eva-mariaroth/Documents/GitHub/IODS-project")
write.table(human, file = "human.csv", sep = ",", col.names = TRUE)
