# Logistics Regression
## Part 1

4.4        (Logistic regression)  If one predicts the probability of success of all the data points in a training set using a logistic regression model and adds up all of these probabilities, this number will equal the number of successes in the training set.  In other words, “the probability mass equals the counts.”  In this assignment, you will analyze this fact by using the same survey.csv dataset that was used is in Lab Exercise 7: Logistic Regression. Do this by creating a Postgresql query that uses MADlib functions.

Create a Postgresql query using MADlib functions

Ø  Enter the psql environment and connect to the training2 database. Create a table named survey with the same number of columns as survey.csv, all of type integer (drop any table named survey that already exists).  Import the data in survey.csv into the survey table you just created in database training2.

Ø  As done in Lab Exercise 6: Linear Regression, create a column in the survey table that consists of the integer 1 for all of the rows of data. 

Ø  Since the price column’s values are categorical between $10, $20, and $30, create the following additional columns in the survey table:

§  price20 - will have the value 1 if the price is $20, 0 otherwise

§  price30 - will have the value 1 if the price is $30, 0 otherwise

Ø  In order to create a logistic model on the data, the dependent variable (mydepv) needs to be of type Boolean while all of the independent variables need to be in the form of an array. 

Ø  Create a new table called survey2 (drop it if it already exists) that contains the data from survey.  To use the MADlib logistic regression function, Survey2 needs to have two columns as follows.  The first column is a Boolean variable that is populated with the dependent variable mydepv.  The second column is an array of integers for the independent variables.

a.      Use the MADlib function logregr to create a logistic regression model and display only the coefficients of the independent variables.  Note: You can refer to the documentation for logregr at:

 http://devdoc.madlib.net/v0.3/group__grp__logreg.html   

(the link is dead, as actual version of MADlib is 1.17.0, not 0.3)

MADlib API had been changed, so please follow instructions in the assignment, as MADlib in the VM is outdated (in case you still use it).  

b.      For every unit increase in income while all other independent variables remain constant, by what percentage does the odds-ratio increase/decrease?

c.       If the price of a row of data were to increase from $10 to $30 while all other independent variables remained constant, by what percentage would the odds-ratio increase/decrease?

 

Ø  Use our logistic regression model to make predictions on probability of success for each of the rows of data in the survey table. Add a column named odds_ratio to the survey table that calculates the odds-ratio of each row of data. Add another column to the survey table named prediction that uses the odds_ratio column data to solve for the probability of success for a row of data.

d.      Test the rule that the probability mass equals the counts.  Use the survey table and take the sums of the mydepv column and the prediction column.  Are the values equal? Excluding rounding errors, does probability mass equal count?

e.       Using the logistic model we have created, what is the likelihood of a person who is 25 years old with an income of $58,000 accepting an offer with a price of $20?


## Part 2


Базовая версия задания абсолютно наглым образом взята из курса по машинному обучению в Стэнфордском университете, читаемым Эндрю Н. Также данный курс бывает периодически доступен на Coursera'е. Желающие могут записаться на него (если он сейчас доступен), что бы посмотреть оригинальные лекции.

В данном задании вам предлагается реализовать различные методы обучения регрессионных моделей. Вам будет дан начальный код для Octave (бесплатный аналог Matlab), в который вам надо лишь вставить ключевые моменты алгоритмов (реализаций функций ошибок, подсчет градиентного спуска, регуляризации, нормального уравнения и т.п.), формулы которых были рассмотрены на лекции и даны (!) в методических материалах.

Вам необходимо сделать только по логистической регрессии. Часть с нейронными сетями делать не надо!

Брать тут: в файлах из директории `mlclass-ex2`

P.S.  Да, старайтесь использовать "векторизованные" вычисления, т.к.  Matlab и Octave оптимизированы на их выполнение и в этом случае ваш код будет работать быстрее и выглядеть гораздо проще и симпатичней ^_^.  

Задание сдается в режиме защиты на занятии с демонстрацией результатов и ответа на вопросы по теории и коду.
