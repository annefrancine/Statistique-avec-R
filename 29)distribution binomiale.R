#Distribution binomiale
#La variable aléatoire binomiale est une variable aléatoire discrète, elle représente le nombre
#de succès parmi n épreuves élémentaires pour autant que les conditions suivantes soient 
#réalisées:

#Pour chaque épreuve, deux types de résultats sont possibles: A (succès) et A* (échec);
#La probabilité de succès (π) est la même à chaque épreuve: probabilité constante de succès π 
#(probabilité d'échec=1-π);
#On répète l'épreuve élémentaire un nombre fixé n

#Exemples de variables aléatoires binomiales
#Le nombre de fois que l'on fait 6 en lançant n fois un dé à 6 faces non pipé
#Le nombre de drosophiles mâles dans des expériences portant sur n individus

#Fonction

#La fonction dbinom() donne les probabilités pour différentes valeurs de la variable binomiale. 
#Au minimum, il nécessite trois arguments. Le premier argument de cette fonction doit être un 
#vecteur de quantiles (les valeurs possibles de la variable aléatoire X ). 
#Les deuxième et troisième arguments sont les defining parameters la distribution, 
#à savoir n (le nombre d'essais indépendants) et p (la probabilité de succès dans chaque essai)

?dbinom

#La fonction dbinom() donne les probabilités pour différentes valeurs de la variable binomiale.
#Au minimum, il nécessite trois arguments. Le premier argument de cette fonction doit être un 
#vecteur de quantiles (les valeurs possibles de la variable aléatoire X ). 
#Les deuxième et troisième arguments sont les defining parameters la distribution, 
#à savoir n (le nombre d'essais indépendants) et p (la probabilité de succès dans chaque essai)

#Binom(n = 5, p = 0.5) probabilities
n <- 5; p<- 0.5; x <- 0:n
dbinom(x,n,p)
#To verify the total probability is 1
sum(dbinom(x,n,p))

#Le graphique de distribution de probabilité binomiale peut être affiché comme dans la figure 
#suivante:

x <- 0:12
prob <- dbinom(x,12,.5)
barplot(prob,col = "red",ylim = c(0,.2),names.arg=x,
          main="Binomial Distribution\n(n=12,p=0.5)")

# La probabilité qu'un patient meure d'une crise cardiaque est de 0,04
#Supposons que nous ayons 5 patients qui ont une crise cardiaque,
#Quelle est la probabilité que tout le monde survivra?

# n= 5, X=nombre de survivants, p=0.04

# dbinom(X, n, p)

a <- dbinom(0, 5, 0.04)
print(a)

#graphique distribution de probabilité

graph <- function(n,p){
  x <- dbinom(0:n, size = n, prob = p)
  barplot(x,ylim=c(0,1),names.arg=0:n,
          main=sprintf(paste('Distribution binomiale (n,p) ',n,p,sep=',')))
}
graph(5,0.04)

#créer un graphique distribution binomiale
x <- seq(0,50,by = 1)
y <- dbinom(x,50,0.5)
plot(x,y)

#Nous allons maintenant illustrer l'utilisation de la fonction de distribution cumulative pbinom() . 
#Cette fonction peut être utilisée pour calculer des probabilités telles que P( X <= x ) . 
#Le premier argument de cette fonction est un vecteur de quantiles (valeurs de x).

# Calculating Probabilities
# P(X <= 2) in a Bin(n=5,p=0.5) distribution
pbinom(2,5,0.5)

#Le rbinom() est utilisé pour générer des échantillons aléatoires de tailles spécifiées avec 
#une valeur de paramètre donnée

# Simulation
xVal<-names(table(rbinom(1000,8,.5)))
barplot(as.vector(table(rbinom(1000,8,.5))),names.arg =xVal,
          main="Simulated Binomial Distribution\n (n=8,p=0.5)")
