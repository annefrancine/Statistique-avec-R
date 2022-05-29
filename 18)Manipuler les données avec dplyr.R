#dplyr fait partie du coeur du tidyverse
install.packages("dplyr")
library(dplyr)

#Dans ce qui suit on va utiliser le jeu de donnees nycflights13, 
#contenu dans lâextension du meme nom (quâil faut donc avoir installe).
#Celui-ci correspond aux donnees de tous les vols au depart dâun
#des trois aeroports de New-York en 2013. Il a la particularite 
# dâetre reparti en trois tables :

#flights - contient des informations sur les vols : date, depart, destination,
# horaires, retard¦

#airports -  contient des informations sur les aeroports

# airlines - contient des donnÃ©es sur les compagnies aÃ©riennes

# On va charger les trois tables du jeu de donnÃ©es :

install.package("nycflights13")
library(nycflights13)

## Chargement des trois tables
data(flights)
data(airports)
data(airlines)

View(flights)
View(airports)
View(airlines)

#1) slice
# Le verbe slice selectionne des lignes du tableau selon leur position. 
# On lui passe un chiffre ou un vecteur de chiffres.

# Si on souhaite selectionner la 345e ligne du tableau airports :

slice(airports, 345)

#Si on veut selectionner les 5 premieres lignes:

slice(airports, 1:5)

# 2) filter

#filter selectionne des lignes d'une table selon une condition.
#On lui passe en parametre un test, et seules les lignes pour 
#lesquelles ce test renvoie TRUE (vrai) sont conservees.


#Par exemple, si on veut selectionner les vols du mois de janvier, 
#on peut filtrer sur la variable month de la maniere suivante :

filter(flights, month == 1)

# Si on veut uniquement les vols avec un retard au depart 
#(variable dep_delay) compris entre 10 et 15 minutes :

filter(flights, dep_delay >= 10 & dep_delay <= 15)

# Si on passe plusieurs arguments Ã  filter, celui-ci rajoute automatiquement
#une condition et entre les conditions. La commande precedente peut
#donc etre ecrite de la maniere suivante, avec le meme resultat :

filter(flights, dep_delay >= 10, dep_delay <= 15)

# On peut egalement placer des fonctions dans les tests, qui nous
#permettent par exemple de selectionner les vols avec la plus grande
#distance :

filter(flights, distance == max(distance))

#3) select e rename

# select permet de selectionner des colonnes d'un tableau de donnees

#si on veut extraire les colonnes lat et lon du tableau airports :

select(airports, lat, lon)

#Si on fait preceder le nom d'un -, la colonne est eliminee plutot que selectionnee :

select(airports, -lat, -lon)

# select comprend toute une serie de fonctions facilitant la 
#selection de colonnes multiples. Par exemple, starts_with, 
#ends_width, contains ou matches permettent d'exprimer des 
#conditions sur les noms de variables :

select(flights, starts_with("dep_"))

#La syntaxe colonne1:colonne2 permet de selectionner toutes les
# colonnes situees entre colonne1 et colonne2 incluses :

select(flights, year:day)

#Une variante de select est rename, qui permet de renommer
#des colonnes. On l'utilise en lui passant des parametres de la 
#forme nouveau_nom = ancien_nom. Ainsi, si on veut renommer les 
#colonnes lon et lat de airports en longitude et latitude :

rename(airports, longitude = lon, latitude = lat)

#Si les noms de colonnes comportent des espaces ou des caracteres
#speciaux, on peut les entourer de guillemets (") ou de quotes 
# inverses (`) :

tmp <- rename(flights, 
              "retard depart" = dep_delay,
              "retard arrivee" = arr_delay)
select(tmp, `retard depart`, `retard arrivee`)

#4) arrange

#arrange reordonne les lignes d'un tableau selon une ou plusieurs 
#colonnes.

#Ainsi, si on veut trier le tableau flights selon le retard au
#depart croissant :

arrange(flights, dep_delay)

#On peut trier selon plusieurs colonnes. Par exemple selon le mois,
# puis selon le retard au depart :

arrange(flights, month, dep_delay)

#Si on veut trier selon une colonne par ordre decroissant, 
# on lui applique la fonction desc() 

arrange(flights, desc(dep_delay))

