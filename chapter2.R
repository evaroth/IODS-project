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


my_model <- lm(Points ~ attitude + stra + surf, data = learning2014)
summary(my_model)

my_model2 <- lm(Points ~ attitude, data = learning2014)
par(mfrow = c(2,2))
plot(my_model2, which = 1)


# Chapter 3
alcdata <-read.csv("/Users/eva-mariaroth/Documents/GitHub/IODS-project/alcjoint", header=TRUE, sep=",")
glimpse(alcdata)
colnames(alcdata)
dim(alcdata)
str(alcdata)

install.packages("tidyr")
install.packages("dplyr")
library("tidyr")
help(summary.glm) 
example(glm)

m<-glm(high_use ~ famrel + absences + failures + G3, data = alc, family = "binomial")
summary(m)
OR <- coef(m) %>% exp()
CI <- confint(m) %>% exp()







