variables_properties <- list()
variables_properties[["identifier"]][["type"]] <- "string"
variables_properties[["name"]][["type"]] <- "string"
variables_properties[["generatingCodebook"]][["type"]] <- "string"
variables_properties[["codebooksList"]][["type"]] <- "array"
variables_properties[["codebooksList"]][["items"]][["type"]] <- "string"
variables_properties[["flowId"]][["type"]] <- "string"

variables_items <- list()
variables_items[["type"]] <- "object"
variables_items[["properties"]] <- variables_properties
variables_items[["required"]] <- c("identifier", "name", "generatingCodebook")
rm(variables_properties)

variables <- list()
variables[["type"]] <- "array"
variables[["items"]] <- variables_items
rm(variables_items)
