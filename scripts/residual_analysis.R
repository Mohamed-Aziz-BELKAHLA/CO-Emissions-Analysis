# QQ Plot for Normality

%%R
# QQ Plot
qqnorm(residuals(model_revised))
qqline(residuals(model_revised))

# Kolmogorov-Smirnov Test
%%R
ks.test(resid(model_revised), "pnorm", mean = mean(resid(model_revised)), sd = sd(resid(model_revised)))

# Histogram of Residuals
%%R
hist(resid(model_revised), main = "Histogram of Residuals", xlab = "Residuals", breaks = 50)

# Heteroscedasticity
# Residuals vs. Fitted Plot
%%R
plot(model_revised$fitted.values, resid(model_revised),
     main = "Residuals vs Fitted Values",
     xlab = "Fitted Values", ylab = "Residuals",
     pch = 20)
abline(h = 0, col = "red", lwd = 2)
# Breusch-Pagan Test
%%R
install.packages("lmtest")
library(lmtest)
bptest(model_revised)

# Robust Standard Errors
%%R
install.packages("sandwich")
library(sandwich)
library(lmtest)

# Calculate robust standard errors
robust_se <- vcovHC(model_revised, type = "HC1")

# Perform hypothesis testing with robust standard errors
coeftest(model_revised, vcov = robust_se)

# Multicollinearity

# Variance Inflation Factor, VIF

%%R
# Install and load the car package for VIF calculation
install.packages("car")
library(car)

# Calculate VIF for our regression model
vif(model_revised)

# Reassess the Model

# **Removing Variables GTEP and CDP**

%%R
# Fit the updated model
model_updated <- lm(CO ~ AT + AP + AH + TIT + TAT + NOX, data = gt_data)

# Display the summary of the updated model
summary(model_updated)

#**Removing AP**

%%R
# Remove AP from the model and rerun the regression
model_refined <- lm(CO ~ AT + AH + TIT + TAT + NOX, data = gt_data)

# Display the summary of the refined model
summary(model_refined)

# **Multicollinearity**
%%R
# Calculate VIF for the updated model
vif(model_refined)

