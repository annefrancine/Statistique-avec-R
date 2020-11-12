# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

#Le type data.frame est un type spécifique dédié à la manipulation
# d’ensemble de données de type « individus x variables » (lignes x colonnes).

# On peut le voir comme une liste de vecteurs de même longueur
# (numérique, factor, etc.). Avec des fonctionnalités spécifiques

# On peut aussi le voir comme une matrice. Cette spécificité peut
# être exploitée intensivement lorsqu’il s’agit d’accéder aux valeurs

# créer un dataframe vide
?data.frame
df <- data.frame()
class(df)
df

# créer vecteurs vides

nom <- character()
age <- numeric()
item <- numeric()
code <- integer()

df <- data.frame(c(nom, age, item, code))
df

# créer vecteurs

pays <- c("France", "Allemagne", "Argentine", "Irlande", "Brésil")
nom <- c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
taille <- c(1.88, 1.76, 1.53, 1.69, 1.68)
code <- c(5001, 2183, 4702, 7965, 8890)

#création d'un dataframe avec plusieurs vecteurs

recherche <- data.frame(pays, nom, taille, code)
recherche

# Ajout d'un nouveau vecteur à un dataframe existant
yeux <-c("noisette", "marron vert", "bleu", "marron", "bleu")
rec2 <- cbind(recherche, yeux)
rec2

#informations sur le dataframe
str(rec2)
dim(rec2)
length(rec2)
View(rec2)
head(rec2)
dimnames(rec2)
colnames(rec2)
rownames(rec2)
#Accès aux éléments d'un dataframe

rec2$pays
rec2$nom

# extraire une valeur unique
rec2[1,1]
rec2[3,2]

# nombre de lignes et de colonnes
nrow(rec2)
ncol(rec2)

# Data frames built-in 
?mtcars
mtcars
View(mtcars)
head(mtcars)
tail(mtcars)

# filtrage des informations
rec2[taille < 1.60,]
rec2[taille < 1.60, c('code', 'yeux')]
rec2

#Nommer dataframes
colnames(rec2) <- c("Var 1", "Var 2", "Var 3", "Var 4", "Var 5")
rownames(rec2) <- c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")
rec2
