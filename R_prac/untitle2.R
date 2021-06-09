library(ggplot2)

iris <- iris

str(iris)

ggplot(data = iris,
       mapping = aes(x = Petal.Length, y = Petal.Width)) +
  geom_smooth()

data("seals")

str(seals)

b <- ggplot(seals, aes(x = long, y = lat))

b + geom_abline(aes(intercept=5, slope=1, color = "red")) +
  geom_smooth()

# Store the data in the variable my_data
my_data <- iris

# Print the first 6 rows
head(my_data, 6)

# Compute the mean value
mean(my_data$Sepal.Length)

# Compute the median value
median(my_data$Sepal.Length)

# Compute the mode
# install.packages("modeest")
require(modeest)
mfv(my_data$Sepal.Length)

# Compute the minimum value
min(my_data$Sepal.Length)

# Compute the maximum value
max(my_data$Sepal.Length)

# Range
range(my_data$Sepal.Length)

# Compute the variance
var(my_data$Sepal.Length)

# Compute the standard deviation =
# square root of th variance
sd(my_data$Sepal.Length)

# Compute the median
median(my_data$Sepal.Length)

# Compute the median absolute deviation
mad(my_data$Sepal.Length)

summary(my_data$Sepal.Length)

summary(my_data, digits = 1)

# Compute the mean of each column
sapply(my_data[, -5], mean)

# Compute quartiles
sapply(my_data[, -5], quantile)


install.packages("pastecs")

# Compute descriptive statistics
library(pastecs)
res <- stat.desc(my_data[, -5])
round(res, 2)

mean(my_data$Sepal.Length, na.rm = TRUE)

# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

library(ggpubr)

ggboxplot(my_data, y = "Sepal.Length", width = 0.5)

gghistogram(my_data, x = "Sepal.Length", bins = 9, 
            add = "mean")

ggecdf(my_data, x = "Sepal.Length")

ggqqplot(my_data, x = "Sepal.Length")

library(dplyr)

group_by(my_data, Species) %>% 
  summarise(
    count = n(), 
    mean = mean(Sepal.Length, na.rm = TRUE),
    sd = sd(Sepal.Length, na.rm = TRUE)
  )

library("ggpubr")

# Box plot colored by groups: Species
ggboxplot(my_data, x = "Species", y = "Sepal.Length",
          color = "Species",
          palette = c("#00AFBB", "#E7B800", "#FC4E07"))

# Stripchart colored by groups: Species
ggstripchart(my_data, x = "Species", y = "Sepal.Length",
             color = "Species",
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             add = "mean_sd")

# Hair/eye color data
df <- as.data.frame(HairEyeColor)
hair_eye_col <- df[rep(row.names(df), df$Freq), 1:3]
rownames(hair_eye_col) <- 1:nrow(hair_eye_col)
head(hair_eye_col)

# hair/eye variables
Hair <- hair_eye_col$Hair
Eye <- hair_eye_col$Eye

# Frequency distribution of hair color
table(Hair)

# Frequency distribution of eye color
table(Eye)

# Compute table and convert as data frame
df <- as.data.frame(table(Hair))
df

# Visualize using bar plot
library(ggpubr)
ggbarplot(df, x = "Hair", y = "Freq")

tbl2 <- table(Hair , Eye)
tbl2

xtabs(~ Hair + Eye, data = hair_eye_col)

df <- as.data.frame(tbl2)
head(df)

# Visualize using bar plot
library(ggpubr)
ggbarplot(df, x = "Hair", y = "Freq",
          color = "Eye", 
          palette = c("brown", "blue", "gold", "green"))

# position dodge
ggbarplot(df, x = "Hair", y = "Freq",
          color = "Eye", position = position_dodge(),
          palette = c("brown", "blue", "gold", "green"))

xtabs(~Hair + Eye + Sex, data = hair_eye_col)

ftable(Sex + Hair ~ Eye, data = hair_eye_col)

Hair <- hair_eye_col$Hair
Eye <- hair_eye_col$Eye
# Hair/Eye color table
he.tbl <- table(Hair, Eye)
he.tbl

# Margin of rows
margin.table(he.tbl, 1)

# Margin of columns
margin.table(he.tbl, 2)

# Frequencies relative to row total
prop.table(he.tbl, 1)

# Table of percentages
round(prop.table(he.tbl, 1), 2)*100

he.tbl/sum(he.tbl)

