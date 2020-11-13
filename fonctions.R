# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# R permet à l'utilisateur d'écrire ses propres fonctions.
#Une fonction est définie de la forme suivante :

name <- function(arg_1, arg_2, ...) expression
#expression est une expression R, (habituellement une expression regroupée), qui utilise les arguments, arg_i, pour calculer une valeur. La valeur de l'expression est la valeur retournée par la fonction.
#Pour exécuter la fonction faire : name(arg_1, arg_2,...)

#Contrairement à d'autre langages, il n'y a pas de contrôle du type de variable que l'on peut utiliser.
#Il faudra l'inclure dans la fonction pour, par exemple, vérifier que la première variable est bien un vecteur.
#L'ordre des paramètres est important, il faut les passer dans le même ordre que dans le code de la fonction

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
