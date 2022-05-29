# Dans cette partie nous allons (enfin) travailler sur des “vraies” 
# donnees, et utiliser un jeu de donnees present dans l'extension 
# questionr

install.packages("questionr")
library(questionr)

# L'utilisation de library permet de rendre disponibles, dans notre 
# session R,les fonctions et jeux de donnees inclus dans l'extension.

#Nous devons ensuite indiquer a R que nous souhaitons acceder au jeu de 
# Pour cela, on utilise la commande data :

data(hdv2003)

#Cette commande ne renvoie aucun resultat particulier (sauf en cas erreur),
# mais vous devriez voir apparaitre dans l'onglet Environment de RStudio un 
# nouvel objet nomme hdv2003

# Un data frame (ou tableau de donnees, ou table) est un type d'objet R 
# qui contient des donnees au format tabulaire, avec les observations 
# en ligne et les variables en colonnes, comme dans une feuille 
# de tableur de type LibreOffice ou Excel.

?hdv2003
hdv2003
View(hdv2003)
class(hdv2003)

# Un data frame peut etre manipule comme les autres objets vus 
# precedemment. On peut par exemple faire :

d <- hdv2003 #copie du dataframe

#nombre de lignes et de colonnes du tableau
nrow(d)
ncol(d)

#La fonction dim renvoie ses dimensions, donc les deux nombres
#precedents:

dim(d)

#La fonction names retourne les noms des colonnes du tableau, 
#cest-a-dire la liste de nos variables :

names(d)

# la fonction str renvoie un descriptif plus detaille de la structure du
# tableau. Elle liste les differentes variables, indique leur type 
# et affiche les premieres valeurs

str(d)

# Acceder aux variables d'un tableau

d$sexe

# Si on souhaite afficher seulement les premieres ou dernieres
# valeurs d'une variable, on peut utiliser les fonctions head 
# et tail :

head(d$age)

tail(d$age, 10)

# On peut aussi utiliser l'operateur $ pour creer une nouvelle 
#variable dans notre tableau : pour cela, il suffit de lui assigner
#une  valeur.

# Par exemple, la variable heures.tv contient le nombre d'heures
# passees quotidiennement devant la tele :

head(d$heures.tv, 10)

# On peut vouloir creer une nouvelle variable dans notre tableau
#qui contienne la meme duree mais en minutes. On va donc creer une
# nouvelle variables minutes.tv de la maniere suivante :

d$minutes.tv <- d$heures.tv * 60
View(d)

# On peut alors constater, soit visuellement soit dans la console,
# une nouvelle variable (une nouvelle colonne) a bien ete ajoutee
# au tableau :

head(d$minutes.tv)
View(d)

# on peut commencer par regarder les valeurs extremes, avec les 
# fonctions min, max ou range

min(d$age)
max(d$age)
range(d$age)
mean(d$age)
median(d$age)

summary(d)

hist(d$age, breaks = 10)

# outil le plus utilise pour representer la repartition des 
#valeurs d'une variable qualitative est le tri a plat : il s'agit
# simplement de compter, pour chacune des valeurs possibles de 
#la variable (pour chacune des modalites), le nombre d'observations 
#ayant cette valeur. Un tri a plat s'obtient sous R a l'aide 
# de la fonction table

table(d$sexe)
table(d$qualif)

# Un tableau de ce type peut etre affiche ou stocke dans un objet,
#et on peut a son tour lui appliquer des fonctions. Par exemple,
# la fonction  sort permet de trier le tableau selon la valeur de 
#effectif.  On peut donc faire :

?sort
tab <- table(d$qualif)
sort(tab)

summary(d$qualif)

# Par defaut ces tris a plat sont en effectifs et ne sont donc
# pas toujours très lisibles, notamment quand on a des effectifs
# importants. On leur rajoute donc en general la repartition en 
# pourcentages. Pour cela, nous allons utiliser la fonction
# freq de l'extension questionr

?freq
freq(d$qualif)

# La colonne n represente les effectifs de chaque categorie,
#la colonne % le pourcentage, et la colonne val% le pourcentage 
# calcule sur les valeurs valides, donc en excluant les NA.

# Une ligne a egalement ete rajoutee pour indiquer le nombre et
# la proportion de NA.
?freq

freq(d$qualif, valid= FALSE, total = TRUE, sort = "dec")

# Representation graphique

tab <- table(d$clso)
?barplot
barplot(tab)

?dotchart
dotchart(table(d$qualif))



