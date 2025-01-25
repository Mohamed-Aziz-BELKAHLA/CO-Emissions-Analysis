# CO Emissions Analysis

## Description
This project analyzes the factors affecting CO emissions using multiple linear regression and statistical tests. The dataset includes variables such as AT, AP, AH, AFDP, GTEP, TIT, TAT, TEY, CDP, CO, and NOX.

## Steps
1. **Data Preparation**: Handling missing values, outliers, and imputation.
2. **Exploratory Data Analysis**: Boxplots, histograms, and correlation analysis.
3. **Regression Modeling**: Multiple linear regression with residual analysis.
4. **ANOVA**: Assessing the significance of variables.

## Results
- AFDP and TEY were not statistically significant and were removed from the model.
- Multicollinearity was addressed by removing GTEP, CDP, and AP.
- Residual analysis confirmed the model's assumptions.

## How to Run
1. Clone this repository.
2. Run the scripts in the `scripts/` folder in order.
3. View the results in the `results/` folder.

## Dashboard
Run the Shiny app locally:
1. Open the `app.R` file in RStudio.
2. Click **Run App** or use:
   ```R
   shiny::runApp("path/to/shiny_app")

   ![CO Emissions Dashboard](images/image.png)

   [View Canva Presentation]([https://www.canva.com/your-presentation-link](https://www.canva.com/design/DAGZIzOwp44/c89pkOlnE1aah88sGO9GIQ/edit?utm_content=DAGZIzOwp44&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton))
