# La classe Date nous permet de representer en R un objet qui 
# contient une date. Pour creer une date, il suffit d'utiliser
# la fonction as.Date() et de lui passer une chaine de caractere au
# format "aaaa-jj-mm" . Voici un exemple :

anniversaire <- as.Date("1992-07-31")
print(anniversaire)

# Le format par defaut de la chaine de caractere pour ecrire une date 
# est le suivant : "aaaa-mm-jj" , qui est un format anglo-saxon.
# Il est heureusement possible de changer le format de la chaine
# utilisee a l'aide du parametre format de la fonction as.Date() . 

# Ecrivons au date au format mois-jj-aaaa

date <- as.Date("12 janv. 1992" , format = "%d %b %Y")
print(date)

# Format
# %Y	annee au format long (4 chiffres)	2016, 2017
# %y	annee en format abrege (2 chiffres)	98, 02
# %b	mois en format abrege	janv. , oct.
# %B	mois au format long	janvier, octobre
# %m	mois au format numerique	01, 10
# %d	jour du mois au format numerique	07, 16, 28

#On peut verifier que nos objets sont bien de la classe date, 
# avec la fonction class()

class(anniversaire)

# Les objets de classe Date fonctionnent comme nous l'avons decrit
# dans le chapitre precedent pour imaginer une classe date fictive : la date est en réalité un nombre qui représente le nombre de jours écoulés depuis une date de départ (le 1er janvier 1970). La classe contient alors diverses fonctions (comme asDate() que nous connaissons) pour rendre cela transparent et nous permettre de les manipuler facilement.

# Pour s'en rendre compte, il suffit d'afficher le type d'un objet
# date, avec typeof() :

typeof(anniversaire)

#On remarque alors que notre variable est bien de type double.
# Bien entendu, la plupart du temps, la classe est le plus important
# a connaitre, car elle indique ce que représente l'objet et 
# comment il va se comporter. Connaitre son type nous sert juste
# a mieux comprendre ce qui se passe en interne.

# Manipuler des dates

today <- Sys.Date() #on recupere la date du jour
today

# Ajouter ou soustraire un nombre de jours a une date

demain <- today + 1
print(demain)

hier <- today - 1
avant_hier <- today -2

hier
avant_hier

#Extraire le jour de la semaine d'une date

#Pour recuperer le jour de la semaine d'une date donnee, on peut 
# utiliser la fonction weekdays()

dayToday <- weekdays(today)
dayToday

# Une fonction identique existe aussi pour recuperer le mois d'une
# date donnee : la fonction months() qui porte bien son nom. 
# Cette fonction retourne par défaut le mois au format de chaine 
# de carctere :

moisToday <- months(today)
moisToday

# Il existe enfin une fonction quarters() qui indique a quelle
# trimestre une date appartient

trimestre <- quarters(today)
trimestre

#Cette seconde classe permet de representer les dates egalement,
#mais en tennant compte cette fois de l'heure precise
# (heures et minutes) du jour en question. Pour creer une date
# ainsi, il faut utiliser la fonction asPOSIXct() . 
# Cette fonction comporte trois arguments principaux :

#Le premier argument qui contient la chaine de la date
#Un second argument format qui contient le format de cette chaine
#Un argument tz qui indique le fuseau horraire de la date.

date <- "15 janvier 2017 12h57:10"
date_format <- "%d %B %Y %Hh%M:%S"
date_complete <- as.POSIXct(date,format = date_format, tz = "GMT")
date_complete

# Format
# %H	Indique l'heure au format 24h	
# %h	Indique l'heure au format 12h	4
# %M	Indique les minutes	36
# %S	Indique les secondes


