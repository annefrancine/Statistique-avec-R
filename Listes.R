# À la différences des vecteurs, les listes peuvent contenir des objets 
#de natures différentes. Une liste peut combiner des vecteurs, 
# des scalaires, des tableaux de données, etc.

?list

liste1 <- list('A', 'B', 'C')
liste1
liste2 <- list(c("A", "A"), 'B', 'C')
liste2
liste3 <- list(matrix(c("A", "A", "A", "A"), nr = 2), 'B', 'C')
liste3

l1 <- list(1:5, "abc")
l1
l2 <- list(minuscules = letters, majuscules = LETTERS, mois = month.name)
l2

length(l2)
names(l2)
str(l2)

#liste nombres entiers
a<-list(2, 3, 4)

#floats
b<- list(1.90, 45.3, 300.5)
b

#nombres complexes
c <- list(5.2+3i, 2.4+8i)
c

#booléen
d<- list(TRUE, FALSE, FALSE)
d

#Accès aux éléments d'une liste 
# Les crochets simples ([]) fonctionnent comme pour les vecteurs. 
#On peut utiliser à la fois l’indexation par position, l’indexation 
#par nom et l’indexation par condition.

liste1 <- list(1:10, c("Zico", "Ronaldo", "Garrincha"), rnorm(10))
liste1

liste1[1]
liste1[2]
liste1[[2]][1]  
liste1[[2]][1] = "Monica" 
liste1

#L’assignation par indexation fonctionne également avec les doubles crochets ou le signe dollar
l <- list(l1, l2)
l
l[[2]] <- list(c("un", "vecteur", "textuel"))#nommer liste
l$mois <- c("Janvier", "Février", "Mars")
l

#Transformer un vecteur en liste
v = c(1:3)
v
l  = as.list(v)
l
class(l)

# joindre 2 elements dans une liste
mat = matrix(1:4, nrow = 2)
mat
vec = c(1:9)
vec
lst = list(mat, vec)
lst
