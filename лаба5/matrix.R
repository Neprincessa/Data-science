data <- read.transactions('./AssociationRules.csv')
rules <- apriori(data, parameter = list(supp = 0.01, conf = 0.8))
library(arulesViz)
plot(rules, shading = c('lift', 'confidence'), method = 'matrix', engine = "interactive")

