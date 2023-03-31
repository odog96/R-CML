# Load the decision tree model from file
model_file <- "fit_tree.rds"
model <- readRDS(model_file)

# Load the Cars93 data set
library(MASS)
data(Cars93)

# Select a random row from the Cars93 data set
set.seed(123)
row_idx <- sample(nrow(Cars93), 1)
input <- Cars93[row_idx, ]

# Remove the target variable from the input data
input <- input[, !(names(input) %in% c("MPG.city", "MPG.highway"))]

# Make a prediction using the decision tree model
prediction <- predict(model, input)

# Print the input data and prediction
print("Input data:")
print(input)
print("Prediction:")
print(prediction)

# Convert the input data to JSON format
library(jsonlite)
input_json <- toJSON(input)
cat(input_json)

toJSON(prediction)

# Convert the JSON back to a data frame
input_df <- fromJSON(input_json)

# Print the converted data frame
print("Input data (after conversion):")
print(input_df)

########### Try the simple linear model

# Select a random row from the Cars93 data set
set.seed(213)
row_idx <- sample(nrow(Cars93), 1)
input <- Cars93[row_idx, ]

input <- input[, (names(input) %in% c("Weight", "Cylinders"))]



model_file <- "fit_lm.rds"
lm_model <- readRDS(model_file)


prediction <- predict(lm_model, input)

print("Prediction:")
print(prediction)

input_json <- toJSON(input)
cat(input_json)




