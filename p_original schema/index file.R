index_steps_properties <- list()
index_steps_properties[["name"]][["type"]] <- "string"
index_steps_properties[["inputs"]][["type"]] <- "array"
index_steps_properties[["inputs"]][["items"]][["type"]] <- "string"
index_steps_properties[["outputs"]][["type"]] <- "array"
index_steps_properties[["outputs"]][["items"]][["type"]] <- "string"

index_steps_items <- list()
index_steps_items[["type"]] <- "object"
index_steps_items[["properties"]] <- index_steps_properties
rm(index_steps_properties)

index_steps <- list()
index_steps[["type"]] <- "array"
index_steps[["items"]] <- index_steps_items
rm(index_steps_items)

indexFile <- list()
indexFile[["type"]] <- "object"
indexFile[["properties"]][["steps"]] <- index_steps
rm(index_steps)
