#La fonction sample permet de tirer, avec ou sans remise, un certain 
#nombre d'elements dans un vecteur.

?sample
sample(1:10,1) # on tire une valeur au hasard entre 1 et 10
sample(1:10,3) # on en tire 3
sample(1:10,10)# on en tire 10.. en pratique on melange les 10 éléments 

sample(1:10,3,replace = T)# on en tire 3 parmi 10.. avec remise
#( on peut très bien avoir c(7,7,2) )

#Obtenir une valeur textuelle aleatoire en R

monVecteur <- c("banane", "pomme", "pêche", "orange", "fraise", "abricot")
sample(x = monVecteur, size = 2)

monVecteur <- c("banane", "pomme", "pêche", "orange", "fraise", "abricot")
sample(x = monVecteur, size = 3, replace = TRUE)

set.seed(873465) #seed pour la reproductibilité

#Échantillonnage avec des probabilités inégales
my_vec <- 1:5 
my_vec

sample(my_vec, size = 10, replace = TRUE, prob = c(0.6, rep(0.1, 4)))  # Adjust probabilities

my_data <- data.frame(x1 = 1:10,# Create example data
                      x2 = letters[1:10])
my_data                                  

my_data_samp <- my_data[sample(1:nrow(my_data), size = 3), ]# Subsample of data frame rows
my_data_samp   

x<- sample(c(1,2,4,5),3, prob=c(0.1,0.2,0.6,0.1))#tirage non uniforme sans remise
x

#tirage non uniforme sans remise

#Exemple de 1000 simulations du jet d'une piece equilibree pour estimer
#la probabilite d'obtenir "pile"

?sample
piece1<-sample(c("Pile", "Face"), 1000, replace=TRUE)
(distpiece1 <- table(piece1))

# Exemple de 1000 simulations du jet d'un de a 6 faces equilibrees pour
# estimer la probabilite d'obtenir la face "4".

de1<-sample(c(1:6),1000,replace=TRUE)
(distde1 <- table(de1))


#L'experience consiste a lancer deux des Ã  6 faces equilibrees et Ã  faire la
#sommes S des "valeurs" obtenues.

#Il s'agit alors de determiner la distribution simulee de S, et d'en dÃ©duire
#une estimation de la probabilite
#d'obtenir la somme 7.

de1<-sample(c(1:6),1000,replace=TRUE)
de2<-sample(c(1:6),1000,replace=TRUE)
somme<-de1+de2
(hist(somme,breaks=seq(1.5,12.5,1)))

sum(somme == 7)/1000 # estimer une probabilitÃ©

