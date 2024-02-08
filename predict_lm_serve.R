library(cml)

# load the model file
model_file <-"./models/fit_lm.rds"
model <- readRDS(model_file)

# Define a function to make predictions using the model
lm_model <- cml_model(function(json_input) {
  prediction <- predict(model, json_input)
  json_output <- jsonlite::toJSON(prediction)
  return(json_output)
})

