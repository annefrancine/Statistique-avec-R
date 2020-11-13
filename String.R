# Remarque: si vous rencontrez des probl?mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Les chaines de caractères
# Les chaines de caractère sont d?limit?es par les caractères " ou '.

a<- "Ceci est une chaine de caractère"
a
class(a)
is (a)

x = as.character(3.14) 
x
class(x) 

# Concaténation de string
# paste : La fonction paste permet de coller des chaines de caractères, cela peut ?tre utile pour plein de chose : d?finir le nom d'un fichier de sortie, 
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

# le parametre sep permet de définir le caractère utilisé pour concatener les chaines de caractères

#extraire une partie de la chaine de caractère

texte <- "Ceci est une chaine de caractère"
substr(texte, start=12, stop=25) 

#compter la quantité de caractère
nchar(texte)

# Comme la plupart des langages de programmation, R trouve des différences entre les majuscules et les minuscules. Les fonctions tolower() et toupper() nous aident comprendre ce problème.
tolower("AlAbAmA")
toupper("AlAbAmA")

# ?sub()? et ?gsub():Nous pourrions ?galement avoir la n?cessit? de remplacer un caract?re particulier dans une cha?ne de caract?res.
sub("a","A","alabama")
gsub("A","a","AlAbAmA")

#is.character() : Avant de commencer travailler sur des strings, il est recommand? de vérifier si nous allons vraiment travailler avec des strings
?is.character
state.name
is.character(state.name)


#as.character(): Si, par exemple, nous devons convertir state.area (vecteur numérique des zones d'état - en miles carrés) en strings, nous pouvons facilement appliquer la fonction as.character().
state.area
is.character(state.area)
stateAreachar <- as.character(state.area)
class(stateAreachar)

# Manipulation de chaînes de caractères avec stringr
#L'extension stringr, développée par Hadley Wickham, propose une 
#interface unifiée et simplifiée à différentes fonctions de manipulations des chaînes de caractères

install.packages("stringr", dependencies=TRUE)
library(stringr)

#Concaténation : str_c
#Équivalent de paste, mais le séparateur par défaut est une chaîne vide au lieu d'un espace.
a<-"coucou"
b<-"comment vas-tu?"
str_c(a,b)

#Longueur d'une chaîne : str_length -Équivalent de nchar 
str_length(a)

# Extraction d'une sous-chaîne : str_sub
#Équivalent de substr. Elle accepte des arguments de position négatifs, 
# qui comptent en partant de la fin de la chaîne :

str_sub("abcdef", 1, 3)
str_sub("abcdef", 4)
str_sub("abcdef", -1)

#Remplacement d'une sous-chaîne : str_sub
# Équivalent de substr<-, avec les mêmes améliorations que pour la fonction précédente

x <- "abcdef"
str_sub(x, 1, 3) <- "aaa"
x

# Suppression des espaces en début et fin : str_trim
str_trim("  abc    ")

#Autres fonctions
#str_dup permet de dupliquer des chaînes
#str_pad permet de compléter une chaîne de caractères avec des espaces en début et/ou fin

#Expressions régulières
# Détecter la présence d'un motif : str_detect
#str_detect renvoie un vecteur logique indiquant si le motif a été repéré pour chaque élément d'un vecteur 

ch <- c("M. patate", "brocolis patissiers", "patates patissieres")
str_detect(ch, "patate")

str_detect(ch, "^patate")

#Localiser un motif : str_locate
# str_locate renvoie les positions de la première occurrence d'un motif dans chaque élément d'un vecteur

str_locate(ch, "patiss.*r")

#str_locate_all renvoie les positions de toutes les occurrences du motif :
str_locate_all(ch, "pat")

# Extraire un motif : str_extract
#Fonctionne de la même manière que str_locate mais renvoit le texte correspondant au motif plutôt que la position :

str_extract(ch, "pat.")
str_extract_all(ch, "pat.")

#str_match fonctionne comme str_extract mais permet de différencier
#les groupements. La fonction renvoit une matrice dont la première 
#colonne est l'extraction de la motif dans son ensemble, et les colonnes suivantes l'extraction de chaque groupe :

str_match(ch, "(.*) (patissier.*)$")

#Remplacement de motif : str_replace-Équivalent de sub et gsub 
str_replace_all(ch, "patate(.?)\\b", "pomme\\1 de terre")

#Découper selon un motif : str_split découpe une chaîne en un nombre variable de sous-chaînes selon un motif de séparation

ch <- "un et deux et trois et quatre"
str_split(ch, " et ")

#str_split_fixed fait de même mais en un nombre fixé de sous-chaînes :
str_split_fixed(ch, " et ", 3)

#Modifier le comportement des motifs
#On peut appliquer la fonctions  fixed() à un motif
#pour le rendre insensible à la casse ou le convertir en simple chaîne de texte 

ch <- "Mais Euh !"
str_detect(ch, fixed("ai."))


