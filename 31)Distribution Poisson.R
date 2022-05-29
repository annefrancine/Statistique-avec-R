#La distribution de Poisson est une distribution de probabilité discrète.

#La distribution de Poisson décrit la distribution de probabilités lorsque les événements étudiés
#ont lieu dans une fourchette de temps délimité ou dans un lieu défini.

#La probabilité qu'un événement survienne est la même pour chaque unité de temps et d'espace.

#Le nombre d'événements qui survient dans une unité de temps et d'espace est indépendant du 
#nombre d'événements qui survient dans une autre unité.

#Quand utiliser la loi de Poisson ?
#Lorsque la loi binomiale ne peut pas s'appliquer en raison des limites de calcul des outils 
#informatiques (nombre d'événements trop élevé)
#Lorsque le taille de l'échantillon n est inconnu.

#Considérez un processus qui a un taux de défaut de 0,5 par unité.
#Quelle est la probabilité qu'une unité présente deux défauts? Et pas de défauts?

?dpois
dpois(2, 0.5)
dpois(0, 0.5)
