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

vec1 <- c("Male","Femelle","Femelle","Femelle","Male")
vec1
class(vec1)
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)

#Variables qualitatives ou catégorielles expriment une qualité comme le sexe, le métier ou le nom
#Nominales, comme par exemple le nom des journaux, le signe astrologique.

animaux<- c("chat","chien","singe","lion","ornithorynque")
animaux
class(animaux)
fac_an <- factor(animaux)
fac_an
class(fac_an)
levels(fac_an)

#désigne le rang ou la préférence comme : un peu, moyen, beaucoup,...
grad <- c("Master", "Doctorat", "Licence", "Master", "Doctorat")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doctorat", "Master", "Licence"))
fac_grad
levels(fac_grad)

summary(grad)#résumé statistique

vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "M", "F", "F", "M", "M")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femelle", "Male")
fac_vec2
summary(fac_vec2)
summary(vec2)
