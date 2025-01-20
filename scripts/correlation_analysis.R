# Normality of Each Feature (excluding CO)
# Shapiro test sample size must be between 3 and 5000
%%R

install.packages("nortest")
# Normality check for all features (excluding CO)
library(nortest)

# Apply normality tests (Shapiro-Wilk) on all columns except CO
features <- names(gt_data)[-which(names(gt_data) == "CO")]
normality_results <- sapply(features, function(x) shapiro.test(gt_2011[[x]])$p.value)

# Print normality results
normality_results
                            
# Visual Inspection using Q-Q Plot and Histogram
# Normality Test
%%R
# List of features excluding 'CO'
features <- c("AT", "AP", "AH", "AFDP", "GTEP", "TIT", "TAT", "TEY", "CDP", "NOX")

# Loop through each feature and generate Q-Q plot and histogram
for (feature in features) {

  # Q-Q Plot
  qqnorm(gt_data[[feature]], main = paste("Q-Q Plot of", feature))
  qqline(gt_data[[feature]], col = "red")
  Sys.sleep(1) # Pause for 1 second between plots

  # Histogram
  hist(gt_data[[feature]], main = paste("Histogram of", feature), xlab = feature, col = "lightblue")
  Sys.sleep(1) # Pause for 1 second between plots
}

# Correlation Matrix

# Spearman

%%R
spearman_matrix <- cor(gt_data[, c("AT", "AP", "AH", "AFDP", "TIT", "TAT", "TEY", "CDP", "CO")], method = "spearman")
print(spearman_matrix)

# Heatmap
%%R
install.packages("reshape2")
library(reshape2)

install.packages("ggplot2")
library(ggplot2)



cor_melted <- melt(spearman_matrix, varnames = c("Var1", "Var2"), value.name = "value")

ggplot(cor_melted, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(midpoint = 0, low = "blue", high = "red", mid = "white") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Spearman Correlation Heatmap", x = "Variables", y = "Variables")


                        
















                            
                    
                            
