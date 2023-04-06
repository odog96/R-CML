# Setup
# -----

# The CML library includes
# a number of helper functions you can use from within R sessions.
library('cml')
library('ggplot2')
library('MASS')

# Load Data
# ---------

summary(Cars93$Type)
head(Cars93)


# Explore
# -------

qplot(Cars93$MPG.city, main="Cars MPG City")
qplot(Cars93$MPG.city, Cars93$Horsepower,
  main="City MPG vs. Horsepower",
  xlab="City MPG", ylab="Horsepower")
qplot(Cars93$Wheelbase, Cars93$Weight,
    main="Wheelbase Vs. Car Weight",
    xlab="Wheelbase", ylab="Car Weight") +
  geom_smooth(method = "loess")

# remove mpg highway to avoid data leakage.
Cars93 = Cars93[,!grepl("^MPG.highway",names(Cars93))]

# Update the Cylinders variable to numeric
Cars93$Cylinders <- as.numeric(as.character(Cars93$Cylinders))

# remove nas
Cars93 <- Cars93[complete.cases(Cars93$Cylinders), ]


# This code block is part of the exploratory data analysis for the Cars93 dataset.
# The goal is to create a table that shows various properties of the dataset, including unique values, data types, correlation with the target variable, and significance of the correlation.
# First, we create an empty dataframe to store the results.

results_df <- data.frame(
  Field = names(Cars93),
  Unique_Values = sapply(Cars93, function(x) length(unique(x))),
  Data_Type = sapply(Cars93, class),
  Correlation = sapply(Cars93, function(x) {
    if (is.numeric(x)) {
      cor(x, Cars93$MPG.city)
    } else {
      NA
    }
  }),
  P_Value = rep(NA, ncol(Cars93)),  # Initialize P_Value column to NA
  stringsAsFactors = FALSE
)

# Loop through each column and conduct a chi-squared test
for (i in seq_along(Cars93)) {
  if (is.factor(Cars93[[i]])) {
    # Conduct chi-squared test
    chi_sq <- chisq.test(Cars93[[i]], Cars93$MPG.city)
    
    # Add P-Value to results_df
    results_df$P_Value[i] <- chi_sq$p.value
    
    # Add Significant column to results_df
    results_df$Significant[i] <- ifelse(chi_sq$p.value < 0.05, "Yes", "No")
  }
}

# View the results
print(results_df)

    
## Create feature set
    
    
# Create a list of model features
model_features <- unique(results_df$Field[results_df$Significant == "Yes"])

# Remove redundant fields
model_features <- setdiff(model_features, c("Price", "Max.Price"))


Cars93_model <- subset(Cars93, select = model_features)

# Decision Tree Model
# -------------------

# Load required libraries
library(rpart)

# Train the model using all features except the target variable
fit_tree <- rpart(MPG.city ~ ., data=Cars93_model)

# Print a summary of the model
summary(fit_tree)

# Save the models to the local directory
saveRDS(fit_tree, "fit_tree.rds")

# Save the feature list to local directory
saveRDS(model_features, "model_features.rds")

    