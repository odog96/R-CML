library(cml)

# Load the decision tree model from file
model_file <- "./models/fit_tree.rds"
model <- readRDS(model_file)

dt_model <- cml_model(function(json_input) {
  input_df = data.frame(json_input)
  prediction <- predict(model, input_df)  
  json_output <- jsonlite::toJSON(prediction)
  return(json_output)
})