#La bibliothèque "lattice" est la version R de la bibliothèque 
#"Trellis" de W. Cleveland. Son objectif est de produire des 
#graphiques, souvent multipanneaux, qui sont à la fois puissants
#(beaucoup d'options) et optimisés pour la visualisation statique (impression) 
#et de qualité de publication.

# La bibliothèque lattice élargit les possibilités graphiques
#de façon considérable, en particulier, elle permet d'obtenir des 
#graphiques en treillis (panels de graphiques). Motez que la toutes
#des fonctions de la bibliothèque fonctionnent de la même façon, en particulier 
#vous specifiez les variables sous forme de formules, permettant de spécifier des
#graphiques en treillis. vous verrez, c'est plus difficile à expliquer qu'à faire et à 
#comprendre quand vous verrez le graphique correspondant.
                                                                                                                                                                                           
# La philosophie des fonctions lattice est assez différente de
#la production de graphique en R, dans le sens que pour
#produire un graphique avec titres, courbe lisse et droite de
#régression vous utilisez un seul appel à une fonction, tandis qu'en R 
#normalement un tel graphique est construit par ajouts successifs d'éléments 
#en appelant des fonctions spécialisées.
#https://www.statmethods.net/advgraphs/trellis.html


install.packages("lattice")
library(lattice)
library(ggplot2)
View(ToothGrowth)
?lattice

# avec ggplot
ggplot(data = ToothGrowth, aes(x = len, color = supp)) +
  geom_line(stat = "density") +
  geom_rug()

# avec lattice
densityplot(~len, data = ToothGrowth, group = supp, auto.key = TRUE)

#Histogramme
# Puisqu’il s’agit de décrire une seule variable, ou sa 
#distribution plus précisément, la formule à employer ne 
#contient pas de variable à gauche du symbole ~ et l’on se
#contente d’écrire la variable à résumer à droite dans la
#formule

histogram(~len, data = ToothGrowth, type = "count")

#En ajoutant une facette pour tenir compte de la 
#variable supp, cela donne

histogram(~ len | supp, data = ToothGrowth, breaks = seq(0, 40, by = 5))

#Une courbe de densité se construit à l’aide de densityplot
#et la syntaxe est strictement identique à celle de histogram, 
#à l’option type= près

densityplot(~len, data = ToothGrowth, plot.points = FALSE, from = 0, to = 40)

#Diagramme en barres
#Les diagrammes en barres peuvent avantageusement être 
#remplacés par des diagrammes en points, tels que les 
#diagrammes de Cleveland (cf. plus loin), mais en attendant
#voici comment en réaliser un à l’aide de barchart à partir
#de données agrégées

install.packages("latticeExtra")
library(latticeExtra, quietly = TRUE)
m <- aggregate(len ~ supp + dose, data = ToothGrowth, mean)
barchart(len ~ dose, data = m, groups = supp, horizontal = FALSE, auto.key = TRUE, par.settings = ggplot2like())

#Diagramme de type boîtes à moustaches
#Les diagrammes en forme de boîtes à moustaches sont 
#obtenus à l’aide de la commande bwplot. Voici un exemple 
#d’utilisation :

bwplot(len ~ supp, data = ToothGrowth, pch = "|")

#Diagramme en points
# Le même type de représentation graphique peut être obtenu
#en utilisant directement les données individuelles, et non
#leur résumé en cinq points (tel que fournit par summary et exploité
#par bwplot). Dans ce cas, il s’agit de la commande dotplot, qui permet
#de construire des diagrammes de Cleveland (moyenne ou effectif total calculé
#pour une variable en fonction des niveaux d’une autre variable) ou, dans le
#cas où la variable à résumer consiste en une série de mesures individuelles numériques, 
#des diagrammes de dispersion. Voici une illustration pour ce dernier cas de figure

dotplot(len ~ supp, ToothGrowth, jitter.x = TRUE)

#Diagramme de dispersion
#Enfin, un diagramme de dispersion est construit à l’aide
#de la commande xyplot

xyplot(len ~ dose, ToothGrowth, type = c("p", "smooth"))
