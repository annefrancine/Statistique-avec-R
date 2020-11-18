# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Le logiciel R dispose de fonctions préprogrammées, appelées « primitives ». 
#L'utilisateur a la possibilité de définir ses propres fonctions.
#Une fonction est un sous-programme, c'est-à-dire une portion de code qui est 
#exécutée lorsqu'on l'appelle.

#Le logiciel R crée un environnement spécifique pour l'exécution de la fonction,
#c'est-à-dire qu'il travaille avec des variables locales.
#Ainsi, une variable définie dans une fonction peut avoir le même nom 
# qu'une variable générale, ce sont deux variables indépendantes ; 
#on peut modifier la valeur de cette variable, mais elle retrouve sa valeur initiale 
#lorsque l'on sort de la fonction.

#Définition d'une fonction
#Une fonction est mise dans une variable contenant un bloc d'instructions 
#introduit par la commande function(). La syntaxe générale est :

nom_de_fonction <- function(arguments) {
  instructions
}

# Par exemple
carre <- function(x) x*x
  carre(2)

#L'évaluation de la fonction renvoie la dernière valeur calculée. 
#On peut préciser la valeur retournée par la commande return() :
  
nom_de_fonction <- function(arguments) {
  instructions
  return(valeur)
}

# Par exemple : 

carre <- function(x) {
  y <- x*x
  return(y)
}

cv <- function(x){
  moy <- mean(x)   # moyenne de x
  s <- sd(x)  # ecart type de x
  rslt <- s/moy  # calcul du CV
  return (rslt)    #la fonction retourne le résultat
}

# Variable de test: 
x<- sample(1:100, 20, replace=TRUE)

#Test de la fonction
cv(x)

# Pour afficher (et non pas retourner) une ou plusieurs variable lors d'un 
#appel à une fonction, on utilise la fonction print à l'intérieur de 
#la fonction.

# Ecrire une fonction "f" qui reçoit en argument un Data frame X et un nombre b , 
#et qui affiche les colonnes dans lesquelles au moins un élément est supérieur à b,
#ainsi que le nombre de colonnes concernées s'il y en a
#ou le message "Pas d'éléments supérieurs à ( la valeur de) b " si aucune des colonnes ne vérifie cette condition

#Définir votre fonction ici:
f= function(X, b){
  c=0
  for(i in 1:length(X))
    if (any(X[,i]>b) ) {print(i);c=c+1}
  
  if(c==0) print(paste('Pas d\'élements supérieurs à' ,b))
  else return(c)
} 

### Variables de test: 
set.seed(300)
X= data.frame(matrix(rnorm(300,1,3),nrow=20))
b=8
d=12
### Tests de la fonction:
f(X,b)
f(X,d)

#Fonctions sur les vecteurs
#Les fonctions mathématiques primitives de R s'appliquent sur des vecteurs. 
#On s'attachera donc à créer des fonctions qui s'appliquent elles-mêmes à des vecteurs. 
#Par exemple, la fonction suivante permet de définir une courbe en cloche dissymétrique, 
#formée de deux demies gaussiennes de largeur différentes.

gauss_dissym <- function(A, x) {
# génère un pic gaussien dissymétrique
# entrées : A : vecteur de réels, paramètres de la fonction
#   A[1] : position du pic
#   A[2] : hauteur de la courbe
#   A[3] : largeur de la courbe à gauche
#   A[4] : largeur de la courbe à droite
#   x : vecteur de réels
# sorties : y : vecteur de réels
  indice <- (x < A[1]) # vecteur de T à gauche, F à droite
  y <- rep(0, length(x)) # initialisation par des zéros
  y[indice] <- A[2]*exp(-(x[indice] - A[1])^2/A[3]) # profil gauche
  y[!indice] <- A[2]*exp(-(x[!indice] - A[1])^2/A[4]) # profil droit
  return(y)
}

# Le fait d'utiliser la matrice de booléens indice permet, au sein d'une seule fonction, de séparer les cas x < A[1] et x ≥ A[1].
#On peut donc utiliser cette fonction sur un vecteur :

x <- seq(-5, 5, len=100)
A <- c(1, 1, 2, 5)
y <- gauss_dissym(A , x)
plot(x, y, "l")
