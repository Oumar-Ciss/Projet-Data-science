
library(mlogit)
library(lmtest)
library(car)

# Chargement des données
data("Fishing", package = "mlogit")
Fish <- dfidx(Fishing, varying = 2:9, choice = "mode", idnames = c("chid", "alt"))

# Estimation du modèle probit multinomial
Fish.mprobit <- mlogit(mode ~ price | income | catch, Fish, probit = TRUE, alt.subset = c('beach', 'boat', 'pier'))

# Affichage des résultats du modèle
summary(Fish.mprobit)

# Normalité des résidus
residuals_standardized <- residuals(Fish.mprobit, type = "standardized")
shapiro_test <- shapiro.test(residuals_standardized)
print(shapiro_test)

# Indépendance des résidus

dw_test <- dwtest(Fish.mprobit)
print(dw_test)

# Homoscédasticité
bptest(Fish.mprobit)
#Les intercepts pour "boat" et "pier" sont significatifs avec des p-values respectives de 0.0429 et 0.0228.
#Cela indique que, toutes choses égales par ailleurs, il y a une tendance à préférer "boat" et "pier" par rapport à la référence (probablement "beach").
#price : Le coefficient est négatif et très significatif (p < 0.001), ce qui signifie que l'augmentation du prix diminue la probabilité de choisir une 
#option de pêche. Plus précisément, pour chaque unité d'augmentation du prix, la probabilité de choisir une option diminue.
#income : Les coefficients pour "income" ne sont pas significatifs, suggérant que le revenu n'a pas 'un impact significatif sur le choix de la méthode de pêche.
#catch : Le coefficient pour "catch" est positif et significatif pour "beach" (p < 0.001) et "pier" (p = 0.0225). 
#Cela signifie que des prises plus élevées augmentent la probabilité de choisir "beach" et "pier". Le coefficient pour "boat" n'est pas significatif.

