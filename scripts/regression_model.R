# Multiple Linear Regression Model

%%R
# Fit a linear regression model with CO as the dependent variable
model <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT + TEY + CDP + NOX, data = gt_data)

# View model summary to check coefficients, R², and significance
summary(model)

# Remove AFDP and TEY from the Model (not statistically significant)

%%R
# Re-run the regression without AFDP
model_revised <- lm(CO ~ AT + AP + AH + GTEP + TIT + TAT + CDP + NOX, data = gt_data)

# Summary of the revised model
summary(model_revised)
