# Setup
# -----

# The CML library includes
# a number of helper functions you can use from within R sessions.
# install.packages("xgboost")
library('cml')

# This library is available under the name "cdsw" when using legacy engines.
# Uncomment the below line if you are using legacy engines.
# library('cdsw')

# [ggplot2](http://ggplot2.org/) is a great way to make pretty graphs.



library('ggplot2')

# Load Data
# ---------

library('MASS')
head(Cars93)
summary(Cars93$Type)


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

Cars93 = Cars93[,!grepl("^MPG.highway",names(Cars93))]

# Model
# -----
#
# Regress City MPG on number of cylinders and weight

fit_lm <- lm(MPG.city ~ Cylinders + Weight, data=Cars93)
summary(fit_lm)

# Decision Tree Model
# -------------------

# Load required libraries
library(rpart)


# Train the model using all features except the target variable
fit_tree <- rpart(MPG.city ~ ., data=Cars93)


# Print a summary of the model
summary(fit_tree)

# Save the models to the local directory
saveRDS(fit_lm, "fit_lm.rds")
saveRDS(fit_tree, "fit_tree.rds")
