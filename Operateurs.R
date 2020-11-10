# What are the differences between “=” and “<-” assignment operators in R?
# https://stackoverflow.com/questions/1741820/what-are-the-differences-between-and-assignment-operators-in-r

?Syntax

getwd()

#Opérateurs arithmétiques

#Addition : L'opérateur ‘+’ ajoute deux opérandes. Par exemple, x+y.
#Soustraction: l'opérateur ‘ - ' soustrait deux opérandes. Par exemple, x-y.
#Multiplication: l'opérateur '*' multiplie deux opérandes. Par exemple, x*y.
#Division: l'opérateur '/' divise le premier opérande par le second. Par exemple, x/y.
#Module: l'opérateur ' % %' renvoie le reste lorsque le premier opérande est divisé par le second. Par exemple, x%%y).
#Division entière : Lorsque nous divisons des entiers avec %/% , le quotient est également un entier.Par exemple, x%/%y
#Exposant : '^ ou **' consiste à multiplier un élément par lui-même plusieurs fois de suite


7 + 7
7 - 4
5 * 5
6 / 6
3^2
3**2
16 %% 3 
3+7/5
((1+sqrt(5))/2)

# L’acte d’assignation / Objet

a <- 1.2
a

# a est une variable, en interne c’est un vecteur de taille 1 et il peut contenir des données
# numériques  le typage est donc automatique Dans la terminologie R, a est un « objet »
# Dans R, un objet représente un concept, une idée. Il se matérialise par une entité qui possède sa propre identité

nom <- "Keïta"
prenom <- "Mobido"
annee_arrivee_pouvoir <- 1960
nom
prenom
annee_arrivee_pouvoir
a <- 5; a + 2

# Conventions pour les noms d’objets
# Les noms d’objets ne peuvent commencer par un chiffre
# Le R est sensible à la casse, ce qui signifie que foo, Foo et FOO sont trois objets distincts. Un moyen simple d’éviter des erreurs liées à la casse consiste
# à n’employer que des lettres minuscules.
# x Certains noms sont utilisés par le système R, aussi vaut-il mieux éviter de
# les utiliser

# La notion de classe et de type

#Quand on a faire à des objets dont on ignore l’identité, l’on peut s’appuyer la fonction class. Celle-ci permet de connaître la classe de l’objet. La classe est un attribut qui contribue à la formation de l’idée d’un objet. “Avec quoi se mélange-t-il?”
#“A quelles règles de transformation se soumet-il?” Basiquement, la classe dicte les principes régissant la manipulation de cet objet. Testons la fonction sur les objets que nous venons de créer pour bien confirmer les identités qu’on leur a attribuées.
?class
class(nom)
class(annee_arrivee_pouvoir)

# Opérateurs relationnels
# >  strictement supérieur
# <  strictement inférieur
#  >= # supérieur ou égal
#  <= # inférieur ou égal
# != # différent
#  == # égal   ( oui il faut mettre == et pas =)
# And
(x==8) & (x==6)
(x==7) & (x>=5)
(x==8) & (x==7)

# Or
(x==8) | (x>5)
(x==8) | (x>=5)

# Not
x > 8
print(!x > 8)

x <- 7

x > 8
x < 8
x <= 8
x >= 8
x == 8
x != 8