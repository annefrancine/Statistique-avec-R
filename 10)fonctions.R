# Remarque: si vous rencontrez des problÃ¨mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Le logiciel R dispose de fonctions preprogrammees, appelees « primitives ». 
#L'utilisateur a la possibilite de definir ses propres fonctions.
#Une fonction est un sous-programme, c'est-à-dire une portion de code qui est 
#executee lorsqu'on l'appelle.

#Le logiciel R cree un environnement specifique pour l'execution de la 
# fonction, c'est-à-dire qu'il travaille avec des variables locales.
#Ainsi, une variable definie dans une fonction peut avoir le même nom 
# qu'une variable generale, ce sont deux variables independantes ; 
#on peut modifier la valeur de cette variable, mais elle retrouve sa valeur initiale 
#lorsque l'on sort de la fonction

#Definition d'une fonction
#Une fonction est mise dans une variable contenant un bloc d'instructions 
#introduit par la commande function(). La syntaxe  est :

nom_de_fonction <- function(arguments) {
  instructions
}

# Par exemple
carre <- function(x) x*x
  carre(2)

#L'evaluation de la fonction renvoie la derniere valeur calculee. 
#On peut preciser la valeur retournee par la commande return() :
  
nom_de_fonction <- function(arguments) {
  instructions
  return(valeur)
}

# Par exemple : 
carre <- function(x) {
  y <- x*x
  return(y)
}

carre(x=2)

cv <- function(x){
  moy <- mean(x)   # moyenne de x
  s <- sd(x)  # ecart type de x
  rslt <- s/moy  # calcul du CV
  return (rslt)    #la fonction retourne le resultat
}

# Variable de test: 
x<- sample(1:100, 20, replace=TRUE)

#Test de la fonction
cv(x)

# Pour afficher (et non pas retourner) une ou plusieurs variable lors d'un 
#appel à une fonction, on utilise la fonction print à l'interieur de 
#la fonction.

# Ecrire une fonction "f" qui reçoit en argument un Data frame X et un nombre b , 
#et qui affiche les colonnes dans lesquelles au moins un element est superieur à b,
#ainsi que le nombre de colonnes concernÃees s'il y en a
#ou le message "Pas d'elements superieurs à ( la valeur de) b 
#" si aucune des colonnes ne verifie cette condition

#Definir votre fonction ici:
f= function(X, b){
  c=0
  for(i in 1:length(X))
    if (any(X[,i]>b) ) {print(i);c=c+1}
  
  if(c==0) print(paste('Pas elements superieurs a', b))
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

#Les fonctions mathematiques primitives de R s'appliquent sur des vecteurs. 
#On s'attachera donc à creer des fonctions qui s'appliquent elles-memes à des 
# vecteurs.  Par exemple, la fonction suivante permet de definir une courbe 
# en cloche dissymetrique ,formee de deux demies gaussiennes de largeur 
# differentes.


gauss_dissym <- function(A, x) {

#genere un pic gaussien dissymetrique
# entrees : A : vecteur de reels, parametres de la fonction
# A[1] : position du pic
# A[2] : hauteur de la courbe
# A[3] : largeur de la courbe a gauche
# A[4] : largeur de la courbe a droite
# x : vecteur de reels
# sorties : y : vecteur de réels
  
  indice <- (x < A[1]) #  vecteur de T a gauche, F à droite
  y <- rep(0, length(x)) # initialisation par des zeros
  y[indice] <- A[2]*exp(-(x[indice] - A[1])^2/A[3]) # profil gauche
  y[!indice] <- A[2]*exp(-(x[!indice] - A[1])^2/A[4]) # profil droit
  return(y)
}

# Le fait d'utiliser la matrice de booleens indice permet, au sein d'une seule fonction, de separer les cas x < A[1] et x â‰¥ A[1].
#On peut donc utiliser cette fonction sur un vecteur :

x <- seq(-5, 5, len=100)
A <- c(1, 1, 2, 5)
y <- gauss_dissym(A , x)
plot(x, y, "l")

