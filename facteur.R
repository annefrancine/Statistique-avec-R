# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

#En R, un facteur (ou factor) est un vecteur contenant uniquement certaines valeurs prédéfinies. 
# Les valeurs pré-définies sont appelées des levels

c("orange", "banane", "fraise")

# On tire aléatoirement dans ce vecteur grâce à la fonction sample() avec l'option size=10 et replace = TRUE (tirage avec remise.
x <- sample(x = c("orange", "banane", "fraise"), size = 10, replace = TRUE)
x

#Pour le moment, le vecteur x est de classe chaîne de caractère 
class(x)

# Comme il prend un nombre fini de valeurs, on pourrait aussi le définir comme un facteur :
x <- factor(x = x)
x
