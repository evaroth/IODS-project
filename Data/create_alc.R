# Name: Eva Roth
# Date: 21.11.2017
# File for xercise no. 3 - logistic regression - data wrangling
# Link to data source: https://archive.ics.uci.edu/ml/datasets/Student+Performance

# loading the csv table student-mat, exploring structure and dimensions
math <- read.csv ("/Users/eva-mariaroth/Documents/GitHub/IODS-project/Data/student/student-mat.csv", header= TRUE, sep = ";")
dim(math)
str(math)
head(math)

# 395 observations of 33 variables

# loading the csv table student-por into R, exploring structure and dimension
por <- read.csv ("/Users/eva-mariaroth/Documents/GitHub/IODS-project/Data/student/student-por.csv", header = TRUE, sep = ";")
dim(por)
str(por)
head(por)

# 649 observations of 33 variables

# joining the two data sets
# step no 1, accessing dplyr library
library(dplyr)
# columns used as identifiers
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
# joining the two data sets by the identifiers
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))
dim(math_por)
str(math_por)
# 382 observations of 53 variables

# creating a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))
# columns that were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# copying the code from the DataCamp exercise to combine the duplicated anwers in the joined data.

for(column_name in notjoined_columns) {
  two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else {
    alc[column_name] <- first_column
  }
}

glimpse(alc)
# creating a new column alc-use to the joined data, containing the average of the answers related to weekday and weekend alcohol consumtion
# accessing the tidyverse packages dplyr and ggplot2
library(dplyr)
library(ggplot2)

# defining a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)


# define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)
 
glimpse(alc)
# 382 Observations of 35 variables

# Setting the IODS project folder to the working directory
setwd("/Users/eva-mariaroth/Documents/GitHub/IODS-project")
write.csv(alc, file = "alcjoint", row.names = FALSE)

