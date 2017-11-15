learning2014 <- read.csv("/Users/eva-mariaroth/Documents/GitHub/IODS-project/learning2014.csv", header = TRUE)
dim(learning2014)
str(learning2014)
head(learning2014)

install.packages("ggplot2")
library("ggplot2")
install.packages("GGally")
library("GGally")
summary(learning2014)
pairs(learning2014[-1], col = learning2014$gender)
p <- ggpairs(learning2014, mapping = aes(col = gender, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20)))
p
