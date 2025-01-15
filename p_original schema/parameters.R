parameters_properties <- list()
parameters_properties[["name"]][["type"]] <- "string"
parameters_properties[["parameterVariable"]][["type"]] <- "string"
parameters_properties[["values"]][["type"]] <- "array"
parameters_properties[["values"]][["items"]][["type"]] <- "string"
parameters_properties[["configFile"]][["type"]] <- "string"

parameters_items <- list()
parameters_items[["type"]] <- "object"
parameters_items[["properties"]] <- parameters_properties
rm(parameters_properties)

parameters <- list()
parameters[["type"]] <- "array"
parameters[["items"]] <- parameters_items
rm(parameters_items)
