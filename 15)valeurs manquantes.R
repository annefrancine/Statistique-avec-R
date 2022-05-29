data(iris)
View(iris)
install.packages("missForest")
install.packages("diplyr")
library(missForest)
library(dplyr)

#diapo (introduction)
# introduction de 20% de valeurs manquantes:
iris.miss <- missForest::prodNA(iris, noNA = 0.2)

# summary de base
?summary
summary(iris.miss)
#sum(is.na)
sum(is.na(iris.miss))# verifier les valeurs manquantes

#vous pouvez identifier avec une focntion sapply
na_count <-sapply(iris.miss, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count

#lapply
valeurmanquantes <-lapply(iris.miss, function(x) sum(is.na(x)))
valeurmanquantes

## fonction str, egalement un classique
str(iris.miss)

# fonction glimpse
?glimpse
dplyr::glimpse(iris.miss)

#Visualisation des donnees manquantes

#visdat : est un package qui permet de visualiser un jeu 
#de donnees entier. La fonction vis_miss() se concentre sur 
#les valeurs manquantes de l'ensemble de nos donnees : 
#pourcentage de NA pour chaque variable et global, 
#visualisation

install.packages("visdat")
library(visdat)
?airquality
View(airquality)
vis_miss(airquality)

#naniar:package est entierement dedie aux donnees manquantes, 
#avec en particulier 4 fonctions permettant de les visualiser,
#non seulement variable par variable, mais egalement les 
#relations entre elles.

#la fonction geom_miss_points() remplace les NA par des 
#valeurs 10% plus basses que la valeur minimum observee de 
#la variable, ce qui permet de les visualiser comme ci-dessous:

install.packages("naniar")
library(naniar)
install.packages("ggplot2")
library(ggplot2)
ggplot(data = airquality) +
  aes(x = Ozone, y = Solar.R) +
  geom_miss_point()

#La fontion gg_miss_var() presente une autre approche pour 
#la visualisation des donnees manquantes :

gg_miss_var(airquality,show_pct = FALSE)

gg_miss_case(airquality)

#La fonction gg_miss_fct() plot le nombre de valeurs 
#manquantes de chaque colonne en fonction d'une variable 
#categorielle du jeu de donnees :

gg_miss_fct(x = riskfactors, fct = marital)

#package UPSETR
# La fonction gg_miss_upset() peut etre utile pour 
#visualiser les combinaisons de NA les et intersections de 
#variables.

install.packages("UpSetR")
library(UpSetR)
gg_miss_upset(riskfactors)

# imputation des donnees manquantes

# Generation d'un jeu de donnees bivarie, distribution normale
df_bivar <- data.frame(x = rnorm(50, 0, 1), y = rnorm(50, 10, 10))
View(df_bivar)

# Introduction artificielle de donnees manquantes (20%) :
df_miss <- df_bivar
df_miss$y[sample(1:nrow(df_miss), size = 10)] <- NA
df_miss$any_na <- ifelse(is.na(df_miss$y), "donnee imputee", "donnee originale")
View(df_miss)

# Imputation des donnees manquantes par la moyenne
install.packages("zoo")
library(zoo)
df_miss$y <- na.aggregate(df_miss$y, FUN = mean)
View(df_miss)

# Visualisation# il y a un probleme avec plotly en R studio, dans ce cas
#utiliser R

install.packages("plotly")
library(plotly)
plot_ly(data = df_miss, x = ~x, y = ~y, color = ~any_na, colors = "Set2") 

#Repetition de la derniere ou de la prochaine valeur 
#observee : na.locf()

?na.locf
bz <- zoo(c(2, NA, 1, 4, 5, 2))
bz
# repetitio n de la derniere valeur observee
na.locf(bz)

# repetition de la prochaine valeur observee
na.locf(bz, fromLast = TRUE)

#remplacer par zero 
m <- matrix(sample(c(NA, 1:10), 100, replace = TRUE), 10)
d <- as.data.frame(m)
View(d)
d[is.na(d)] <- 0
d

