# Naïve Bayes

4.5        (Naïve Bayes)  In this assignment you will train a Naïve Bayes classifier on categorical data and predict individuals’ incomes.  Import the nbtrain.csv file.  Use the first 9010 records as training data and the remaining 1000 records as testing data.

a.      Construct the Naïve Bayes classifier from the training data, according to the formula “income ~ age + sex + educ”.  To do this, use the “naiveBayes” function from the “e1071” package.  Provide the model’s a priori and conditional probabilities.

b.      Score the model with the testing data and create the model’s confusion matrix.  Also, calculate the overall, 10-50K, 50-80K, and GT 80K misclassification rates. Explain the variation in the model’s predictive power across income classes.

4.6        (Naïve Bayes)  As in assignment 4.5, import the nbtrain.csv file.  Use the first 9010 records as training data and the remaining 1000 records as testing data.

a.      Construct the classifier according to the formula “sex ~ age + educ + income”, and calculate the overall, female, and male misclassification rates.  Explain the misclassification rates?

b.      Divide the training data into two partitions, according to sex, and randomly select 3500 records from each partition.  Reconstruct the model from part (a) from these 7000 records.  Provide the model’s a priori and conditional probabilities.

c.       How well does the model classify the testing data?  Explain why.

d.      Repeat step (b) 4 several times.  What effect does the random selection of records have on the model’s performance?

e.      What conclusions can one draw from this exercise?
