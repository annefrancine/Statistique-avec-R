# Premiers pas avec R

# Remarque: si vous rencontrez des problèmes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# L’utilisation d’un fichier ou d’un dossier passe par une étape de localisation indiquant où trouver le fichier ou le dossier.
#Cette localisation peut être absolue (on donne le chemin complet depuis la racine de l’arborescence) 
#ou relative (elle se fait à partir d’un endroit particulier qui n’est plus la racine). Lorsqu’elle est relative, 
#c’est le répertoire de travail de R (wd ou working directory) 
# qui sert de référence et c’est à partir de ce répertoire que sont interprétés les chemins relatifs. 
#C’est aussi dans ce répertoire que sont sauvegardés les fichiers.


# Configuratio du répertoire de travail
# Mettre le lien entre guillemets
# N'utilisez pas de répertoires avec un espace dans le nom
# Attention: le répertoire doit exister avant le changement de localisation. 
# Dans le cas contraire, la fonction retourne un message d’erreur.

setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()#  affiche la localisation du répertoire de travail sous la forme d’un chemin absolu.


#La gestion des dossiers
# Les fonctions dir() et list.files() permettent de connaitre le contenu d’un dossier. Par défaut, seuls les noms des fichiers 
# non cachés et des sous-dossiers (sans leur contenu) sont affichés

dir(path = R.home())
list.files() 

# Nom des Contributors
contributors()

# Licence
license()

# Pour connaître la version de R, et la version des packages 
# que vous êtes en train d’utiliser

sessionInfo()

# Pour savoir comment citer un package pour une publication
# Cette fonction est très utile, car elle vous fournit 
# la référence bibliographique de n’importe quel package
citation()
citation("ggplot2")


# Pour afficher tous les objets situés dans la mémoire de l’environnement R
ls()

#importer un package
install.packages('randomForest')
install.packages('ggplot2')
install.packages("dplyr")
install.packages("devtools")

# Chargement du package

library(ggplot2)

# décharger l package
detach(package:ggplot2)

# Accès à l’aide d’une fonction
help(mean)
?mean

# lance un navigateur pour l'aide en html.
help.start() 

# Pour rechercher plus d'options sur une fonction, vous pouvez utiliser 
# le package SOS

install.packages("sos")
library(sos)
findFn("fread")

# Si vous ne connaissez pas le nom de la fonction
help.search('randomForest')
help.search('matplot')
??matplot
RSiteSearch('matplot')
example('matplot')

# pour quitter la session
# options("rstudio.errors.suppressed"=FALSE)
q()
