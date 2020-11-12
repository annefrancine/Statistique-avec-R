# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# La fonction for est très pratique pour l’exécution des boucles dans R. 
#Elle est structurée de la façon suivante:

for(var in seq){
  expr
}

#où var désigner une variable dans la séquence seq et expr la transformation à laquelle l’on soumet les éléments de cette dernière. Un exemple.

for(i in c(1:10)){
  print(i^2)
}

#applications sur vecteurs

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# Création d'une coquille vide de vecteur.
y <- c() 
y
# Pour chaque élément dans le vecteur x,
for(i in x){ 
  # créer un élément dans le vecteur y qui en serait le carré.
  y[[i]] <- i^2 
}

y

# Prenons un vecteur de caractères.Cherchons à détecter les prénoms qui contiennent la lettre “a” (en minuscule). R a des fonctions natives qui peuvent exécuter cette tâche dont grepl.

x <- c("Mamadou", "Amadou", "Ahmed", "Ahmad", "Abdoul", "Zan", "Tchiè", "Mady")
# Création d'une coquille vide de vecteur.
y <- c() 
# Pour chaque élément dans le vecteur x,
for(i in x){ 
  # identifier les éléments contenant la lettre "a".
  y[i] <- grepl(pattern = "(a)", x = i) 
}

y

# Application sur matrices

x <- matrix(data = c(1:12), nrow = 3, byrow = TRUE)
x

#Comme avant, élévons les éléments à leur carré et stockons dans une matrice nommée y.
# Création d'une coquille vide de matrice
y <- c() 
# Pour chaque élément dans la matrice x,
for(i in x){ 
  # créer un élément dans la matrice y qui en serait le carré.
  y[[i]] <- i^2 
}
y

# Loop For
for (i in 1:20) {print(i)}
for (q in rnorm(10)) {print(q)}

# Ignore certains éléments à l'intérieur de la boucle
for(i in 1:22){
  if(i == 13 | i == 15)
    next
  print (i)}

# interrompre la boucle
for(i in 1:22){
  if(i == 13)
    break
  print (i)}

# Loop While
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}

# La boucle while ne sera pas exécutée
y = 6
while(y < 5){
  y = y+10
  print(y)
}
