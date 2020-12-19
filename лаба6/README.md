# Linear Regression

4.3        (Linear Regression)  In this assignment, you will analyze linear regression models on different categories of data about average households in the United States.

Gather and Prepare Data

Ø  Load zeta dataset, and remove all  meanhouseholdincome duplicates (or more formally only females records should be in the dataset) that does not have any duplicate rows of data (done in homework 3.2). 

Ø  Remove the columns zcta and sex from the imported table.

Ø  Remove outliers by creating subsets of the original data so that: 

8 < meaneducation < 18

10,000 < meanhouseholdincome < 200,000

0 < meanemployment < 3

20 < meanage < 60

Ø  Create a variable called log_income = log10(meanhouseholdincome).

Ø  Rename the columns meanage, meaneducation, and meanemployment as age, education, and employment, respectively.

Linear Regression Analysis

a.      We will be analyzing this data with income as the dependent variable and the other columns as independent variables.  Create a scatter plot showing the effect age has on log_income and paste it here.  Do you see any linear relationship between the two variables?

b.      Create a linear regression model between log_income and age.  What is the interpretation of the t-value? What kind of t-value would indicate a significant coefficient?

c.       What is the interpretation of the R-squared value?  What kind of R-squared value would indicate a good fit?

d.      What is the interpretation of the F-statistic?  What kind of F-statistic indicates a strong linear regression model?

e.      View a detailed summary of the previous model.  What is the R-squared value?  Does this suggest that the model is a good fit? Why?

f.        Create a scatter plot showing the effect education has on log_income.  Do you see any linear relationship between the two variables?

g.      Analyze a detailed summary of a linear regression model between log_income and education.  What is the R-squared value?  Is the model a good fit?  Is it better than the previous model?

h.      Analyze a detailed summary of a linear regression model between the dependent variable log_income, and the independent variables age, education, and employment.  Is this model a good fit?  Why?  What conclusions can be made about the different independent variables?

i.        Based on the coefficients of the multiple regression model, by what percentage would income increase/decrease for every unit of education completed, while all other independent variables remained constant?

j.        Create a graph that contains a y = x line and uses the multiple regression model to plot the predicted data points against the actual data points of the training set. 

k.       How well does the model predict across the various income ranges?

# Gradients

Базовая версия задания абсолютно наглым образом взята из курса по машинному обучению в Стэнфордском университете, читаемым Эндрю Н. Также данный курс бывает периодически доступен на Coursera'е. Желающие могут записаться на него (если он сейчас доступен), что бы посмотреть оригинальные лекции.

В данном задании вам предлагается реализовать различные методы обучения регрессионных моделей. Вам будет дан начальный код для Octave (бесплатный аналог Matlab), в который вам надо лишь вставить ключевые моменты алгоритмов (реализаций функций ошибок, подсчет градиентного спуска, регуляризации, нормального уравнения и т.п.), формулы которых были рассмотрены на лекции и даны (!) в методических материалах.

Брать тут: 1.

P.S.  Да, старайтесь использовать "векторизованные" вычисления, т.к.  Matlab и Octave оптимизированы на их выполнение и в этом случае ваш код будет работать быстрее и выглядеть гораздо проще и симпатичней ^_^.  

Задание сдается в режиме защиты на занятии с демонстрацией результатов и ответа на вопросы по теории и коду.