#Combine avec slice, arrange permet par exemple de selectionner 
#les trois vols ayant eu le plus de retard :

tmp <- arrange(flights, desc(dep_delay)) 
slice(tmp, 1:3)

# 5) mutate

# mutate permet de creer de nouvelles colonnes dans le tableau de
#donnees, en general Ã  partir de variables existantes.

# Par exemple, la table flights contient la duree du vol en minutes.. Si on veut crÃ©er une nouvelle variable duree_h avec cette durÃ©e en heures, on peut faire :
flights <- mutate(flights, duree_h = air_time / 60)
select(flights, air_time, duree_h)

# On peut creer plusieurs nouvelles colonnes en une seule commande,
#et les expressions successives peuvent prendre en compte les
#resultats des calculs precedents. 

#L'exemple suivant convertitb d'abord la duree en heures dans une
# variable duree_h et labdistance en kilometres dans une variable
#distance_km, puis utilise ces nouvelles colonnes pour calculer la
# vitesse en km/h.

flights <- mutate(flights, 
                  duree_h = air_time / 60,
                  distance_km = distance / 0.62137,
                  vitesse = distance_km / duree_h)
select(flights, air_time, duree_h, distance, distance_km, vitesse)


#6) Enchainer les operations avec le pipe

# Pour simplifier et ameliorer encore la lisibilite du code, 
#on va utiliser un nouvel operateur, baptise pipe. Le pipe se
#note %>%, et son fonctionnement est le suivant : si j'execute 
# expr %>% f, alors le resultat de l'expression expr, � gauche du
#pipe, sera passe comme premier argument � la fonction f, 
#� droite du pipe, ce qui revient �  executer f(expr).


select(filter(flights, dest == "LAX"), dep_delay, arr_delay)


flights %>% filter(dest == "LAX") %>% select(dep_delay, arr_delay)

#Dans ce cas, delay_la contiendra le tableau final, obtenu apres 
# application des trois instructions filter, select et arrange

delay_la <- flights %>% 
  filter(dest == "LAX") %>% 
  select(dep_delay, arr_delay) %>% 
  arrange(dep_delay)

delay_la

#7)group_by
#  Elle permet de definir des groupes de lignes à partir des 
#valeurs d'une ou plusieurs colonnes. Par exemple, on peut 
# grouper les vols selon leur mois :

flights %>% group_by(month)

# Par exemple, si on applique slice à un tableau prelablement 
# groupe, il va selectionner les lignes aux positions indiquees
#pour chaque groupe. Ainsi la commande suivante affiche le premier
#vol de chaque mois, selon leur ordre d'apparition dans le tableau

flights %>% group_by(month) %>% slice(1)

# group_by peut aussi etre utile avec filter, par exemple pour 
#selectionner les vols avec le retard au depart le plus important
#pour chaque mois 

flights %>% 
  group_by(month) %>% 
  filter(dep_delay == max(dep_delay, na.rm = TRUE))


# 8)summarise et count

#summarise permet d'agreger les lignes du tableau en effectuant
#une opÃ©ration à resumee sur une ou plusieurs colonnes. 

#Par exemple, si on souhaite connaitre les retards moyens au 
#depart et à l'arrivee pour l'ensemble des vols du tableau flights


flights %>% 
  summarise(retard_dep = mean(dep_delay, na.rm=TRUE),
            retard_arr = mean(arr_delay, na.rm=TRUE))

# summarise dispose d'un operateur special, n(), qui retourne le nombre de 
#lignes du groupe. Ainsi si on veut le nombre de vols par 
# destination, on peut utiliser :

flights %>%
  group_by(dest) %>%
  summarise(nb = n())

#à noter que quand on veut compter le nombre de lignes par groupe,
#on peut utiliser directement la fonction count. Ainsi le code 
# suivant est identique au precedent :

flights %>%
  count(dest)

# Lorsque la variable de groupage est un facteur et que certaines
#valeurs du facteur ne sont pas presentes dans le tableau, 
#l'argument .drop = FALSE de group_by permet de conserver ces 
#niveaux dans le resultat d'une operation groupee.

#Par exemple, si on transforme la variable origin en facteur pour
# conserver la liste de ses modalitÃ©s, et qu'on ne garde que les
# vols à destination de San Francisco (code SFO) :

