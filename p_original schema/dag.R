dag_properties <- list()
dag_properties[["inceptionDatabase"]][["type"]] <- "array"
dag_properties[["inceptionDatabase"]][["items"]][["type"]] <- "string"
dag_properties[["codebooks"]][["type"]] <- "array"
dag_properties[["codebooks"]][["items"]][["type"]] <- "string"
dag_properties[["steps"]][["type"]] <- "array"
dag_properties[["steps"]][["items"]][["type"]] <- "string"

dag <- list()
dag[["type"]] <- "object"
dag[["properties"]] <- dag_properties
rm(dag_properties)
