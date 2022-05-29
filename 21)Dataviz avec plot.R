# définir le répertoire de travail
#Dataviz avec plot

?plot

plot(iris)

#Tracer un graphique ( plot) illustrant toutes les
#valeurs de x dans l'ordre et à intervalles réguliers
x <- c(1:10)
x
plot(x) 

#Tracer un graphique, un nuage de points où y = f(x) 
y = log10(x)
y
plot(y~x)

#Ajouter un titre
plot(x,y,main="titre")

#Mettre un titre en bas ou sous-titre 
plot(x,y,sub="sous-titre")

#Changer la couleur de la courbe et des points
plot(x,y,col="red")

# Type de graphiques (points seuls, reliés...)
plot(x,y,type="b")    # points reliés - espaces points-lignes
plot(x,y,type="o")    # points reliés - pas d'espace
plot(x,y,type="l")    # que les lignes
plot(x,y,type="p")    # que les points
plot(x,y,type="s")    # en marches type "histogramme"

# Taille des points : changer la taille des points  
plot(x,y, cex=2)
# exemple
x = c(1,3,6) ; y = c(1,5,8) ; plot(x,y, cex=1.5, type="o")
x = c(2,4,5) ; y = c(2,4,7) ; points(x,y, cex=3, type="o") 

#Epaisseur des lignes : faire varier la valeur de l'attribut "lwd"
plot(x,y,lwd=2)

#Type de ligne (continue ou en pointillés) : faire varier la valeur de l'attribut "lty" 
plot(x,y, lty=3) 

#Types de points : afficher les points sous forme de rond (1),
#de triangle (2) de croix (3 ou 4) ou de ronds pleins (16)

plot(x,y, pch=16) 

#Donner des titres et unités aux axes

plot(x,y,xlab = "titre de l'axe x",ylab = "axe y")

#Paramétrer les limites des axes : limiter le graphique en 
#x (xlim) ou en y (ylim)
plot(x,y,xlim=c(0,10)) # l'axe x va de 0 à 10
plot(x,y,ylim=c(2,5)) # l'axe y va de 2 à 5 

#export des graphiques
#exemple1
x = c(1,3,6) ; y = c(1,5,8)
plot(x,y)
dev.print(png,filename="xy.png", width=7, height=7,units="in",res = 200)
dev.off()

#exemple2
d = c(3,4,3.5,2)
par(lwd=2) # doit précéder la fonction barplot pour changer l'épaisseur des traits du diagramme
c<-barplot(d, density=c(5,15,30),angle=c(0,45,70),col=6)
# density = nombres de traits par unité de surface (densité)
# angle = angle des traits

dev.print(png,filename="barplot.png", width=7, height=7,units="in",res = 200)
dev.off()

#exemple3
plot(iris)
dev.print(png,filename="irisdata.png", width=7, height=7,units="in",res = 200)
dev.off()