ff <- flights %>% 
  mutate(origin = factor(origin)) %>% 
  filter(dest == "SFO")

#Par defaut, si on compte le nombre de vols selon l'aeroport de
#depart, La Guardia n'apparait pas car il ne compte aucun vol :

ff %>% 
  group_by(origin) %>% 
  summarise(n = n())

#Si on souhaite faire apparaitre cette information dans la sortie
# du summarise, on peut ajouter l'argument .drop = FALSE au 
# group_by :

ff %>% 
  group_by(origin, .drop = FALSE) %>% 
  summarise(n = n())

# 9) Grouper selon plusieurs variables

#On peut grouper selon plusieurs variables à la fois, il suffit
#de les indiquer dans la clause du group_by. Le pipeline suivant 
#le nombre de vols pour chaque mois et pour chaque destination, 
# et trie le resultat par nombre de vols decroissant :

flights %>%
  group_by(month, dest) %>%
  summarise(nb = n()) %>%
  arrange(desc(nb))

#On peut egalement utiliser count sur plusieurs variables. 
# Les commandes suivantes comptent le nombre de vols pour chaque
# couple aeroport de depart / aeroport d'arrivee, et trie le 
#resultat par nombre de vols dÃ©croissant. Ici la colonne qui 
#contient le nombre de vols, cree par count, s'appelle n par 
# defaut :

flights %>% 
  count(origin, dest) %>% 
  arrange(desc(n))

# 10) slice_sample
# Ce verbe permet de sÃ©lectionner alÃ©atoirement un nombre de lignes 
#(avec l'argument n) ou une fraction des lignes (avec l'argument
# prop) d'un tableau.

# Ainsi si on veut choisir 5 lignes au hasard dans le tableau 
# airports :

airports %>% slice_sample(n = 5)

# Si on veut tirer au hasard 10% des lignes de flights :

flights %>% slice_sample(prop = 0.1)

# 11) slice_head, slice_tail, slice_min, slice_max
# slice_head et slice_tail permettent de selectionner les 
#premieres ou derniÃ¨re lignes d'un tableau. On peut indiquer 
#le nombre (avec n) ou la proportion (avec prop) de lignes qu'on 
#souhaite.

#Ainsi si on veut afficher les trois premieres lignes d'airport :

airports %>% slice_head(n = 3)

# Si on veut afficher les dernieres 20% des lignes de airlines

airlines %>% slice_tail(prop = 0.2)

# slice_min et slice_max prennent en argument supplementaire 
#une variable du tableau et affichent n ou prop lignes du tableau
#ayant les valeurs les plus ou les moins elevÃees de cette variable.

# Ainsi si on veut les 1% de lignes de flights ayant les plus
# fortes valeurs de dep_delay :

flights %>% slice_max(dep_delay, prop = 0.01)

# Si on veut les 2 aeroports avec l'altitude la plus basse :

airports %>% slice_min(alt, n = 2)

# 12) lead et lag

#lead et lag permettent de decaler les observations d(une variable
# d'un cran vers l'arriere (pour lead) ou vers l'avant (pour lag).

lead(1:5)

lag(1:5)

# 13) distinct et n_distinct

# distinct filtre les lignes du tableau pour ne conserver que les 
# lignes distinctes, en supprimant toutes les lignes en double.

flights %>%
  select(day, month) %>%
  distinct
# On peut lui specifier une liste de variables : dans ce cas, pour toutes les
# observations ayant des valeurs identiques pour les variables en
#question, distinct ne conservera que la premiere d'entre elles.

flights %>%
  distinct(month, day)

# L'option .keep_all permet, dans l'operation precedente, de 
# conserver l'ensemble des colonnes du tableau :

flights %>%
  distinct(month, day, .keep_all = TRUE) 

# La fonction n_distinct, elle, renvoie le nombre de valeurs 
# distinctes d'un vecteur. On peut notamment l'utiliser dans un 
# summarise.

# Dans l'exemple qui suit on calcule, pour les trois aeroports de
# depart de la table flights le nombre de valeurs distinctes de
# l'aeroport d'arrivee :

flights %>% 
  group_by(origin) %>% 
  summarise(n_dest = n_distinct(dest))