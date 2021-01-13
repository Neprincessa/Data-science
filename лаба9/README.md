# Decision Trees

4.7         (Decision Trees)  In this assignment you will train a classification tree, using the survey data from Lab Exercise 7: Logistic Regression.  Import the survey data survey.csv from Lab Exercise 7: Logistic Regression into R, storing rows 1 through 600 as training data and rows 601 through 750 as testing data.

a.      Build a classification tree from the training data using the “rpart” package, according to the formula “MYDEPV ~ Price + Income + Age”.  Use three-fold cross-validation and the information gain splitting index.  Which features were actually used to construct the tree?  (see the “printcp” function)  Plot the tree using the “rpart.plot” package.

b.      Score the model with the training data and create the model’s confusion matrix.  Which class of MYDEPV was the model better able to classify?

c.       Define the resubstitution error rate, and then calculate it using the confusion matrix from the previous step.  Is it a good indicator of predictive performance?  Why or why not?

d.      Using the “ROCR” package, plot the receiver operating characteristic (ROC) curve.  Note: For a refresher on how to use the ROCR package, see Lab Exercise 7: Logistic Regression.  Calculate the area under the ROC curve (AUC).  Describe the usefulness of this statistic.

e.      Score the model with the testing data.  How accurate are the tree’s predictions?

f.        Repeat part (a), but set the splitting index to the Gini coefficient splitting index.  How does the new tree compare to the previous one? 

g.      Pruning is a technique that reduces the size/depth of a decision tree by removing sections with low classification power, which helps reduce overfitting and simplifies the model, reducing the computational cost.  One way to prune a tree is according to the complexity parameter associated with the smallest cross-validation error.  Prune the new tree in this way using the “prune” function.  Which features were actually used in the pruned tree?  Why were certain variables not used?

h.      Create the confusion matrix for the new model, and compare the performance of the model before and after pruning.
