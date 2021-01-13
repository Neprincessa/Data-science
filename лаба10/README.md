# Time Series forecasting


4.8        (Time Series)  A classic dataset used in time series lectures is the quarterly earnings per share (EPS) for Johnson & Johnson stock.  Shumway and Stoffer [2006] utilize this dataset in their text and provide a copy of the dataset.   

There are 84 values in this dataset covering the EPS from the first quarter of 1960 to the fourth quarter of 1980.

a.      After obtaining a copy of the dataset, plot the quarterly EPS vs. time.  Describe any patterns that you observe.

b.      In order to perform an ARIMA model, the time series will need to be transformed to remove any trend.  Plot the difference of xt and xt-1, for all t > 0.   Has this difference adequately detrended the series? Does the variability of the EPS appear constant over time?  Why does the constant variance matter?

c.       Plot the log10 of the quarterly EPS vs. time and plot the difference of log10(xt ) and
log10(xt-1) for all t > 0.  Has this adequately detrended the series?  Has the variability of the differenced log10(EPS) become more constant? 

d.      Treating the differenced log10 of the EPS series as a stationary series, plot the ACF and PACF of this series.  What possible ARIMA models would you consider and why?

e.      Run the proposed ARIMA models from part d and compare the results.  Identify an appropriate model.  Justify your choice.  

Hint: The Akaike Information Criterion  (AIC) can be used to compare the models.  

4.9        (Time Series)  Why is the choice of natural log or log base 10 in Problem 4.8 somewhat irrelevant to the transformation and the analysis?

4.10    (Time Series)  Why is the value of the ACF for lag 0 equal to one?
Note: The ACF R function plots the value at lag 0.

4.11    (Time Series) Using arima.sim in R, simulate 10,000 points for AR(p) p = 1,2,3,4.
Plot the simulated series, ACF and PACF.  What pattern emerges between p and the plots? 

Hint: Here is possible R simulation code for the AR(4) model. 

ts.sim_AR4 <- arima.sim(n = 10000, list(ar = c(0.9, -0.5, .2, -.3)))

The choice of the coefficients needs to be carefully made to ensure that the simulated series is a stationary series.   Suggestion: Simply drop off the last coefficient to get to the AR(3) inputs, then the AR(2) inputs, and finally the AR(1) inputs.

4.12    (Time Series)  Using arima.sim in R, simulate 10,000 points for MA(p) p = 1,2,3,4.
 Plot the simulated series, ACF and PACF.  What pattern emerges between p and the plots?

Hint:  Here is possible R simulation code for the MA(4) model. 


sim_MA4 <- arima.sim(n = 10000, list( ma = c(-1.9, 1.7, -1.5, 1.5)))

The choice of the coefficients needs to be carefully made to ensure that the simulated series is a stationary series.   Suggestion: simply drop off the last coefficient to get to the MA(3) inputs, then the MA(2) inputs, and finally the MA(1) inputs.
