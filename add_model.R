library(cml)

add_numbers <- cml_model(function(json_input) {
  result <- json_input$num1 + json_input$num2
  # Return result in JSON format
  json_output <- jsonlite::toJSON(list(result))
  return(json_output)
})