# La fonction lapply

#La fonction lapply applique a chaque element du premier 
#parametre qui lui est donne une fonction indiquee en second
#parametre et retourne le resultat sous forme de liste. 
#La syntaxe est la suivante :
?lapply
lapply(X, FUN, ...)

liste <- list(normale = rnorm(10), logiques = c(TRUE, TRUE, FALSE), x = c(0, NA, 3))

# Obtenir la liste des longueurs de chaque element
lapply(liste, length)

# Calculer la moyenne pour chaque element
lapply(liste, mean, na.rm = TRUE)

# On peut creer une fonction a linterieur de lappel e lapply.
# Le premier parametre est necessairement un element du vecteur
# auquel on souhaite appliquer la fonction.

lapply(liste, function(x) x / mean(x, na.rm = TRUE))

# Si la fonction doit posseder plusieurs parametres
lapply(liste, function(x, y) x / mean(x, na.rm = TRUE) + y, y = 2)

#On peut appliquer la lapply sur des tableaux de donnees, 
#dans la mesure ou ces derniers sont des listes. Cela s’avere
#pratique pour realiser des operations pour chaque colonne 
#dun tableau de donnees. Afin de prendre moins de place 
#dans laffichage, lexemple suivant utilise la fonction
#unlist pour aplatir la liste obtenue

data(cars)
View(cars)

# Afficher le type de chaque colonne de la data frame "cars"
unlist(lapply(cars, class))

# Calculer la moyenne pour chaque colonne
unlist(lapply(cars, mean))

#La fonction sapply

#La fonction sapply applique une fonction aux elements dun vecteur ou dune
#liste et peut retourner un vecteur, une liste ou une matrice. 
#Elle possede la syntaxe suivante :

?sapply
sapply(X, FUN, simplify, USE.NAMES)

(x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE, FALSE, FALSE, TRUE)))

# Application de la fonction quantile() a chaque element
# pour obtenir la mediane et les quartiles
# Avec lapply()
lapply(x, quantile)

# Avec sapply
sapply(x, quantile)

#La fonction vapply
#La fonction vapply est similaire a sapply, mais elle
#possade un type de valeurs spacifie, ce qui peut rendre
#lutilisation plus sûre (et parfois plus rapide). 
#Lorsquon lui fournit un data.frame, vapply retourne le 
#meme resultat que sapply. Cependant, quand on lui fournit 
#une liste vide, vapply retourne un vecteur logique de longueur 
#nulle (ce qui est plus sensé que la liste vide que returne
#sapply).
?vapply
vapply(X, FUN, FUN.VALUE, ..., USE.NAMES)

# Retourner le vecteur
sapply(cars, is.numeric)

vapply(cars, is.numeric, FUN.VALUE = logical(1))

# Avec la liste vide
sapply(list(), is.numeric)
vapply(list(), is.numeric, FUN.VALUE = logical(1))

#La fonction apply
#La fonction apply possède la syntaxe suivante :
apply(X, MARGIN, FUN, ...)
?apply

(X <- matrix(1:9, ncol = 3))

# Somme par ligne
apply(X, MARGIN = 1, sum)

# Somme par colonne
apply(X, MARGIN = 2, sum)

# Fonction definie par l'utilisateur
apply(X, MARGIN = 1, function(x) sum(x) / sum(X))

#La fonction tapply
#La fonction tapply sapplique a chaque cellule dun tableau,
#sur des regroupements definis par les variables categorielles
#fournies. La syntaxe est la suivante :

tapply(X, INDEX, FUN, ..., simplify)

data(iris)
View(iris)

# Moyenne de la longueur des sepales par espece
tapply(iris$Sepal.Length, iris$Species, mean)
# Pour retourner le resultat sous forme de liste
tapply(iris$Sepal.Length, iris$Species, mean, simplify = FALSE)



#La fonction mapply
#La fonction mapply applique une fonction a plusieurs listes
#ou vecteurs. La syntaxe est la suivante :

mapply(FUN, ..., MoreArgs, SIMPLIFY, USE.NAMES)
?mapply

(l1 <- list(a = c(1:5), b = c(6:10)))
(l2 <- list(c = c(11:15), d = c(16:20)))

# La somme des elements correspondants de l1 et l2
mapply(sum, l1$a, l1$b, l2$c, l2$d)

# Attention au recyclage silencieux !
(l1 <- list(a = c(1:5), b = c(6:20)))
mapply(sum, l1$a, l1$b, l2$c, l2$d)

#La fonction Vectorize
#La fonction Vectorize permet de convertir une fonction 
#scalaire en une fonction vectorielle. Attention, cela ne
#permet pas dameliorer la rapidite dexecution du code.
#Par contre, son utilisation assez intuitive permet de 
#gagner du temps. Il sagit donc de faire larbitrage 
#entre le temps passe a trouver un moyen elegant et 
#efficace pour effectuer une operation en passant par de 
#réels calculs vectoriels et le gain dexecution que ce
#calcul vectoriel apporte vis-a-vis dune boucle. 

#La syntaxe de la Vectorize est la suivante :

Vectorize(FUN, vectorize.args, SIMPLIFY, USE.NAMES)
?Vectorize

f <- function(x = 1:3, y) c(x, y)
f
# On "vectorise" la fonction f
vf <- Vectorize(f, SIMPLIFY = FALSE)
f(1:3, 1:3)

# Vectorise seulement y, pas x
vf(y = 1:3)
