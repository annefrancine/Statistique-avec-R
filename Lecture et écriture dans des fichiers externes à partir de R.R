#Remarques:
#getwd : affiche le chemin d’accès au répertoire de travail,
#setwd : permet de changer de répertoire de travail.
#pas de \ : seuls / et \\ sont acceptés pour séparer les éléments d’un chemin d’accès;
#toujours inclure l’extension du fichier;
#encadrer le chemin de guillemets.

#Etape 1:définir le repertoire de travail

#Etape2: Accéder au système de fichiers 
#de notre ordinateur à partir de R

#Ainsi, R a accès au système de fichiers de l’ordinateur 
#à partir duquel la session a été démarrée. Par défaut, 
#l’accès se fait à partir du répertoire de travail. 
#Directement dans la console R, il est possible de voir le 
#contenu du répertoire de travail, créer des fichiers et des 
#répertoires, effacer des fichiers, etc

dir()

# Lecture de fichiers
#Documentation : https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table
#Une analyse de données en R débute typiquement par 
#l’importation de données. Les données à importer en R 
#peuvent provenir de toutes sortes de sources. 
#Elles peuvent se trouver dans des fichiers sous un certain 
#format, dans des bases de données, ou provenir directement du web. 
#En outre, il existe plusieurs formats de fichiers pour stocker des données : 
#texte (dont CSV), JSON, EXCEL, formats propres à un logiciel statistique 

# Importation de données à partir d’un fichier texte
#La lecture de données dans un fichier texte se fait principalement
#avec la fonction R read.table. Par exemple, allons lire les données contenues 
#dans le fichier dataEx.txt,qui a l’allure suivante.

?read.table

#Par défaut, read.table transforme toutes les colonnes contenant 
#des valeurs caractères en facteur (comme la fonction data.frame).

txt <- read.table("dataEx.txt")
View(txt)
str(txt)

#On peut aussi utiliser read.delim() qui est la même chose 
#que read.table, mais avec \t comme séparateur par défaut).
vente<-read.delim("venteproduits.txt")
vente
class(vente)

#Dataframe txt
#Nous pouvons tout de suite remarquer un problème avec ce 
#data frame. Le nom des variables a été interprété comme 
#une observation. Il faudrait utiliser l’argument header 
#pour indiquer que la première ligne du fichier contient 
#les noms des variables.

txt <- read.table("dataEx.txt", header = TRUE)
str(txt)

#La première variable, de1, a été correctement lu, mais il 
#y a un problème avec la deuxième variable, de2. Elle est 
#un facteur. Nous souhaitons considérer cette variable 
#numérique et non catégorique (il s’agit du résultat d’un 
#lancer de dé). Afin de pouvoir faire des calculs numériques
#sur cette variable, elle doit être stockée dans un vecteur
#(= colonne du data frame) de valeurs numériques. 
#R a cru que les valeurs dans cette colonne étaient de type
#caractère à cause de la valeur manquante représentée par 
#un point. L’argument na.strings de read.table indique à R
#les chaînes de caractères à interpréter comme des valeurs 
#manquantes. Par défaut, na.strings prend la valeur "NA". 
#Il faut donc changer la valeur de cet argument comme suit.

txt <- read.table("dataEx.txt", header = TRUE, na.strings = ".")
str(txt)

#Pour obtenir plutôt un vecteur de chaînes de caractères, il 
#faut modifier la valeur de l’argument stringsAsFactors comme suit.

dataEx_txt <- read.table("dataEx.txt", header = TRUE, na.strings = ".", 
                         stringsAsFactors = FALSE)
str(txt)

#Nous aurions aussi pu utiliser l’argument colClasses pour 
#spécifier le type de données dans chacune des colonnes.

txt <- read.table("dataEx.txt", header = TRUE, na.strings = ".",
                         colClasses = c("numeric", "numeric", "character"))
str(txt)

# Importation de données en format CSV(Comma Separated Values)

#La fonction read.csv : pour un fichier séparé par des virgules  » ,  »
#La fonction read.csv2 : pour un fichier séparé par des points-virgules  » ;  »

#github
url <- "https://raw.githubusercontent.com/fousseynoubah/dswr_slides/master/4_Importer_Donnees_dans_R/data/RGPH_MLI.csv"
RGPH_MLI_csv_online <- read.csv(url)
View(RGPH_MLI_csv_online)

csv <- read.csv2("dataEx.csv")
str(csv)
View(csv)

#la première ligne a correctement été interprétée comme le nom 
#des variables, parce que l’argument header de read.csv2 prend 
#par défaut la valeur TRUE. Aussi, la valeur manquante a été bien
#interprétée pour la variable numérique, mais pas pour la 
#variable catégorique. Utilisons donc l’argument na.strings 
#comme suit pour faire correctement l’importation.

csv <- read.csv2("dataEx.csv", na.strings = "")
str(csv)

#Importation de données en format JSON
#Aucune fonction de l’installation de base de R ne permet de 
#lire ce format de fichier. Cependant, quelques packages 
#offrent des fonctions pour ce faire. C’est le cas de la fonction
#fromJSON du package jsonlite. 

install.packages("jsonlite")
library(jsonlite)
json <- fromJSON("dataEx.json")
View(json)
str(json)
class(json)

#Importation de données à partir d’un fichier EXCEL
#Afin de lire en R des données provenant d’un fichier EXCEL, 
#une première option est d’enregistrer le fichier dans un format 
#texte, puis de l’importer en R avec les moyens vus précédemment. 
#Cette procédure n’est cependant pas automatique

install.packages("readxl")
library(readxl)
excel <- read_excel("dataEx.xlsx")
str(excel)

#Importation de données publiées sur internet


install.packages("readr")
install.packages("rvest")
install.packages("xml2")
library(rvest)
library(readr)
library(xml2)

url <- "https://en.wikipedia.org/wiki/List_of_highest-grossing_films"
page <- read_html(url)#lire le code HTML d’une page web
tables <- html_table(page, fill = TRUE)
boxoffice <- tables[[1]]
str(boxoffice)
View(boxoffice)


# télécharger plusieurs fichiers en même temps
fichier <- list.files("C:/Users/anne-francine/OneDrive - ESTIAM/2020-2021/R/22-11/fichier", full.names = TRUE)
class(fichier)
fichier

fichier2 <- lapply(fichier, read_csv)
class(fichier2)
View(fichier2)

#Une leçon importante à retenir de tous les exemples 
#d’importation présentés dans ce document est qu’il faut 
#toujours vérifier que l’objet R dans lequel nous avons 
#importé des données contient les bonnes données et sous 
#le bon format. Si ce n’est pas le cas, la commande d’importation de données
#doit être corrigée. Plusieurs tentatives sont parfois 
#nécessaires afin d’arriver à effectuer correctement l’importation.


# écriture d'un fichier
# reprenons le data frame dataEx, auquel une colonne 
# est ajoutée contenant la somme des 2 dés.

csv <- read.csv2("dataEx.csv")
str(csv)
View(csv)

dataExS <- cbind(csv, Somme = csv$de1 + csv$de2)
dataExS

#Nommons ce nouveau jeu de données dataExS 
# et voyons comment exporter son contenu

#Exportation de données dans un fichier txt
write.table(dataExS, file = "dataExS1.txt")

#Exportation de données dans un fichier EXCEL
install.packages("openxlsx")
library(openxlsx)
write.xlsx(dataExS, file = "dataExS2.xlsx")


#Exportation de données dans un fichier csv
write.csv(x = dataExS, file = "dataExS3.csv")
