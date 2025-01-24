dag_properties <- list()
# TODO add CDM name and "description"
dag_properties[["inceptionDatabase"]][["type"]] <- "array"
dag_properties[["inceptionDatabase"]][["items"]][["type"]] <- "string"
# TODO codebooks and steps as previously defined object
dag_properties[["codebooks"]][["type"]] <- "array"
dag_properties[["codebooks"]][["items"]][["type"]] <- "object"
dag_properties[["steps"]][["type"]] <- "array"
dag_properties[["steps"]][["items"]][["type"]] <- "object"

dag <- list()
dag[["type"]] <- "object"
dag[["properties"]] <- dag_properties
rm(dag_properties)
