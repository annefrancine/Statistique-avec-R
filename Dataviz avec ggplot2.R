#Dataviz avec ggplot2
# Par exemple
install.packages("ggplot2")
install.packages("ggridges")
library(ggplot2)
library(ggridges)

ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(aes(fill = Species)) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07"))

p <- ggplot(mpg, aes(class, hwy))
  p + geom_boxplot()
  
#1) Définition de la couche canevas
#Pour définir ce que j’appelle la couche canevas, on utilise 
#la fonction “ggplot()” et son argument “aes().”. 
#Les graphs construits avec ggplot2 commencent toujours 
#par ce type de ligne de code :

ggplot(dataset, aes(x=, y = ))

# Par exemple:

ggplot(mtcars, aes(x=disp, y=mpg))

#2)Définition du type de plot : geom_XXX
#Il s’agit ensuite de définir le type de graph que l’on souhaite 
#réaliser : un scatter plot, un boxplot, un barplot, etc… 
#Pour cela, on rajoute un signe plus en bout de la première
#ligne (celle du canevas), et on ajoute une nouvelle ligne 
#avec la fonction adéquate : geom_point() pour un scatter plot, 
#geom_boxplot() pour un boxplot, geom_bar() pour un barplot etc…

ggplot(mtcars, aes(x=disp, y=mpg))+
  geom_point()


#3) Définition des options du graph
#Dans un troisième temps, on affine le graph, en précisant différentes couches concernant :

#les échelles des axes : avec la fonctions scale_x_continuous(), par exemple
#les couleurs : avec la fonction scale_colour_manual(), par exemple
#les noms des axes, avec les fonctions xlab(), ylab(), par exemple
#la légende avec, par exemple, avec la fonction theme(legend.position,=”bottom”)

#Par exemple, pour passer l’axe des x dans l’échelle log, on ajoute la couche correspondante, grâce à la fonction coord_trans().

ggplot(mtcars, aes(x=disp, y=mpg))+
  geom_point() +
  coord_trans(x="log10")

#Dataviz iris
?iris
View(iris)

#1)Le scatterplot de base
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))+
  geom_point()

#2)Définir des couleurs selon une variable
#Le jeu de données comporte, en réalité, trois espèces d’iris
#différentes (variable Species). Pour représenter les points avec 
#une couleur différente par espèce, on va définir l’argument colour dans la fonction aes() de la partie “canevas” 2)

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()

#3)Choisir d’autres couleurs
#Pour choisir d’autres couleurs que celles appliquées par défaut, 
#on utilise la fonction scale_colour_manual(). 

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))

#4)Utiliser des formes de points différentes
#Pour cela, on utilise l’argument shape dans aes() :

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, shape=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))

#5)Choisir les formes des points
#Pour cela, on utilise scale_shape_manual()

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, shape=Species))+
  geom_point()+
  scale_shape_manual(values=c(21,23,25))

#6)Gérer la taille des points
#On peut représenter les points avec des tailles différentes,
#par exemple en fonction de la valeur d’une variable. 
#Pour cela, on utilise l’argument size dans aes().

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, size=Petal.Length))+
  geom_point()

#7)Ajouter une courbe ou droite de régression
#Pour cela on utilise la fonction geom_smooth(). 
#Par défaut, c’est une courbe de régression locale (LOESS) 
#si n < 1000. Sinon c’est une courbe de modèle additif généralisé qui est employée.  

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))+
  geom_smooth( colour="red")

# Il est possible d’obtenir une droite de régression,
#en ajoutant l’argument method=”lm”

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))+
  geom_smooth(method="lm", colour="red")

#Il est aussi possible d’obtenir une droite par espèce, 
#en utilisant l’argument group dans la fonction aes() de 
#la première ligne.

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, group=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))+
  geom_smooth(method="lm", colour="red")

#Boxplot de base
#on utilise la fonction geom_boxplot()

ggplot(iris, aes( y=Sepal.Length,x=Species))+
  geom_boxplot()

#Pour utiliser des couleurs dans les boites, ici on utilise
#l’argument fill et non colour, dans la fonction aes(), 
#car il s’agit de “remplir” les boites :

