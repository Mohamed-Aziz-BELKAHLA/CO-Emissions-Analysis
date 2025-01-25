CO Emissions Analysis
Description
This project analyzes the factors affecting CO emissions using multiple linear regression and statistical tests. The dataset includes variables such as AT, AP, AH, AFDP, GTEP, TIT, TAT, TEY, CDP, CO, and NOX.

Steps
Data Preparation: Handling missing values, outliers, and imputation.

Exploratory Data Analysis: Boxplots, histograms, and correlation analysis.

Regression Modeling: Multiple linear regression with residual analysis.

ANOVA: Assessing the significance of variables.

Results
AFDP and TEY were not statistically significant and were removed from the model.

Multicollinearity was addressed by removing GTEP, CDP, and AP.

Residual analysis confirmed the model's assumptions.

How to Run
Clone this repository.

Run the scripts in the scripts/ folder in order.

View the results in the results/ folder.

Dashboard
Run the Shiny app locally:

Open the app.R file in RStudio.

Click Run App or use:

R
Copy
shiny::runApp("path/to/shiny_app")
