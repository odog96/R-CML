# Load the linear regression model from file

model_file <-"fit_lm.rds"
model <- readRDS(model_file)

print("loaded file name")

# Define a function to make predictions using the model
lm_model <- function(json_input) {

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

