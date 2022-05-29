#Les parametres de dispersion sont des indices permettant de savoir si une série de données est
#fort resserrée autour d'un paramètre de tendance centrale ou si, au contraire, les données sont 
#plus dispersées: plus les données sont dispersées et plus les valeurs des paramètres de 
#dispersion sont grandes.

var(x) #calcule la variance du vecteur x.
sd(x) #calcule l'écart-type du vecteur x.

#La variance et l'écart-type sont deux paramètres reliés car l'écart-type est égal à la 
#racine carré de la variance. Si on reprend l'exemple des poids des 10 bovins donné avant:

poids<-c(663.03, 816.77, 689.50, 726.54, 800.53, 741.16, 738.93, 788.65, 824.50, 732.59)
poids

?var
var(poids)

?sd
sd(poids)

#L'étendue
#L'étendue est la différence entre la valeur maximum et la valeur minimum d'une série de données. 
max(x)-min(x)
#calcule l'étendue du vecteur x en soustrayant la valeur minimum de x à la valeur maximum de x.
max(poids)-min(poids)
range(poids)# montre le valeur minimum et maximum

#Le coefficient de variation
#Le coefficient de variation est l'écart-type divisé par la moyenne, le tout multiplié par 100.
#Il représente donc une mesure relative de dispersion et mesure la dispersion en pourcentage de 
#la moyenne.

(sd(poids)/mean(poids))*100

#L'intervalle inter-quartiles
#Les quartiles divisent les données en quatre parties correspondant chacune à 25% des valeurs.
#Le premier quartile (Q1) est la valeur qui divise l'échantillon de telle sorte que 25% des 
#valeurs lui sont inférieures et 75% des valeurs lui sont supérieures. Le second quartile (Q2)
#est la médiane. Et le troisième quartile (Q3) divise l'échantillon de telle sorte que 75% des
#valeurs lui sont inférieures et 25% des valeurs lui sont supérieures. La différence entre le premier
#et le troisième quartile peut être une mesure de dispersion.

q1<-quantile(x,0.25) #calcule premier quantile du vecteur x.
q3<-quantile(x,0.75) #calcule troisième quantile du vecteur x.
q3-q1 #calcule l'intervalle inter-quartile du vecteur x.

q1<-quantile(poids,0.25)
q1
q3<-quantile(poids,0.75)
q3
q3-q1

#boxplot

vec = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

mean(vec)
sd(vec)
median(vec)
range(vec)
quantile(vec)

?range
boxplot(vec)

#Percentiles
#Les percentiles permettent d’ordonner les sujets, de les classer des « premiers aux derniers », 
#mais sans spécifier la distance (l’écart) entre eux. Dans les Exalangs, pour tous les types
#de scores, les percentiles suivants sont indiqués (listés ci-après du moins performant au 
#plus performant) : P5, P10, P25 (ou Quartile 1=Q1), P50 (ou Médiane = Med.), P75 
#(ou Quartile 3 = Q3), P90, P95.

quantile(poids,0.1)

quantile(poids,0.9)

quantile(poids,0.99)

summary(poids)
summary(iris)
summary(mtcars)
