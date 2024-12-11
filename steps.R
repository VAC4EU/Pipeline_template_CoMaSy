input_properties <- list()
input_properties[["inceptionDatabase"]][["type"]] <- "array"
input_properties[["inceptionDatabase"]][["items"]][["type"]] <- "string"
input_properties[["codebooks"]][["type"]] <- "array"
input_properties[["codebooks"]][["items"]][["type"]] <- "string"

steps_items_properties <- list()
steps_items_properties[["name"]][["type"]] <- "string"
steps_items_properties[["partialOrdering"]][["type"]] <- "string"
steps_items_properties[["input"]][["type"]] <- "string"
steps_items_properties[["input"]][["properties"]] <- input_properties
steps_items_properties[["output"]][["type"]] <- "array"
steps_items_properties[["output"]][["items"]][["type"]] <- "string"
steps_items_properties[["programCodeFiles"]][["type"]] <- "array"
steps_items_properties[["programCodeFiles"]][["items"]][["type"]] <- "string"
rm(input_properties)

steps_items <- list()
steps_items[["type"]] <- "object"
steps_items[["properties"]] <- steps_items_properties
steps_items[["required"]] <- c("name", "input", "output", "programCodeFiles")
rm(steps_items_properties)

steps <- list()
steps[["type"]] <- "array"
steps[["items"]] <- steps_items
rm(steps_items)
