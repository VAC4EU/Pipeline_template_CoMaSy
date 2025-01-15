configurationFiles_properties <- list()
configurationFiles_properties[["name"]][["type"]] <- "string"
configurationFiles_properties[["fileNames"]][["type"]] <- "array"
configurationFiles_properties[["fileNames"]][["items"]][["type"]] <- "string"
configurationFiles_properties[["parameterVariables"]][["type"]] <- "array"
configurationFiles_properties[["parameterVariables"]][["items"]][["type"]] <- "string"

configurationFiles_items <- list()
configurationFiles_items[["type"]] <- "object"
configurationFiles_items[["properties"]] <- configurationFiles_properties
configurationFiles_items[["required"]] <- c("name", "fileNames", "parameterVariables")
rm(configurationFiles_properties)

configurationFiles <- list()
configurationFiles[["type"]] <- "array"
configurationFiles[["items"]] <- configurationFiles_items
rm(configurationFiles_items)
