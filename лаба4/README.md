# K-Means K-means Clustering

4.1a        (K-means)  You have been asked to cluster all 50 U.S. states, including Washington D.C. and Puerto Rico, by mean household income and mean household electricity usage (both rounded by the integer).  You have decided to use a k-means clustering algorithm.

Access the census data in the training2 database.  Create a table with three columns: state, mean household income, and mean electricity usage.  Note: If the housing_nodupes table isn’t present in the database, repeat the steps from Lab Exercise 1.3 Database Environment – Census Data to recreate it.

a.      Cluster the data and plot all 52 data points, along with the centroids.  Mark all data points and centroids belonging to a given cluster with their own color.  Here, let k=10.

b.      Repeat step (a) several times.  What can change each time you cluster the data?  Why?  How do you prevent these changes from occurring?

c.       Once you’ve accounted for the issues in the previous step, determine a reasonable value of k.  Why would you suggest this value of k?

d.      Convert the mean household income and mean electricity usage to a log10 scale and cluster this transformed dataset.  How has the clustering changed?  Why?

e.      Reevaluate your choice of k.  Would you now choose k differently?  Why or why not?

f.        Have you observed an outlier in the data?  Remove the outlier and, once again, reevaluate your choice of k.

g.      Color a map of the U.S. according to the clustering you obtained.  To simplify this task, use the “maps” package and color only the 48 contiguous states and Washington D.C.

4.1b        (Hierarchical clustering)  Repeat experiments with hierarchical clustering. Use different linkage metrics to obtain clusters, do you see differences in the results?
