data(iris)
View(iris)
install.packages("missForest")
library(missForest)
library(dplyr)

#diapo (introduction)
# introduction de 20% de valeurs manquantes:
iris.miss <- missForest::prodNA(iris, noNA = 0.2)

# summary de base
?summary
summary(iris.miss)
#sum(is.na)
sum(is.na(iris.miss))# vérifier les valeurs manquantes

#vous pouvez identifier avec une focntion sapply
na_count <-sapply(iris.miss, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)
na_count

#lapply
valeurmanquantes <-lapply(iris.miss, function(x) sum(is.na(x)))
valeurmanquantes

## fonction str, également un classique
str(iris.miss)

# fonction glimpse
?glimpse
dplyr::glimpse(iris.miss)

#Visualisation des données manquantes

#visdat : est un package qui permet de visualiser un jeu 
#de données entier. La fonction vis_miss() se concentre sur 
#les valeurs manquantes de l’ensemble de nos données : 
#pourcentage de NA pour chaque variable et global, 
#visualisation

install.packages("visdat")
library(visdat)
?airquality
View(airquality)
vis_miss(airquality)

#naniar: e package est entièrement dédié aux données manquantes, 
#avec en particulier 4 fonctions permettant de les visualiser,
#non seulement variable par variable, mais également les 
#relations entre elles.

#la fonction geom_miss_points() remplace les NA par des 
#valeurs 10% plus basses que la valeur minimum observée de 
#la variable, ce qui permet de les visualiser comme ci-dessous:
install.packages("naniar")
library(naniar)
library(ggplot2)
ggplot(data = airquality) +
  aes(x = Ozone, y = Solar.R) +
  geom_miss_point()

#La fontion gg_miss_var() présente une autre approche pour 
#la visualisation des données manquantes :

gg_miss_var(airquality)

gg_miss_case(airquality)

#La fonction gg_miss_fct() plot le nombre de valeurs 
#manquantes de chaque colonne en fonction d’une variable 
#catégorielle du jeu de données :

gg_miss_fct(x = riskfactors, fct = marital)

#package UPSETR
# La fonction gg_miss_upset() peut être utile pour 
#visualiser les combinaisons de NA les et intersections de 
#variables.
install.packages("UpSetR")
library(UpSetR)
gg_miss_upset(riskfactors)

# imputation des données manquantes

# Génération d'un jeu de données bivarié, distribution normale
df_bivar <- data.frame(x = rnorm(50, 0, 1), y = rnorm(50, 10, 10))
View(df_bivar)

# Introduction artificielle de données manquantes (20%) :
df_miss <- df_bivar
df_miss$y[sample(1:nrow(df_miss), size = 10)] <- NA
df_miss$any_na <- ifelse(is.na(df_miss$y), "donnée imputée", "donnée originale")
View(df_miss)

# Imputation des données manquantes par la moyenne
install.packages("zoo")
library(zoo)
df_miss$y <- na.aggregate(df_miss$y, FUN = mean)
View(df_miss)

# Visualisation# il y a un probleme avec plotly en R studio, dans ce cas
#utiliser R

install.packages("plotly")
library(plotly)
plot_ly(data = df_miss, x = ~x, y = ~y, color = ~any_na, colors = "Set2") 

#Répétition de la dernière ou de la prochaine valeur 
#observée : na.locf()

?na.locf
bz <- zoo(c(2, NA, 1, 4, 5, 2))
bz
# répétition de la dernière valeur observée
na.locf(bz)

# répétition de la prochaine valeur observée
na.locf(bz, fromLast = TRUE)

#remplacer par zero 
m <- matrix(sample(c(NA, 1:10), 100, replace = TRUE), 10)
d <- as.data.frame(m)
View(d)
d[is.na(d)] <- 0
d

#Interpolation grâce à la méthode des kNN : l’idée est de 
#calculer les distances entre observations, et d’attribuer 
#aux valeurs manquante la moyenne des valeurs observées 
#chez les k plus proches voisins : fonction kNN() du 
#package {VIM}.
install.packages("VIM")
library(VIM)
# données avec valeurs manquantes :
data(sleep)
# imputation grâce à la méthode des kNN :
kNN(sleep)

#LE PACKAGE {MISSFOREST}
#Comme son nom l’indique, ce package propose d’utiliser 
#une méthode de complétion basée sur les forêts aléatoires. 
#Rapidement : pour chaque variable est construit un modèle 
#random forest dont les prédictions permettront de remplacer 
#les valeurs manquantes. L’option permettant de retourner 
#l’erreur out of bag liée à chaque variable permet un haut niveau 
#de contrôle pour les imputations au niveau de chaque variable.

library(missForest)
data(iris)
# Introduction artificielle de données manquantes (20%) :
iris.miss <- prodNA(iris, noNA = 0.2)
# Imputation des données manquantes :
iris.imputed <- missForest(iris.miss, xtrue = iris)
# erreur out of bag :
iris.imputed$OOBerror
# résultat : Root-mean-square deviation

# erreur d'imputation si disponible (si on a fourni xtrue) :
iris.imputed$error

#données imputées :
iris.imputed$ximp

#LE PACKAGE {AMELIA}
#Du nom de la première femme aviateur a avoir traversé 
#l’Atlantique en solitaire (Amelia Earhart), supposément 
#disparue lors d’un survol de l’océan Pacifique (elle est « missing », 
#comme nos missing data : je n’arrive pas à savoir si je trouve 
#ça cool ou de mauvais goût de l’avoir nommé ainsi), 
#ce package permet de réaliser des imputations multiples, 
#ce qui a pour avantage de réduire le biais tout en augmentant
#la pertinence de l’imputation

#La fonction amelia() présente un algorithme qui combine 
#l’algorithme classique du maximum de vraisemblance avec
#une approche boostrap, ce qui en fait une méthode rapide 
#et robuste.
install.packages("Amelia")
library(Amelia)
data(africa)
View(africa)
summary(africa)

?amelia
a.out <- amelia(x = africa, cs = "country", ts = "year", logs = "gdp_pc")

summary(a.out)
plot(a.out)
