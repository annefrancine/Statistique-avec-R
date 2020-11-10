# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Les chaînes de caractères
# Les chaines de caractère sont délimitées par les caractères " ou '.

a<- "Ceci est une chaïne de caractère"
a
class(a)
is (a)

x = as.character(3.14) 
x
class(x) 

# Concaténation de string
# paste : La fonction paste permet de « coller » des chaînes de caractères, cela peut être utile pour plein de chose : définir le nom d'un fichier de sortie, 
# écrire une formule pour un modele
?paste
?cat

prenom = "Nelson"; nom = "Mandela" 
paste(nom, prenom)
cat(nom, prenom)

a<-"coucou"
b<-"comment vas-tu?"

paste(a,b)
paste(a,b,sep="+")

# le paramètre sep permet de définir le caractère utilisé pour concaténer les chaînes de caractères

#extraire une partie de la chaine de caractère

texte <- "Ceci est une chaïne de caractère"
substr(texte, start=12, stop=25) 

#compter la quantité de caractère
nchar(texte)

# Comme la plupart des langages de programmation, R trouve des différences entre les majuscules et les minuscules. Les fonctions «tolower()» et «toupper()» nous aident à comprendre ce problème.
tolower("AlAbAmA")
toupper("AlAbAmA")

# «sub()» et «gsub():Nous pourrions également avoir la nécessité de remplacer un caractère particulier dans une chaîne de caractères.
sub("a","A","alabama")
gsub("A","a","AlAbAmA")

#is.character() : Avant de commencer à travailler sur des strings, il est recommandé de vérifier si nous allons vraiment travailler avec des strings
?is.character
state.name
is.character(state.name)


#as.character(): Si, par exemple, nous devons convertir «state.area» (vecteur numérique des zones d'état - en miles carrés) en strings, nous pouvons facilement appliquer la fonction «as.character()».
state.area
is.character(state.area)
stateAreachar <- as.character(state.area)
class(stateAreachar)
