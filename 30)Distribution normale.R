#A la difference de la loi de Poisson ou de la loi binomiale qui sont des distributions de 
#probabilite discrete, la distribution normale est une distribution de probabilité continue.

#On peut parler egalement de distribution Gaussienne. On notera que sa représentation graphique
#est appelee courbe en cloche. La courbe normale a la particularite d'être symétrique.

#La loi normale est remarquable par le fait qu'elle decrit une grande partie des phénomènes 
#naturels. (science physique, sociale, medecine, agriculture, Business...) . 
#Elle peut etre utilise dans un grand nombre de situations, c'est ce qui la rend si utile.

#Lorsqu'un phenomene est influence par de nombreux facteurs dont aucun n'est preponderant les 
#resultats des mesures de ce phenomene obeissent a une loi normale.

#dnorm() avec d pour densite, qui represente la fonction de densite de probabilité de la loi normale.
#pnorm() avec p pour probabilite,qui represente la fonction de repartition de la loi normale.
#qnorm() avec q pour quantile, qui represente la fonction reciproque de la fonction de répartition de la loi normale.
#rnorm() avec r pour random (aleatoire, du vieux français aller e randon, comme dans une randonnée), qui représente la fonction permettant de faire des
#tirages aleatoire selon une loi normale.

?rnorm
x <- rnorm(n, mean, sd)
# n = taille echantillon, sd = ecart-type

u<-rnorm(100)
# genere 100 observations issues de la loi genere 100 observations
#issues de la loi normale de param�tres 0 et 1 (par d�faut)

u

v<-rnorm(100, 2, 3)
# genere 100 observations issues de la loi normale de param�tres 2 et 3 
v

poids1<-rnorm(30,10,2) # Creation d'un echantillon de 30 poids provenant d'une distribution 
#normale ayant pour moyenne 10 et pour ecart-type 2
poids1

hist(poids1, prob=T)
curve(dnorm(x,mean(poids1),sd(poids1)),add=T,col="red")

x <- rnorm(100)
x
hist(x)

x <- seq(-6, 6, by=0.01)
y <- dnorm(x)
plot(x, y, type="l")
