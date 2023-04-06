# Setup
# -----

# The CML library includes
# a number of helper functions you can use from within R sessions.
library('cml')

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

########################################
# using two fields as independent variables (or features)
# 1. Number of Cylinders 
# 2. Car Weight

# Update the Cylinders variable to numeric
Cars93$Cylinders <- as.numeric(as.character(Cars93$Cylinders))

# remove nas
Cars93 <- Cars93[complete.cases(Cars93$Cylinders), ]

# Model
# -----
#
# Regress City MPG on number of cylinders and weight

fit_lm <- lm(MPG.city ~ Cylinders + Weight, data=Cars93)
summary(fit_lm)

# Save the models to the local directory
saveRDS(fit_lm, "fit_lm.rds")
