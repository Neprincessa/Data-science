# Data Analysis in R

Load the text file of income data you created in the Problem 3.1.1 into R (zipIncome.txt).

                            Change the column names of your data frame so that zip_Prefix becomes zipCode and meanhouseholdincome becomes income.

a.      Analyze the summary of your data.  What are the mean and median average incomes?

b.      Plot a scatter plot of the data.  Although this graph is not too informative, do you see any outlier values?  If so, what are they?

                            In order to omit outliers, create a subset of the data so that:

      $7,000 < income < $200,000

c.        What’s your new mean?

d.       Create a simple box plot of your data.  Be sure to add a title and label the axes.

e.      In the box plot you created, notice that all of the income data is pushed towards the bottom of the graph because most average incomes tend to be low.  Create a new box plot where the y-axis uses a log scale.  Be sure to add a title and label the axes.

                            Use the ggplot library in R, which enables you to create graphs with several different types of plots layered over each other.  Be sure to read the documentation for ggplot and load the library ggplot2 (you may have to install this package into R). 

f.        Make a ggplot that consists of just a scatter plot using the function geom_point() with position = “jitter”  so that the data points are grouped by zip code.  Be sure to use ggplot’s function for taking the log10 of the y-axis data.  (Hint: for geom_point, have alpha=0.2).

g.        Create a new ggplot by adding a box plot layer to your previous graph.  To do this, add the ggplot function geom_boxplot().  Also, add color to the scatter plot so that data points between different zip codes are different colors.  Be sure to label the axes and add a title to the graph.

h.       What can you conclude from this data analysis/visualization?
