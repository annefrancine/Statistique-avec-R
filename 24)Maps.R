# Maps

# Installation
install.packages(c("ggplot2", "maps", "mapdata"))

# Charger les packages
library(ggplot2)
library(maps)
library(mapdata)

# rechercher des coordonnées du pays
?map_data
mapa <- map_data("world")

# Visualiser le data frame
dim(mapa)
View(mapa)

# Generation de la carte
ggplot() + geom_polygon(data = mapa, aes(x=long, y = lat, group = group)) + 
  coord_fixed(1.3)

ggplot() + 
  geom_polygon(data = mapa, aes(x=long, y = lat, group = group), fill = NA, color = "blue") + 
  coord_fixed(1.3)

gg1 <- ggplot() + 
  geom_polygon(data = mapa, aes(x=long, y = lat, group = group), fill = "seagreen1", color = "blue") + 
  coord_fixed(1.3)
gg1

# Marquer des points sur la carte
# Nous pouvons utiliser un shapefile
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c("Point 1", "Point 2"),
  stringsAsFactors = FALSE
)  

# Points sur la carte
gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 2)

# Division par pays
ggplot(data = mapa) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)


# rMaps 
# http://rmaps.github.io
  
  
  