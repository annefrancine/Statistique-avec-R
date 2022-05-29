#Relation et dépendance

#Soit deux caractères quantitatifs X et Y, décrivant le même ensemble d'unités.
#On dit qu'il existe une relation entre X et Y si l'attribution des modalités de X et de Y ne 
#se fait pas au hasard, c'est à dire si les valeurs de X dépendent des valeurs de Y ou si les 
#valeurs de Y dépendent des valeurs de X. Dire que Y dépend de X signifie que la connaissance des
#valeurs de X permet de prédire, dans une certaine mesure, les valeurs de Y. En d'autres termes,
#si Y dépend de X, on peut trouver une fonction f telle que :

Y=f(X)
#Exemple : il existe une relation entre la température et l'altitude. La dépendance entre la 
#température et l'altitude


# Covariance
#La covariance mesure le lien linéaire qui peut exister entre deux séries statistiques.
#Lorsqu’elle est normalisée, la covariance est utilisée comme un coefficient de corrélation
#entre les deux séries.
#La covariance est la moyenne des produits des écarts des valeurs à la moyenne de chaque série

#La covariance permet d'étudier les variations simultanées de deux variables par rapport à
#leur moyenne respective.
#La covariance permet de mesurer les variations de deux séries de valeurs entres elles 
#(comme deux titres de bourses) et de savoir si elles varient de concert.

#Si la covariance est supérieure à 0, on peut dire qu'il ya corrélation entres les deux
#séries, mais on ne peut pas conclure qu'il y causalité !


#Correlation
#Le coefficient de corrélation linéaire, ou de Bravais-Pearson, permet de mesurer à la fois
#la force et le sens d’une association

#Il ne faut pas confondre corrélation et relation causale.


#Le coefficient de corrélation linéaire nous aide à juger de l’existence d’une relation 
#linéaire entre deux variables c’est-à-dire lorsque l’on peut tracer une ligne droite dans
#le nuage de points. Il n’est donc pas adapté lorsque les relations ne sont pas linéaires


#p = +1 : corrélation positive parfaite

#p = -1 : corrélation négative parfaite (lorsque la valeur de a augmente, la valeur de b diminue)

#p = 0 : absence totale de corrélation



#Analyser la covariance et la corrélation entre les variables miles / gallon et poids du 
#véhicule -dataset mtcars

my_data <- mtcars
View(my_data)
summary(mtcars)

library(ggplot2)
ggplot(mtcars, aes(x=mpg, y=wt)) + geom_point()
# Changer la taille et la forme
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)

#Définir x et y
x = my_data$mpg
y = my_data$wt

#Covariance
?cov
cov(x, y)


# Correlation
?cor
cor(x, y)

#Matrice de corrélation

#Une matrice de corrélation est utilisée pour évaluer la dépendence entre plusieurs variables
#en même temps. Le résultat est une table contenant les coefficients de corrélation entre chaque
#variable et les autres. Il existe différentes méthodes de test de corrélation : Le test de 
#corrélation de Pearson, la corrélation de Kendall et de Spearman qui sont des tests basés sur
#le rang

#La fonction cor() de R peut être utilisée pour calculer la matrice de corrélation. 
#Un format simplifié de la fonction est :

# x est une variable de type matrix ou data.frame
cor(x, method = c("pearson", "kendall", "spearman"))

head(mtcars)
View(mtcars)

mcor <- cor(mtcars)
mcor

#Corrélogramme : visualisation d’une matrice de corrélation
#Plusieurs méthodes sont disponibles dans R pour dessiner un corrélogramme. Vous pouvez utiliser 
#soit la fonction symnum(), la fonction corrplot() ou des nuages de points pour faire le 
#graphique de la matrice de corrélation.

#La fonction symnum de R remplace les coefficients de corrélation par des symboles en fonction
#de la valeur. Elle prend la matrice de corrélation comme argument:

?symnum
View(mcor)
symnum(mcor, abbr.colnames=FALSE)

#Comme indiqué dans la légende, les coefficients de corrélation entre 0 et 0.3 sont remplacés
#par un espace (" “); les coefficients de corrélation entre 0.3 et 0.6 sont remplacés par”.“; 
#etc …

#Faire un correlogramme avec la fonction corrplot de R
#Vous devez installer le package corrplot qui permet de faire une visualisation graphique de 
#la matrice de corrélation.


#La fonction corrplot prend la matrice de correlation comme premier argument. Le second 
#argument (type=“upper”) est utilisé pour afficher seulement le triangle supérieur de la 
#matrice de corrélation.

install.packages("corrplot")
library(corrplot)
corrplot(mcor, type="upper", order="hclust", tl.col="black", tl.srt=45)

#Les corrélations positives sont affichees en bleu et les corrélations negatives en rouge. 
#L’intensité de la couleur et la taille des cercles sont proportionnelles aux coefficients de
#corrélation. A droite du corrélogramme, la légende de couleurs montre les coefficients de
#corrélation et les couleurs correspondantes.
