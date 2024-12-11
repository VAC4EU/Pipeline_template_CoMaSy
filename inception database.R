
dataModel_items_properties_admissibleValues <- list()
dataModel_items_properties_admissibleValues[["type"]] <- "array"
dataModel_items_properties_admissibleValues[["items"]][["type"]] <- "string"

dataModel_items_properties <- list()
dataModel_items_properties[["flow_id"]][["type"]] <- "string"
dataModel_items_properties[["database"]][["type"]] <- "string"
dataModel_items_properties[["file_name"]][["type"]] <- "string"
dataModel_items_properties[["admissibleValues"]] <- dataModel_items_properties_admissibleValues
dataModel_items_properties[["comments"]][["type"]] <- "string"
rm(dataModel_items_properties_admissibleValues)

dataModel_items <- list()
dataModel_items[["type"]] <- "object"
dataModel_items[["properties"]] <- dataModel_items_properties
dataModel_items[["required"]] <- c("name", "description", "format")
rm(dataModel_items_properties)

dataModel <- list()
dataModel[["type"]] <- "array"
dataModel[["items"]] <- dataModel_items
rm(dataModel_items)

inception_db_items_properties <- list()
inception_db_items_properties[["name"]][["type"]] <- "string"
inception_db_items_properties[["description"]][["type"]] <- "string"
inception_db_items_properties[["dataModel"]] <- dataModel

inception_db_items <- list()
inception_db_items[["type"]] <- "object"
inception_db_items[["properties"]] <- inception_db_items_properties
inception_db_items[["required"]] <- c("name", "description", "dataModel")

inceptionDatabase <- list()
inceptionDatabase[["type"]] <- "array"
inceptionDatabase[["items"]] <- inception_db_items
