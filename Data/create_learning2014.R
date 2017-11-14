# Name: Eva Roth
# Date: 15.11.2017 
# File for exercise no.2 - regression and model validation
# Link to data source: http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt

learning2014 <- read.table ("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Checking dimensions and structure
str(learning2014)
dim(learning2014)

# Data contains 183 observation of 60 variables, variables have 5 levels (likert scale) except for age, attitude, gender and points

# Installing and accessing package
install.packages("dplyr")
library(dplyr)

# Questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# Selecting the columns related to deep learning and creating column 'deep' by averaging
deep_columns <- select(learning2014, one_of(deep_questions))
learning2014$deep <- rowMeans(deep_columns)

# Selecting the columns related to surface learning and creating column 'surf' by averaging
surface_columns <- select(learning2014, one_of(surface_questions))
learning2014$surf <- rowMeans(surface_columns)

# Selecting the columns related to strategic learning and creating column 'stra' by averaging
strategic_columns <- select(learning2014, one_of(strategic_questions))
learning2014$stra <- rowMeans(strategic_columns)


# Creating column "attitude" by scaling the column "Attitude"
learning2014$attitude <- learning2014$Attitude / 10

# exclude observations where exam points are zero
learning2014 <-subset(learning2014, (Points>0))

# select columns
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

newdataset <- select(learning2014, one_of(keep_columns))

# Seeing the structure and dimensions of new dataset (166 obs of 7 variables)
str(newdataset)

# Setting the IODS project folder to the working directory
setwd(C:/Users/eva-mariaroth/Documents/GitHub/IODS-project)


