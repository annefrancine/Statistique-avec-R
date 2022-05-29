
# 1) : On souhaite convertir des objets de mode 
#logical en mode numeric 

logique <- c(FALSE, FALSE, TRUE, TRUE, FALSE, TRUE)
class(logique)
conversion_numerique <- as.numeric(logique)
conversion_numerique
class(conversion_numerique)

#2) : On souhaite convertir des objets de mode 
#character en mode numeric 

caractere <- c("1", "2", "3", "A", "/", "T", "%", "-")
class(caractere)
conversion_numerique<- as.numeric(caractere)
conversion_numerique 
class(conversion_numerique)

#3) : On souhaite convertir des objets de mode 
#numeric en mode logical 
numerique <- 0:5
class(numerique)
conversion_logique1 <- as.logical(numerique)
conversion_logique1 
class(conversion_logique1)

#4) : On souhaite convertir des objets de mode character 
# en factor

string<-c("femme","homme","homme","homme","femme","homme","femme","femme")
class(string)
facteur <- as.factor(string)
facteur
class(facteur)

#5) On souhaite convertir la matrice a en une data.frame b

a <- matrix(1:25, nrow = 5, ncol = 5)
a
class(a)
b <- as.data.frame(a)
b
class(b)

#6) La conversion d'un facteur en numerique 
facteur <- factor(c(1, 5, 10))
class(facteur)

facteur_numerique1 <- as.numeric(facteur)
facteur_numerique1
class(facteur_numerique1)

 