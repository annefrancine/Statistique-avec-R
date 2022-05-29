#Remarques:
#getwd : affiche le chemin d"acces au repertoire de travail,
#setwd : permet de changer de repertoire de travail.
#pas de \ : seuls / et \\ sont acceptes pour separer les elements dÃ¢Â€Â™un chemin dÃ¢Â€Â™acces;
#toujours inclure l'extension du fichier;
#encadrer le chemin de guillemets.

#Etape 1:definir le repertoire de travail

#Etape2: Acceder au systeme de fichiers de notre ordinateur a  partir de R

#Ainsi, R a acces au systeme de fichiers ordinateur 
# Par defaut, lacces se fait a partir du repertoire de travail.
#Directement dans la console R, il est possible de voir le 
#contenu du repertoire de travail, creer des fichiers et des 
#repertoires, effacer des fichiers, etc

dir()

# Lecture de fichiers
#Documentation : https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table
#Une analyse de donnees en R debute typiquement par 
#l'importation de donnees. Les donnees à importer en R 
#peuvent provenir de toutes sortes de sources. 

#Elles peuvent se trouver dans des fichiers sous un certain 
#format, dans des bases de donnees, ou provenir directement du web. 
#En outre, il existe plusieurs formats de fichiers pour stocker des donnees : 
#texte (dont CSV), JSON, EXCEL, formats propres à un logiciel statistique 

# Importation de donnees à partir d'un fichier texte
#La lecture de donnees dans un fichier texte se fait principalement
#avec la fonction R read.table. Par exemple, allons lire les donnees contenues 
#dans le fichier dataEx.txt,qui a l'allure suivante.

?read.table

#Par defaut, read.table transforme toutes les colonnes contenant 
#des valeurs caracteres en facteur (comme la fonction data.frame).

txt <- read.table("dataEx.txt")
View(txt)
str(txt)

#On peut aussi utiliser read.delim() qui est la meme chose 
#que read.table, mais avec \t comme separateur par defaut).
vente<-read.delim("venteproduits.txt")
vente
class(vente)

#Dataframe txt
#Nous pouvons tout de suite remarquer un probleme avec ce 
#data frame. Le nom des variables a ete interprete comme 
#une observation. Il faudrait utiliser argument header 
#pour indiquer que la premiere ligne du fichier contient 
#les noms des variables.

txt <- read.table("dataEx.txt", header = TRUE)
str(txt)

#La premiere variable, de1, a ete correctement lu, mais il 
#y a un probleme avec la deuxieme variable, de2. Elle est 
#un facteur. 

#Nous souhaitons considerer cette variable 
#numerique et non categorique (il s'agit du resultat d'un 
#lancer de de). Afin de pouvoir faire des calculs numeriques
#sur cette variable, elle doit etre stockee dans un vecteur
#(= colonne du data frame) de valeurs numeriques. 
#R a cru que les valeurs dans cette colonne etaient de type
#caractere a cause de la valeur manquante representee par 
#un point. 

#Largument na.strings de read.table indique à R
#les chaines de caracteres a interpreter comme des valeurs 
#manquantes. Par defaut, na.strings prend la valeur "NA". 
#Il faut donc changer la valeur de cet argument comme suit.

txt <- read.table("dataEx.txt", header = TRUE, na.strings = ".")
str(txt)

#Pour obtenir plutot un vecteur de chaines de caracteres, il 
#faut modifier la valeur de l'argument stringsAsFactors comme suit.

txt <- read.table("dataEx.txt", header = TRUE, na.strings = ".", 
                         stringsAsFactors = FALSE)
str(txt)

#Nous aurions aussi pu utiliser l'argument colClasses pour 
#specifier le type de donnees dans chacune des colonnes.

txt <- read.table("dataEx.txt", header = TRUE, na.strings = ".",
                         colClasses = c("numeric", "numeric", "character"))
str(txt)

# Importation de donnees en format CSV(Comma Separated Values)

#La fonction read.csv : pour un fichier separe par des virgules (",")
#La fonction read.csv2 : pour un fichier separe par des points-virgules (";")

#github
url <- "https://raw.githubusercontent.com/fousseynoubah/dswr_slides/master/4_Importer_Donnees_dans_R/data/RGPH_MLI.csv"
RGPH_MLI_csv_online <- read.csv(url)
View(RGPH_MLI_csv_online)

csv <- read.csv2("dataEx.csv")
str(csv)
View(csv)

#la premiere ligne a correctement ete interpretee comme le nom 
#des variables, parce que l'argument header de read.csv2 prend 
#par defaut la valeur TRUE. Aussi, la valeur manquante a ete bien
#interpretee pour la variable numerique, mais pas pour la 
#variable categorique. Utilisons donc l'argument na.strings 
#comme suit pour faire correctement l'importation.

csv <- read.csv2("dataEx.csv", na.strings = "")
str(csv)

#Importation de donnees en format JSON
#Aucune fonction de l'installation de base de R ne permet de 
#lire ce format de fichier. Cependant, quelques packages 
#offrent des fonctions pour ce faire. C'est le cas de la fonction
#fromJSON du package jsonlite. 

install.packages("jsonlite")
library(jsonlite)
json <- fromJSON("dataEx.json")
View(json)
str(json)
class(json)

#Importation de donnees a partir d'un fichier EXCEL
#Afin de lire en R des donnees provenant d'un fichier EXCEL, 
#une premiere option est d'enregistrer le fichier dans un format 
#texte, puis de l'importer en R avec les moyens vus precedemment. 
#Cette procedure n'est cependant pas automatique

install.packages("readxl")
library(readxl)
excel <- read_excel("dataEx.xlsx")
str(excel)


# telecharger plusieurs fichiers en meme temps
library(readr)
fichier <- list.files("C:/Users/Anne-Francine/OneDrive - ESTIAM/2020-2021/DataScience/10-06/fichier", full.names = TRUE)
class(fichier)
fichier

fichier2 <- lapply(fichier, read_csv)
class(fichier2)
View(fichier2)

#Une leçon importante a retenir de tous les exemples 
#d'importation presentes dans ce document est qu'il faut 
#toujours verifier que l'objet R dans lequel nous avons 
#importe des donnees contient les bonnes donnees et sous 
#le bon format. Si ce n'est pas le cas, la commande d'importation de donnees
#doit etre corrigee. Plusieurs tentatives sont parfois 
#necessaires afin d'arriver a effectuer correctement l'importation.


# ecriture d'un fichier
# reprenons le data frame dataEx, auquel une colonne 
# est ajoutee contenant la somme des 2 des.

csv <- read.csv2("dataEx.csv")
str(csv)
View(csv)

dataExS <- cbind(csv, Somme = csv$de1 + csv$de2)
dataExS

#Nommons ce nouveau jeu de donnees dataExS 
# et voyons comment exporter son contenu

#Exportation de donnees dans un fichier txt
write.table(dataExS, file = "dataExS1.txt")


#Exportation de donnees dans un fichier csv
write.csv(x = dataExS, file = "dataExS3.csv")
