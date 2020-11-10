# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Un vecteur est un ensemble d’éléments de même nature
# La fonction c permet de créer un vecteur. 
# Tous les éléments d'un vecteur doivent être du même type.

#il existe quatre types fondamentaux de vecteurs :
# les nombres réels (c’est-à-dire les nombres décimaux que nous utilisons au quotidien)
# les nombres entiers
# les chaînes de caractères (qui correspondent à du texte)
# les valeurs logiques ou valeurs booléennes, à savoir vrai ou faux

a<- c(12,7,5.3,9.1,24)
is(a)
class(a)

b <- c("Vecteur", "de", "chaîne", "de", "caractère")
b
is (b)

nom <- c("Keïta", "Traoré", "Konaré", "Touré", "Keïta")
prenom <- c("Modibo", "Moussa", "Alpha Oumar", "Amadou Toumani", "Ibrahim Boubacar")


is.vector(nom)
length(nom)
class(nom)
typeof(nom)

prenom_nom_age <- paste(prenom, nom)
prenom_nom_age

# On peut créer un autre objet ”y” à partir de l’objet ”x” 
x <- 10
x
y <- x^2+2*x+1 
y

#Quelques vecteurs remarquables
LETTERS
month.name
pi

month.abb

#rep:Dans certaines situations, on peut avoir besoin de créer un vecteur d’une certaine longueur mais dont toutes les valeurs sont identiques. Cela se réalise facilement avec rep à qui on indiquera la valeur à répéter puis le nombre de répétitions 
?rep

rep(2, 10)
rep(c("a", "b"), 3)

#La fonction seq peut générer des s´equences de nombres réels
?seq
seq(1, 5, 0.5)
#ou` le premier nombre indique le début de la séquence, le second la fin, et le
#troisième l’incrément utilis´e dans la progression de la séquence

seq(length=9, from=1, to=5)

c(1:5, seq(10, 11, 0.2))

# Soit ”v” un vecteur contenant 6 entiers allant de 1 à 6 :
v <- c(1, 2, 3, 4 , 5, 6)
v<- 1:6
v

# Arithmétique des vecteurs
# Les opérations arithmétiques entre deux vecteurs de même dimension sont des opérations terme à terme. Une opération arithmétique entre deux vecteurs de même dimension retourne un vecteur dont les éléments correspondent à l'opération arithmétique effectuée pour l'indice correspondant des vecteurs donnés en argument.

a <- c(1, 6, 2, 4)
b <- c(9, 2, 6, 1)
a+b

# Si un vecteur est plus petit que l'autre, R répète les valeurs du plus petit vecteur jusqu'à générer un vecteur de même taille que le plus grand. En particulier, si un des vecteurs est un scalaire, alors R applique l'opération entre le scalaire et tous les éléments du vecteur
a <- 1:10
a
a+5

alfa = c(10, 20, 30) 
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9) 
alfa + beta 

# Pour déterminer les nombres impairs :

a %% 2 == 1

# Ainsi, l'opération multiplication d'un vecteur par un scalaire correspond à l'opération algébrique.
v <- c(2, 3)
4*v

# combinaison de vecteurs
v1 = c(2, 3, 5) 
v2 = c("aa", "bb", "cc", "dd", "ee") 
c(v1, v2) 

# min(), max() : donne la valeur respectivement minimale et maximale de la suite ;
a;b
min(a)
max(b)

#cumsum() : effectue la somme cumulée du vecteur ; cela correspond à la somme de la série ; cette fonction renvoie un vecteur de même taille que le vecteur initial
cumsum(a)

#cumprod() : effectue le produit cumulé du vecteur ; cette fonction renvoie un vecteur de même taille que le vecteur initial
cumprod(a)

#cummax(), cummin() : renvoie respectivement le maximum et le minimum cumulé
cummax(a)

# Valeurs manquantes
# Lorsqu’on travaille avec des données d’enquête, il est fréquent que certaines données soient manquantes, en raison d’un refus du participant de répondre à une question donnée ou d’un oubli ou d’un dysfonctionnement du matériel de mesure, etc.
#Une valeur manquante s’indique sous R avec NA (pour not available).
#Cette valeur peut s’appliquer à n’importe quel type de vecteur, qu’il soit numérique, textuel ou logique.

taille <- c(1.88, NA, 1.65, 1.92, 1.76, NA)
sexe <- c("h", "f", NA, "h", NA, "f")

length(taille)

a<- c(NA, NA, NA)
length(a)

# Des vecteurs nommés
# Les différentes valeurs d’un vecteur peuvent être nommées. Une première manière de nommer les éléments d’un vecteur est de le faire à sa création

sexe <- c(Michel = "h", Anne = "f", Dominique = NA, Jean = "h", 
         Claude = NA, Marie = "f")
sexe

# La liste des noms s’obtient avec names
names(sexe)

# Pour ajouter ou modifier les noms d’un vecteur, on doit attribuer un nouveau vecteur de noms
names(sexe) <- c("Michael", "Anna", "Dom", "John", "Alex", "Mary")
sexe

# Pour supprimer tous les noms, il y a la fonction unname
anonyme <- unname(sexe)
anonyme

# Extraire ou assigner une composante
# Pour avoir accès à la valeur du i-ème élément, on utilise la notation [i]

x <- c(1:5, 10:15)
print(x)
x[6]
x[4:7]
x[c(1, 3, 6)]

# On peut aussi utiliser un vecteur de booléens ; R extrait alors les éléments correspondant aux valeurs vraies. Par exemple :
x <- c(1:5, 10:15)
indices = x > 5
x[indices]

# Indexation par nom
#Lorsqu’un vecteur est nommé, il est dès lors possible d’accéder à ses valeurs à partir de leur nom.
# Il s’agit de l’indexation par nom.

sexe["Anna"]
sexe[c("Mary", "Michael", "John")]
sexe[c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE)]# indexation par condition

# Modification d'un vecteur

d <- 1:5
d
d[1] <- 3
d

sexe
sexe["Alex"] <- "f"
sexe
