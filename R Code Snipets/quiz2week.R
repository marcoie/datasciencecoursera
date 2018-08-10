library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

library(datasets)
data(airquality)
qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)