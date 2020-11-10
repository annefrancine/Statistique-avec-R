# Remarque: si vous rencontrez des probl�mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Les cha�nes de caract�res
# Les chaines de caract�re sont d�limit�es par les caract�res " ou '.

a<- "Ceci est une cha�ne de caract�re"
a
class(a)
is (a)

x = as.character(3.14) 
x
class(x) 

# Concat�nation de string
# paste : La fonction paste permet de � coller � des cha�nes de caract�res, cela peut �tre utile pour plein de chose : d�finir le nom d'un fichier de sortie, 
# �crire une formule pour un modele
?paste
?cat

prenom = "Nelson"; nom = "Mandela" 
paste(nom, prenom)
cat(nom, prenom)

a<-"coucou"
b<-"comment vas-tu?"

paste(a,b)
paste(a,b,sep="+")

# le param�tre sep permet de d�finir le caract�re utilis� pour concat�ner les cha�nes de caract�res

#extraire une partie de la chaine de caract�re

texte <- "Ceci est une cha�ne de caract�re"
substr(texte, start=12, stop=25) 

#compter la quantit� de caract�re
nchar(texte)

# Comme la plupart des langages de programmation, R trouve des diff�rences entre les majuscules et les minuscules. Les fonctions �tolower()� et �toupper()� nous aident � comprendre ce probl�me.
tolower("AlAbAmA")
toupper("AlAbAmA")

# �sub()� et �gsub():Nous pourrions �galement avoir la n�cessit� de remplacer un caract�re particulier dans une cha�ne de caract�res.
sub("a","A","alabama")
gsub("A","a","AlAbAmA")

#is.character() : Avant de commencer � travailler sur des strings, il est recommand� de v�rifier si nous allons vraiment travailler avec des strings
?is.character
state.name
is.character(state.name)


#as.character(): Si, par exemple, nous devons convertir �state.area� (vecteur num�rique des zones d'�tat - en miles carr�s) en strings, nous pouvons facilement appliquer la fonction �as.character()�.
state.area
is.character(state.area)
stateAreachar <- as.character(state.area)
class(stateAreachar)