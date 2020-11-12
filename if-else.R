# Créer des conditions

#If : exécuter une action si la condition est vérifiée
if (maCondition){ action }
# Si la condition est vrai (TRUE), alors l'action contenue entre crochets est déclenchée. 
#Sinon, les lignes contenues entre crochets sont ignorées.

# Else : exécuter une action si la condition n'est pas vérifiée
#Il est possible de déclencher une action si la condition n'est pas vérifiée grâce à l'élément else. 
# L'élément else doit être situé sur la même ligne que le crochet fermant la condition.

if (variable == TRUE) { print("Ma condition est validée") } else {
  print("Ma condition n'est pas validée") }

B<-TRUE
x<-2

if (B==TRUE){
  x<-x+1
  y<-10
}
x

x=9
if (x < 7) {
  "ce nombre est inférieur à 7"
} else {
  "ce nombre n'est pas inférieur à 7"
}

#La fonction ifelse()
#La fonction ifelse() peut être utilisée afin de simplifier l'écriture de certaines conditions.
ifelse(maCondition, actionSiVrai, actionSiFaux)

x = 5
ifelse (x < 6, "bien!", NA)

x = 9
ifelse (x < 6, "bien!", NA)

#expressions ifelse imbriquées

x = c(7,5,4)
ifelse(x < 5, "inférieur à 5", 
       ifelse(x == 5, "égal à 5", "supérieur à 5"))

# Repeat
x = 1
repeat {
  x = x + 3
  if (x > 99)
    break
  print(x)}



