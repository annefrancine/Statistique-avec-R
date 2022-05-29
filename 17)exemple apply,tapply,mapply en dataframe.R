install.packages("MASS")
library(MASS)

data(state) # load
head(state.x77)
View(state.x77)

str(state.x77)

apply(state.x77, 2, mean)
apply(state.x77, 2, median)
apply(state.x77, 2, sd)# écart-type

# Saving the results of apply
state.summary<- apply(state.x77, 2, function(x) c(mean(x), sd(x))) 
state.summary

state.range <- apply(state.x77, 2, function(x) c(min(x), median(x), max(x)))
state.range

# Using mapply to compute a new variable
population <- state.x77[1:50]
area <- state.area
pop.dens <- mapply(function(x, y) x/y, population, area)
pop.dens


# Using tapply to explore population by region

region.info <- tapply(population, state.region, function(x) c(min(x), median(x), max(x)))
region.info
