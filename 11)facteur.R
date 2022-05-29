# Remarque: si vous rencontrez des probl√®mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

#En R, un facteur (ou factor) est un vecteur contenant
# uniquement certaines valeurs predefinies. 
# Les valeurs pre-definies sont appelees des levels


sexe<- factor(c("H", "H", "F", "H", "H", "F", "F", "F"))
sexe

str(sexe)

c("orange", "banane", "fraise")

# ÈlÈments importants concernant les facteurs et leur utilisation :

#1- Les niveaux d'un facteur sont toujours affichÈs sous forme de 
#caractËre. Cependant, en interne, R encode ces valeurs sous forme
#d'entiers, dans notre exemple, les modalitÈs "F" et "H" sont encodÈes
# en 1 et 2, respectivement.

#2- Par dÈfaut, les modalitÈs/niveaux d'un facteur nouvellement crÈÈs 
#sont l'ensemble des valeurs uniques du vecteur utilisÈ. 
#Pour connaitre ou modifier ces modalitÈs, on peut utiliser la
#fonction levels.


levels(sexe)

# On tire aleatoirement dans ce vecteur grace a la fonction sample() 
# avec l'option size=10 et replace = TRUE (tirage avec
# remise.

x <- sample(x = c("orange", "banane", "fraise"), size = 10, replace = TRUE)
x

#Pour le moment, le vecteur x est de classe chaine de caractere 
class(x)

# Comme il prend un nombre fini de valeurs, on pourrait aussi le definir comme un facteur :
x <- factor(x = x)
x
class(x)
vec1 <- c("Male","Femelle","Femelle","Femelle","Male")
vec1
class(vec1)
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)

# Variables qualitatives ou categorielles expriment une 
# qualite comme le sexe, le metier ou le nom
# Nominales, comme par exemple le nom des journaux, le signe
# astrologique.

animaux<- c("chat","chien","singe","lion","ornithorynque")
animaux
class(animaux)
fac_an <- factor(animaux)
fac_an
class(fac_an)
levels(fac_an)

#designe le rang ou la preference comme : un peu, moyen, beaucoup,...
grad <- c("Master", "Doctorat", "Licence", "Master", "Doctorat")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doctorat", "Master", "Licence"))
fac_grad
levels(fac_grad)

summary(grad)#resume statistique

vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "M", "F", "F", "M", "M")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femelle", "Male")
fac_vec2
summary(fac_vec2)
summary(vec2)
