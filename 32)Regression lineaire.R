#Nous allons nous appuyer sur des données de naissances à Philadelphie, en 1990 (Elo, Rodgriguez, and Lee 2001). L'échantillon concerne  
#5 %des naissances ayant eu lieu dans cette ville en 1990, ce qui représente  
#1115 observations. Chaque enregistrement renseigne sur :
  
# grams : masse à la naissance (grammes) ;
# gestate : temps de gestation (semaines) ;
# educ : nombre d'années d'éducation de la mère (0-17);
# black : variable indicatrice de la couleur de peau de la mère (1 si oui, 0 sinon);
# smokeindique si la mère a fumé pendant la grossesse (1 si oui, 0 sinon).


url <- "http://data.princeton.edu/wws509/datasets/phbirths.dat"
births <- read.table(url, header = TRUE)
head(births)

#Resume statistique
summary(births)

# Les correlations
round(cor(births), 2)

# Un aperçu graphique des données
library(ggplot2)
qplot(data = births, grams, fill = I("dodger blue"))
qplot(data = births, gestate, fill = I("dodger blue"))
qplot(data = births, educ, fill = I("dodger blue"))
qplot(data = births, black, fill = I("dodger blue"))
qplot(data = births, smoke, fill = I("dodger blue"))

#Si on souhaite regarder les différentes valeurs que prennent chaque variable pour chaque observation, 
# on peut utiliser la petite astuce consistant à utiliser la fonction seq_along()

# Pour avoir des nuages de points
p_1 <- qplot(data = births, seq_along(grams), grams) + xlab("Index")
p_2 <- qplot(data = births, seq_along(gestate), gestate) + xlab("Index")
p_3 <- qplot(data = births, seq_along(educ), educ) + xlab("Index")

library(gridExtra)
grid.arrange(p_1, p_2, p_3, ncol=3)

#Pour avoir une idée de la relation possible entre la reponse et chaque variable explicative, 
#il est interessant de tracer les graphiques suivants.

p_1 <- qplot(data = births, grams, gestate,
             geom = c("point", "smooth"))
p_2 <- qplot(data = births, educ, gestate, 
             geom = c("point", "smooth"))
p_3 <- qplot(data = births, black, gestate, position = "jitter")
p_4 <- qplot(data = births, smoke, gestate, position = "jitter")

grid.arrange(p_1, p_2, p_3, p_4, ncol=2)

#Estimation des parametres

#La fonction permettant de réaliser une régression linéaire avec R se nomme lm(). 
#Il est nécessaire de fournir une formule à l'arguemnt formula. L'argument data indique le tableau de
#donnees (la liste, ou un objet convertible en data.frame) dans lequel les variables 
#mentionnees dans la formule se trouvent

reg <- lm(grams ~ gestate, data = births)
reg

#On lit dans la sortie que le coefficient de la constante vaut -3245.446394 et que 
# le coefficient associe à la variable gestate vaut 166.4462854.

#Comme on peut le voir sur les graphiques proposes precedemment, la relation entre la masse 
# du nouveau né et le temps de gestation semble plus quadratique que linéaire. Pour introduire le
# carré de la durée de gestation, on utilise la fonction I()

reg_2 <- lm(grams ~ gestate + I(gestate^2), data = births)
reg_2

# Lecture des sorties 

#call : la fomule du modèle ;
#Residuals : des statistiques descriptives des residus ;
# Coefficients : un tableau à deux entrées où les lignes correspondent aux coefficients associés aux variables explicatives, et les colonnes, dans l'ordre, à l'estimation du coefficient, l'écart-type estimé, la valeur du test de Student de nullité statistique du coefficient et enfin la p-value associé à ce test, suivie d'un symbole pour lire rapidement la significativité ;
#Signif. codes : les significations des symboles de niveau de significativité ;
#Residual standard error : estimation de l'écart-type de l'aléa et degré de liberté ;
#Multiple R-squared : coefficient de détermination ;
#Adjusted R-squared : coefficient de détermination ajuste ;
#F-statistic : valeur de la statistique de Fisher du test de significativité globale, ainsi que les
#degrés de liberté et la p-value associée au test.

summary(reg)

# Extractions

#L'objet retourné par la régression contient plusieurs éléments auxquels il est possible d'accéder. Voici les principaux

# coefficients un vecteur de coefficients (nommé) ;
# residuals les residus ;
# fitted.values : les valeurs estimees ;
# df.residual : nombre de degrés de liberte.

names(reg)

reg$coefficients

# Residus
qplot(seq_along(reg$residuals), reg$residuals) +
  xlab("") + ylab("Résidus")

# Ordonnons les résidus en fonction de la masse des nouveaux-nés
ind <- order(births$grams)
qplot(seq_along(reg$residuals[ind]), reg$residuals[ind]) +
  xlab("") + ylab("Résidus")

#Variables categorielles 

#En R, les variables categorielles sont de mode factor. Si on souhaite intégrer une variable catégorielle
# à un modèle de régression linéaire, il y a deux méthodes. La première, est de définir le type de la variable
# dans le tableau qui contient les données (tibble, data.frame, .). La seconde est d'utiliser la variable 
# factor() dans la formule, lors de l'appel de la régression. La première méthode possède l'avantage de la 
# lisibilite, surtout lorsque l'on souhaite définir la valeur de réference.

#Lorsque la variable est de type logical ou character, la conversion est faite automatiquement par R. 
# Le choix de la classe de référence est aussi effectué automatiquement

class(births$smoke)

summary(reg_3 <- 
          lm(grams ~ gestate + smoke + black,
             data = births))

# Equivalent de 
summary(reg_3 <- 
          lm(grams ~ gestate + factor(smoke) + factor(black),
             data = births))

#Pour changer la valeur de reference, on peut utiliser la fonction fct_relevel() de {forcast}, ou bien preciser
# manuellement les niveaux au moment de la créqtion du facteur (le premier niveau énoné devenant la 
# modalité de référence).

births <- 
  births %>%
  mutate(smoke = factor(smoke))

levels(births$smoke)

births <- 
  births %>% 
  mutate(smoke = fct_relevel(smoke, "TRUE"))

# Au moment de la création
births <- 
  births %>% 
  mutate(black = factor(black, levels = c("TRUE", "FALSE"),
                        labels = c("Black", "Not Black")))

reg_3 <- lm(grams ~ gestate + smoke + black, data = births)
summary(reg_3)

#Une alternative à fct_relevel() est la fonction relevel()

exemple <- relevel(births$smoke, ref = "FALSE")
levels(exemple)

# Tests  de nullité des coefficients 

# Intervalles de confiance à 95% pour les paramètres
confint(reg_3)

# Intervalles de confiance à 90% pour les paramètres
confint(reg_3, level = 0.95)

# Voici une fonction qui permet d'afficher les intervalles de confiance pour chaque coefficient.

#' @param x : objet issu de lm()
confint_bar <- function(x){
  df <- data.frame(confint(x))
  colnames(df) <- list("b_inf", "b_sup")
  df$variable <- rownames(df)
  rownames(df) <- NULL
  df$coef <- coef(x)
  
  ggplot(df, aes(x = factor(1), y = coef)) +
    geom_errorbar(aes(ymin = b_inf, ymax = b_sup)) +
    geom_point(col = "dodger blue", size = 3) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    facet_wrap(~variable, scales = "free_y") +
    xlab("") +
    theme(axis.ticks = element_blank(),
          axis.text.x = element_blank())
  
}

# On peut alors appliquer cette fonction au résultat d'une régression linéaire :

confint_bar(reg_3)


