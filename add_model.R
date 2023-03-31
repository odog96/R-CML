model_file <-"fit_lm.rds"
model <- readRDS(model_file)

print("loaded file name")
 


add_numbers_json <- function(json_input) {
  # Parse JSON input
  json_input <- jsonlite::toJSON(json_input)
  input <- jsonlite::fromJSON(json_input)
  print(json_input)
  print(input)
  # Extract numbers from input
  num1 <- input[[1]]
  num2 <- input[[2]]
  # Add numbers
  result <- num1 + num2
  # Convert result to JSON format
  json_output <- jsonlite::toJSON(list(result))
  # Return result in JSON format
  return(json_output)
}