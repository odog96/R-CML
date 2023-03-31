# Load the decision tree model from file

model_file <- "fit_tree.rds"
model <- readRDS(model_file)

print("loaded file name")

# Define a function to make predictions using the model
dt_model <- function(json_input) {

  # Convert the JSON input to an R object
  json_input <- jsonlite::toJSON(json_input)
  input <- jsonlite::fromJSON(json_input)
  # Make a prediction using the decision tree model
  prediction <- predict(model, input)
  
  # Convert the prediction to JSON format
  json_output <- jsonlite::toJSON(list(prediction))
  
  # Return the result in JSON format
  return(json_output)
}

# Example usage:
# Define some example input data in JSON format
example_input <- list(Cylinders = 6, Weight = 3100)
example_input_json <- jsonlite::toJSON(example_input)

# Make a prediction using the example input data
prediction <- dt_model(example_input_json)

# Print the prediction to the console
print(prediction)