ggplot(iris, aes( y=Sepal.Length,x=Species, fill=Species))+
  geom_boxplot()

#Pour ajouter les observations, on utilise la couche geom_jitter().
ggplot(iris, aes( y=Sepal.Length,x=Species, fill=Species))+
  geom_boxplot()+
  geom_jitter()

#Les axes, titres et légende
#Vous pouvez donner un titre à votre graph avec la fonction
#ggtitle(), puis renommer les axes avec ylab() et xlab().
#La position de la légende se gère avec theme(legend.position=” “).

ggplot(iris, aes( y=Sepal.Length,x=Species, fill=Species, colour=Species))+
  geom_boxplot(alpha=0.5)+
  geom_jitter(width=0.25)+
  ggtitle("Mon super premier boxplot")+
  ylab("Longueur des sépales")+
  xlab("Espèces")+
  theme(legend.position="bottom")

#Les thèmes
#Il existe également des thèmes de graphs 
#classic

ggplot(iris, aes( y=Sepal.Length,x=Species, colour=Species))+
  geom_boxplot(alpha=0.5)+
  geom_jitter(width=0.25)+
  theme_classic()

#dark
ggplot(iris, aes( y=Sepal.Length,x=Species, colour=Species))+
  geom_boxplot(alpha=0.5)+
  geom_jitter(width=0.25)+
  theme_dark()

#Il existe même un thème pour les nostalgiques d’Excel!
install.packages("ggthemes")
library(ggthemes)
ggplot(mtcars) +
  geom_point(aes(x = wt, y = mpg, colour = factor(gear))) +
  facet_wrap(~am)+
  theme_excel() +
  scale_colour_excel()

##########################################################

#Barplot 
#En utilisant le jeu de données “mtcars”, imaginons, par exemple, que je veuille représenter le nombre de voitures ayant 3,4 ou 5 vitesses (variables gear) :
  # pas de y car c'est un comptage
View(mtcars)
?mtcars

ggplot(mtcars,aes(as.factor(gear)))+
  geom_bar()

#Pour ajouter des couleurs aux barres, comme précédemment,
#j’utilise l’argument fill et j’indique quelle variable doit 
#être considérée 

ggplot(mtcars,aes(as.factor(gear), fill=as.factor(gear)))+
  geom_bar()

#Pour représenter le nombre de données par vitesse, 
#en fonction d’une autre variable (ici le nombre de carburateurs),
#il suffit de l’indiquer dans l’argument fill

# en prenant en compte deux variables catégorielles (ici carb et gear)
ggplot(mtcars,aes(as.factor(gear), fill=as.factor(carb)))+
  geom_bar()

# On peut encore ramener la somme des comptages à 1,
#autrement dit de représenter les comptages
#sous la forme de pourcentages. Pour cela,
#on utilise l’argument position=”fill” :

ggplot(mtcars,aes(as.factor(gear)))+
  geom_bar(aes(fill=as.factor(carb)),position = "fill")

#Il est également possible de représenter ces données avec
#un autre positionnement, en utilisant l’option dodge.

ggplot(mtcars,aes(as.factor(gear), fill=as.factor(carb)))+
  geom_bar(position = "dodge")

#Le facetting
#C’est une des grandes possibilités de ggplot2. Ca consiste
#à sous diviser un graph, selon les modalités d’une ou plusieurs
#variables. Ici par exemple, je vais utiliser le jeu de données
#Melanoma du package MASS, et je vais étudier les relations entre
#la variable thickness et time, pour chacune des modalités de 
#la variable status

install.packages("MASS")
library(MASS)
View(Melanoma)
head(Melanoma)
str(Melanoma)

ggplot(Melanoma, aes(y=thickness, x=time))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~status)

#La division peut également être faite en fonction de deux variables
ggplot(Melanoma, aes(y=thickness, x=time))+
  geom_point()+
  geom_smooth()+
  facet_grid(sex~status)

dev.print(png,filename="melanoma.png", width=7, height=7,units="in",res = 200)
dev.off()

#pie charts
df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)
head(df)

bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp

pie <- bp + coord_polar("y", start=0)
pie
