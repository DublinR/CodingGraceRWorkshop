mtcars - Regression Exercise
========================================================

### Quick Inspection of Data Set

```r
tail(mtcars)
```

```
##                 mpg cyl  disp  hp drat    wt qsec vs am gear carb
## Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.7  0  1    5    2
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.9  1  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.5  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.5  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.6  0  1    5    8
## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.6  1  1    4    2
```


### Exercise 1 : Simple Linear Regression

In this exercise, fit a simple linear model, where weight (***wt***) is the independent variable, and miles per gallon (***mpg***) is the dependent variable. Call the fitted model `Fit1`.

```r
attach(mtcars)
Fit1 = lm(mpg ~ wt)
Fit1
```

```
## 
## Call:
## lm(formula = mpg ~ wt)
## 
## Coefficients:
## (Intercept)           wt  
##       37.29        -5.34
```

```r
summary(Fit1)
```

```
## 
## Call:
## lm(formula = mpg ~ wt)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -4.543 -2.365 -0.125  1.410  6.873 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   37.285      1.878   19.86  < 2e-16 ***
## wt            -5.344      0.559   -9.56  1.3e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.05 on 30 degrees of freedom
## Multiple R-squared:  0.753,	Adjusted R-squared:  0.745 
## F-statistic: 91.4 on 1 and 30 DF,  p-value: 1.29e-10
```

```r
detach(mtcars)
```

### Exercise 2 : Multiple Linear Regression
In this exercise, fit a simple linear model, where weight (***wt***) and number of cylinders (***cyl*** are the independent variable, and miles per gallon (***mpg***) is the dependent variable. Call the fitted model `Fit2`.

```r
attach(mtcars)
Fit2 = lm(mpg ~ wt + cyl)
Fit2
```

```
## 
## Call:
## lm(formula = mpg ~ wt + cyl)
## 
## Coefficients:
## (Intercept)           wt          cyl  
##       39.69        -3.19        -1.51
```

```r
summary(Fit2)
```

```
## 
## Call:
## lm(formula = mpg ~ wt + cyl)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -4.289 -1.551 -0.468  1.574  6.100 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   39.686      1.715   23.14  < 2e-16 ***
## wt            -3.191      0.757   -4.22  0.00022 ***
## cyl           -1.508      0.415   -3.64  0.00106 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.57 on 29 degrees of freedom
## Multiple R-squared:  0.83,	Adjusted R-squared:  0.819 
## F-statistic: 70.9 on 2 and 29 DF,  p-value: 6.81e-12
```

```r
detach(mtcars)
```


### Exercise 3 : Confidence Intervals for Regression Estimates
Using the regression model from the previous exercise (i.e. `Fit2`), compute 95% and 99% confidence intervals for the regression estimates.


```r
confint(Fit2)
```

```
##              2.5 %  97.5 %
## (Intercept) 36.179 43.1938
## wt          -4.739 -1.6429
## cyl         -2.356 -0.6597
```

```r
confint(Fit2, conf.level = 0.99)
```

```
##              2.5 %  97.5 %
## (Intercept) 36.179 43.1938
## wt          -4.739 -1.6429
## cyl         -2.356 -0.6597
```


### Exercise 4 : Akaike Information Criterion
When comparing two or more candidate models, the model with lowest
AIC value is considered the best model. Use the AIC to compare `Fit1` and `Fit2`.

```r
AIC(Fit1)
```

```
## [1] 166
```

```r
AIC(Fit2)
```

```
## [1] 156
```


### Exercise 5 : ANOVA tables for Regression Models
Construct the ANOVA tables for the fitted models computed previously.

```r
anova(Fit1)
```

```
## Analysis of Variance Table
## 
## Response: mpg
##           Df Sum Sq Mean Sq F value  Pr(>F)    
## wt         1    848     848    91.4 1.3e-10 ***
## Residuals 30    278       9                    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
anova(Fit2)
```

```
## Analysis of Variance Table
## 
## Response: mpg
##           Df Sum Sq Mean Sq F value  Pr(>F)    
## wt         1    848     848   128.6 3.5e-12 ***
## cyl        1     87      87    13.2  0.0011 ** 
## Residuals 29    191       7                    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

