# Le package lubridate offre une panoplie de fonctionnalit√©s qui rendent
#plus conviviales les op√©rations
#effectuees sur les donn√©es de type date. En effet, avec ses plus de 50 
#fonctions, lubridate constitue un outil
#tres puissant et efficace pour manipuler les dates (temps, p√©riode, intervalle
#de temps, laps de temps, . . . ).

install.packages("lubridate")

# ou install via github
#install.packages("devtools")
#devtools::install_github("tidyverse/lubridate")

library(lubridate, warn.conflicts = FALSE)

#Analyse simple et rapide des dates-heures

ymd(20101215)

mdy("4/1/17")

jourJ <- dmy("11 avril 2019")
jourJ

class(jourJ)

hms("14h37min52s")

#Recuperer les elements des dates

#Pour commencer, on peut essayer d'isoler un des elements de la date-time
#(juste l'ann√©e, ou juste le mois, ou juste l'heure, etc.).

#La encore, c'est a travers le nom de la fonction utilisee que l'on va
#specifier quel est l'element qui nous interesse.

t <- ymd_hms("2019.04.11 14h37min52s")
date(t)

hour(t)

minute(t)

second(t)


# Arrondir
#On peut egalement arrondir une date, vers le haut (ceiling_date()), 
#vers le bas (floor_date()), ou vers le plus proche (round_date()):

t <- ymd_hms("2019.04.11 14h37min52s")
ceiling_date(t,"hour")

floor_date(t,"hour")

round_date(t,"hour")

#Periodes ou durees

t1 <- dmy("17/07/2018")
t2 <- dmy("17/04/2019")
diff <- t2-t1

#L'objet diff nous renseigne sur la "difference de temps" entre t1 et t2.
#Il s'agit d'un objet de classe difftime (classe qui n'est pas
#specifiquement liee a l'usage de lubridate).

#Cette "difference de temps" peut etre traitee de differentes manieres
#par lubridate. On peut en effet considerer cette difference en terme
#de periode ou en terme de duree.

#On le specifie de la maniere suivante:

as.duration(diff)

as.period(diff)

# Calculs arithmetiques avec des periodes ou durees

t1+months(9)#t1 + 9 mois

t1+ddays(268) # t1 + exactement 268 jours

ddays(268)/dweeks(1) # combien de semaines (exactement) pour 268 jours?

t2-dweeks(3) # t2 - (exactement) 3 semaines

#Nous pouvons creer des series a intervalle de temps regulier:

t1+months(1:9)

#Intervalles de temps
#Une autre maniËre d'envisager l'analyse d'un jeu de donnees comprenant
#des dates est de travailler sur des intervalles de temps.

?interval()
itv <- interval(t1,t2)
itv <- t1 %--% t2

itv

#Disposer d'un intervalle, cela permet de rÈaliser certaines operations,
#comme (par exemple) dÈterminer si une date (ou une "date-time") donnee
#fait partie de l'intervalle:

Noel <- dmy("25/12/2018")
Noel %within% itv

sitv<-int_diff(t1+months(1:9))

#Une des operations a mon sens les plus utiles en lien avec ces 
#intervalles, c'est ainsi de permettre de replacer l'occurrence d'un
#ou plusieurs evenements dans des intervalles de temps:

sitv

Noel %within% sitv

