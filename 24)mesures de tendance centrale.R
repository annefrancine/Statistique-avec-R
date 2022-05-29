# Mesure de tendance centrale
# Les mesures de tendance centrale (la moyenne, la médiane et le mode) vous aident à saisir, 
#à l’aide d’un nombre unique, ce qui est typique d’un ensemble de données.

#La moyenne est la valeur moyenne de toutes les données de l’ensemble.

#La médiane est la valeur du milieu lorsque les données de l’ensemble ont été classées 
#en ordre numérique : exactement la moitié des données se situant au-dessus de la médiane et 
#la moitié se situant au-dessous.

#Le mode est la valeur la plus fréquente de l’ensemble

#Supposons que le vecteur poids contient les poids en kilos de 10 bovins

poids<-c(663.03, 816.77, 689.50, 726.54, 800.53, 741.16, 738.93, 788.65, 824.50, 732.59)
poids

#A. La moyenne arithmétique
#mean(x) calcule la moyenne arithmétique des valeurs contenues dans le vecteur x

?mean
mean(poids)

#ce qui correspond effectivement à*
n<-length(poids)
sum(poids)/n

#La médiane
#median(x) calcule la médiane du vecteur x.

?median
median(poids)

#Pour comprendre d'où provient cette valeur, on peut demander à R de trier les données:
tri<-sort(poids)
(n+1)/2

#La mediane se situe donc au milieu de l'intervalle déterminé par la cinquième et la 
#sixième valeur de ce vecteur trié, soit:

(tri[5]+tri[6])/2

#Le mode
size = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)
mean(size)  
median(size)

moda = function(donnée) {
  vetor = table(as.vector(donnée))
  names(vetor)[vetor == max(vetor)]
}

mode(size)

# Par exemple, imaginons un vecteur "race" contenant la race de 12 chiens:
race<-c("teckel","teckel","bichon","boxer","spitz","husky","spitz","epagneul","spitz","spitz","bichon","spitz")
effectifs<-table(race)
sort(effectifs)#mode



