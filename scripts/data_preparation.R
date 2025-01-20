# Missing Values
%%R
# Check for missing values
colSums(is.na(gt_data))

# Outliers
# Boxplots
%%R
# Boxplots before handling outliers
par(mfrow = c(3, 4))  # Set up a 3x4 grid for multiple plots
for(i in 1:ncol(gt_data)) {
  if(is.numeric(gt_data[, i])) {
    boxplot(gt_data[, i], main = paste("Boxplot of", names(gt_data)[i]),
            col = "lightblue", outline = TRUE)
  }
}

# Histograms
%%R
# Histograms before handling missing values
par(mfrow = c(3, 4))  # Set up a 3x4 grid for multiple plots
for(i in 1:ncol(gt_data)) {
  if(is.numeric(gt_data[, i])) {
    hist(gt_data[, i], main = paste("Histogram of", names(gt_data)[i]),
         xlab = names(gt_data)[i], col = "lightgreen", border = "black")
  }
}

# IQR
%%R
# Function to find outliers using IQR
find_outliers <- function(data) {
  Q1 <- quantile(data, 0.25, na.rm = TRUE)  # 25th percentile
  Q3 <- quantile(data, 0.75, na.rm = TRUE)  # 75th percentile
  IQR <- Q3 - Q1  # Interquartile Range

  # Define bounds for outliers
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR

  # Identify outliers
  outliers <- data < lower_bound | data > upper_bound
  return(outliers)
}

# Apply the function to each numeric column and replace outliers with NA
for(i in 1:ncol(gt_data)) {
  if(is.numeric(gt_data[, i])) {
    outliers <- find_outliers(gt_data[, i])
    gt_data[outliers, i] <- NA  # Replace outliers with NA
  }
}

# Display the modified data with NAs in place of outliers
head(gt_data)

# Boxplots after handling outliers

%%R
# Boxplots after handling outliers (should not show extreme outliers now)
par(mfrow = c(3, 4))  # Set up a 3x4 grid for multiple plots
for(i in 1:ncol(gt_data)) {
  if(is.numeric(gt_data[, i])) {
    boxplot(gt_data[, i], main = paste("Boxplot of", names(gt_data)[i]),
            col = "lightblue", outline = FALSE)  # No outliers visible
  }
}

# Missing values Before Imputation
%%R
# Check for missing values
colSums(is.na(gt_data))

# Imputation
%%R
# Impute missing values with the column median (for numeric variables)
for(i in 1:ncol(gt_data)) {
  if(is.numeric(gt_data[, i])) {
    # Replace NAs with column median
    gt_data[, i][is.na(gt_data[, i])] <- median(gt_data[, i], na.rm = TRUE)
  }
}

# Histograms after imputation
%%R
# Histograms after imputation (missing values replaced)
par(mfrow = c(3, 4))  # Set up a 3x4 grid for multiple plots
for(i in 1:ncol(gt_data)) {
  if(is.numeric(gt_data[, i])) {
    hist(gt_data[, i], main = paste("Histogram of", names(gt_data)[i]),
         xlab = names(gt_data)[i], col = "lightgreen", border = "black")
  }
}
# Missing values after imputation
%%R
# Check for missing values
colSums(is.na(gt_data))



















